package cn.qihangerp.module.order.service.impl.orderMessage;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.enums.TaoOrderStateEnum;
import cn.qihangerp.module.order.domain.OOrder;
import cn.qihangerp.module.order.domain.OOrderItem;
import cn.qihangerp.module.order.domain.OSupplierShipOrder;
import cn.qihangerp.module.order.domain.OSupplierShipOrderItem;
import cn.qihangerp.module.order.mapper.OOrderItemMapper;
import cn.qihangerp.module.order.mapper.OOrderMapper;
import cn.qihangerp.module.order.mapper.OSupplierShipOrderItemMapper;
import cn.qihangerp.module.order.mapper.OSupplierShipOrderMapper;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.Date;
import java.util.List;

@Slf4j
@AllArgsConstructor
@Service
public class TaoOrderMessageService {
    private final OOrderMapper orderMapper;
    private final OOrderItemMapper orderItemMapper;
    private final OSupplierShipOrderMapper shipOrderMapper;
    private final OSupplierShipOrderItemMapper shipOrderItemMapper;

    @Transactional
    public ResultVo<Integer> taoOrderMessage(String tid, JSONObject orderDetail ) {
        log.info("Tao订单消息处理"+tid);
//        JSONObject jsonObject = taoApiService.getOrderDetail(tid);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====tao order message===没有找到订单");
//            return ResultVo.error(404,"没有找到订单");
//        }
//
//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====tao order message===订单:"+JSONObject.toJSONString(orderDetail));

        JSONArray itemArray = orderDetail.getJSONArray("items");
        if (itemArray.isEmpty()) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            log.info("=====tao order message===没有items====事务回滚=======");
        }
//        List<TaoOrder> taoOrders = taoOrderMapper.selectList(new LambdaQueryWrapper<TaoOrder>().eq(TaoOrder::getTid, tid));
//
//        if(taoOrders == null || taoOrders.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO订单："+tid);
//        }
//        TaoOrder taoOrder = taoOrders.get(0);
        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, tid));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            OOrder insert = new OOrder();
            insert.setOrderNum(tid);
            insert.setShopType(EnumShopType.TAO.getIndex());
            insert.setShopId(orderDetail.getLong("shopId"));
            String buyerMemo = "";
            if(org.springframework.util.StringUtils.hasText(orderDetail.getString("buyerMessage"))){
                buyerMemo += orderDetail.getString("buyerMessage");
            }
            if(org.springframework.util.StringUtils.hasText(orderDetail.getString("buyerMemo"))){
                buyerMemo += orderDetail.getString("buyerMemo");
            }
            insert.setBuyerMemo(buyerMemo);
            insert.setSellerMemo(orderDetail.getString("sellerMemo"));
            // 状态
            int orderStatus = TaoOrderStateEnum.getIndex(orderDetail.getString("status"));
//            if (orderStatus == 11) {
//                insert.setRefundStatus(4);
//            } else if (orderStatus == -1) {
//                insert.setRefundStatus(-1);
//            } else {
//                insert.setRefundStatus(1);
//            }
            insert.setOrderStatus(orderStatus);
            Double goodsAmount  = orderDetail.getDouble("totalFee");
            Double postFee = orderDetail.getDouble("postFee");
            Double payment = orderDetail.getDouble("payment");
            insert.setGoodsAmount(goodsAmount);
            insert.setPostFee(postFee);
            insert.setAmount(payment);
            insert.setPayment(payment);
            insert.setPlatformDiscount(0.0);
            insert.setSellerDiscount(goodsAmount+postFee-payment);
            insert.setReceiverName(orderDetail.getString("receiverName"));
            insert.setReceiverMobile(orderDetail.getString("receiverMobile"));
            insert.setAddress(orderDetail.getString("receiverAddress"));
            insert.setProvince(orderDetail.getString("receiverState"));
            insert.setCity(orderDetail.getString("receiverCity"));
            insert.setTown(orderDetail.getString("receiverDistrict"));
            insert.setOrderTime(orderDetail.getDate("created"));
            // 计算商家优惠
//            Double sellerDiscount = 0.0;
//            List<TaoOrderPromotion> taoOrderPromotions = taoOrderPromotionMapper.selectList(new LambdaQueryWrapper<TaoOrderPromotion>().eq(TaoOrderPromotion::getId, taoOrder.getTid()));
//            if(taoOrderPromotions!=null){
//                for (var it:taoOrderPromotions) {
//                    if(org.springframework.util.StringUtils.hasText(it.getKdDiscountFee())){
//                        try {
//                            sellerDiscount += Double.parseDouble(it.getKdDiscountFee());
//                        }catch (Exception e){}
//                    } else if (org.springframework.util.StringUtils.hasText(it.getDiscountFee())) {
//                        try {
//                            sellerDiscount += Double.parseDouble(it.getDiscountFee());
//                        }catch (Exception e){}
//                    }
//                }
//            }
//            insert.setSellerDiscount(sellerDiscount);


