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
import cn.qihangerp.utils.DateUtils;
import cn.qihangerp.utils.StringUtils;
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
public class PddOrderMessageService {
    private final OOrderMapper orderMapper;
    private final OOrderItemMapper orderItemMapper;
    private final OSupplierShipOrderMapper shipOrderMapper;
    private final OSupplierShipOrderItemMapper shipOrderItemMapper;
    @Transactional
    public ResultVo<Integer> pddOrderMessage(String orderSn, JSONObject orderDetail ) {
        log.info("=====pdd order message===订单号{}==="+orderSn);
//        JSONObject jsonObject = pddApiService.getOrderDetail(orderSn);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====pdd order message===没有找到订单");
//            return ResultVo.error(404,"没有找到订单");
//        }
//
//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====pdd order message===订单:"+JSONObject.toJSONString(orderDetail));
        if(orderDetail == null) return ResultVo.error(404,"没有找到订单");
//        List<PddOrder> originOrders = pddOrderMapper.selectList(new LambdaQueryWrapper<PddOrder>().eq(PddOrder::getOrderSn, orderSn));
//
//        if(originOrders == null || originOrders.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到PDD原始订单："+orderSn);
//        }
//        PddOrder originOrder = originOrders.get(0);
//        PddOrder originOrder = new PddOrder();

        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderSn));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            OOrder insert = new OOrder();
            insert.setOrderNum(orderSn);
            insert.setShopType(EnumShopType.PDD.getIndex());
            insert.setShopId(orderDetail.getLong("shopId"));
            insert.setBuyerMemo(orderDetail.getString("buyerMemo"));
            insert.setSellerMemo(orderDetail.getString("remark"));
            Integer originOrderStatus = orderDetail.getInteger("orderStatus");
            Integer originRefundStatus = orderDetail.getInteger("refundStatus");
            // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除
            int orderStatus = -1;
            int refundStatus = -1;
            if (originRefundStatus == 1) {
                // 没有售后
                orderStatus = originOrderStatus;
                refundStatus = 1;
            } else {
                if (originRefundStatus == 4) {
                    refundStatus = 4;
                    orderStatus = 11;
                } else {
                    refundStatus = originRefundStatus;
                    orderStatus = 12;
                }
            }
//            insert.setRefundStatus(refundStatus);
            insert.setOrderStatus(orderStatus);
            // 价格
            insert.setGoodsAmount(orderDetail.getDouble("goodsAmount"));//.getGoodsAmount());
            insert.setPostFee(orderDetail.getDouble("postage"));
            insert.setAmount(orderDetail.getDouble("payAmount"));
            insert.setPayment(orderDetail.getDouble("payAmount"));
//            double platformDiscount = originOrder.getPlatformDiscount()!=null?originOrder.getPlatformDiscount():0.0;
            insert.setPlatformDiscount(orderDetail.getDouble("platformDiscount"));
//            double sellerDiscount = originOrder.getSellerDiscount()!=null?originOrder.getSellerDiscount():0.0;
            insert.setSellerDiscount(orderDetail.getDouble("sellerDiscount"));

            insert.setReceiverName(orderDetail.getString("receiverNameMask"));
            insert.setReceiverMobile(orderDetail.getString("receiverPhoneMask"));
            insert.setAddress(orderDetail.getString("addressMask"));
            insert.setProvince(orderDetail.getString("province"));
            insert.setCity(orderDetail.getString("city"));
            insert.setTown(orderDetail.getString("town"));
            insert.setOrderTime(DateUtils.parseDate(orderDetail.getString("createdTime")));
//            insert.setShipType(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);
            // 插入orderItem
