package cn.qihangerp.module.order.service.impl.orderMessage;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.enums.EnumShopType;
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

import java.util.Date;
import java.util.List;

@Slf4j
@AllArgsConstructor
@Service
public class DouOrderMessageService {
    private final OOrderMapper orderMapper;
    private final OOrderItemMapper orderItemMapper;
    private final OSupplierShipOrderMapper shipOrderMapper;
    private final OSupplierShipOrderItemMapper shipOrderItemMapper;
    @Transactional
    public ResultVo<Integer> douOrderMessage(String orderId, JSONObject orderDetail ) {
        log.info("Dou订单消息处理" + orderId);
//        DouOrder douOrder = douOrderService.queryDetailById(Long.parseLong(orderId));
//        if(douOrder == null) return ResultVo.error("找不到Dou订单");
//        JSONObject jsonObject = douApiService.getOrderDetail(orderId);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====dou order message===没有找到订单");
//            return ResultVo.error(404,"没有找到订单");
//        }
//
//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====dou order message===订单:" + JSONObject.toJSONString(orderDetail));
        if (orderDetail == null) return ResultVo.error(404, "没有找到订单");
        // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除，101部分发货
        // 抖店订单状态 1 待确认/待支付（订单创建完毕）105 已支付 2 备货中 101 部分发货 3 已发货（全部发货）4 已取消 5 已完成（已收货）
        int orderStatus = -1;
        int refundStatus = -1;
        if (orderDetail.getInteger("orderStatus") == 1) {
            // 1待确认/待支付（订单创建完毕）
            orderStatus = 21;
            refundStatus = 1;
        } else if (orderDetail.getInteger("orderStatus") == 105) {
            // 105 已支付
            orderStatus = 0;
            refundStatus = 1;
        } else if (orderDetail.getInteger("orderStatus") == 2) {
            // 105 已支付
            orderStatus = 1;
            refundStatus = 1;
        } else if (orderDetail.getInteger("orderStatus") == 101) {
            // 101 部分发货
            orderStatus = 101;
            refundStatus = 1;
        } else if (orderDetail.getInteger("orderStatus") == 3) {
            //  3 已发货（全部发货）
            orderStatus = 2;
            refundStatus = 1;
        } else if (orderDetail.getInteger("orderStatus") == 4) {
            //  4 已取消
            orderStatus = 11;
            refundStatus = 1;
        } else if (orderDetail.getInteger("orderStatus") == 5) {
            //  5 已完成（已收货）
            orderStatus = 3;
            refundStatus = 1;
        }

//        List<DouOrder> originOrders = douOrderMapper.selectList(new LambdaQueryWrapper<DouOrder>().eq(DouOrder::getOrderId, orderId));
//
//        if (originOrders == null || originOrders.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound, "没有找到DOU原始订单：" + orderId);
//        }
//        DouOrder originOrder = originOrders.get(0);

        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
        if (oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            OOrder insert = new OOrder();
            insert.setOrderNum(orderId);
            insert.setShopType(EnumShopType.DOU.getIndex());
            insert.setShopId(orderDetail.getLong("shopId"));
            insert.setBuyerMemo(orderDetail.getString("buyerWords"));
            insert.setSellerMemo(orderDetail.getString("sellerWords"));
//            insert.setRefundStatus(refundStatus);
            insert.setOrderStatus(orderStatus);
            insert.setGoodsAmount(orderDetail.getDouble("orderAmount") / 100);
            insert.setPostFee(orderDetail.getDouble("postAmount") / 100);
            insert.setAmount(orderDetail.getDouble("orderAmount") / 100);
            insert.setPayment(orderDetail.getDouble("payAmount") / 100);
            insert.setPlatformDiscount(orderDetail.getDouble("promotionPlatformAmount") / 100);
            insert.setSellerDiscount(orderDetail.getDouble("promotionShopAmount") / 100);

            insert.setReceiverName(orderDetail.getString("maskPostReceiver"));
            insert.setReceiverMobile(orderDetail.getString("maskPostTel"));
            insert.setAddress(orderDetail.getString("maskPostAddress"));
            insert.setProvince(orderDetail.getString("provinceName"));
            insert.setCity(orderDetail.getString("cityName"));
            insert.setTown(orderDetail.getString("townName"));
            long time = orderDetail.getLong("createTime") * 1000;
            insert.setOrderTime(new Date(time));
//            insert.setShipType(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);
            // 插入orderItem
            addDouOrderItem(insert.getId(), orderId, orderStatus, orderDetail.getJSONArray("items"));

        } else {
            // 修改订单 (修改：)
            OOrder update = new OOrder();
            update.setId(oOrders.get(0).getId());
//            update.setRefundStatus(refundStatus);
            update.setOrderStatus(orderStatus);
            update.setGoodsAmount(orderDetail.getDouble("orderAmount") / 100);
            update.setPostFee(orderDetail.getDouble("postAmount") / 100);
            update.setAmount(orderDetail.getDouble("orderAmount") / 100);
            update.setPayment(orderDetail.getDouble("payAmount") / 100);
            update.setPlatformDiscount(orderDetail.getDouble("promotionPlatformAmount") / 100);
            update.setSellerDiscount(orderDetail.getDouble("promotionShopAmount") / 100);

            update.setReceiverName(orderDetail.getString("maskPostReceiver"));
            update.setReceiverMobile(orderDetail.getString("maskPostTel"));
            update.setAddress(orderDetail.getString("maskPostAddress"));


            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);

            // 更新发货主表数据状态
            OSupplierShipOrder shipOrder = new OSupplierShipOrder();
            shipOrder.setOrderStatus(update.getOrderStatus());
            shipOrderMapper.update(shipOrder,new LambdaQueryWrapper<OSupplierShipOrder>().eq(OSupplierShipOrder::getOOrderId,update.getId()));

            // 插入orderItem
            addDouOrderItem(update.getId(), orderId, orderStatus, orderDetail.getJSONArray("items"));
        }
        return ResultVo.success();
    }

    private void addDouOrderItem(String oOrderId, String originOrderId, Integer orderStatus, JSONArray itemArray){

        if(itemArray!=null && itemArray.size()>0) {
            for (int i = 0; i < itemArray.size(); i++) {
                JSONObject itemObject = itemArray.getJSONObject(i);
                Integer refundStatus = null;
                Long mainStatus = itemObject.getLong("mainStatus");
                //主流程状态，1 待确认/待支付（订单创建完毕）103 部分支付105 已支付2 备货中101 部分发货3 已发货（全部发货）4 已取消5 已完成（已收货）21 发货前退款完结22 发货后退款完结39 收货后退款完结
                if(mainStatus==21){
                    refundStatus =11;
                }
                else if(mainStatus==22||mainStatus==29){
                    refundStatus =4;
                }else{
                    refundStatus=1;
                }
                OOrderItem orderItem = new OOrderItem();
                orderItem.setOrderId(oOrderId);
                orderItem.setOrderNum(itemObject.getString("parentOrderId"));
                orderItem.setSubOrderNum(itemObject.getString("orderId"));
                orderItem.setSkuNum(itemObject.getString("code"));
                orderItem.setSkuId(itemObject.getString("skuId"));
                orderItem.setProductId(itemObject.getString("productId"));
                orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
                orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
                orderItem.setGoodsImg(itemObject.getString("productPic"));

//                if(org.springframework.util.StringUtils.hasText(item.getSpec())) {
//                    orderItem.setGoodsSpec(item.getSpec().length()>500?item.getSpec().substring(0,499):item.getSpec());
//                }
                orderItem.setGoodsTitle(itemObject.getString("productName"));
                orderItem.setGoodsSpec(itemObject.getString("spec"));
                try {
                    // 计算优惠
                    Integer promotionAmount = itemObject.getInteger("promotionAmount");
                    Integer promotionShopAmount = itemObject.getInteger("promotionShopAmount");
                    Integer promotionPlatformAmount = itemObject.getInteger("promotionPlatformAmount");
                    Integer promotionPayAmount = itemObject.getInteger("promotionPayAmount");
                    Integer discountAmount = promotionAmount+promotionShopAmount+promotionPlatformAmount+promotionPayAmount;
                    orderItem.setDiscountAmount(discountAmount.doubleValue() / 100);
                }catch (Exception e){
                    orderItem.setDiscountAmount(0.0);
                }
                orderItem.setGoodsPrice(itemObject.getDouble("goodsPrice")/100);
                orderItem.setItemAmount(itemObject.getDouble("orderAmount")/100);
                orderItem.setPayment(itemObject.getDouble("payAmount")/100);
                orderItem.setQuantity(itemObject.getInteger("itemNum"));
                orderItem.setOrderStatus(orderStatus);
                orderItem.setRefundStatus(refundStatus);
                orderItem.setRefundCount(0);
                orderItem.setCreateTime(new Date());
                orderItem.setCreateBy("ORDER_MESSAGE");

                List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>()
                        .eq(OOrderItem::getOrderId, orderItem.getOrderId())
                        .eq(OOrderItem::getSkuId, orderItem.getSkuId())
                );
                if(oOrderItems.isEmpty()) {
                    // 新增
                    orderItem.setCreateTime(new Date());
                    orderItem.setCreateBy("ORDER_MESSAGE");
                    orderItemMapper.insert(orderItem);
                }else{
                    //修改
                    orderItem.setId(oOrderItems.get(0).getId());
                    orderItem.setUpdateTime(new Date());
                    orderItem.setUpdateBy("ORDER_MESSAGE");
                    orderItemMapper.updateById(orderItem);
                    // 更新发货子表状态
                    OSupplierShipOrderItem updateShip = new OSupplierShipOrderItem();
                    updateShip.setRefundStatus(orderItem.getRefundStatus());
                    shipOrderItemMapper.update(updateShip,
                            new LambdaQueryWrapper<OSupplierShipOrderItem>()
                                    .eq(OSupplierShipOrderItem::getOOrderItemId,orderItem.getId()));
                }

                //更新发货表
//                if(orderItem.getRefundStatus()>1){
//                    List<OSupplierShipOrderItem> shipOrderItemList = shipOrderItemMapper.selectList(
//                            new LambdaQueryWrapper<OSupplierShipOrderItem>()
//                                    .eq(OSupplierShipOrderItem::getOrderNum, orderItem.getOrderNum())
////                                    .eq(OSupplierShipOrderItem::getProductId, orderItem.getProductId())
//                                    .eq(OSupplierShipOrderItem::getSkuId, orderItem.getSkuId())
//                    );
//                    if(shipOrderItemList!=null && shipOrderItemList.size()>0) {
//                        OSupplierShipOrderItem updateShip = new OSupplierShipOrderItem();
//                        updateShip.setId(shipOrderItemList.get(0).getId());
//                        updateShip.setRefundStatus(orderItem.getRefundStatus());
//                        shipOrderItemMapper.updateById(updateShip);
//                        // 如果全部退款了，那么就更新主表
//                        List<OSupplierShipOrderItem> supplierShipOrderItemList = shipOrderItemMapper.selectList(new LambdaQueryWrapper<OSupplierShipOrderItem>()
//                                .eq(OSupplierShipOrderItem::getOrderNum, orderItem.getOrderNum())
//                                .eq(OSupplierShipOrderItem::getSupplierId, shipOrderItemList.get(0).getSupplierId())
//                                .eq(OSupplierShipOrderItem::getRefundStatus, 1)
//                        );
//                        if(supplierShipOrderItemList==null||supplierShipOrderItemList.size()==0){
//                            // 更新主表
//                            OSupplierShipOrder shipOrder = new OSupplierShipOrder();
//                            shipOrder.setId(shipOrderItemList.get(0).getShipOrderId());
//                            shipOrder.setRefundStatus(orderItem.getRefundStatus());
//                            shipOrderMapper.updateById(shipOrder);
//                        }
//
//                    }
//                }
            }
        }
    }
}
