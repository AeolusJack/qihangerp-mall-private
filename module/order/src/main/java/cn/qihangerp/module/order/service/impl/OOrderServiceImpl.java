package cn.qihangerp.module.order.service.impl;

import cn.qihangerp.module.order.domain.*;
import cn.qihangerp.module.order.domain.vo.OrderDiscountVo;
import cn.qihangerp.module.order.domain.vo.SalesDailyVo;
import cn.qihangerp.module.order.mapper.*;
import cn.qihangerp.module.order.service.OOrderService;
import cn.qihangerp.module.order.service.impl.orderMessage.*;
import cn.qihangerp.request.OrderSearchRequest;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.enums.JdOrderStateEnum;
import cn.qihangerp.common.enums.TaoOrderStateEnum;
import cn.qihangerp.utils.DateUtils;
import cn.qihangerp.utils.StringUtils;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
* @author qilip
* @description 针对表【o_order(订单表)】的数据库操作Service实现
* @createDate 2024-03-09 13:15:57
*/
@Slf4j
@AllArgsConstructor
@Service
public class OOrderServiceImpl extends ServiceImpl<OOrderMapper, OOrder>
    implements OOrderService {

    private final OOrderMapper orderMapper;
    private final OOrderItemMapper orderItemMapper;
    private final OSupplierShipOrderMapper shipOrderMapper;
    private final OSupplierShipOrderItemMapper shipOrderItemMapper;
    private final OfflineOrderMessageService offlineOrderMessageService;
    private final WeiOrderMessageService weiOrderMessageService;
    private final DouOrderMessageService douOrderMessageService;
    private final PddOrderMessageService pddOrderMessageService;
    private final TaoOrderMessageService taoOrderMessageService;
    private final JdOrderMessageService jdOrderMessageService;
//    private final OfflineOrderMapper offlineOrderMapper;
//    private final OfflineOrderItemMapper offlineOrderItemMapper;
//    private final PddApiService pddApiService;
//    private final TaoApiService taoApiService;
//    private final JdApiService jdApiService;
//    private final DouApiService douApiService;
//    private final WeiApiService weiApiService;


    private final String DATE_PATTERN =
            "^(?:(?:(?:\\d{4}-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|1\\d|2[0-8]))|(?:(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26])|(?:(?:0[48]|[2468][048]|[13579][26])00))-0?2-29))$)|(?:(?:(?:\\d{4}-(?:0?[13578]|1[02]))-(?:0?[1-9]|[12]\\d|30))$)|(?:(?:(?:\\d{4}-0?[13-9]|1[0-2])-(?:0?[1-9]|[1-2]\\d|30))$)|(?:(?:(?:\\d{2}(?:0[48]|[13579][26]|[2468][048])|(?:(?:0[48]|[13579][26]|[2468][048])00))-0?2-29))$)$";
    private final Pattern DATE_FORMAT = Pattern.compile(DATE_PATTERN);
    @Transactional
    @Override
    public ResultVo<Integer> jdOrderMessage(String orderId,JSONObject orderDetail) {
        log.info("京东订单消息处理"+orderId);
//        JSONObject jsonObject = jdApiService.getOrderDetail(Long.parseLong(orderId),0);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====jdpop order message===没有找到订单");
//            return ResultVo.error(404,"没有找到订单");
//        }

//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====jdpop order message===订单:"+JSONObject.toJSONString(orderDetail));
        return jdOrderMessageService.jdOrderMessage(orderId,orderDetail);
//        JSONArray itemArray = orderDetail.getJSONArray("items");
//        if (itemArray.isEmpty()) {
////            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//            log.info("=====jdpop order message===没有items====事务回滚=======");
//        }

//        List<JdOrder> jdOrders = jdOrderMapper.selectList(new LambdaQueryWrapper<JdOrder>().eq(JdOrder::getOrderId, orderId));
//        if(jdOrders == null || jdOrders.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到JD订单："+orderId);
//        }
//        JdOrder jdOrder = jdOrders.get(0);
        // 状态
//        int orderStatus = JdOrderStateEnum.getIndex(orderDetail.getString("orderState"));
//        Integer refundStatus=-1;
//        if (orderStatus == 11) {
//            //已取消的订单
//            refundStatus=4;
//        } else if (orderStatus == -1) {
//            refundStatus=-1;
//        } else {
//            refundStatus=1;
//        }
//        // 价格
//        double orderSellerPrice = 0.0;
//        try{
//            orderSellerPrice = StringUtils.isEmpty(orderDetail.getString("orderSellerPrice")) ? 0.0 : Double.parseDouble(orderDetail.getString("orderSellerPrice"));
//        }catch (Exception e){}
//        double freightPrice =0.0;
//        try{
//            freightPrice = StringUtils.isEmpty(orderDetail.getString("freightPrice")) ? 0.0 : Double.parseDouble(orderDetail.getString("freightPrice"));
//        }catch (Exception e){}
//        double orderPayment = 0.0;
//        try {
//            orderPayment = StringUtils.isEmpty(orderDetail.getString("orderPayment")) ? 0.0 : Double.parseDouble(orderDetail.getString("orderPayment"));
//        }catch (Exception e){
//        }
//        double sellerDiscount= 0.0;
//        try {
//            sellerDiscount = StringUtils.isEmpty(orderDetail.getString("sellerDiscount")) ? 0.0 : Double.parseDouble(orderDetail.getString("sellerDiscount"));
//        }catch (Exception e){
//        }
//        if(orderSellerPrice == 0.0) orderSellerPrice = orderPayment;
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
//        if(oOrders == null || oOrders.isEmpty()) {
//            // 新增订单 12
//            OOrder insert = new OOrder();
//            insert.setOrderNum(orderId);
//            insert.setShopType(EnumShopType.JD.getIndex());
//            insert.setShopId(orderDetail.getLong("shopId"));
//            insert.setBuyerMemo(orderDetail.getString("orderRemark"));
//            insert.setSellerMemo(orderDetail.getString("venderRemark"));
//            insert.setRefundStatus(refundStatus);
//            insert.setOrderStatus(orderStatus);
//            // 价格
//            insert.setGoodsAmount(orderSellerPrice);
//            insert.setPayment(orderPayment);
//            insert.setAmount(orderSellerPrice);
//            insert.setPostFee(freightPrice);
//            insert.setPlatformDiscount(0.0);
//            insert.setSellerDiscount(sellerDiscount);
//
//            insert.setReceiverName(orderDetail.getString("fullname"));
//            insert.setReceiverMobile(orderDetail.getString("mobile"));
//            insert.setAddress(orderDetail.getString("fullAddress"));
//            insert.setProvince(orderDetail.getString("province"));
//            insert.setCity(orderDetail.getString("city"));
//            insert.setTown(orderDetail.getString("county"));
//            insert.setOrderTime(DateUtils.parseDate(orderDetail.getString("orderStartTime")));
//            insert.setShipType(0);
//            insert.setCreateTime(new Date());
//            insert.setCreateBy("ORDER_MESSAGE");
//
//            orderMapper.insert(insert);
//
//            // 添加orderItem
//            addJdOrderItem(orderId,insert.getId(),orderStatus,orderSellerPrice,orderPayment,itemArray);
//        }else{
//            // 修改订单 (修改：)
//            OOrder update = new OOrder();
//            update.setId(oOrders.get(0).getId());
//            // 价格
//            update.setGoodsAmount(orderSellerPrice);
//            update.setPayment(orderPayment);
//            update.setAmount(orderSellerPrice);
//            update.setPostFee(freightPrice);
//            update.setPlatformDiscount(0.0);
//            update.setSellerDiscount(sellerDiscount);
//            update.setRefundStatus(refundStatus);
//            update.setOrderStatus(orderStatus);
//            update.setUpdateTime(new Date());
//            update.setUpdateBy("ORDER_MESSAGE");
//            orderMapper.updateById(update);
//
//            // 删除orderItem
//            orderItemMapper.delete(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId,update.getId()));
//            // 插入orderItem
//            addJdOrderItem(orderId,update.getId(),orderStatus,orderSellerPrice,orderPayment,itemArray);
//
//        }
//        return ResultVo.success();
    }

//    private void addJdOrderItem(String orderId,String oOrderId,Integer orderStatus,Double orderSellerPrice,Double orderPayment,JSONArray itemArray ) {
//        Double payedItemAmount = 0.0;//已付金额
//        for (int i =0;i<itemArray.size();i++) {
//            JSONObject itemObject =itemArray.getJSONObject(i);
//
//            OOrderItem orderItem = new OOrderItem();
//            orderItem.setOrderId(oOrderId);
//            orderItem.setOrderNum(orderId);
//            orderItem.setSubOrderNum(orderId+"-"+itemObject.getString("skuId"));
//            // TODO：这里将订单商品skuid转换成erp系统的skuid
////            Long erpGoodsId = 0L;
////            String erpSkuId = "0";
////
////            List<JdGoodsSku> jdGoodsSkus = jdGoodsSkuMapper.selectList(new LambdaQueryWrapper<JdGoodsSku>().eq(JdGoodsSku::getSkuId, item.getSkuId()));
////            if (jdGoodsSkus != null && !jdGoodsSkus.isEmpty()) {
////                erpGoodsId = jdGoodsSkus.get(0).getOGoodsId();
////                erpSkuId = jdGoodsSkus.get(0).getOGoodsSkuId();
////                orderItem.setGoodsImg(jdGoodsSkus.get(0).getLogo());
////                orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
////                orderItem.setSkuNum(jdGoodsSkus.get(0).getOuterId());
////            }
//            orderItem.setSkuNum(itemObject.getString("outerSkuId"));
//            orderItem.setSkuId(itemObject.getString("skuId"));
//            orderItem.setProductId(itemObject.getString("wareId"));
//            orderItem.setGoodsId(itemObject.getLong("oGoodsId"));
//            orderItem.setGoodsSkuId(itemObject.getString("oGoodsSkuId"));
//            orderItem.setGoodsTitle(itemObject.getString("skuName"));
//            orderItem.setGoodsPrice(StringUtils.isEmpty(itemObject.getString("jdPrice")) ? 0.0 : Double.parseDouble(itemObject.getString("jdPrice")));
//            Integer quantity = itemObject.getInteger("itemTotal");
//
//            // TODO:计算子订单价格 计算公式不对
////            Double orderTotalPrice = Double.parseDouble(jdOrder.getOrderTotalPrice()) * 100;
////            Double orderPayment = Double.parseDouble(jdOrder.getOrderPayment()) * 100;
////            // 折扣比例
////            Double rate = orderPayment / orderTotalPrice;
////
////            // 折扣计算后的价格
////            if ((i+1) != itemArray.size()) {
////                Double itemAmountTmp = orderItem.getGoodsPrice() * rate * quantity;
////                double itemAmount = BigDecimal.valueOf(itemAmountTmp).setScale(2, RoundingMode.HALF_UP).doubleValue();
////                orderItem.setItemAmount(itemAmount);
////                orderItem.setPayment(itemAmount);
////                payedItemAmount += itemAmount;
//////                    availableItemAmount = Double.parseDouble(jdOrder.getOrderPayment()) - availableItemAmount;
////            } else {
////                payedItemAmount = Double.parseDouble(jdOrder.getOrderPayment()) - payedItemAmount;
////                orderItem.setItemAmount(payedItemAmount);
////                orderItem.setPayment(payedItemAmount);
////            }
//
////                    orderItem.setItemAmount(orderItem.getGoodsPrice() *quantity);
//
//            orderItem.setQuantity(quantity);
//            if (orderStatus == 11) {
//                orderItem.setRefundStatus(4);
//                orderItem.setRefundCount(quantity);
//            } else if (orderStatus == -1) {
//                orderItem.setRefundStatus(-1);
//            } else {
//                orderItem.setRefundStatus(1);
//                orderItem.setRefundCount(0);
//            }
//            orderItem.setCreateTime(new Date());
//            orderItem.setCreateBy("ORDER_MESSAGE");
//            orderItemMapper.insert(orderItem);
//        }
//
//    }

    @Transactional
    @Override
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
        return jdOrderMessageService.jdvcOrderMessage(customOrderId,orderDetail);
//        JSONArray itemArray = orderDetail.getJSONArray("items");
//        if (itemArray.isEmpty()) {
////            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//            log.info("=====jdvc order message===没有items====事务回滚=======");
//        }
//
//
////        List<JdVcOrder> jdVcOrders = jdVcOrderMapper.selectList(new LambdaQueryWrapper<JdVcOrder>().eq(JdVcOrder::getCustomOrderId, customOrderId));
////        if(jdVcOrders == null || jdVcOrders.size() == 0) {
////            // 没有找到订单信息
////            return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO订单："+customOrderId);
////        }
////        JdVcOrder jdVcOrder = jdVcOrders.get(0);
//        // 状态
//        Integer orderStatus = null;
//        Integer refundStatus = null;
//        // 订单状态:7 新订单；10等待发货；16等待确认收货；19订单完成；22锁定，29删除
//        Integer orderState = orderDetail.getInteger("orderState");
//        if(orderState==7){
//            //7 新订单；
//            orderStatus = 1;
//            refundStatus =1;
//
//        }else if(orderState==10){
//            //10等待发货；
//            orderStatus = 1;
//            refundStatus=1;
//        }else if(orderState==16){
//            //16等待确认收货；
//            orderStatus = 2;
//            refundStatus=1;
//        }else if(orderState==19){
//            //19订单完成；
//            orderStatus = 3;
//            refundStatus=1;
//        }else if(orderState==22){
//            //22锁定；
//            orderStatus = 22;
//            refundStatus = 1;
//        }else if(orderState==29) {
//            //29删除；
//            orderStatus = 29;
//            refundStatus = 1;
//        }
//
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, customOrderId));
//        if(oOrders == null || oOrders.isEmpty()) {
//            // 新增订单
//            // 新增订单
//            OOrder insert = new OOrder();
//            insert.setOrderNum(customOrderId);
//            insert.setShopType(EnumShopType.JDVC.getIndex());
//            insert.setShopId(orderDetail.getLong("shopId"));
//            insert.setBuyerMemo(orderDetail.getString("orderRemark"));
//            insert.setSellerMemo(orderDetail.getString("memoByVendor"));
//
//            insert.setOrderStatus(orderStatus);
//            insert.setRefundStatus(refundStatus);
//            insert.setGoodsAmount(orderDetail.getDouble("jdPrice"));
//            insert.setPostFee(orderDetail.getDouble("totalCarriage"));
//            insert.setAmount(orderDetail.getDouble("cost"));
//            insert.setPayment(orderDetail.getDouble("cost"));
//            insert.setPlatformDiscount(0.0);
//            insert.setSellerDiscount(0.0);
//
//            insert.setReceiverName(orderDetail.getString("consigneeName"));
//            insert.setReceiverMobile(orderDetail.getString("phone"));
//            insert.setAddress(orderDetail.getString("address"));
//            insert.setProvince(orderDetail.getString("provinceName"));
//            insert.setCity(orderDetail.getString("cityName"));
//            insert.setTown(orderDetail.getString("countyName"));
//            insert.setOrderTime(orderDetail.getDate("orderCreateDate"));
//            insert.setShipType(0);
//            insert.setCreateTime(new Date());
//            insert.setCreateBy("ORDER_MESSAGE");
//
//            orderMapper.insert(insert);
//            // 插入orderItem
//            addJdVcOrderItem(insert.getId(),customOrderId,orderStatus,orderDetail.getJSONArray("items"));
//        }else {
//            //修改
//            // 修改订单 (修改：)
//            OOrder update = new OOrder();
//            update.setId(oOrders.get(0).getId());
//            update.setOrderStatus(orderStatus);
//            update.setRefundStatus(refundStatus);
//            update.setGoodsAmount(orderDetail.getDouble("jdPrice"));
//            update.setPostFee(orderDetail.getDouble("totalCarriage"));
//            update.setAmount(orderDetail.getDouble("cost"));
//            update.setPayment(orderDetail.getDouble("cost"));
//            update.setPlatformDiscount(0.0);
//            update.setSellerDiscount(0.0);
//            update.setPlatformDiscount(0.0);
//            update.setSellerDiscount(0.0);
//
//            update.setReceiverName(orderDetail.getString("consigneeName"));
//            update.setReceiverMobile(orderDetail.getString("phone"));
//            update.setAddress(orderDetail.getString("address"));
//            update.setProvince(orderDetail.getString("provinceName"));
//            update.setCity(orderDetail.getString("cityName"));
//            update.setTown(orderDetail.getString("countyName"));
////            update.setOrderTime(jdVcOrder.getOrderCreateDate() );
//            update.setUpdateTime(new Date());
//            update.setUpdateBy("ORDER_MESSAGE");
//            orderMapper.updateById(update);
//
//            // 删除orderItem
//            orderItemMapper.delete(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId,update.getId()));
//
//            // 插入orderItem
//            addJdVcOrderItem(update.getId(),customOrderId,orderStatus,orderDetail.getJSONArray("items"));
//        }
//        return ResultVo.success();
    }