//            addPddOrderItem(insert.getId(),originOrder.getOrderSn(),orderStatus,refundStatus,platformDiscount,sellerDiscount);
            JSONArray itemArray = orderDetail.getJSONArray("items");
            if (itemArray.isEmpty()) {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                log.info("=====pdd order message===没有items====事务回滚=======");
            }


            for (int i =0;i<itemArray.size();i++) {
                JSONObject itemObject =itemArray.getJSONObject(i);
//                Map<String,Object> itemObject = (Map<String, Object>) itemArray.get(i);
//                JSONObject itemObject = (JSONObject) item;

                OOrderItem orderItem = new OOrderItem();
                orderItem.setOrderId(insert.getId());
                orderItem.setOrderNum(orderSn);
                orderItem.setSubOrderNum(orderSn+"-"+itemObject.getString("skuId"));
                // 这里将订单商品skuid转换成erp系统的skuid
//                Long erpGoodsId = 0L;
//                String erpSkuId = "0";
//
//                List<PddGoodsSku> pddGoodsSku = pddGoodsSkuMapper.selectList(new LambdaQueryWrapper<PddGoodsSku>().eq(PddGoodsSku::getSkuId, item.getSkuId()));
//                if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
//                    erpGoodsId = pddGoodsSku.get(0).getOGoodsId();
//                    erpSkuId = pddGoodsSku.get(0).getOGoodsSkuId();
////                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
////                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
////                    orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
//                }
                orderItem.setSkuNum(itemObject.getString("outerId"));
                orderItem.setSkuId(itemObject.getString("skuId"));
                orderItem.setProductId(itemObject.getString("goodsId"));
                orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
                orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
                orderItem.setGoodsImg(itemObject.getString("goodsImg"));
                orderItem.setGoodsSpec(itemObject.getString("goodsSpec"));
                orderItem.setGoodsTitle(itemObject.getString("goodsName"));
                orderItem.setGoodsPrice(itemObject.getDouble("goodsPrice"));
                orderItem.setQuantity(itemObject.getInteger("goodsCount"));
                if (i == 0) {
                    Double itemAmount = orderItem.getGoodsPrice() * orderItem.getQuantity() - insert.getPlatformDiscount() - insert.getSellerDiscount();
                    orderItem.setItemAmount(itemAmount);
                    orderItem.setPayment(itemAmount);
                } else {
                    orderItem.setItemAmount(orderItem.getGoodsPrice()* orderItem.getQuantity());
                    orderItem.setPayment(orderItem.getGoodsPrice()* orderItem.getQuantity());
                }
//                orderItem.setPayment(item.getGoodsPrice());

                orderItem.setOrderStatus(orderStatus);
                orderItem.setRefundStatus(refundStatus);
                orderItem.setRefundCount(0);
                orderItem.setCreateTime(new Date());
                orderItem.setCreateBy("ORDER_MESSAGE");
                orderItemMapper.insert(orderItem);
            }


        }else {
            // 修改订单 (修改：)
            OOrder update = new OOrder();
            update.setId(oOrders.get(0).getId());
            Integer originOrderStatus = orderDetail.getInteger("orderStatus");
            Integer originRefundStatus = orderDetail.getInteger("refundStatus");
            // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除
            int orderStatus = -1;
            int refundStatus = -1;
            if (originRefundStatus == 1) {
                // 没有售后
                orderStatus = originOrderStatus;
                refundStatus = 1;
            } else {
                if (originRefundStatus == 4) {
                    refundStatus = 4;
                    orderStatus = 11;
                } else {
                    refundStatus = originRefundStatus;
                    orderStatus = 12;
                }
            }
//            update.setRefundStatus(refundStatus);
            update.setOrderStatus(orderStatus);

            // 价格
            update.setGoodsAmount(orderDetail.getDouble("goodsAmount"));//.getGoodsAmount());
            update.setPostFee(orderDetail.getDouble("postage"));
            update.setAmount(orderDetail.getDouble("payAmount"));
            update.setPayment(orderDetail.getDouble("payAmount"));
//            double platformDiscount = originOrder.getPlatformDiscount()!=null?originOrder.getPlatformDiscount():0.0;
            update.setPlatformDiscount(orderDetail.getDouble("platformDiscount"));
//            double sellerDiscount = originOrder.getSellerDiscount()!=null?originOrder.getSellerDiscount():0.0;
            update.setSellerDiscount(orderDetail.getDouble("sellerDiscount"));

            if (orderStatus == 1 && refundStatus == 1) {
                if (StringUtils.isNotBlank(orderDetail.getString("receiverNameMask"))) {
                    update.setReceiverName(orderDetail.getString("receiverNameMask"));
                }
                if (StringUtils.isNotBlank(orderDetail.getString("receiverPhoneMask"))) {
                    update.setReceiverMobile(orderDetail.getString("receiverPhoneMask"));
                }
                if (StringUtils.isNotBlank(orderDetail.getString("addressMask"))) {
                    update.setAddress(orderDetail.getString("addressMask"));
                }
            }

            if (StringUtils.isNotBlank(orderDetail.getString("province"))) {
                update.setProvince(orderDetail.getString("province"));
            }
            if (StringUtils.isNotBlank(orderDetail.getString("city"))) {
                update.setCity(orderDetail.getString("city"));
            }
            if (StringUtils.isNotBlank(orderDetail.getString("town"))) {
                update.setTown(orderDetail.getString("town"));
            }
            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);

            // 更新发货主表数据状态
            OSupplierShipOrder shipOrder = new OSupplierShipOrder();
            shipOrder.setOrderStatus(update.getOrderStatus());
            shipOrderMapper.update(shipOrder,new LambdaQueryWrapper<OSupplierShipOrder>().eq(OSupplierShipOrder::getOOrderId,update.getId()));
