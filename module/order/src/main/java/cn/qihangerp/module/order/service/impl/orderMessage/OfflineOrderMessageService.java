package cn.qihangerp.module.order.service.impl.orderMessage;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.module.order.domain.*;
import cn.qihangerp.module.order.mapper.*;
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
public class OfflineOrderMessageService {
    private final OfflineOrderMapper offlineOrderMapper;
    private final OfflineOrderItemMapper offlineOrderItemMapper;
    private final OOrderMapper orderMapper;
    private final OOrderItemMapper orderItemMapper;
    private final OSupplierShipOrderMapper shipOrderMapper;
    private final OSupplierShipOrderItemMapper shipOrderItemMapper;

    @Transactional
    public ResultVo<Integer> offlineOrderMessage(String orderNum) {
        log.info("Offline订单消息处理" + orderNum);
        List<OfflineOrder> originOrders = offlineOrderMapper.selectList(new LambdaQueryWrapper<OfflineOrder>().eq(OfflineOrder::getOrderNum, orderNum));

        if (originOrders == null || originOrders.size() == 0) {
            // 没有找到订单信息
            return ResultVo.error(ResultVoEnum.NotFound, "没有找到OFFLINE原始订单：" + orderNum);
        }

        OfflineOrder originOrder = originOrders.get(0);

        List<OOrder> oOrders = orderMapper.selectList(new LambdaQueryWrapper<OOrder>().eq(OOrder::getOrderNum, orderNum));
        if (oOrders == null || oOrders.isEmpty()) {
            // 新增订单
            OOrder insert = new OOrder();
            insert.setOrderNum(originOrder.getOrderNum());
            insert.setShopType(EnumShopType.OFFLINE.getIndex());
            insert.setShopId(originOrder.getShopId());
            insert.setBuyerMemo(originOrder.getBuyerMemo());
            insert.setSellerMemo(originOrder.getSellerMemo());
//            insert.setRefundStatus(originOrder.getRefundStatus());
            insert.setOrderStatus(originOrder.getOrderStatus());

            insert.setGoodsAmount(originOrder.getGoodsAmount());
            insert.setPostFee(originOrder.getPostFee());
            insert.setAmount(originOrder.getAmount());
            insert.setPayment(originOrder.getPayment());
            insert.setPlatformDiscount(originOrder.getPlatformDiscount());
            insert.setSellerDiscount(originOrder.getSellerDiscount());

            insert.setReceiverName(originOrder.getReceiverName());
            insert.setReceiverMobile(originOrder.getReceiverMobile());
            insert.setAddress(originOrder.getAddress());
            insert.setProvince(originOrder.getProvince());
            insert.setCity(originOrder.getCity());
            insert.setTown(originOrder.getTown());
            insert.setOrderTime(originOrder.getOrderTime());
//            insert.setShipType(0);
            insert.setCreateTime(new Date());
            insert.setCreateBy("ORDER_MESSAGE");

            orderMapper.insert(insert);
            // 插入orderItem
            addOfflineOrderItem(insert.getId(), originOrder.getOrderNum(), originOrder.getOrderStatus(), originOrder.getRefundStatus());

            //更新推送状态
            OfflineOrder offlineUpdate = new OfflineOrder();
            offlineUpdate.setId(originOrder.getId());
            offlineUpdate.setOmsPushStatus(1);
            offlineUpdate.setUpdateTime(new Date());
            offlineUpdate.setUpdateBy("推送状态更新");
            offlineOrderMapper.updateById(offlineUpdate);
        } else {
            // 修改订单 (修改：)
            OOrder update = new OOrder();
            update.setId(oOrders.get(0).getId());
//            update.setRefundStatus(originOrder.getRefundStatus());
            update.setOrderStatus(originOrder.getOrderStatus());
            update.setReceiverName(originOrder.getReceiverName());
            update.setReceiverMobile(originOrder.getReceiverMobile());
            update.setAddress(originOrder.getAddress());
            update.setProvince(originOrder.getProvince());
            update.setCity(originOrder.getCity());
            update.setTown(originOrder.getTown());
            update.setUpdateTime(new Date());
            update.setUpdateBy("ORDER_MESSAGE");
            orderMapper.updateById(update);
            // 更新发货主表数据状态
            OSupplierShipOrder shipOrder = new OSupplierShipOrder();
            shipOrder.setOrderStatus(update.getOrderStatus());
            shipOrderMapper.update(shipOrder,new LambdaQueryWrapper<OSupplierShipOrder>().eq(OSupplierShipOrder::getOOrderId,update.getId()));
        }
        return ResultVo.success();
    }