//
//    private void addJdVcOrderItem(String oOrderId,String customOrderId,Integer orderStatus,JSONArray orderItems){
//
//        if(orderItems!=null && orderItems.size()>0) {
//            for (int i =0;i<orderItems.size();i++) {
//                JSONObject itemObject =orderItems.getJSONObject(i);
//
//                OOrderItem orderItem = new OOrderItem();
//                orderItem.setOrderId(oOrderId);
//                orderItem.setOrderNum(customOrderId);
//                orderItem.setSubOrderNum(customOrderId+"-"+itemObject.getString("sku"));
//                orderItem.setSkuNum(itemObject.getString("sku"));
//                orderItem.setSkuId(itemObject.getString("sku"));
//                orderItem.setProductId(itemObject.getString("upc"));
//                orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
//                orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
//                orderItem.setGoodsImg("");
//                orderItem.setGoodsSpec(itemObject.getString("wareName"));
//                orderItem.setGoodsTitle(itemObject.getString("wareName"));
//                orderItem.setGoodsPrice(itemObject.getDouble("jdPrice"));
//                orderItem.setItemAmount(itemObject.getDouble("cost"));
//                orderItem.setPayment(itemObject.getDouble("cost"));
//                orderItem.setQuantity(itemObject.getInteger("wareNum"));
//                orderItem.setRefundStatus(1);
//                orderItem.setRefundCount(0);
//                // 状态
//                orderItem.setOrderStatus(orderStatus);
//                orderItem.setCreateTime(new Date());
//                orderItem.setCreateBy("ORDER_MESSAGE");
//                orderItemMapper.insert(orderItem);
//            }
//        }
//    }

