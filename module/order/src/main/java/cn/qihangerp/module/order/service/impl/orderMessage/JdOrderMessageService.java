package cn.qihangerp.module.order.service.impl.orderMessage;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.enums.JdOrderStateEnum;
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

import java.util.Date;
import java.util.List;

@Slf4j
@AllArgsConstructor
@Service
public class JdOrderMessageService {
    private final OOrderMapper orderMapper;
    private final OOrderItemMapper orderItemMapper;
    private final OSupplierShipOrderMapper shipOrderMapper;
    private final OSupplierShipOrderItemMapper shipOrderItemMapper;

    @Transactional
    public ResultVo<Integer> jdOrderMessage(String orderId, JSONObject orderDetail) {
        log.info("京东订单消息处理"+orderId);
//        JSONObject jsonObject = jdApiService.getOrderDetail(Long.parseLong(orderId),0);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====jdpop order message===没有找到订单");
//            return ResultVo.error(404,"没有找到订单");
//        }

//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====jdpop order message===订单:"+JSONObject.toJSONString(orderDetail));

        JSONArray itemArray = orderDetail.getJSONArray("items");
        if (itemArray.isEmpty()) {
//            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            log.info("=====jdpop order message===没有items====事务回滚=======");
        }

//        List<JdOrder> jdOrders = jdOrderMapper.selectList(new LambdaQueryWrapper<JdOrder>().eq(JdOrder::getOrderId, orderId));
//        if(jdOrders == null || jdOrders.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到JD订单："+orderId);
//        }
//        JdOrder jdOrder = jdOrders.get(0);
        // 状态
        int orderStatus = JdOrderStateEnum.getIndex(orderDetail.getString("orderState"));
        Integer refundStatus=-1;
        if (orderStatus == 11) {
            //已取消的订单
            refundStatus=4;
        } else if (orderStatus == -1) {
            refundStatus=-1;
        } else {
            refundStatus=1;
        }
        // 价格
        double orderSellerPrice = 0.0;
        try{
            orderSellerPrice = StringUtils.isEmpty(orderDetail.getString("orderSellerPrice")) ? 0.0 : Double.parseDouble(orderDetail.getString("orderSellerPrice"));
        }catch (Exception e){}
        double freightPrice =0.0;
        try{
            freightPrice = StringUtils.isEmpty(orderDetail.getString("freightPrice")) ? 0.0 : Double.parseDouble(orderDetail.getString("freightPrice"));
        }catch (Exception e){}
        double orderPayment = 0.0;
        try {
            orderPayment = StringUtils.isEmpty(orderDetail.getString("orderPayment")) ? 0.0 : Double.parseDouble(orderDetail.getString("orderPayment"));
        }catch (Exception e){
        }
        double sellerDiscount= 0.0;
        try {
            sellerDiscount = StringUtils.isEmpty(orderDetail.getString("sellerDiscount")) ? 0.0 : Double.parseDouble(orderDetail.getString("sellerDiscount"));
        }catch (Exception e){
        }
        if(orderSellerPrice == 0.0) orderSellerPrice = orderPayment;
        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单 12
            OOrder insert = new OOrder();
            insert.setOrderNum(orderId);
            insert.setShopType(EnumShopType.JD.getIndex());
            insert.setShopId(orderDetail.getLong("shopId"));
            insert.setBuyerMemo(orderDetail.getString("orderRemark"));
            insert.setSellerMemo(orderDetail.getString("venderRemark"));
//            insert.setRefundStatus(refundStatus);
            insert.setOrderStatus(orderStatus);
            // 价格
            insert.setGoodsAmount(orderSellerPrice);
            insert.setPayment(orderPayment);
            insert.setAmount(orderSellerPrice);
            insert.setPostFee(freightPrice);
            insert.setPlatformDiscount(0.0);
            insert.setSellerDiscount(sellerDiscount);

            insert.setReceiverName(orderDetail.getString("fullname"));
            insert.setReceiverMobile(orderDetail.getString("mobile"));
            insert.setAddress(orderDetail.getString("fullAddress"));
            insert.setProvince(orderDetail.getString("province"));
            insert.setCity(orderDetail.getString("city"));
            insert.setTown(orderDetail.getString("county"));
            insert.setOrderTime(DateUtils.parseDate(orderDetail.getString("orderStartTime")));
//            insert.setShipType(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);

            // 添加orderItem
            addJdOrderItem(orderId,insert.getId(),orderStatus,orderSellerPrice,orderPayment,itemArray);
        }else{
            // 修改订单 (修改：)
            OOrder update = new OOrder();
            update.setId(oOrders.get(0).getId());
            // 价格
            update.setGoodsAmount(orderSellerPrice);
            update.setPayment(orderPayment);
            update.setAmount(orderSellerPrice);
            update.setPostFee(freightPrice);
            update.setPlatformDiscount(0.0);
            update.setSellerDiscount(sellerDiscount);
//            update.setRefundStatus(refundStatus);
            update.setOrderStatus(orderStatus);
            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);

