package cn.qihangerp.module.order.service.impl;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.module.order.domain.*;
import cn.qihangerp.module.order.mapper.*;
import cn.qihangerp.module.order.service.OOrderService;
import cn.qihangerp.module.order.service.OShipWaybillService;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
* @author qilip
* @description 针对表【o_ship_waybill(发货电子面单记录表（打单记录）)】的数据库操作Service实现
* @createDate 2024-07-28 18:29:53
*/
@Slf4j
@AllArgsConstructor
@Service
public class OShipWaybillServiceImpl extends ServiceImpl<OShipWaybillMapper, OShipWaybill>
    implements OShipWaybillService {
    private final OShipWaybillMapper mapper;
    private final OSupplierShipOrderMapper supplierShipOrderMapper;
    private final OSupplierShipOrderItemMapper supplierShipOrderItemMapper;
    private final OShipmentMapper shipmentMapper;
    private final OShipmentItemMapper shipmentItemMapper;
    private final OOrderItemMapper orderItemMapper;
    private final OOrderService oOrderService;
    /**
     * 更新电子面单信息
     * @param shipWaybill
     * @return
     */
    @Transactional
    @Override
    public ResultVo<Integer> waybillUpdate(OShipWaybill shipWaybill) {
        String orderId= shipWaybill.getOrderId();
        if(shipWaybill.getId()!=null&&shipWaybill.getId()>0){
            // 存在，修改
            shipWaybill.setCreateBy(null);
            shipWaybill.setCreateTime(null);
            shipWaybill.setOrderId(null);
            shipWaybill.setShopId(null);
            shipWaybill.setShopType(null);
            mapper.updateById(shipWaybill);
        }else{
            // 新增
            List<OShipWaybill> erpShipWaybills = mapper.selectList(new LambdaQueryWrapper<OShipWaybill>()
                    .eq(OShipWaybill::getOrderId, orderId).eq(OShipWaybill::getShipOrderId,shipWaybill.getShipOrderId()));
            if(erpShipWaybills==null|| erpShipWaybills.size()==0) {
                shipWaybill.setStatus(1);//已取号
                shipWaybill.setShopType(shipWaybill.getShopType());
                shipWaybill.setCreateTime(new Date());
                mapper.insert(shipWaybill);
            }else{
//                OShipWaybill update = new OShipWaybill();
                shipWaybill.setId(erpShipWaybills.get(0).getId());
//                update.setWaybillCode(shipWaybill.getWaybillCode());
//                update.setLogisticsCode(shipWaybill.getLogisticsCode());
//                update.setPrintData(shipWaybill.getPrintData());
//                update.setStatus(1);
                shipWaybill.setUpdateTime(new Date());
                shipWaybill.setUpdateBy("重新取号");
                mapper.updateById(shipWaybill);
            }
        }
//        // 更新关联订单erp_send_status状态
//        OmsTaoOrder orderUpdate = new OmsTaoOrder();
//        orderUpdate.setErpSendStatus(shipWaybill.getStatus());
//        orderUpdate.setErpSendCode(shipWaybill.getWaybillCode());
//        orderUpdate.setErpSendCompany(shipWaybill.getLogisticsCode());
//        orderMapper.update(orderUpdate,new LambdaQueryWrapper<OmsTaoOrder>().eq(OmsTaoOrder::getTid,orderId));

        return ResultVo.success();
    }
    @Override
    public List<OShipWaybill> getListByOrderIds(Long shopId, String[] orderIds) {
        List<OShipWaybill> erpShipWaybills = mapper.selectList(
                new LambdaQueryWrapper<OShipWaybill>()
                        .eq(OShipWaybill::getShopId,shopId)
                        .in(OShipWaybill::getOrderId, Arrays.stream(orderIds).toList()));
        return erpShipWaybills;
    }

    @Override
    public List<OShipWaybill> getListBySupplierShipOrderIds(String[] orderIds) {
        List<OShipWaybill> erpShipWaybills = mapper.selectList(
                new LambdaQueryWrapper<OShipWaybill>()
                        .in(OShipWaybill::getShipOrderId, Arrays.stream(orderIds).toList()));
        return erpShipWaybills;

//        List<OSupplierShipOrder> supplierShipOrders = supplierShipOrderMapper.selectList(new LambdaQueryWrapper<OSupplierShipOrder>()
//                .in(OSupplierShipOrder::getId, Arrays.stream(orderIds).toList())
//                .select(OSupplierShipOrder::getOrderNum)
//        );
//        if(supplierShipOrders.isEmpty())
//            return null;
//        else{
//            String[] orderNums = supplierShipOrders.stream()
//                    .map(OSupplierShipOrder::getOrderNum)
//                    .toArray(String[]::new);
//            List<OShipWaybill> erpShipWaybills = mapper.selectList(
//                    new LambdaQueryWrapper<OShipWaybill>()
//                            .in(OShipWaybill::getOrderId, Arrays.stream(orderNums).toList()));
//            return erpShipWaybills;
//        }
    }

    @Transactional
    @Override
    public ResultVo<Integer> printSuccess(Long shopId, String[] orderIds) {
        List<OShipWaybill> erpShipWaybills = mapper.selectList(
                new LambdaQueryWrapper<OShipWaybill>()
                        .eq(OShipWaybill::getShopId,shopId)
                        .in(OShipWaybill::getOrderId, Arrays.stream(orderIds).toList()));
        if(erpShipWaybills!=null){
            for (var w : erpShipWaybills){
                if(w.getStatus()==1) {
                    OShipWaybill update = new OShipWaybill();
                    update.setId(erpShipWaybills.get(0).getId());
                    update.setStatus(2);
                    update.setUpdateTime(new Date());
                    update.setUpdateBy("打印面单");
                    mapper.updateById(update);

//                    // 更新关联订单erp_send_status状态
//                    OmsTaoOrder orderUpdate = new OmsTaoOrder();
//                    orderUpdate.setErpSendStatus(update.getStatus());
//
//                    orderMapper.update(orderUpdate, new LambdaQueryWrapper<OmsTaoOrder>().eq(OmsTaoOrder::getTid, w.getOrderId()));
//
//                    //TODO: 打印成功之后 加入备货清单 采用kafka推送消息处理
//
//                    // 打印完成，通知备货
//                    kafkaTemplate.send(MqType.SHIP_STOCK_UP_MQ, JSONObject.toJSONString(MqMessage.build(w.getShopId(), w.getOrderId())));
                }
            }
        }
        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Integer> supplierPrintSuccess(String supplierShipOrderId) {
        OSupplierShipOrder shipOrder = supplierShipOrderMapper.selectById(supplierShipOrderId);
        if (shipOrder == null) return ResultVo.error("找不到数据");

        List<OShipWaybill> erpShipWaybills = mapper.selectList(
                new LambdaQueryWrapper<OShipWaybill>()
                        .eq(OShipWaybill::getOrderId, shipOrder.getOrderNum()));
        if (erpShipWaybills.isEmpty()) return ResultVo.error("找不到数据");

        if (erpShipWaybills.get(0).getStatus() == 1) {
            OShipWaybill update = new OShipWaybill();
            update.setId(erpShipWaybills.get(0).getId());
            update.setStatus(2);
            update.setUpdateTime(new Date());
            update.setUpdateBy("打印面单");
            mapper.updateById(update);

            // 更新供应商订单状态
            OSupplierShipOrder oSupplierShipOrder = new OSupplierShipOrder();
            oSupplierShipOrder.setWaybillStatus(2);
            oSupplierShipOrder.setUpdateTime(new Date());
            oSupplierShipOrder.setUpdateBy("供应商打单");
            oSupplierShipOrder.setId(shipOrder.getId());
            supplierShipOrderMapper.updateById(oSupplierShipOrder);
//                    // 更新关联订单erp_send_status状态
//                    OmsTaoOrder orderUpdate = new OmsTaoOrder();
//                    orderUpdate.setErpSendStatus(update.getStatus());
//
//                    orderMapper.update(orderUpdate, new LambdaQueryWrapper<OmsTaoOrder>().eq(OmsTaoOrder::getTid, w.getOrderId()));
//
//                    //TODO: 打印成功之后 加入备货清单 采用kafka推送消息处理
//
//                    // 打印完成，通知备货
//                    kafkaTemplate.send(MqType.SHIP_STOCK_UP_MQ, JSONObject.toJSONString(MqMessage.build(w.getShopId(), w.getOrderId())));
        }

        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Integer> pushShipSend(Long shopId, String[] orderIds) {
        List<OShipWaybill> erpShipWaybills = mapper.selectList(
                new LambdaQueryWrapper<OShipWaybill>()
                        .eq(OShipWaybill::getShopId,shopId)
                        .in(OShipWaybill::getOrderId, Arrays.stream(orderIds).toList()));
        if(erpShipWaybills!=null){
            for (var w : erpShipWaybills){
                if(w.getStatus() > 0 && w.getStatus()<3) {
                    OShipWaybill update = new OShipWaybill();
                    update.setId(erpShipWaybills.get(0).getId());
                    update.setStatus(3);// 已发货
                    update.setUpdateTime(new Date());
                    update.setUpdateBy("电子面单发货");
                    mapper.updateById(update);

//                    // 更新关联订单erp_send_status状态
//                    OmsTaoOrder orderUpdate = new OmsTaoOrder();
//                    orderUpdate.setErpSendStatus(update.getStatus());
//
//                    orderMapper.update(orderUpdate, new LambdaQueryWrapper<OmsTaoOrder>().eq(OmsTaoOrder::getTid, w.getOrderId()));
//
//                    // 更新erp_sale_order发货状态(controller层采用kafka推送消息处理)
//                    // 发货完成，通知发货出库
//                    kafkaTemplate.send(MqType.SHIP_SEND_MQ, JSONObject.toJSONString(MqMessage.build(w.getShopId(),w.getOrderId(),w.getLogisticsCode(),w.getWaybillCode())));
                }
            }
        }
        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Integer> pushSupplierShipSend(String supplierShipOrderId) {
        OSupplierShipOrder shipOrder = supplierShipOrderMapper.selectById(supplierShipOrderId);
        if (shipOrder == null) return ResultVo.error("找不到数据");
        if(shipOrder.getSendStatus().intValue() !=1) return ResultVo.error(ResultVoEnum.Exist,"已发货或已取消不能再发货");
        List<OShipWaybill> erpShipWaybills = mapper.selectList(
                new LambdaQueryWrapper<OShipWaybill>()
                        .eq(OShipWaybill::getOrderId, shipOrder.getOrderNum()));
        if (erpShipWaybills.isEmpty()) return ResultVo.error("找不到数据");

        OShipWaybill update = new OShipWaybill();
        update.setId(erpShipWaybills.get(0).getId());
        update.setStatus(3);// 已发货
        update.setUpdateTime(new Date());
        update.setUpdateBy("电子面单发货");
        mapper.updateById(update);

        // 更新供应商订单状态
        OSupplierShipOrder oSupplierShipOrder = new OSupplierShipOrder();
        oSupplierShipOrder.setSendStatus(2);
        oSupplierShipOrder.setWaybillStatus(3);
        oSupplierShipOrder.setUpdateTime(new Date());
        oSupplierShipOrder.setUpdateBy("供应商打单");
        oSupplierShipOrder.setId(shipOrder.getId());
        supplierShipOrderMapper.updateById(oSupplierShipOrder);

        // 添加发货记录
        List<OShipmentItem> shippingItemList = new ArrayList<>();
        List<String> subOrderNums = new ArrayList<>();
        // 自订单
        List<OSupplierShipOrderItem> shipOrderItemList = supplierShipOrderItemMapper.selectList(new LambdaQueryWrapper<OSupplierShipOrderItem>().eq(OSupplierShipOrderItem::getShipOrderId, supplierShipOrderId));
        if(!shipOrderItemList.isEmpty()){
            for (var item:shipOrderItemList) {
                // 查询子订单是否存在
                // 添加shipping_item
                OShipmentItem shippingItem = new OShipmentItem();
                shippingItem.setOrderId(shipOrder.getOOrderId().toString());
                shippingItem.setOrderItemId(item.getSkuId());
                shippingItem.setOrderNum(shipOrder.getOrderNum());
                shippingItem.setSubOrderNum(item.getId().toString());
                shippingItemList.add(shippingItem);
                subOrderNums.add(item.getId().toString());

                OSupplierShipOrderItem shipOrderItem=new OSupplierShipOrderItem();
                shipOrderItem.setSendStatus(2);
                shipOrderItem.setId(item.getId());
                supplierShipOrderItemMapper.updateById(shipOrderItem);
                // 更新订单明细o_order_item
                OOrderItem updateOrderItem =new OOrderItem();
                updateOrderItem.setWaybillCode(item.getWaybillCode());
                updateOrderItem.setId(item.getOOrderItemId().toString());
                updateOrderItem.setShipStatus(2);
                orderItemMapper.updateById(updateOrderItem);
            }
        }



        // 订单发货主表
        OShipment shipping = new OShipment();
        shipping.setShippingType(1);//订单发货
        shipping.setShopId(shipOrder.getShopId());
        shipping.setOrderNums(shipOrder.getOrderNum());
        shipping.setSubOrderNums(String.join(", ", subOrderNums));
//        shipping.setReceiverName(shipBo.getReceiverName());
//        shipping.setReceiverMobile(shipBo.getReceiverMobile());
//        shipping.setProvince(shipBo.getProvince());
//        shipping.setCity(shipBo.getCity());
//        shipping.setTown(shipBo.getTown());
//        shipping.setAddress(shipBo.getAddress());
//        shipping.setLogisticsCompany(shipBo.getShipCompany());
//        shipping.setLogisticsCompanyCode(shipBo.getShipCompany());
        shipping.setWaybillCode(shipOrder.getWaybillCode());
        shipping.setShippingTime(new Date());
        shipping.setSupplierId(shipOrder.getSupplierId());
//            shipping.setRemark("手动发货");
        shipping.setCreateTime(new Date());
        shipmentMapper.insert(shipping);

        // 添加发货子表
        for (var item:shippingItemList) {
            item.setShippingId(shipping.getId());
            shipmentItemMapper.insert(item);
        }



        // 推送到店铺由controller进行操作
        return ResultVo.success();
    }

    @Override
    public ResultVo<OShipWaybill> cancelWaybillCode(Long supplierShipOrderId, String orderNum) {
        OSupplierShipOrder shipOrder = supplierShipOrderMapper.selectById(supplierShipOrderId);
        if (shipOrder == null) return ResultVo.error("找不到数据");

        List<OShipWaybill> erpShipWaybills = mapper.selectList(
                new LambdaQueryWrapper<OShipWaybill>()
                        .eq(OShipWaybill::getOrderId, shipOrder.getOrderNum()));
        if (erpShipWaybills.isEmpty()) return ResultVo.error("找不到数据");

        OShipWaybill waybill = erpShipWaybills.get(0);
        mapper.deleteById(erpShipWaybills.get(0).getId());


        // 更新供应商订单状态
        OSupplierShipOrder oSupplierShipOrder = new OSupplierShipOrder();
        oSupplierShipOrder.setWaybillStatus(0);
        oSupplierShipOrder.setUpdateTime(new Date());
        oSupplierShipOrder.setUpdateBy("取消取号");
        oSupplierShipOrder.setId(shipOrder.getId());
        supplierShipOrderMapper.updateById(oSupplierShipOrder);
        return ResultVo.success(waybill);
    }

    @Transactional
    @Override
    public ResultVo<Long> updateWaybillCode(OSupplierShipOrder supplierShipOrder,String templateUrl,int waybillStatus) {
        if(supplierShipOrder.getId()==null) return ResultVo.error("缺少ID");
        OSupplierShipOrder shipOrder = supplierShipOrderMapper.selectById(supplierShipOrder.getId());
        if(shipOrder==null) return ResultVo.error("没有找到数据");
        OOrder oOrder = oOrderService.getById(shipOrder.getOOrderId());
        if(oOrder==null){
            log.info("=========取号发货没有找到订单库订单信息======"+JSONObject.toJSONString(shipOrder));
            return ResultVo.error("没有找到订单库订单信息");
        }

        // 添加电子面单发货信息
        OShipWaybill waybill = new OShipWaybill();
        waybill.setShopId(supplierShipOrder.getShopId());
        waybill.setOrderId(supplierShipOrder.getOrderNum());
        waybill.setShipOrderId(supplierShipOrder.getId());
        waybill.setShopType(supplierShipOrder.getShopType().intValue());
        waybill.setWaybillCode(supplierShipOrder.getWaybillCode());
        waybill.setLogisticsCode(supplierShipOrder.getWaybillCompany());
        waybill.setPrintData(supplierShipOrder.getPrintData());
        waybill.setStatus(waybillStatus);//1已取号
        waybill.setWaybillOrderId(supplierShipOrder.getWaybillOrderId());
        waybill.setTemplateUrl(templateUrl);
        // 存在就更新，不存在就添加
        waybillUpdate(waybill);

        // 更新 发货主表
        OSupplierShipOrder supplierShipOrderUpdate = new OSupplierShipOrder();
        supplierShipOrderUpdate.setId(supplierShipOrder.getId());
        supplierShipOrderUpdate.setWaybillCode(supplierShipOrder.getWaybillCode());
        supplierShipOrderUpdate.setWaybillCompany(supplierShipOrder.getWaybillCompany());
        supplierShipOrderUpdate.setWaybillStatus(waybillStatus);
        if(waybillStatus==3) {
            supplierShipOrderUpdate.setShippingCompany(supplierShipOrder.getWaybillCompany());
            supplierShipOrderUpdate.setShippingNumber(supplierShipOrder.getWaybillCode());
            supplierShipOrderUpdate.setShippingTime(new Date());
            supplierShipOrderUpdate.setSendStatus(2);
        }
        supplierShipOrderUpdate.setUpdateTime(new Date());
        supplierShipOrderUpdate.setUpdateBy("用户取号");
        supplierShipOrderMapper.updateById(supplierShipOrderUpdate);

        // 更新子表数据（分配给供应商的订单不允许再拆单或者合单）
        List<OSupplierShipOrderItem> shipOrderItemList = supplierShipOrderItemMapper.selectList(
                new LambdaQueryWrapper<OSupplierShipOrderItem>()
                        .eq(OSupplierShipOrderItem::getShipOrderId, supplierShipOrder.getId()));
        if(!shipOrderItemList.isEmpty()) {
            for (var item : shipOrderItemList) {

                OSupplierShipOrderItem shipOrderItem=new OSupplierShipOrderItem();
                shipOrderItem.setWaybillCode(supplierShipOrder.getWaybillCode());
                shipOrderItem.setWaybillStatus(waybillStatus);
                if(waybillStatus==3) {
                    shipOrderItem.setSendStatus(2);
                }
                shipOrderItem.setUpdateBy("用户取号");
                shipOrderItem.setUpdateTime(new Date());
                shipOrderItem.setId(item.getId());
                supplierShipOrderItemMapper.updateById(shipOrderItem);
                // 更新订单明细o_order_item
                if(waybillStatus==3) {
                    OOrderItem updateOrderItem = new OOrderItem();
                    updateOrderItem.setId(item.getOOrderItemId().toString());
                    updateOrderItem.setShipStatus(2);
                    orderItemMapper.updateById(updateOrderItem);
                }
            }
        }

        // 更新订单库主表发货状态（部分发货、全部发货）
        if(waybillStatus==3) {
            // 发货就更新发货表
            // 未发货数量(未退款）
            long count = orderItemMapper.selectList(
                    new LambdaQueryWrapper<OOrderItem>()
                            .eq(OOrderItem::getOrderId, shipOrder.getOOrderId())
                            .eq(OOrderItem::getRefundStatus,1)
                            .ne(OOrderItem::getShipStatus, 2)

            ).stream().count();
            if(count==0){
                // 说明订单全部发货了
                OOrder orderUpdate = new OOrder();
                orderUpdate.setId(oOrder.getId());
                orderUpdate.setShipStatus(2);
                oOrderService.updateById(orderUpdate);
            }else{
                // 说明订单部分发货了
                OOrder orderUpdate = new OOrder();
                orderUpdate.setId(oOrder.getId());
                orderUpdate.setShipStatus(1);
                oOrderService.updateById(orderUpdate);
            }

        }
        log.info("====保存電子面單信息========" + supplierShipOrder.getOrderNum());

        return ResultVo.success();
    }

    /**
     * 更新发货状态
     * @param supplierShipOrderId
     * @return
     */
    @Transactional
    @Override
    public ResultVo<Long> updateSendStatus(Long supplierShipOrderId) {

        if (supplierShipOrderId == null) return ResultVo.error("缺少ID");
        OSupplierShipOrder shipOrder = supplierShipOrderMapper.selectById(supplierShipOrderId);
        if (shipOrder == null) return ResultVo.error("没有找到数据");
        OOrder oOrder = oOrderService.getById(shipOrder.getOOrderId());
        if (oOrder == null) {
            log.info("=========取号发货没有找到订单库订单信息======" + JSONObject.toJSONString(shipOrder));
            return ResultVo.error("没有找到订单库订单信息");
        }else if(oOrder.getOrderStatus().intValue()!=2&&oOrder.getOrderStatus().intValue()!=3&&oOrder.getOrderStatus().intValue()!=101){
            log.info("平台订单状态不是已发货状态，不允许更新"+oOrder.getOrderNum());
            return ResultVo.error("平台订单状态不是已发货状态，不允许更新");
        }
        if(shipOrder.getSendStatus()==1) {
            // 更新 发货主表
            OSupplierShipOrder supplierShipOrderUpdate = new OSupplierShipOrder();
            supplierShipOrderUpdate.setId(supplierShipOrderId);
            supplierShipOrderUpdate.setShippingCompany(shipOrder.getWaybillCompany());
            supplierShipOrderUpdate.setShippingNumber(shipOrder.getWaybillCode());
            supplierShipOrderUpdate.setShippingTime(new Date());
            supplierShipOrderUpdate.setSendStatus(2);
            supplierShipOrderUpdate.setUpdateTime(new Date());
            supplierShipOrderUpdate.setUpdateBy("用户发货");
            supplierShipOrderMapper.updateById(supplierShipOrderUpdate);
        }
        // 更新子表数据（分配给供应商的订单不允许再拆单或者合单）
        List<OSupplierShipOrderItem> shipOrderItemList = supplierShipOrderItemMapper.selectList(
                new LambdaQueryWrapper<OSupplierShipOrderItem>()
                        .eq(OSupplierShipOrderItem::getShipOrderId, supplierShipOrderId));
        if (!shipOrderItemList.isEmpty()) {
            for (var item : shipOrderItemList) {
                if(item.getSendStatus()==1) {
                    OSupplierShipOrderItem shipOrderItem = new OSupplierShipOrderItem();
                    shipOrderItem.setWaybillCode(shipOrder.getWaybillCode());
                    shipOrderItem.setWaybillStatus(3);
                    shipOrderItem.setSendStatus(2);
                    shipOrderItem.setUpdateBy("用户取号");
                    shipOrderItem.setUpdateTime(new Date());
                    shipOrderItem.setId(item.getId());
                    supplierShipOrderItemMapper.updateById(shipOrderItem);
                    // 更新订单明细o_order_item
                    OOrderItem updateOrderItem = new OOrderItem();
                    updateOrderItem.setId(item.getOOrderItemId().toString());
                    updateOrderItem.setShipStatus(2);
                    orderItemMapper.updateById(updateOrderItem);
                }
            }
        }

        // 更新订单库主表发货状态（部分发货、全部发货）

        // 发货就更新发货表
        // 未发货数量(未退款）
        if(oOrder.getShipStatus()==0||oOrder.getShipStatus()==1) {
            long count = orderItemMapper.selectList(
                    new LambdaQueryWrapper<OOrderItem>()
                            .eq(OOrderItem::getOrderId, shipOrder.getOOrderId())
                            .eq(OOrderItem::getRefundStatus, 1)
                            .ne(OOrderItem::getShipStatus, 2)

            ).stream().count();
            if (count == 0) {
                // 说明订单全部发货了
                OOrder orderUpdate = new OOrder();
                orderUpdate.setId(oOrder.getId());
                orderUpdate.setShipStatus(2);
                oOrderService.updateById(orderUpdate);
            } else {
                // 说明订单部分发货了
                OOrder orderUpdate = new OOrder();
                orderUpdate.setId(oOrder.getId());
                orderUpdate.setShipStatus(1);
                oOrderService.updateById(orderUpdate);
            }

        }
        log.info("====更新发货状态========" +shipOrder.getOrderNum());

        return ResultVo.success();
    }

}