//    @Override
//    public ResultVo<Integer> jdvcOrderMessage(String orderId) {
//        log.info("接收jdvc订单消息："+orderId);
//        List<JdVcPurchaseOrder> jdVcOrders = jdVcOrderMapper.selectList(new LambdaQueryWrapper<JdVcPurchaseOrder>().eq(JdVcPurchaseOrder::getOrderId, orderId));
//        if(jdVcOrders == null || jdVcOrders.size() == 0) {
//            // 没有找到订单信息
//            return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO订单："+orderId);
//        }
//        JdVcPurchaseOrder jdVcOrder = jdVcOrders.get(0);
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
//        if(oOrders == null || oOrders.isEmpty()) {
//            // 新增订单
//            OOrder insert = new OOrder();
//            insert.setOrderNum(orderId);
//            insert.setShopType(EnumShopType.JDVC.getIndex());
//            insert.setShopId(jdVcOrder.getShopId().intValue());
//            insert.setBuyerMemo("");
//            insert.setSellerMemo("");
//            // 状态
//            insert.setOrderStatus(jdVcOrder.getState());
//            insert.setRefundStatus(1);
//
//            insert.setGoodsAmount(jdVcOrder.getTotalPrice());
//            insert.setPostFee(0.0);
//            insert.setAmount(jdVcOrder.getTotalPrice());
//            insert.setPayment(jdVcOrder.getTotalPrice());
//            insert.setReceiverName(jdVcOrder.getReceiverName());
//            insert.setReceiverMobile(jdVcOrder.getWarehousePhone());
//            insert.setAddress(jdVcOrder.getAddress());
//            insert.setProvince("");
//            insert.setCity("");
//            insert.setTown("");
//            insert.setOrderTime(jdVcOrder.getCreatedDate() );
//            insert.setShipType(0);
//            insert.setCreateTime(new Date());
//            insert.setCreateBy("ORDER_MESSAGE");
//
//            orderMapper.insert(insert);
//            // 插入orderItem
//            addJdVcOrderItem(insert.getId(),orderId,jdVcOrder.getState());
//        }else {
//            //修改
//            // 修改订单 (修改：)
//            OOrder update = new OOrder();
//            update.setId(oOrders.get(0).getId());
//            update.setOrderStatus(jdVcOrder.getState());
//            update.setGoodsAmount(jdVcOrder.getTotalPrice());
//            update.setPostFee(0.0);
//            update.setAmount(jdVcOrder.getTotalPrice());
//            update.setPayment(jdVcOrder.getTotalPrice());
//            update.setReceiverName(jdVcOrder.getReceiverName());
//            update.setReceiverMobile(jdVcOrder.getWarehousePhone());
//            update.setAddress(jdVcOrder.getAddress());
//            update.setUpdateTime(new Date());
//            update.setUpdateBy("ORDER_MESSAGE");
//            orderMapper.updateById(update);
//
//            // 删除orderItem
//            orderItemMapper.delete(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId,update.getId()));
//
//            // 插入orderItem
//            addJdVcOrderItem(update.getId(),orderId,jdVcOrder.getState());
//        }
//        return ResultVo.success();
//    }
//
//    private void addJdVcOrderItem(String oOrderId,String orderId,Integer orderStatus){
//        List<JdVcPurchaseOrderItem> originOrderItems = jdVcOrderItemMapper.selectList(new LambdaQueryWrapper<JdVcPurchaseOrderItem>().eq(JdVcPurchaseOrderItem::getOrderId, orderId));
//        if(originOrderItems!=null && originOrderItems.size()>0) {
//            for (var item : originOrderItems) {
//                OOrderItem orderItem = new OOrderItem();
//                orderItem.setOrderId(oOrderId);
//                orderItem.setOrderNum(item.getOrderId().toString());
//                orderItem.setSubOrderNum(item.getId().toString());
//                // 这里将订单商品skuid转换成erp系统的skuid
//                Long erpGoodsId = 0L;
//                Long erpSkuId = 0L;
//
//                List<JdVcGoods> shopGoods = jdVcGoodsMapper.selectList(new LambdaQueryWrapper<JdVcGoods>().eq(JdVcGoods::getWareId, item.getWareId()));
//                if (shopGoods != null && !shopGoods.isEmpty()) {
//                    erpGoodsId = shopGoods.get(0).getOGoodsId();
//                    erpSkuId = shopGoods.get(0).getOGoodsSkuId();
////                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
////                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
////                    orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
//                }
//                orderItem.setSkuNum("");
//                orderItem.setSkuId(item.getWareId().toString());
//                orderItem.setGoodsId(erpGoodsId);
//                orderItem.setGoodsSkuId(erpSkuId);
//                orderItem.setGoodsImg("");
//                orderItem.setGoodsSpec(item.getWareName());
//                orderItem.setGoodsTitle(item.getWareName());
//                orderItem.setGoodsPrice(item.getTotoalPrice());
//                orderItem.setItemAmount(item.getPurchasePrice());
//                orderItem.setPayment(item.getPurchasePrice());
//                orderItem.setQuantity(item.getOriginalNum());
//                orderItem.setRefundStatus(1);
//                orderItem.setRefundCount(0);
//                // 状态
//                orderItem.setOrderStatus(orderStatus);
//                orderItem.setCreateTime(new Date());
//                orderItem.setCreateBy("ORDER_MESSAGE");
//                orderItemMapper.insert(orderItem);
//            }
//        }
//    }

    @Transactional
    @Override
    public ResultVo<Integer> taoOrderMessage(String tid,JSONObject orderDetail ) {
        log.info("Tao订单消息处理"+tid);
//        JSONObject jsonObject = taoApiService.getOrderDetail(tid);
//        if(jsonObject.getInteger("code")!=200 || jsonObject.getJSONObject("data") ==null){
//            log.info("=====tao order message===没有找到订单");
//            return ResultVo.error(404,"没有找到订单");
//        }
//
//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====tao order message===订单:"+JSONObject.toJSONString(orderDetail));
        return taoOrderMessageService.taoOrderMessage(tid,orderDetail);
//        JSONArray itemArray = orderDetail.getJSONArray("items");
//        if (itemArray.isEmpty()) {
//            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//            log.info("=====tao order message===没有items====事务回滚=======");
//        }
////        List<TaoOrder> taoOrders = taoOrderMapper.selectList(new LambdaQueryWrapper<TaoOrder>().eq(TaoOrder::getTid, tid));
////
////        if(taoOrders == null || taoOrders.size() == 0) {
////            // 没有找到订单信息
////            return ResultVo.error(ResultVoEnum.NotFound,"没有找到TAO订单："+tid);
////        }
////        TaoOrder taoOrder = taoOrders.get(0);
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, tid));
//        if(oOrders == null || oOrders.isEmpty()) {
//            // 新增订单
//            OOrder insert = new OOrder();
//            insert.setOrderNum(tid);
//            insert.setShopType(EnumShopType.TAO.getIndex());
//            insert.setShopId(orderDetail.getLong("shopId"));
//            String buyerMemo = "";
//            if(org.springframework.util.StringUtils.hasText(orderDetail.getString("buyerMessage"))){
//                buyerMemo += orderDetail.getString("buyerMessage");
//            }
//            if(org.springframework.util.StringUtils.hasText(orderDetail.getString("buyerMemo"))){
//                buyerMemo += orderDetail.getString("buyerMemo");
//            }
//            insert.setBuyerMemo(buyerMemo);
//            insert.setSellerMemo(orderDetail.getString("sellerMemo"));
//            // 状态
//            int orderStatus = TaoOrderStateEnum.getIndex(orderDetail.getString("status"));
//            if (orderStatus == 11) {
//                insert.setRefundStatus(4);
//            } else if (orderStatus == -1) {
//                insert.setRefundStatus(-1);
//            } else {
//                insert.setRefundStatus(1);
//            }
//            insert.setOrderStatus(orderStatus);
//            Double goodsAmount  = orderDetail.getDouble("totalFee");
//            Double postFee = orderDetail.getDouble("postFee");
//            Double payment = orderDetail.getDouble("payment");
//            insert.setGoodsAmount(goodsAmount);
//            insert.setPostFee(postFee);
//            insert.setAmount(payment);
//            insert.setPayment(payment);
//            insert.setPlatformDiscount(0.0);
//            insert.setSellerDiscount(goodsAmount+postFee-payment);
//            insert.setReceiverName(orderDetail.getString("receiverName"));
//            insert.setReceiverMobile(orderDetail.getString("receiverMobile"));
//            insert.setAddress(orderDetail.getString("receiverAddress"));
//            insert.setProvince(orderDetail.getString("receiverState"));
//            insert.setCity(orderDetail.getString("receiverCity"));
//            insert.setTown(orderDetail.getString("receiverDistrict"));
//            insert.setOrderTime(orderDetail.getDate("created"));
//            // 计算商家优惠
////            Double sellerDiscount = 0.0;
////            List<TaoOrderPromotion> taoOrderPromotions = taoOrderPromotionMapper.selectList(new LambdaQueryWrapper<TaoOrderPromotion>().eq(TaoOrderPromotion::getId, taoOrder.getTid()));
////            if(taoOrderPromotions!=null){
////                for (var it:taoOrderPromotions) {
////                    if(org.springframework.util.StringUtils.hasText(it.getKdDiscountFee())){
////                        try {
////                            sellerDiscount += Double.parseDouble(it.getKdDiscountFee());
////                        }catch (Exception e){}
////                    } else if (org.springframework.util.StringUtils.hasText(it.getDiscountFee())) {
////                        try {
////                            sellerDiscount += Double.parseDouble(it.getDiscountFee());
////                        }catch (Exception e){}
////                    }
////                }
////            }
////            insert.setSellerDiscount(sellerDiscount);
//
//
//            insert.setShipType(0);
//            insert.setCreateTime(new Date());
//            insert.setCreateBy("ORDER_MESSAGE");
//
//            orderMapper.insert(insert);
//
//            // 插入orderItem
//            addTaoOrderItem(insert.getId(),tid,itemArray);
//
//        }else{
//            // 修改订单 (修改：)
//            OOrder update = new OOrder();
//            update.setId(oOrders.get(0).getId());
//            String buyerMemo = "";
//            if(org.springframework.util.StringUtils.hasText(orderDetail.getString("buyerMessage"))){
//                buyerMemo += orderDetail.getString("buyerMessage");
//            }
//            if(org.springframework.util.StringUtils.hasText(orderDetail.getString("buyerMemo"))){
//                buyerMemo += orderDetail.getString("buyerMemo");
//            }
//            update.setBuyerMemo(buyerMemo);
//            update.setSellerMemo(orderDetail.getString("sellerMemo"));
//            // 状态
//            int orderStatus = TaoOrderStateEnum.getIndex(orderDetail.getString("status"));
//            if (orderStatus == 11) {
//                update.setRefundStatus(4);
//            } else if (orderStatus == -1) {
//                update.setRefundStatus(-1);
//            } else {
//                update.setRefundStatus(1);
//            }
//            update.setOrderStatus(orderStatus);
//
//            Double goodsAmount  = orderDetail.getDouble("totalFee");
//            Double postFee = orderDetail.getDouble("postFee");
//            Double payment = orderDetail.getDouble("payment");
//            update.setGoodsAmount(goodsAmount);
//            update.setPostFee(postFee);
//            update.setAmount(payment);
//            update.setPayment(payment);
//            update.setPlatformDiscount(0.0);
//            update.setSellerDiscount(goodsAmount+postFee-payment);
//            update.setReceiverName(orderDetail.getString("receiverName"));
//            update.setReceiverMobile(orderDetail.getString("receiverMobile"));
//            update.setAddress(orderDetail.getString("receiverAddress"));
//            update.setUpdateTime(new Date());
//            update.setUpdateBy("ORDER_MESSAGE");
//            orderMapper.updateById(update);
//
//            // 删除orderItem
//            orderItemMapper.delete(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId,update.getId()));
//            // 插入orderItem
//            addTaoOrderItem(update.getId(),tid,itemArray);
//
//
//        }
//        return ResultVo.success();
    }