//            // 插入orderItem
//            addPddOrderItem(update.getId(),originOrder.getOrderSn(),orderStatus,refundStatus,platformDiscount,sellerDiscount);

            JSONArray itemArray = orderDetail.getJSONArray("items");
            if (itemArray.isEmpty()) {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                log.info("=====pdd order message===没有items====事务回滚=======");
            }


            for (int i = 0; i < itemArray.size(); i++) {
                JSONObject itemObject = itemArray.getJSONObject(i);
                List<OOrderItem> oOrderItems = orderItemMapper.selectList(
                        new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrders.get(0).getId())
                                .eq(OOrderItem::getSkuId, itemObject.getString("skuId")));
                if (oOrderItems.isEmpty()) {
                    // 新增item
                    OOrderItem orderItem = new OOrderItem();
                    orderItem.setOrderId(oOrders.get(0).getId());
                    orderItem.setOrderNum(orderSn);
                    orderItem.setSubOrderNum(orderSn + "-" + itemObject.getString("skuId"));
                    orderItem.setSkuNum(itemObject.getString("outerId"));
                    orderItem.setSkuId(itemObject.getString("skuId"));
                    orderItem.setProductId(itemObject.getString("goodsId"));
                    orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
                    orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
                    orderItem.setGoodsImg(itemObject.getString("goodsImg"));
                    orderItem.setGoodsSpec(itemObject.getString("goodsSpec"));
                    orderItem.setGoodsTitle(itemObject.getString("goodsName"));
                    orderItem.setGoodsPrice(itemObject.getDouble("goodsPrice"));
                    orderItem.setQuantity(itemObject.getInteger("goodsCount"));
                    if (i == 0) {
                        Double itemAmount = orderItem.getGoodsPrice() * orderItem.getQuantity() - oOrders.get(0).getPlatformDiscount() - oOrders.get(0).getSellerDiscount();
                        orderItem.setItemAmount(itemAmount);
                        orderItem.setPayment(itemAmount);
                    } else {
                        orderItem.setItemAmount(orderItem.getGoodsPrice() * orderItem.getQuantity());
                        orderItem.setPayment(orderItem.getGoodsPrice() * orderItem.getQuantity());
                    }
                    orderItem.setOrderStatus(orderStatus);
                    orderItem.setRefundStatus(refundStatus);
                    orderItem.setRefundCount(0);
                    orderItem.setCreateTime(new Date());
                    orderItem.setCreateBy("ORDER_MESSAGE");
                    orderItemMapper.insert(orderItem);
                } else {
                    // 修改、
                    OOrderItem orderItem = new OOrderItem();
                    orderItem.setId(oOrderItems.get(0).getId());

                    orderItem.setSkuNum(itemObject.getString("outerId"));
                    orderItem.setSkuId(itemObject.getString("skuId"));
                    orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
                    orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
                    orderItem.setGoodsImg(itemObject.getString("goodsImg"));
                    orderItem.setGoodsSpec(itemObject.getString("goodsSpec"));
                    orderItem.setGoodsTitle(itemObject.getString("goodsName"));
                    orderItem.setGoodsPrice(itemObject.getDouble("goodsPrice"));
                    orderItem.setQuantity(itemObject.getInteger("goodsCount"));
                    if (i == 0) {
                        Double itemAmount = orderItem.getGoodsPrice() * orderItem.getQuantity() - oOrders.get(0).getPlatformDiscount() - oOrders.get(0).getSellerDiscount();
                        orderItem.setItemAmount(itemAmount);
                        orderItem.setPayment(itemAmount);
                    } else {
                        orderItem.setItemAmount(orderItem.getGoodsPrice() * orderItem.getQuantity());
                        orderItem.setPayment(orderItem.getGoodsPrice() * orderItem.getQuantity());
                    }
                    orderItem.setOrderStatus(orderStatus);
                    orderItem.setRefundStatus(refundStatus);
                    orderItem.setRefundCount(0);
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
            }
        }
        return ResultVo.success();
    }
}
