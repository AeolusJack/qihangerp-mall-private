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
public class WeiOrderMessageService {
    private final OOrderMapper orderMapper;
    private final OOrderItemMapper orderItemMapper;
    private final OSupplierShipOrderMapper shipOrderMapper;
    private final OSupplierShipOrderItemMapper shipOrderItemMapper;

    @Transactional
    public ResultVo<Integer> weiOrderMessage(String orderId, JSONObject orderDetail ) {
        log.info("WEI订单消息处理" + orderId);
//        JSONObject jsonObject = weiApiService.getOrderDetail(orderId);
//        if (jsonObject.getInteger("code") != 200 || jsonObject.getJSONObject("data") == null) {
//            log.info("=====wei order message===没有找到订单");
//            return ResultVo.error(404, "没有找到订单");
//        }

//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====wei order message===订单:" + JSONObject.toJSONString(orderDetail));
        if (orderDetail == null) return ResultVo.error(404, "没有找到订单");
        Long shopId = orderDetail.getLong("shopId");
        Integer originOrderStatus = orderDetail.getInteger("status");
        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
        // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除，101部分发货
        Integer orderStatus = null;
        Integer refundStatus = null;
        //状态 10	待付款；20	待发货；21	部分发货；30	待收货；100	完成；200	全部商品售后之后，订单取消；250	未付款用户主动取消或超时未付款订单自动取消；
        if(originOrderStatus == 10||originOrderStatus == 12){
            orderStatus = 21;
            refundStatus = 1;
        } else if (originOrderStatus == 20 || originOrderStatus == 21) {
            orderStatus = 1;
            refundStatus = 1;
        } else if (originOrderStatus == 30) {
            orderStatus = 2;
            refundStatus = 1;
        } else if (originOrderStatus == 100) {
            orderStatus = 3;
            refundStatus = 1;
        }else if (originOrderStatus == 200) {
            orderStatus = 11;
            refundStatus = 4;
        }else if ( originOrderStatus == 250) {
            orderStatus = 11;
            refundStatus = 11;
        }

        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            OOrder insert = new OOrder();
            insert.setOrderNum(orderId);
            insert.setShopType(EnumShopType.WEI.getIndex());
            insert.setShopId(shopId);
            insert.setBuyerMemo("");
            insert.setSellerMemo("");


//            insert.setRefundStatus(refundStatus);
            insert.setOrderStatus(orderStatus);
            Double goodsAmount = orderDetail.getInteger("productPrice").doubleValue() / 100;
            Double postFee =  orderDetail.getInteger("freight").doubleValue() / 100;
            Double orderAmount =  orderDetail.getInteger("orderPrice").doubleValue() / 100;

            insert.setGoodsAmount(goodsAmount);
            insert.setPostFee(postFee);
            Integer discountedPrice = orderDetail.getInteger("discountedPrice");
            insert.setSellerDiscount(discountedPrice!=null?discountedPrice.doubleValue()/100:0.0);
            insert.setPlatformDiscount(0.0);
            insert.setAmount(orderAmount);
            insert.setPayment(orderAmount);
            insert.setReceiverName(orderDetail.getString("userName"));
            insert.setReceiverMobile(orderDetail.getString("telNumber"));
            insert.setAddress(orderDetail.getString("detailInfo"));
            insert.setProvince(orderDetail.getString("provinceName"));
            insert.setCity(orderDetail.getString("cityName"));
            insert.setTown(orderDetail.getString("countyName"));
            long time = orderDetail.getInteger("createTime").longValue() * 1000;
            insert.setOrderTime(new Date(time));
//            insert.setShipType(0);
//            insert.setWaybillStatus(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);
            // 插入orderItem
            addWeiOrderItem(insert.getId(),orderId,shopId,orderStatus,orderDetail.getJSONArray("items"));
        } else{
            // 修改订单 (修改：)
            OOrder update = new OOrder();
            update.setId(oOrders.get(0).getId());
//            update.setRefundStatus(refundStatus);
            update.setOrderStatus(orderStatus);
//            long time = originOrder.getCreateTime().longValue() * 1000;
//            update.setOrderTime(new Date(time));
//            update.setGoodsAmount(originOrder.getOrderAmount().doubleValue()/100);
//            update.setPostFee(originOrder.getPostAmount().doubleValue()/100);
//            update.setAmount(originOrder.getOrderAmount().doubleValue()/100);
//            update.setPayment(originOrder.getPayAmount().doubleValue()/100);
            update.setReceiverName(orderDetail.getString("userName"));
            update.setReceiverMobile(orderDetail.getString("telNumber"));
            update.setAddress(orderDetail.getString("detailInfo"));
            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);

            //修改发货表退款状态（o_supplier_ship_order）
//            if(refundStatus>1){
//                OSupplierShipOrder updateShip = new OSupplierShipOrder();
//                updateShip.setRefundStatus(refundStatus);
//                shipOrderMapper.update(updateShip,new LambdaQueryWrapper<OSupplierShipOrder>().eq(OSupplierShipOrder::getOrderNum,oOrders.get(0).getOrderNum()));
//            }
            // 更新发货主表数据状态
            OSupplierShipOrder shipOrder = new OSupplierShipOrder();
            shipOrder.setOrderStatus(update.getOrderStatus());
            shipOrderMapper.update(shipOrder,new LambdaQueryWrapper<OSupplierShipOrder>().eq(OSupplierShipOrder::getOOrderId,update.getId()));

            // 插入orderItem
            addWeiOrderItem(update.getId(),orderId,update.getShopId(),orderStatus,orderDetail.getJSONArray("items"));
        }

        return ResultVo.success();
    }

    private void addWeiOrderItem(String oOrderId, String originOrderId, Long shopId, Integer orderStatus, JSONArray itemArray){
        if(itemArray!=null && itemArray.size()>0) {
            for (int i = 0; i < itemArray.size(); i++) {
                JSONObject itemObject = itemArray.getJSONObject(i);
//                OOrderItem orderItem = new OOrderItem();
//                orderItem.setOrderId(oOrderId);
//                orderItem.setOrderNum(item.getParentOrderId());
//                orderItem.setSubOrderNum(item.getOrderId());
                OOrderItem orderItem = new OOrderItem();
                orderItem.setOrderId(oOrderId);
                orderItem.setOrderNum(originOrderId);
                orderItem.setSubOrderNum(originOrderId + "-" + itemObject.getString("skuId"));
                orderItem.setSkuNum(itemObject.getString("skuCode"));
                orderItem.setSkuId(itemObject.getString("skuId"));
                orderItem.setProductId(itemObject.getString("productId"));
                orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
                orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
                orderItem.setGoodsImg(itemObject.getString("thumbImg"));
                orderItem.setGoodsTitle(itemObject.getString("title"));
                orderItem.setGoodsSpec(itemObject.getString("skuAttrs"));
                orderItem.setGoodsPrice(itemObject.getDouble("salePrice")/100);
                orderItem.setItemAmount(itemObject.getDouble("realPrice")/100);
                orderItem.setPayment(itemObject.getDouble("realPrice")/100);
                orderItem.setDiscountAmount(orderItem.getGoodsPrice()-orderItem.getItemAmount());

                orderItem.setQuantity(itemObject.getInteger("skuCnt"));
                orderItem.setOrderStatus(orderStatus);
                orderItem.setRefundStatus(itemObject.getInteger("refundStatus"));
                orderItem.setRefundCount(itemObject.getInteger("onAftersaleSkuCnt")+itemObject.getInteger("finishAftersaleSkuCnt"));


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
//                                    .eq(OSupplierShipOrderItem::getProductId, orderItem.getProductId())
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