//    private void addTaoOrderItem(String oOrderId,String tid, JSONArray itemArray) {
//        for (int i = 0; i < itemArray.size(); i++) {
//            JSONObject itemObject = itemArray.getJSONObject(i);
//
//            OOrderItem orderItem = new OOrderItem();
//            orderItem.setOrderId(oOrderId);
//            orderItem.setOrderNum(tid);
//            orderItem.setSubOrderNum(itemObject.getString("oid"));
//            orderItem.setSkuNum(itemObject.getString("outerSkuId"));
//            orderItem.setSkuId(itemObject.getString("skuId"));
//            orderItem.setProductId(itemObject.getString("numIid"));
//            orderItem.setGoodsId(itemObject.getLong("oGoodsId"));
//            orderItem.setGoodsSkuId(itemObject.getString("oGoodsSkuId"));
//            orderItem.setGoodsImg(itemObject.getString("picPath"));
//            orderItem.setGoodsSpec(itemObject.getString("skuPropertiesName"));
//            orderItem.setGoodsTitle(itemObject.getString("title"));
//            orderItem.setGoodsPrice(itemObject.getDouble("price"));
//            orderItem.setItemAmount(itemObject.getDouble("totalFee"));
//            orderItem.setDiscountAmount(itemObject.getDouble("partMjzDiscount"));
//            orderItem.setPayment(itemObject.getDouble("payment"));
//            orderItem.setQuantity(itemObject.getInteger("num"));
//            // 退款状态。退款状态。可选值 WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意)
//            // WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货)
//            // WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货)
//            // SELLER_REFUSE_BUYER(卖家拒绝退款)
//            // CLOSED(退款关闭)
//            // SUCCESS(退款成功)
//            if (itemObject.getString("refundStatus").equals("WAIT_SELLER_AGREE")
//                    || itemObject.getString("refundStatus").equals("WAIT_BUYER_RETURN_GOODS")
//                    || itemObject.getString("refundStatus").equals("WAIT_SELLER_CONFIRM_GOODS")
//                    || itemObject.getString("refundStatus").equals("SELLER_REFUSE_BUYER")) {
//                orderItem.setRefundStatus(2);
//                orderItem.setRefundCount(itemObject.getInteger("num"));
//            } else if (itemObject.getString("refundStatus").equals("SUCCESS")) {
//                orderItem.setRefundCount(itemObject.getInteger("num"));
//                orderItem.setRefundStatus(4);
//            } else if (itemObject.getString("refundStatus").equals("CLOSED") || itemObject.getString("refundStatus").equals("NO_REFUND")) {
//                orderItem.setRefundStatus(1);
//                orderItem.setRefundCount(0);
//            }
//            // 状态
//            int orderStatus = TaoOrderStateEnum.getIndex(itemObject.getString("status"));
//            orderItem.setOrderStatus(orderStatus);
//            orderItem.setCreateTime(new Date());
//            orderItem.setCreateBy("ORDER_MESSAGE");
//            orderItemMapper.insert(orderItem);
//        }
//
//    }

    @Transactional
    @Override
    public ResultVo<Integer> pddOrderMessage(String orderSn,JSONObject orderDetail ) {
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
//
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderSn));
//        if(oOrders == null || oOrders.isEmpty()) {
//            // 新增订单
//            OOrder insert = new OOrder();
//            insert.setOrderNum(orderSn);
//            insert.setShopType(EnumShopType.PDD.getIndex());
//            insert.setShopId(orderDetail.getLong("shopId"));
//            insert.setBuyerMemo(orderDetail.getString("buyerMemo"));
//            insert.setSellerMemo(orderDetail.getString("remark"));
//            Integer originOrderStatus = orderDetail.getInteger("orderStatus");
//            Integer originRefundStatus = orderDetail.getInteger("refundStatus");
//            // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除
//            int orderStatus = -1;
//            int refundStatus = -1;
//            if (originRefundStatus == 1) {
//                // 没有售后
//                orderStatus = originOrderStatus;
//                refundStatus = 1;
//            } else {
//                if (originRefundStatus == 4) {
//                    refundStatus = 4;
//                    orderStatus = 11;
//                } else {
//                    refundStatus = originRefundStatus;
//                    orderStatus = 12;
//                }
//            }
//            insert.setRefundStatus(refundStatus);
//            insert.setOrderStatus(orderStatus);
//            // 价格
//            insert.setGoodsAmount(orderDetail.getDouble("goodsAmount"));//.getGoodsAmount());
//            insert.setPostFee(orderDetail.getDouble("postage"));
//            insert.setAmount(orderDetail.getDouble("payAmount"));
//            insert.setPayment(orderDetail.getDouble("payAmount"));
////            double platformDiscount = originOrder.getPlatformDiscount()!=null?originOrder.getPlatformDiscount():0.0;
//            insert.setPlatformDiscount(orderDetail.getDouble("platformDiscount"));
////            double sellerDiscount = originOrder.getSellerDiscount()!=null?originOrder.getSellerDiscount():0.0;
//            insert.setSellerDiscount(orderDetail.getDouble("sellerDiscount"));
//
//            insert.setReceiverName(orderDetail.getString("receiverNameMask"));
//            insert.setReceiverMobile(orderDetail.getString("receiverPhoneMask"));
//            insert.setAddress(orderDetail.getString("addressMask"));
//            insert.setProvince(orderDetail.getString("province"));
//            insert.setCity(orderDetail.getString("city"));
//            insert.setTown(orderDetail.getString("town"));
//            insert.setOrderTime(DateUtils.parseDate(orderDetail.getString("createdTime")));
//            insert.setShipType(0);
//            insert.setCreateTime(new Date());
//            insert.setCreateBy("ORDER_MESSAGE");
//
//            orderMapper.insert(insert);
//            // 插入orderItem
////            addPddOrderItem(insert.getId(),originOrder.getOrderSn(),orderStatus,refundStatus,platformDiscount,sellerDiscount);
//            JSONArray itemArray = orderDetail.getJSONArray("items");
//            if (itemArray.isEmpty()) {
//                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//                log.info("=====pdd order message===没有items====事务回滚=======");
//            }
//
//
//            for (int i =0;i<itemArray.size();i++) {
//                JSONObject itemObject =itemArray.getJSONObject(i);
////                Map<String,Object> itemObject = (Map<String, Object>) itemArray.get(i);
////                JSONObject itemObject = (JSONObject) item;
//
//                OOrderItem orderItem = new OOrderItem();
//                orderItem.setOrderId(insert.getId());
//                orderItem.setOrderNum(orderSn);
//                orderItem.setSubOrderNum(orderSn+"-"+itemObject.getString("skuId"));
//                // 这里将订单商品skuid转换成erp系统的skuid
////                Long erpGoodsId = 0L;
////                String erpSkuId = "0";
////
////                List<PddGoodsSku> pddGoodsSku = pddGoodsSkuMapper.selectList(new LambdaQueryWrapper<PddGoodsSku>().eq(PddGoodsSku::getSkuId, item.getSkuId()));
////                if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
////                    erpGoodsId = pddGoodsSku.get(0).getOGoodsId();
////                    erpSkuId = pddGoodsSku.get(0).getOGoodsSkuId();
//////                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
//////                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
//////                    orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
////                }
//                orderItem.setSkuNum(itemObject.getString("outerId"));
//                orderItem.setSkuId(itemObject.getString("skuId"));
//                orderItem.setProductId(itemObject.getString("goodsId"));
//                orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
//                orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
//                orderItem.setGoodsImg(itemObject.getString("goodsImg"));
//                orderItem.setGoodsSpec(itemObject.getString("goodsSpec"));
//                orderItem.setGoodsTitle(itemObject.getString("goodsName"));
//                orderItem.setGoodsPrice(itemObject.getDouble("goodsPrice"));
//                orderItem.setQuantity(itemObject.getInteger("goodsCount"));
//                if (i == 0) {
//                    Double itemAmount = orderItem.getGoodsPrice() * orderItem.getQuantity() - insert.getPlatformDiscount() - insert.getSellerDiscount();
//                    orderItem.setItemAmount(itemAmount);
//                    orderItem.setPayment(itemAmount);
//                } else {
//                    orderItem.setItemAmount(orderItem.getGoodsPrice()* orderItem.getQuantity());
//                    orderItem.setPayment(orderItem.getGoodsPrice()* orderItem.getQuantity());
//                }
////                orderItem.setPayment(item.getGoodsPrice());
//
//                orderItem.setOrderStatus(orderStatus);
//                orderItem.setRefundStatus(refundStatus);
//                orderItem.setRefundCount(0);
//                orderItem.setCreateTime(new Date());
//                orderItem.setCreateBy("ORDER_MESSAGE");
//                orderItemMapper.insert(orderItem);
//            }
//
//
//        }else{
//            // 修改订单 (修改：)
//            OOrder update = new OOrder();
//            update.setId(oOrders.get(0).getId());
//            Integer originOrderStatus = orderDetail.getInteger("orderStatus");
//            Integer originRefundStatus = orderDetail.getInteger("refundStatus");
//            // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除
//            int orderStatus = -1;
//            int refundStatus = -1;
//            if (originRefundStatus == 1) {
//                // 没有售后
//                orderStatus = originOrderStatus;
//                refundStatus = 1;
//            } else {
//                if (originRefundStatus == 4) {
//                    refundStatus = 4;
//                    orderStatus = 11;
//                } else {
//                    refundStatus = originRefundStatus;
//                    orderStatus = 12;
//                }
//            }
//            update.setRefundStatus(refundStatus);
//            update.setOrderStatus(orderStatus);
//
//            // 价格
//            update.setGoodsAmount(orderDetail.getDouble("goodsAmount"));//.getGoodsAmount());
//            update.setPostFee(orderDetail.getDouble("postage"));
//            update.setAmount(orderDetail.getDouble("payAmount"));
//            update.setPayment(orderDetail.getDouble("payAmount"));
////            double platformDiscount = originOrder.getPlatformDiscount()!=null?originOrder.getPlatformDiscount():0.0;
//            update.setPlatformDiscount(orderDetail.getDouble("platformDiscount"));
////            double sellerDiscount = originOrder.getSellerDiscount()!=null?originOrder.getSellerDiscount():0.0;
//            update.setSellerDiscount(orderDetail.getDouble("sellerDiscount"));
//
//            if(orderStatus==1 && refundStatus==1) {
//                if (StringUtils.isNotBlank(orderDetail.getString("receiverNameMask"))) {
//                    update.setReceiverName(orderDetail.getString("receiverNameMask"));
//                }
//                if (StringUtils.isNotBlank(orderDetail.getString("receiverPhoneMask"))) {
//                    update.setReceiverMobile(orderDetail.getString("receiverPhoneMask"));
//                }
//                if (StringUtils.isNotBlank(orderDetail.getString("addressMask"))) {
//                    update.setAddress(orderDetail.getString("addressMask"));
//                }
//            }
//
//            if(StringUtils.isNotBlank(orderDetail.getString("province"))){
//                update.setProvince(orderDetail.getString("province"));
//            }
//            if(StringUtils.isNotBlank(orderDetail.getString("city"))){
//                update.setCity(orderDetail.getString("city"));
//            }
//            if(StringUtils.isNotBlank(orderDetail.getString("town"))){
//                update.setTown(orderDetail.getString("town"));
//            }
//            update.setUpdateTime(new Date());
//            update.setUpdateBy("ORDER_MESSAGE");
//            orderMapper.updateById(update);
//
//            // 删除orderItem
//            orderItemMapper.delete(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId,update.getId()));
////            // 插入orderItem
////            addPddOrderItem(update.getId(),originOrder.getOrderSn(),orderStatus,refundStatus,platformDiscount,sellerDiscount);
//
//            JSONArray itemArray = orderDetail.getJSONArray("items");
//            if (itemArray.isEmpty()) {
//                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//                log.info("=====pdd order message===没有items====事务回滚=======");
//            }
//
//
//            for (int i =0;i<itemArray.size();i++) {
//                JSONObject itemObject =itemArray.getJSONObject(i);
////                List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrders.get(0).getId()).eq(OOrderItem::getSkuId, itemObject.getString("skuId")));
////                if(oOrderItems.isEmpty()) {
//                    // 新增item
//                    OOrderItem orderItem = new OOrderItem();
//                    orderItem.setOrderId(oOrders.get(0).getId());
//                    orderItem.setOrderNum(orderSn);
//                    orderItem.setSubOrderNum(orderSn + "-" + itemObject.getString("skuId"));
//                    orderItem.setSkuNum(itemObject.getString("outerId"));
//                    orderItem.setSkuId(itemObject.getString("skuId"));
//                    orderItem.setProductId(itemObject.getString("goodsId"));
//                    orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
//                    orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
//                    orderItem.setGoodsImg(itemObject.getString("goodsImg"));
//                    orderItem.setGoodsSpec(itemObject.getString("goodsSpec"));
//                    orderItem.setGoodsTitle(itemObject.getString("goodsName"));
//                    orderItem.setGoodsPrice(itemObject.getDouble("goodsPrice"));
//                    orderItem.setQuantity(itemObject.getInteger("goodsCount"));
//                    if (i == 0) {
//                        Double itemAmount = orderItem.getGoodsPrice() * orderItem.getQuantity() - oOrders.get(0).getPlatformDiscount() - oOrders.get(0).getSellerDiscount();
//                        orderItem.setItemAmount(itemAmount);
//                        orderItem.setPayment(itemAmount);
//                    } else {
//                        orderItem.setItemAmount(orderItem.getGoodsPrice() * orderItem.getQuantity());
//                        orderItem.setPayment(orderItem.getGoodsPrice() * orderItem.getQuantity());
//                    }
//                    orderItem.setOrderStatus(orderStatus);
//                    orderItem.setRefundStatus(refundStatus);
//                    orderItem.setRefundCount(0);
//                    orderItem.setCreateTime(new Date());
//                    orderItem.setCreateBy("ORDER_MESSAGE");
//                    orderItemMapper.insert(orderItem);
////                }
//                else{
//                    // 修改、
//                    OOrderItem orderItem = new OOrderItem();
//                    orderItem.setId(oOrderItems.get(0).getId());
//
//                    orderItem.setSkuNum(itemObject.getString("outerId"));
//                    orderItem.setSkuId(itemObject.getString("skuId"));
//                    orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
//                    orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
//                    orderItem.setGoodsImg(itemObject.getString("goodsImg"));
//                    orderItem.setGoodsSpec(itemObject.getString("goodsSpec"));
//                    orderItem.setGoodsTitle(itemObject.getString("goodsName"));
//                    orderItem.setGoodsPrice(itemObject.getDouble("goodsPrice"));
//                    orderItem.setQuantity(itemObject.getInteger("goodsCount"));
//                    if (i == 0) {
//                        Double itemAmount = orderItem.getGoodsPrice() * orderItem.getQuantity() - oOrders.get(0).getPlatformDiscount() - oOrders.get(0).getSellerDiscount();
//                        orderItem.setItemAmount(itemAmount);
//                        orderItem.setPayment(itemAmount);
//                    } else {
//                        orderItem.setItemAmount(orderItem.getGoodsPrice() * orderItem.getQuantity());
//                        orderItem.setPayment(orderItem.getGoodsPrice() * orderItem.getQuantity());
//                    }
//                    orderItem.setOrderStatus(orderStatus);
//                    orderItem.setRefundStatus(refundStatus);
//                    orderItem.setRefundCount(0);
//                    orderItem.setUpdateTime(new Date());
//                    orderItem.setUpdateBy("ORDER_MESSAGE");
//                    orderItemMapper.updateById(orderItem);
//                }
//            }
//        }
        return pddOrderMessageService.pddOrderMessage(orderSn,orderDetail);