//            insert.setShipType(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);

            // 插入orderItem
            addTaoOrderItem(insert.getId(),tid,itemArray);

        }else{
            // 修改订单 (修改：)
            OOrder update = new OOrder();
            update.setId(oOrders.get(0).getId());
            String buyerMemo = "";
            if(org.springframework.util.StringUtils.hasText(orderDetail.getString("buyerMessage"))){
                buyerMemo += orderDetail.getString("buyerMessage");
            }
            if(org.springframework.util.StringUtils.hasText(orderDetail.getString("buyerMemo"))){
                buyerMemo += orderDetail.getString("buyerMemo");
            }
            update.setBuyerMemo(buyerMemo);
            update.setSellerMemo(orderDetail.getString("sellerMemo"));
            // 状态
            int orderStatus = TaoOrderStateEnum.getIndex(orderDetail.getString("status"));
//            if (orderStatus == 11) {
//                update.setRefundStatus(4);
//            } else if (orderStatus == -1) {
//                update.setRefundStatus(-1);
//            } else {
//                update.setRefundStatus(1);
//            }
            update.setOrderStatus(orderStatus);

            Double goodsAmount  = orderDetail.getDouble("totalFee");
            Double postFee = orderDetail.getDouble("postFee");
            Double payment = orderDetail.getDouble("payment");
            update.setGoodsAmount(goodsAmount);
            update.setPostFee(postFee);
            update.setAmount(payment);
            update.setPayment(payment);
            update.setPlatformDiscount(0.0);
            update.setSellerDiscount(goodsAmount+postFee-payment);
            update.setReceiverName(orderDetail.getString("receiverName"));
            update.setReceiverMobile(orderDetail.getString("receiverMobile"));
            update.setAddress(orderDetail.getString("receiverAddress"));
            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);

            // 更新发货主表数据状态
            OSupplierShipOrder shipOrder = new OSupplierShipOrder();
            shipOrder.setOrderStatus(update.getOrderStatus());
            shipOrderMapper.update(shipOrder,new LambdaQueryWrapper<OSupplierShipOrder>().eq(OSupplierShipOrder::getOOrderId,update.getId()));

            // 插入orderItem
            addTaoOrderItem(update.getId(),tid,itemArray);


        }
        return ResultVo.success();
    }

    private void addTaoOrderItem(String oOrderId,String tid, JSONArray itemArray) {
        for (int i = 0; i < itemArray.size(); i++) {
            JSONObject itemObject = itemArray.getJSONObject(i);

            OOrderItem orderItem = new OOrderItem();
            orderItem.setOrderId(oOrderId);
            orderItem.setOrderNum(tid);
            orderItem.setSubOrderNum(itemObject.getString("oid"));
            orderItem.setSkuNum(itemObject.getString("outerSkuId"));
            orderItem.setSkuId(itemObject.getString("skuId"));
            orderItem.setProductId(itemObject.getString("numIid"));
            orderItem.setGoodsId(itemObject.getLong("oGoodsId"));
            orderItem.setGoodsSkuId(itemObject.getString("oGoodsSkuId"));
            orderItem.setGoodsImg(itemObject.getString("picPath"));
            orderItem.setGoodsSpec(itemObject.getString("skuPropertiesName"));
            orderItem.setGoodsTitle(itemObject.getString("title"));
            orderItem.setGoodsPrice(itemObject.getDouble("price"));
            orderItem.setItemAmount(itemObject.getDouble("totalFee"));
            orderItem.setDiscountAmount(itemObject.getDouble("partMjzDiscount"));
            orderItem.setPayment(itemObject.getDouble("payment"));
            orderItem.setQuantity(itemObject.getInteger("num"));
            // 退款状态。退款状态。可选值 WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意)
            // WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货)
            // WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货)
            // SELLER_REFUSE_BUYER(卖家拒绝退款)
            // CLOSED(退款关闭)
            // SUCCESS(退款成功)
            if (itemObject.getString("refundStatus").equals("WAIT_SELLER_AGREE")
                    || itemObject.getString("refundStatus").equals("WAIT_BUYER_RETURN_GOODS")
                    || itemObject.getString("refundStatus").equals("WAIT_SELLER_CONFIRM_GOODS")
                    || itemObject.getString("refundStatus").equals("SELLER_REFUSE_BUYER")) {
                orderItem.setRefundStatus(2);
                orderItem.setRefundCount(itemObject.getInteger("num"));
            } else if (itemObject.getString("refundStatus").equals("SUCCESS")) {
                orderItem.setRefundCount(itemObject.getInteger("num"));
                orderItem.setRefundStatus(4);
            } else if (itemObject.getString("refundStatus").equals("CLOSED") || itemObject.getString("refundStatus").equals("NO_REFUND")) {
                orderItem.setRefundStatus(1);
                orderItem.setRefundCount(0);
            }
            // 状态
            int orderStatus = TaoOrderStateEnum.getIndex(itemObject.getString("status"));
            orderItem.setOrderStatus(orderStatus);

            List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderNum, tid).eq(OOrderItem::getSubOrderNum, orderItem.getSubOrderNum()));
            if(oOrderItems.isEmpty()) {
                // 新增
                orderItem.setCreateTime(new Date());
                orderItem.setCreateBy("ORDER_MESSAGE");
                orderItemMapper.insert(orderItem);
            }else {
                // 修改
                orderItem.setId(oOrderItems.get(0).getId());
                orderItem.setUpdateBy("更新");
                orderItem.setUpdateTime(new Date());
                orderItemMapper.updateById(orderItem);

                // 更新发货子表状态
                OSupplierShipOrderItem updateShip = new OSupplierShipOrderItem();
                updateShip.setRefundStatus(orderItem.getRefundStatus());
                shipOrderItemMapper.update(updateShip,
                        new LambdaQueryWrapper<OSupplierShipOrderItem>()
                                .eq(OSupplierShipOrderItem::getOOrderItemId,orderItem.getId()));
            }
        }

    }
}