            // 更新发货主表数据状态
            OSupplierShipOrder shipOrder = new OSupplierShipOrder();
            shipOrder.setOrderStatus(update.getOrderStatus());
            shipOrderMapper.update(shipOrder,new LambdaQueryWrapper<OSupplierShipOrder>().eq(OSupplierShipOrder::getOOrderId,update.getId()));
            // 插入orderItem
            addJdOrderItem(orderId,update.getId(),orderStatus,orderSellerPrice,orderPayment,itemArray);

        }
        return ResultVo.success();
    }

    private void addJdOrderItem(String orderId,String oOrderId,Integer orderStatus,Double orderSellerPrice,Double orderPayment,JSONArray itemArray ) {
        Double payedItemAmount = 0.0;//已付金额
        for (int i = 0; i < itemArray.size(); i++) {
            JSONObject itemObject = itemArray.getJSONObject(i);

            OOrderItem orderItem = new OOrderItem();
            orderItem.setOrderId(oOrderId);
            orderItem.setOrderNum(orderId);
            orderItem.setSubOrderNum(orderId + "-" + itemObject.getString("skuId"));
            // TODO：这里将订单商品skuid转换成erp系统的skuid
//            Long erpGoodsId = 0L;
//            String erpSkuId = "0";
//
//            List<JdGoodsSku> jdGoodsSkus = jdGoodsSkuMapper.selectList(new LambdaQueryWrapper<JdGoodsSku>().eq(JdGoodsSku::getSkuId, item.getSkuId()));
//            if (jdGoodsSkus != null && !jdGoodsSkus.isEmpty()) {
//                erpGoodsId = jdGoodsSkus.get(0).getOGoodsId();
//                erpSkuId = jdGoodsSkus.get(0).getOGoodsSkuId();
//                orderItem.setGoodsImg(jdGoodsSkus.get(0).getLogo());
//                orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
//                orderItem.setSkuNum(jdGoodsSkus.get(0).getOuterId());
//            }
            orderItem.setSkuNum(itemObject.getString("outerSkuId"));
            orderItem.setSkuId(itemObject.getString("skuId"));
            orderItem.setProductId(itemObject.getString("wareId"));
            orderItem.setGoodsId(itemObject.getLong("oGoodsId"));
            orderItem.setGoodsSkuId(itemObject.getString("oGoodsSkuId"));
            orderItem.setGoodsTitle(itemObject.getString("skuName"));
            orderItem.setGoodsPrice(StringUtils.isEmpty(itemObject.getString("jdPrice")) ? 0.0 : Double.parseDouble(itemObject.getString("jdPrice")));
            Integer quantity = itemObject.getInteger("itemTotal");

            // TODO:计算子订单价格 计算公式不对
//            Double orderTotalPrice = Double.parseDouble(jdOrder.getOrderTotalPrice()) * 100;
//            Double orderPayment = Double.parseDouble(jdOrder.getOrderPayment()) * 100;
//            // 折扣比例
//            Double rate = orderPayment / orderTotalPrice;
//
//            // 折扣计算后的价格
//            if ((i+1) != itemArray.size()) {
//                Double itemAmountTmp = orderItem.getGoodsPrice() * rate * quantity;
//                double itemAmount = BigDecimal.valueOf(itemAmountTmp).setScale(2, RoundingMode.HALF_UP).doubleValue();
//                orderItem.setItemAmount(itemAmount);
//                orderItem.setPayment(itemAmount);
//                payedItemAmount += itemAmount;
////                    availableItemAmount = Double.parseDouble(jdOrder.getOrderPayment()) - availableItemAmount;
//            } else {
//                payedItemAmount = Double.parseDouble(jdOrder.getOrderPayment()) - payedItemAmount;
//                orderItem.setItemAmount(payedItemAmount);
//                orderItem.setPayment(payedItemAmount);
//            }

//                    orderItem.setItemAmount(orderItem.getGoodsPrice() *quantity);

            orderItem.setQuantity(quantity);
            if (orderStatus == 11) {
                orderItem.setRefundStatus(4);
                orderItem.setRefundCount(quantity);
            } else if (orderStatus == -1) {
                orderItem.setRefundStatus(-1);
            } else {
                orderItem.setRefundStatus(1);
                orderItem.setRefundCount(0);
            }
            List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrderId).eq(OOrderItem::getSkuId, orderItem.getSkuId()));
            if (oOrderItems.isEmpty()) {
                //新增
                orderItem.setCreateTime(new Date());
                orderItem.setCreateBy("ORDER_MESSAGE");
                orderItemMapper.insert(orderItem);
            } else {
                orderItem.setUpdateTime(new Date());
                orderItem.setUpdateBy("更新");
                orderItem.setId(oOrderItems.get(0).getId());
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


    @Transactional
    public ResultVo<Integer> jdvcOrderMessage(String customOrderId,JSONObject orderDetail ) {
        log.info("接收jdvc订单消息："+customOrderId);
//        JSONObject jsonObject = jdApiService.getOrderDetail(Long.parseLong(customOrderId),1);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====jdvc order message===没有找到订单");
//            return ResultVo.error(404,"没有找到订单");
//        }
//
//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====jdvc order message===订单:"+JSONObject.toJSONString(orderDetail));

        JSONArray itemArray = orderDetail.getJSONArray("items");
        if (itemArray.isEmpty()) {
//            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            log.info("=====jdvc order message===没有items====事务回滚=======");
        }


//        List<JdVcOrder> jdVcOrders = jdVcOrderMapper.selectList(new LambdaQueryWrapper<JdVcOrder>().eq(JdVcOrder::getCustomOrderId, customOrderId));
//        if(jdVcOrders == null || jdVcOrders.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO订单："+customOrderId);
//        }
//        JdVcOrder jdVcOrder = jdVcOrders.get(0);
        // 状态
        Integer orderStatus = null;
        Integer refundStatus = null;
        // 订单状态:7 新订单；10等待发货；16等待确认收货；19订单完成；22锁定，29删除
        Integer orderState = orderDetail.getInteger("orderState");
        if(orderState==7){
            //7 新订单；
            orderStatus = 1;
            refundStatus =1;

        }else if(orderState==10){
            //10等待发货；
            orderStatus = 1;
            refundStatus=1;
        }else if(orderState==16){
            //16等待确认收货；
            orderStatus = 2;
            refundStatus=1;
        }else if(orderState==19){
            //19订单完成；
            orderStatus = 3;
            refundStatus=1;
        }else if(orderState==22){
            //22锁定；
            orderStatus = 22;
            refundStatus = 1;
        }else if(orderState==29) {
            //29删除；
            orderStatus = 29;
            refundStatus = 1;
        }

        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, customOrderId));
        if(oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            // 新增订单
            OOrder insert = new OOrder();
            insert.setOrderNum(customOrderId);
            insert.setShopType(EnumShopType.JDVC.getIndex());
            insert.setShopId(orderDetail.getLong("shopId"));
            insert.setBuyerMemo(orderDetail.getString("orderRemark"));
            insert.setSellerMemo(orderDetail.getString("memoByVendor"));

            insert.setOrderStatus(orderStatus);
//            insert.setRefundStatus(refundStatus);
            insert.setGoodsAmount(orderDetail.getDouble("jdPrice"));
            insert.setPostFee(orderDetail.getDouble("totalCarriage"));
            insert.setAmount(orderDetail.getDouble("cost"));
            insert.setPayment(orderDetail.getDouble("cost"));
            insert.setPlatformDiscount(0.0);
            insert.setSellerDiscount(0.0);

            insert.setReceiverName(orderDetail.getString("consigneeName"));
            insert.setReceiverMobile(orderDetail.getString("phone"));
            insert.setAddress(orderDetail.getString("address"));
            insert.setProvince(orderDetail.getString("provinceName"));
            insert.setCity(orderDetail.getString("cityName"));
            insert.setTown(orderDetail.getString("countyName"));
            insert.setOrderTime(orderDetail.getDate("orderCreateDate"));
//            insert.setShipType(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);
            // 插入orderItem
            addJdVcOrderItem(insert.getId(),customOrderId,orderStatus,orderDetail.getJSONArray("items"));
        }else {
            //修改
            // 修改订单 (修改：)
            OOrder update = new OOrder();
            update.setId(oOrders.get(0).getId());
            update.setOrderStatus(orderStatus);
//            update.setRefundStatus(refundStatus);
            update.setGoodsAmount(orderDetail.getDouble("jdPrice"));
            update.setPostFee(orderDetail.getDouble("totalCarriage"));
            update.setAmount(orderDetail.getDouble("cost"));
            update.setPayment(orderDetail.getDouble("cost"));
            update.setPlatformDiscount(0.0);
            update.setSellerDiscount(0.0);
            update.setPlatformDiscount(0.0);
            update.setSellerDiscount(0.0);

            update.setReceiverName(orderDetail.getString("consigneeName"));
            update.setReceiverMobile(orderDetail.getString("phone"));
            update.setAddress(orderDetail.getString("address"));
            update.setProvince(orderDetail.getString("provinceName"));
            update.setCity(orderDetail.getString("cityName"));
            update.setTown(orderDetail.getString("countyName"));
//            update.setOrderTime(jdVcOrder.getOrderCreateDate() );
            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);

            // 更新发货主表数据状态
            OSupplierShipOrder shipOrder = new OSupplierShipOrder();
            shipOrder.setOrderStatus(update.getOrderStatus());
            shipOrderMapper.update(shipOrder,new LambdaQueryWrapper<OSupplierShipOrder>().eq(OSupplierShipOrder::getOOrderId,update.getId()));

            // 插入orderItem
            addJdVcOrderItem(update.getId(),customOrderId,orderStatus,orderDetail.getJSONArray("items"));
        }
        return ResultVo.success();
    }

    private void addJdVcOrderItem(String oOrderId,String customOrderId,Integer orderStatus,JSONArray orderItems){

        if(orderItems!=null && orderItems.size()>0) {
            for (int i =0;i<orderItems.size();i++) {
                JSONObject itemObject =orderItems.getJSONObject(i);

                OOrderItem orderItem = new OOrderItem();
                orderItem.setOrderId(oOrderId);
                orderItem.setOrderNum(customOrderId);
                orderItem.setSubOrderNum(customOrderId+"-"+itemObject.getString("sku"));
                orderItem.setSkuNum(itemObject.getString("sku"));
                orderItem.setSkuId(itemObject.getString("sku"));
                orderItem.setProductId(itemObject.getString("upc"));
                orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
                orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
                orderItem.setGoodsImg("");
                orderItem.setGoodsSpec(itemObject.getString("wareName"));
                orderItem.setGoodsTitle(itemObject.getString("wareName"));
                orderItem.setGoodsPrice(itemObject.getDouble("jdPrice"));
                orderItem.setItemAmount(itemObject.getDouble("cost"));
                orderItem.setPayment(itemObject.getDouble("cost"));
                orderItem.setQuantity(itemObject.getInteger("wareNum"));
                orderItem.setRefundStatus(1);
                orderItem.setRefundCount(0);
                // 状态
                orderItem.setOrderStatus(orderStatus);

                List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrderId).eq(OOrderItem::getSkuId, orderItem.getSkuId()));
                if (oOrderItems.isEmpty()) {
                    //新增
                    orderItem.setCreateTime(new Date());
                    orderItem.setCreateBy("ORDER_MESSAGE");
                    orderItemMapper.insert(orderItem);
                } else {
                    orderItem.setUpdateTime(new Date());
                    orderItem.setUpdateBy("更新");
                    orderItem.setId(oOrderItems.get(0).getId());
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


}