//        return ResultVo.success();
    }

//    private void addPddOrderItem(String oOrderId,String orderSn,Integer orderStatus,Integer refundStatus,double platformDiscount,double sellerDiscount){
//        List<PddOrderItem> originOrderItems = pddOrderItemMapper.selectList(new LambdaQueryWrapper<PddOrderItem>().eq(PddOrderItem::getOrderSn, orderSn));
//        if(originOrderItems!=null && originOrderItems.size()>0) {
//            int i = 0;
//            for (var item : originOrderItems) {
//                OOrderItem orderItem = new OOrderItem();
//                orderItem.setOrderId(oOrderId);
//                orderItem.setOrderNum(item.getOrderSn());
//                orderItem.setSubOrderNum(item.getId().toString());
//                // 这里将订单商品skuid转换成erp系统的skuid
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
//                orderItem.setSkuNum(item.getOuterId());
//                orderItem.setSkuId(item.getSkuId());
//                orderItem.setGoodsId(erpGoodsId);
//                orderItem.setGoodsSkuId(erpSkuId);
//                orderItem.setGoodsImg(item.getGoodsImg());
//                orderItem.setGoodsSpec(item.getGoodsSpec());
//                orderItem.setGoodsTitle(item.getGoodsName());
//                orderItem.setGoodsPrice(item.getGoodsPrice());
//                if(i==0) {
//                    Double itemAmount = item.getGoodsPrice() * item.getGoodsCount() - platformDiscount - sellerDiscount;
//                    orderItem.setItemAmount(itemAmount);
//                    orderItem.setPayment(itemAmount);
//                }else {
//                    orderItem.setItemAmount(item.getGoodsPrice());
//                    orderItem.setPayment(item.getGoodsPrice());
//                }
////                orderItem.setPayment(item.getGoodsPrice());
//                orderItem.setQuantity(item.getGoodsCount());
//                orderItem.setOrderStatus(orderStatus);
//                orderItem.setRefundStatus(refundStatus);
//                orderItem.setRefundCount(0);
//                orderItem.setCreateTime(new Date());
//                orderItem.setCreateBy("ORDER_MESSAGE");
//                orderItemMapper.insert(orderItem);
//                i++;
//            }
//        }
//    }

    @Transactional
    @Override
    public ResultVo<Integer> douOrderMessage(String orderId,JSONObject orderDetail ) {
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
        log.info("=====dou order message===订单:"+JSONObject.toJSONString(orderDetail));
        if(orderDetail == null) return ResultVo.error(404,"没有找到订单");
        return douOrderMessageService.douOrderMessage(orderId,orderDetail);
        // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除，101部分发货
        // 抖店订单状态 1 待确认/待支付（订单创建完毕）105 已支付 2 备货中 101 部分发货 3 已发货（全部发货）4 已取消 5 已完成（已收货）
//        int orderStatus = -1;
//        int refundStatus = -1;
//        if (orderDetail.getInteger("orderStatus") == 1) {
//            // 1待确认/待支付（订单创建完毕）
//            orderStatus = 21;
//            refundStatus = 1;
//        } else if (orderDetail.getInteger("orderStatus") == 105) {
//            // 105 已支付
//            orderStatus = 0;
//            refundStatus = 1;
//        } else if (orderDetail.getInteger("orderStatus") == 2) {
//            // 105 已支付
//            orderStatus = 1;
//            refundStatus = 1;
//        } else if (orderDetail.getInteger("orderStatus") == 101) {
//            // 101 部分发货
//            orderStatus = 101;
//            refundStatus = 1;
//        } else if (orderDetail.getInteger("orderStatus") == 3) {
//            //  3 已发货（全部发货）
//            orderStatus = 2;
//            refundStatus = 1;
//        } else if (orderDetail.getInteger("orderStatus") == 4) {
//            //  4 已取消
//            orderStatus = 11;
//            refundStatus = 1;
//        } else if (orderDetail.getInteger("orderStatus") == 5) {
//            //  5 已完成（已收货）
//            orderStatus = 3;
//            refundStatus = 1;
//        }
//
////        List<DouOrder> originOrders = douOrderMapper.selectList(new LambdaQueryWrapper<DouOrder>().eq(DouOrder::getOrderId, orderId));
////
////        if (originOrders == null || originOrders.size() == 0) {
////            // 没有找到订单信息
////            return ResultVo.error(ResultVoEnum.NotFound, "没有找到DOU原始订单：" + orderId);
////        }
////        DouOrder originOrder = originOrders.get(0);
//
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
//        if (oOrders == null || oOrders.isEmpty()) {
//            // 新增订单
//            OOrder insert = new OOrder();
//            insert.setOrderNum(orderId);
//            insert.setShopType(EnumShopType.DOU.getIndex());
//            insert.setShopId(orderDetail.getLong("shopId"));
//            insert.setBuyerMemo(orderDetail.getString("buyerWords"));
//            insert.setSellerMemo(orderDetail.getString("sellerWords"));
//            insert.setRefundStatus(refundStatus);
//            insert.setOrderStatus(orderStatus);
//            insert.setGoodsAmount(orderDetail.getDouble("orderAmount")  / 100 );
//            insert.setPostFee(orderDetail.getDouble("postAmount") / 100);
//            insert.setAmount(orderDetail.getDouble("orderAmount")  / 100);
//            insert.setPayment(orderDetail.getDouble("payAmount")  / 100);
//            insert.setPlatformDiscount(orderDetail.getDouble("promotionPlatformAmount") / 100);
//            insert.setSellerDiscount(orderDetail.getDouble("promotionShopAmount") / 100);
//
//            insert.setReceiverName(orderDetail.getString("maskPostReceiver"));
//            insert.setReceiverMobile(orderDetail.getString("maskPostTel"));
//            insert.setAddress(orderDetail.getString("maskPostAddress"));
//            insert.setProvince(orderDetail.getString("provinceName"));
//            insert.setCity(orderDetail.getString("cityName"));
//            insert.setTown(orderDetail.getString("townName"));
//            long time = orderDetail.getLong("createTime") * 1000;
//            insert.setOrderTime(new Date(time));
//            insert.setShipType(0);
//            insert.setCreateTime(new Date());
//            insert.setCreateBy("ORDER_MESSAGE");
//
//            orderMapper.insert(insert);
//            // 插入orderItem
//            addDouOrderItem(insert.getId(), orderId, orderStatus,orderDetail.getJSONArray("items"));
//
//        } else {
//            // 修改订单 (修改：)
//            OOrder update = new OOrder();
//            update.setId(oOrders.get(0).getId());
//            update.setRefundStatus(refundStatus);
//            update.setOrderStatus(orderStatus);
//            update.setGoodsAmount(orderDetail.getDouble("orderAmount")  / 100 );
//            update.setPostFee(orderDetail.getDouble("postAmount") / 100);
//            update.setAmount(orderDetail.getDouble("orderAmount")  / 100);
//            update.setPayment(orderDetail.getDouble("payAmount")  / 100);
//            update.setPlatformDiscount(orderDetail.getDouble("promotionPlatformAmount") / 100);
//            update.setSellerDiscount(orderDetail.getDouble("promotionShopAmount") / 100);
//
//            update.setReceiverName(orderDetail.getString("maskPostReceiver"));
//            update.setReceiverMobile(orderDetail.getString("maskPostTel"));
//            update.setAddress(orderDetail.getString("maskPostAddress"));
//
//
//            update.setUpdateTime(new Date());
//            update.setUpdateBy("ORDER_MESSAGE");
//            orderMapper.updateById(update);
//
//            // 删除orderItem
////            orderItemMapper.delete(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, update.getId()));
//            // 插入orderItem
//            addDouOrderItem(update.getId(), orderId, orderStatus,orderDetail.getJSONArray("items"));
//        }
//        return ResultVo.success();
    }