    private void addOfflineOrderItem(String oOrderId, String originOrderNum, Integer orderStatus, Integer refundStatus) {
        List<OfflineOrderItem> originOrderItems = offlineOrderItemMapper.selectList(new LambdaQueryWrapper<OfflineOrderItem>().eq(OfflineOrderItem::getOrderNum, originOrderNum));
        if (originOrderItems != null && originOrderItems.size() > 0) {
            for (var item : originOrderItems) {

                OOrderItem orderItem = new OOrderItem();
                orderItem.setOrderId(oOrderId);
                orderItem.setOrderNum(originOrderNum);
                orderItem.setSubOrderNum(item.getSubOrderNum());
                // 这里将订单商品skuid转换成erp系统的skuid
                Long erpGoodsId = 0L;
                String erpSkuId = "0";

//                DouGoodsSku douGoodsSku = douGoodsSkuMapper.selectById(item.getSkuId());
//                if (douGoodsSku != null ) {
//                    erpGoodsId = douGoodsSku.getOGoodsId();
//                    erpSkuId = douGoodsSku.getOGoodsSkuId();
////                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
////                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
////                    orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
//                }
//                List<DouGoodsSku> douGoodsSku = douGoodsSkuMapper.selectList(new LambdaQueryWrapper<DouGoodsSku>().eq(DouGoodsSku::getId, item.getSkuId()));
//                if (douGoodsSku != null && !douGoodsSku.isEmpty()) {
//                    erpGoodsId = douGoodsSku.get(0).getOGoodsId();
//                    erpSkuId = douGoodsSku.get(0).getOGoodsSkuId();
////                        orderItem.setGoodsImg(taoGoodsSku.get(0).getLogo());
////                        orderItem.setGoodsSpec(jdGoodsSkus.get(0).getSkuName());
////                    orderItem.setSkuNum(taoGoodsSku.get(0).getOuterId());
//                }
                orderItem.setSkuNum(item.getSkuNum());
                orderItem.setSkuId(item.getSkuId());
                orderItem.setProductId(item.getGoodsId().toString());
                orderItem.setGoodsId(item.getGoodsId());
                orderItem.setGoodsSkuId(item.getGoodsSkuId() + "");
                orderItem.setGoodsImg(item.getGoodsImg());
                orderItem.setGoodsSpec(item.getGoodsSpec());
                orderItem.setGoodsTitle(item.getGoodsTitle());
                orderItem.setGoodsPrice(item.getGoodsPrice());
                orderItem.setItemAmount(item.getItemAmount());
                orderItem.setPayment(item.getPayment());
                orderItem.setQuantity(item.getQuantity());
                orderItem.setOrderStatus(orderStatus);
                orderItem.setRefundStatus(refundStatus);
                orderItem.setRefundCount(0);

                List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>()
                        .eq(OOrderItem::getOrderId, orderItem.getOrderId())
                        .eq(OOrderItem::getSkuId, orderItem.getSkuId())
                );
                if(oOrderItems.isEmpty()) {
                    // 添加
                    orderItem.setCreateTime(new Date());
                    orderItem.setCreateBy("ORDER_MESSAGE");
                    orderItemMapper.insert(orderItem);
                }else{
                    // 修改
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
            }
        }
    }


}