//    private void addDouOrderItem(String oOrderId,String originOrderId,Integer orderStatus,JSONArray itemArray){
//
//        if(itemArray!=null && itemArray.size()>0) {
//            for (int i = 0; i < itemArray.size(); i++) {
//                JSONObject itemObject = itemArray.getJSONObject(i);
//                Integer refundStatus = null;
//                Long mainStatus = itemObject.getLong("mainStatus");
//                //主流程状态，1 待确认/待支付（订单创建完毕）103 部分支付105 已支付2 备货中101 部分发货3 已发货（全部发货）4 已取消5 已完成（已收货）21 发货前退款完结22 发货后退款完结39 收货后退款完结
//                if(mainStatus==21||mainStatus==22||mainStatus==29){
//                    refundStatus =4;
//                }else{
//                    refundStatus=1;
//                }
//                OOrderItem orderItem = new OOrderItem();
//                orderItem.setOrderId(oOrderId);
//                orderItem.setOrderNum(itemObject.getString("parentOrderId"));
//                orderItem.setSubOrderNum(itemObject.getString("orderId"));
//                orderItem.setSkuNum(itemObject.getString("code"));
//                orderItem.setSkuId(itemObject.getString("skuId"));
//                orderItem.setProductId(itemObject.getString("productId"));
//                orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
//                orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
//                orderItem.setGoodsImg(itemObject.getString("productPic"));
//
////                if(org.springframework.util.StringUtils.hasText(item.getSpec())) {
////                    orderItem.setGoodsSpec(item.getSpec().length()>500?item.getSpec().substring(0,499):item.getSpec());
////                }
//                orderItem.setGoodsTitle(itemObject.getString("productName"));
//                orderItem.setGoodsSpec(itemObject.getString("spec"));
//
//                orderItem.setGoodsPrice(itemObject.getDouble("goodsPrice")/100);
//                orderItem.setItemAmount(itemObject.getDouble("orderAmount")/100);
//                orderItem.setPayment(itemObject.getDouble("payAmount")/100);
//                orderItem.setQuantity(itemObject.getInteger("itemNum"));
//                orderItem.setOrderStatus(orderStatus);
//                orderItem.setRefundStatus(refundStatus);
//                orderItem.setRefundCount(0);
//                orderItem.setCreateTime(new Date());
//                orderItem.setCreateBy("ORDER_MESSAGE");
//
//                List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>()
//                        .eq(OOrderItem::getOrderId, orderItem.getOrderId())
//                        .eq(OOrderItem::getSkuId, orderItem.getSkuId())
//                );
//                if(oOrderItems.isEmpty()) {
//                    // 新增
//                    orderItem.setCreateTime(new Date());
//                    orderItem.setCreateBy("ORDER_MESSAGE");
//                    orderItemMapper.insert(orderItem);
//                }else{
//                    //修改
//                    orderItem.setId(oOrderItems.get(0).getId());
//                    orderItem.setUpdateTime(new Date());
//                    orderItem.setUpdateBy("ORDER_MESSAGE");
//                    orderItemMapper.updateById(orderItem);
//                }
//
//                //更新发货表
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
//            }
//        }
//    }

    @Transactional
    @Override
    public ResultVo<Integer> weiOrderMessage(String orderId,JSONObject orderDetail ) {
        log.info("WEI订单消息处理" + orderId);
//        JSONObject jsonObject = weiApiService.getOrderDetail(orderId);
//        if (jsonObject.getInteger("code") != 200 || jsonObject.getJSONObject("data") == null) {
//            log.info("=====wei order message===没有找到订单");
//            return ResultVo.error(404, "没有找到订单");
//        }

//        JSONObject orderDetail = jsonObject.getJSONObject("data");
        log.info("=====wei order message===订单:" + JSONObject.toJSONString(orderDetail));
        return weiOrderMessageService.weiOrderMessage(orderId,orderDetail);
//        if (orderDetail == null) return ResultVo.error(404, "没有找到订单");
//        Long shopId = orderDetail.getLong("shopId");
//        Integer originOrderStatus = orderDetail.getInteger("status");
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
////        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderId));
//        // 状态 订单状态0：新订单，1：待发货，2：已发货，3：已完成，11已取消；12退款中；21待付款；22锁定，29删除，101部分发货
//        Integer orderStatus = null;
//        Integer refundStatus = null;
//        //状态 10	待付款；20	待发货；21	部分发货；30	待收货；100	完成；200	全部商品售后之后，订单取消；250	未付款用户主动取消或超时未付款订单自动取消；
//        if(originOrderStatus == 10){
//            orderStatus = 21;
//            refundStatus = 1;
//        } else if (originOrderStatus == 20 || originOrderStatus == 21) {
//            orderStatus = 1;
//            refundStatus = 1;
//        } else if (originOrderStatus == 30) {
//            orderStatus = 2;
//            refundStatus = 1;
//        } else if (originOrderStatus == 100) {
//            orderStatus = 3;
//            refundStatus = 1;
//        }else if (originOrderStatus == 200 || originOrderStatus == 250) {
//            orderStatus = 11;
//            refundStatus = 4;
//        }
//        if(oOrders == null || oOrders.isEmpty()) {
//            // 新增订单
//            OOrder insert = new OOrder();
//            insert.setOrderNum(orderId);
//            insert.setShopType(EnumShopType.WEI.getIndex());
//            insert.setShopId(shopId);
//            insert.setBuyerMemo("");
//            insert.setSellerMemo("");
//
//
////            insert.setRefundStatus(refundStatus);
//            insert.setOrderStatus(orderStatus);
//            Double goodsAmount = orderDetail.getInteger("productPrice").doubleValue() / 100;
//            Double postFee =  orderDetail.getInteger("freight").doubleValue() / 100;
//            Double orderAmount =  orderDetail.getInteger("orderPrice").doubleValue() / 100;
//
//            insert.setGoodsAmount(goodsAmount);
//            insert.setPostFee(postFee);
//            Integer discountedPrice = orderDetail.getInteger("discountedPrice");
//            insert.setSellerDiscount(discountedPrice!=null?discountedPrice.doubleValue()/100:0.0);
//            insert.setPlatformDiscount(0.0);
//            insert.setAmount(orderAmount);
//            insert.setPayment(orderAmount);
//            insert.setReceiverName(orderDetail.getString("userName"));
//            insert.setReceiverMobile(orderDetail.getString("telNumber"));
//            insert.setAddress(orderDetail.getString("detailInfo"));
//            insert.setProvince(orderDetail.getString("provinceName"));
//            insert.setCity(orderDetail.getString("cityName"));
//            insert.setTown(orderDetail.getString("countyName"));
//            long time = orderDetail.getInteger("createTime").longValue() * 1000;
//            insert.setOrderTime(new Date(time));
//            insert.setShipType(0);
////            insert.setWaybillStatus(0);
//            insert.setCreateTime(new Date());
//            insert.setCreateBy("ORDER_MESSAGE");
//
//            orderMapper.insert(insert);
//            // 插入orderItem
//            addWeiOrderItem(insert.getId(),orderId,shopId,orderStatus,orderDetail.getJSONArray("items"));
//        } else{
//            // 修改订单 (修改：)
//            OOrder update = new OOrder();
//            update.setId(oOrders.get(0).getId());
////            update.setRefundStatus(refundStatus);
//            update.setOrderStatus(orderStatus);
////            long time = originOrder.getCreateTime().longValue() * 1000;
////            update.setOrderTime(new Date(time));
////            update.setGoodsAmount(originOrder.getOrderAmount().doubleValue()/100);
////            update.setPostFee(originOrder.getPostAmount().doubleValue()/100);
////            update.setAmount(originOrder.getOrderAmount().doubleValue()/100);
////            update.setPayment(originOrder.getPayAmount().doubleValue()/100);
//            update.setReceiverName(orderDetail.getString("userName"));
//            update.setReceiverMobile(orderDetail.getString("telNumber"));
//            update.setAddress(orderDetail.getString("detailInfo"));
//            update.setUpdateTime(new Date());
//            update.setUpdateBy("ORDER_MESSAGE");
//            orderMapper.updateById(update);
//
//            //修改发货表退款状态（o_supplier_ship_order）
//            if(refundStatus>1){
//                OSupplierShipOrder updateShip = new OSupplierShipOrder();
//                updateShip.setRefundStatus(refundStatus);
//                shipOrderMapper.update(updateShip,new LambdaQueryWrapper<OSupplierShipOrder>().eq(OSupplierShipOrder::getOrderNum,oOrders.get(0).getOrderNum()));
//            }
//
//            // 删除orderItem
////            orderItemMapper.delete(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId,update.getId()));
//            // 插入orderItem
//            addWeiOrderItem(update.getId(),orderId,update.getShopId(),orderStatus,orderDetail.getJSONArray("items"));
//        }
//
//        return ResultVo.success();
    }
//
//    private void addWeiOrderItem(String oOrderId,String originOrderId,Long shopId,Integer orderStatus,JSONArray itemArray){
//        if(itemArray!=null && itemArray.size()>0) {
//            for (int i = 0; i < itemArray.size(); i++) {
//                JSONObject itemObject = itemArray.getJSONObject(i);
////                OOrderItem orderItem = new OOrderItem();
////                orderItem.setOrderId(oOrderId);
////                orderItem.setOrderNum(item.getParentOrderId());
////                orderItem.setSubOrderNum(item.getOrderId());
//                OOrderItem orderItem = new OOrderItem();
//                orderItem.setOrderId(oOrderId);
//                orderItem.setOrderNum(originOrderId);
//                orderItem.setSubOrderNum(originOrderId + "-" + itemObject.getString("skuId"));
//                orderItem.setSkuNum(itemObject.getString("skuCode"));
//                orderItem.setSkuId(itemObject.getString("skuId"));
//                orderItem.setProductId(itemObject.getString("productId"));
//                orderItem.setGoodsId(itemObject.getLong("ogoodsId"));
//                orderItem.setGoodsSkuId(itemObject.getString("ogoodsSkuId"));
//                orderItem.setGoodsImg(itemObject.getString("thumbImg"));
//                orderItem.setGoodsTitle(itemObject.getString("title"));
//                orderItem.setGoodsSpec(itemObject.getString("skuAttrs"));
//                orderItem.setGoodsPrice(itemObject.getDouble("salePrice")/100);
//
//                orderItem.setItemAmount(itemObject.getDouble("estimatePrice")/100);
//                orderItem.setPayment(itemObject.getDouble("estimatePrice")/100);
//                orderItem.setQuantity(itemObject.getInteger("skuCnt"));
//                orderItem.setOrderStatus(orderStatus);
//                orderItem.setRefundStatus(itemObject.getInteger("refundStatus"));
//                orderItem.setRefundCount(itemObject.getInteger("onAftersaleSkuCnt")+itemObject.getInteger("finishAftersaleSkuCnt"));
//
//
//                List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>()
//                        .eq(OOrderItem::getOrderId, orderItem.getOrderId())
//                        .eq(OOrderItem::getSkuId, orderItem.getSkuId())
//                );
//                if(oOrderItems.isEmpty()) {
//                    // 新增
//                    orderItem.setCreateTime(new Date());
//                    orderItem.setCreateBy("ORDER_MESSAGE");
//                    orderItemMapper.insert(orderItem);
//                }else{
//                    //修改
//                    orderItem.setId(oOrderItems.get(0).getId());
//                    orderItem.setUpdateTime(new Date());
//                    orderItem.setUpdateBy("ORDER_MESSAGE");
//                    orderItemMapper.updateById(orderItem);
//                }
//                //更新发货表
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
//
//            }
//
//        }
//    }
    /**
     * 线下订单通知
     * @param orderId
     * @return
     */
    @Transactional
    @Override
    public ResultVo<Integer> offlineOrderMessage(String orderNum) {
        log.info("Offline订单消息处理" + orderNum);
        return offlineOrderMessageService.offlineOrderMessage(orderNum);
    }

    @Override
    public List<OOrder> getList(OOrder order) {
        return orderMapper.selectList(new LambdaQueryWrapper<>());
    }

    @Override
    public PageResult<OOrder> queryPageList(OrderSearchRequest bo, PageQuery pageQuery) {
        if(org.springframework.util.StringUtils.hasText(bo.getStartTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getStartTime());
            boolean b = matcher.find();
            if(b){
                bo.setStartTime(bo.getStartTime()+" 00:00:00");
            }
        }
        if(org.springframework.util.StringUtils.hasText(bo.getEndTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getEndTime());
            boolean b = matcher.find();
            if(b){
                bo.setEndTime(bo.getEndTime()+" 23:59:59");
            }
        }

        LambdaQueryWrapper<OOrder> queryWrapper = new LambdaQueryWrapper<OOrder>()
                .eq(bo.getShopId()!=null,OOrder::getShopId,bo.getShopId())
                .eq(org.springframework.util.StringUtils.hasText(bo.getOrderNum()),OOrder::getOrderNum,bo.getOrderNum())
                .eq(bo.getOrderStatus()!=null,OOrder::getOrderStatus,bo.getOrderStatus())
//                .eq(bo.getRefundStatus()!=null,OOrder::getRefundStatus,bo.getRefundStatus())
                .eq(bo.getPlatformId()!=null,OOrder::getShopType,bo.getPlatformId())
                .ge(org.springframework.util.StringUtils.hasText(bo.getStartTime()),OOrder::getOrderTime,bo.getStartTime()+" 00:00:00")
                .le(org.springframework.util.StringUtils.hasText(bo.getEndTime()),OOrder::getOrderTime,bo.getEndTime()+" 23:59:59")
                .eq(bo.getShipStatus()!=null ,OOrder::getShipStatus,bo.getShipStatus())
//                .eq(bo.getErpPushStatus()!=null && bo.getErpPushStatus() == 0,OOrder::getErpPushStatus,0)
//                .eq(bo.getErpPushStatus()!=null && bo.getErpPushStatus() == 100,OOrder::getErpPushStatus,100)
//                .eq(bo.getErpPushStatus()!=null && bo.getErpPushStatus() == 200,OOrder::getErpPushStatus,200)
//                .gt(bo.getErpPushStatus()!=null && bo.getErpPushStatus() == 500,OOrder::getErpPushStatus,200)
//                .eq(org.springframework.util.StringUtils.hasText(bo.getReceiverName()),OOrder::getReceiverName,bo.getReceiverName())
//                .like(org.springframework.util.StringUtils.hasText(bo.getReceiverMobile()),OOrder::getReceiverMobile,bo.getReceiverMobile())
                ;
//        if(bo.getErpPushStatus()!=null) {
//            if (bo.getErpPushStatus() == 0) {
//                // 未推送
//                queryWrapper.eq(OOrder::getErpPushResult, 0);
//            } else if (bo.getErpPushStatus() == 200) {
//                // 推送成功
//                queryWrapper.eq(OOrder::getErpPushResult, 200);
//            } else if (bo.getErpPushStatus() == 500) {
//                // 推送失败
//                queryWrapper.gt(OOrder::getErpPushResult, 200);
//            }
//        }
        pageQuery.setOrderByColumn("order_time");
        pageQuery.setIsAsc("desc");
        Page<OOrder> pages = orderMapper.selectPage(pageQuery.build(), queryWrapper);

        // 查询子订单
        if(pages.getRecords()!=null){
            for (var order:pages.getRecords()) {
//                order.setItemList(orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, order.getId())));
                order.setItemVoList(orderItemMapper.selectOrderItemListByOrderId(Long.parseLong(order.getId())));
            }
        }

        return PageResult.build(pages);
    }

    /**
     * 待分配发货清单
     * @param bo
     * @param pageQuery
     * @return
     */
    @Override
    public PageResult<OOrder> queryWaitDistOrderPageList(OrderSearchRequest bo, PageQuery pageQuery) {
        if(org.springframework.util.StringUtils.hasText(bo.getStartTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getStartTime());
            boolean b = matcher.find();
            if(b){
                bo.setStartTime(bo.getStartTime()+" 00:00:00");
            }
        }
        if(org.springframework.util.StringUtils.hasText(bo.getEndTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getEndTime());
            boolean b = matcher.find();
            if(b){
                bo.setEndTime(bo.getEndTime()+" 23:59:59");
            }
        }

        LambdaQueryWrapper<OOrder> queryWrapper = new LambdaQueryWrapper<OOrder>()
                .eq(bo.getShopId()!=null,OOrder::getShopId,bo.getShopId())
                .eq(org.springframework.util.StringUtils.hasText(bo.getOrderNum()),OOrder::getOrderNum,bo.getOrderNum())
                .eq(OOrder::getOrderStatus,1)
//                .eq(bo.getRefundStatus()!=null,OOrder::getRefundStatus,bo.getRefundStatus())
                .eq(bo.getPlatformId()!=null,OOrder::getShopType,bo.getPlatformId())
                .ge(org.springframework.util.StringUtils.hasText(bo.getStartTime()),OOrder::getOrderTime,bo.getStartTime())
                .le(org.springframework.util.StringUtils.hasText(bo.getEndTime()),OOrder::getOrderTime,bo.getEndTime())
                .ne(OOrder::getDistStatus,2)//没有全部分配
                ;

        pageQuery.setOrderByColumn("order_time");
        pageQuery.setIsAsc("desc");
        Page<OOrder> pages = orderMapper.selectPage(pageQuery.build(), queryWrapper);

        // 查询子订单
        if(pages.getRecords()!=null){
            for (var order:pages.getRecords()) {
                order.setItemList(orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>()
                        .eq(OOrderItem::getOrderId, order.getId())
                        .eq(OOrderItem::getShipStatus,0)//还没有推送的
                ));

            }
        }

        return PageResult.build(pages);
    }

    /**
     * 备货清单 - 已取号 未发货的订单
     * @param orderNum
     * @param shopId
     * @param pageQuery
     * @return
     */
//    @Override
//    public PageResult<OOrder> queryStockUpPageList(String orderNum, Long shopId, PageQuery pageQuery) {
//        LambdaQueryWrapper<OOrder> queryWrapper = new LambdaQueryWrapper<OOrder>()
//                .eq(shopId!=null,OOrder::getShopId,shopId)
//                .eq(org.springframework.util.StringUtils.hasText(orderNum),OOrder::getOrderNum,orderNum)
//                .eq(OOrder::getOrderStatus,1)
//                .eq(OOrder::getRefundStatus,1);
////                .eq(bo.getPlatformId()!=null,OOrder::getShopType,bo.getPlatformId())
////                .gt(OOrder::getWaybillStatus,0);
//
//        pageQuery.setOrderByColumn("order_time");
//        pageQuery.setIsAsc("desc");
//        Page<OOrder> pages = orderMapper.selectPage(pageQuery.build(), queryWrapper);
//
//        // 查询子订单
//        if(pages.getRecords()!=null){
//            for (var order:pages.getRecords()) {
////                order.setItemList(orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, order.getId())));
//                order.setItemVoList(orderItemMapper.selectOrderItemListByOrderId(Long.parseLong(order.getId())));
//            }
//        }
//
//        return PageResult.build(pages);
//    }

    @Override
    public OOrder queryDetailById(Long id) {
        OOrder oOrder = orderMapper.selectById(id);
        if(oOrder!=null) {
//           oOrder.setItemList(orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId, oOrder.getId())));
            oOrder.setItemVoList(orderItemMapper.selectOrderItemListByOrderId(id));
            // 获取优惠信息
            if(oOrder.getShopType()==EnumShopType.TAO.getIndex()){
                oOrder.setDiscounts(orderMapper.getTaoOrderDiscount(oOrder.getOrderNum()));
            } else if (oOrder.getShopType()==EnumShopType.JD.getIndex()) {
                oOrder.setDiscounts(orderMapper.getJdOrderDiscount(oOrder.getOrderNum()));
            }else if (oOrder.getShopType()==EnumShopType.PDD.getIndex()) {
                List<OrderDiscountVo> discountVoList = new ArrayList<>();
                if(oOrder.getPlatformDiscount()!=null&& oOrder.getPlatformDiscount()>0){
                    OrderDiscountVo vo = new OrderDiscountVo();
                    vo.setName("平台优惠");
                    vo.setDiscountAmount(oOrder.getPlatformDiscount().toString());
                    vo.setDescription("平台优惠");
                    discountVoList.add(vo);
                    oOrder.setDiscounts(discountVoList);
                }
            }else if (oOrder.getShopType()==EnumShopType.DOU.getIndex()) {
                List<OrderDiscountVo> discountVoList = new ArrayList<>();
                if(oOrder.getPlatformDiscount()!=null&& oOrder.getPlatformDiscount()>0){
                    OrderDiscountVo vo = new OrderDiscountVo();
                    vo.setName("平台优惠");
                    vo.setDiscountAmount(oOrder.getPlatformDiscount().toString());
                    vo.setDescription("平台优惠");
                    discountVoList.add(vo);
                    oOrder.setDiscounts(discountVoList);
                }
            }
        }

        return oOrder;
    }

    @Override
    public List<OOrder> searchOrderConsignee(String consignee) {
        LambdaQueryWrapper<OOrder> qw = new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderStatus,1).likeRight(OOrder::getReceiverName,consignee);
        return orderMapper.selectList(qw);
    }

    @Override
    public List<OOrderItem> searchOrderItemByReceiverMobile(String receiverMobile) {
        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderStatus, 1).eq(OOrder::getReceiverMobile, receiverMobile));
        List<OOrderItem> orderItemList = new ArrayList<>();
        if(oOrders!=null){
            for (var order:oOrders) {
                orderItemList.addAll(orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId,order.getId())));
            }
        }
        return orderItemList;
    }

    @Override
    public List<SalesDailyVo> salesDaily() {
        return orderMapper.salesDaily();
    }

    @Override
    public SalesDailyVo getTodaySalesDaily() {
        return orderMapper.getTodaySalesDaily();
    }



//    @Transactional
//    @Override
//    public ResultVo<Integer> saveWaybillCode(String orderNum, Long shopId, Integer shopType, String waybillCode) {
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderNum).eq(OOrder::getShopId, shopId).eq(OOrder::getShopType, shopType));
//        if(!oOrders.isEmpty()){
//            OOrder update = new OOrder();
//            update.setId(oOrders.get(0).getId());
//            update.setWaybillCode(waybillCode);
//            update.setWaybillStatus(1);
//            update.setUpdateBy("取号");
//            update.setUpdateTime(new Date());
//            orderMapper.updateById(update);
//            // 更新子订单
//            OOrderItem updateItem = new OOrderItem();
//            updateItem.setWaybillCode(waybillCode);
//            updateItem.setWaybillStatus(1);
//            updateItem.setUpdateTime(new Date());
//            updateItem.setUpdateBy("取号");
//            orderItemMapper.update(updateItem,new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getOrderId,update.getId()));
//            return ResultVo.success();
//        }
//        return ResultVo.error("");
//    }

//    /**
//     * 新增订单
//     *
//     * @param bo 订单
//     * @return 结果
//     */
//    @Transactional
//    @Override
//    public int insertErpOrder(OrderCreateBo bo,String createBy)
//    {
//        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, bo.getOrderNum()));
//
//        if (oOrders!=null&& oOrders.size()>0) return -1;// 订单号已存在
////        erpOrder.setCreateTime(DateUtils.getNowDate());
////        int rows = erpOrderMapper.insertErpOrder(erpOrder);
////        insertErpOrderItem(erpOrder);
////        return rows;
//        if(bo.getItemList() == null || bo.getItemList().size() == 0) return -2;
//        else{
//            // 循环查找是否缺少specId
//            for (OrderCreateItemBo itemBo : bo.getItemList()) {
//                if(itemBo.getSkuId()==null || itemBo.getQuantity()<=0) return -3;
//            }
//        }
//
//        OShop shop = shopMapper.selectById(bo.getShopId());
//        Integer shopType = 0;
//        if(shop!=null){
//            shopType = shop.getType();
//        }else return -4;
//
//        // 开始组合订单信息
//        OOrder order = new OOrder();
//        order.setOrderNum(bo.getOrderNum());
//        order.setShopId(bo.getShopId());
//        order.setShopType(shopType);
//        order.setBuyerMemo(bo.getBuyerMemo());
//        order.setRemark(bo.getRemark());
//        order.setRefundStatus(1);
//        order.setOrderStatus(1);
//        order.setGoodsAmount(bo.getGoodsAmount());
//        order.setPostFee(bo.getPostage());
//        order.setAmount(bo.getGoodsAmount()+bo.getPostage());
//        order.setSellerDiscount(bo.getSellerDiscount());
//        order.setPlatformDiscount(0.0);
//        order.setPayment(bo.getGoodsAmount()+bo.getPostage()-bo.getSellerDiscount());
//        order.setReceiverName(bo.getReceiverName());
//        order.setReceiverMobile(bo.getReceiverPhone());
//        order.setProvince(bo.getProvince());
//        order.setCity(bo.getCity());
//        order.setTown(bo.getTown());
//        order.setAddress(bo.getAddress());
//        order.setOrderTime(new Date());
//
//        order.setCreateTime(new Date());
//        order.setShipType(0);
//        order.setErpPushStatus(0);
//        order.setCreateBy(createBy);
//
//        orderMapper.insert(order);
//
////        List<OOrderItem> itemList = new ArrayList<OOrderItem>();
//        for (int i = 0; i < bo.getItemList().size(); i++) {
//            OrderCreateItemBo itemBo = bo.getItemList().get(i);
//            OOrderItem orderItem = new OOrderItem();
//
//            orderItem.setOrderId(order.getId());
//            orderItem.setOrderNum(bo.getOrderNum());
//            if(bo.getItemList().size()==1) {
//                orderItem.setSubOrderNum(bo.getOrderNum());
//            }else{
//                orderItem.setSubOrderNum(bo.getOrderNum()+(i+1));
//            }
//            orderItem.setSkuId(itemBo.getSkuId());
//            orderItem.setGoodsId(0L);
//            orderItem.setGoodsSkuId(Long.parseLong(itemBo.getSkuId()));
//            orderItem.setGoodsTitle(itemBo.getGoodsName());
//            orderItem.setGoodsImg(itemBo.getGoodsImg());
//            orderItem.setGoodsSpec(itemBo.getSkuName());
//            orderItem.setSkuNum(itemBo.getSkuCode());
//            orderItem.setGoodsPrice(itemBo.getGoodsPrice().doubleValue());
//            orderItem.setItemAmount(itemBo.getItemAmount().doubleValue());
//            orderItem.setPayment(itemBo.getItemAmount().doubleValue());
//            orderItem.setQuantity(itemBo.getQuantity());
//            orderItem.setRefundCount(0);
//            orderItem.setRefundStatus(1);
//            orderItem.setOrderStatus(order.getOrderStatus());
//            orderItem.setHasPushErp(0);
//            orderItem.setCreateTime(new Date());
//            orderItem.setCreateBy(createBy);
//            orderItemMapper.insert(orderItem);
////            itemList.add(orderItem);
//        }
//
//        return 1;
//    }
}




