package cn.qihangerp.module.order.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.mq.MqMessage;
import cn.qihangerp.common.mq.MqType;
import cn.qihangerp.domain.OGoodsSku;
import cn.qihangerp.module.goods.domain.OGoods;
import cn.qihangerp.module.goods.service.OGoodsService;
import cn.qihangerp.module.goods.service.OGoodsSkuService;
import cn.qihangerp.module.order.domain.*;
import cn.qihangerp.module.order.domain.bo.OfflineOrderShipBo;
import cn.qihangerp.module.order.domain.bo.SupplierOrderShipBo;
import cn.qihangerp.module.order.domain.vo.DistributeSupplierShipResult;
import cn.qihangerp.module.order.mapper.*;
import cn.qihangerp.module.order.service.OOrderItemService;
import cn.qihangerp.module.order.service.OOrderService;
import cn.qihangerp.module.order.service.OSupplierShipOrderItemService;

import cn.qihangerp.request.SupplierShipOrderSearchRequest;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.module.order.service.OSupplierShipOrderService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

/**
* @author qilip
* @description 针对表【o_supplier_ship_order(供应商发货订单)】的数据库操作Service实现
* @createDate 2025-02-18 11:56:14
*/
@AllArgsConstructor
@Service
public class OSupplierShipOrderServiceImpl extends ServiceImpl<OSupplierShipOrderMapper, OSupplierShipOrder>
    implements OSupplierShipOrderService{
    private final OOrderItemService orderItemService;
    private final OOrderService orderService;
    private final OGoodsSkuService goodsSkuService;
    private final OGoodsService goodsService;
    private final OSupplierShipOrderMapper shipOrderMapper;
    private final OSupplierShipOrderItemService shipOrderItemService;
    private final OShipmentMapper shipmentMapper;
    private final OShipmentItemMapper shipmentItemMapper;

    private final String DATE_PATTERN =
            "^(?:(?:(?:\\d{4}-(?:0?[1-9]|1[0-2])-(?:0?[1-9]|1\\d|2[0-8]))|(?:(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26])|(?:(?:0[48]|[2468][048]|[13579][26])00))-0?2-29))$)|(?:(?:(?:\\d{4}-(?:0?[13578]|1[02]))-(?:0?[1-9]|[12]\\d|30))$)|(?:(?:(?:\\d{4}-0?[13-9]|1[0-2])-(?:0?[1-9]|[1-2]\\d|30))$)|(?:(?:(?:\\d{2}(?:0[48]|[13579][26]|[2468][048])|(?:(?:0[48]|[13579][26]|[2468][048])00))-0?2-29))$)$";
    private final Pattern DATE_FORMAT = Pattern.compile(DATE_PATTERN);
    @Transactional
    @Override
    public ResultVo<DistributeSupplierShipResult> distributeSupplierShip(String[] orderItemIds) {
        DistributeSupplierShipResult result = new DistributeSupplierShipResult();
        // 逐一处理订单item
        // 查出所有orderItem
        List<OOrderItem> oOrderItems = orderItemService.listByIds(Arrays.stream(orderItemIds).toList());
        if(oOrderItems.isEmpty()) return ResultVo.error("没有找到订单item数据");

        int fail = 0;
        int success = 0;
        int exist = 0;
        // 组合供应商发货的orderItem
        List<OSupplierShipOrderItem> shipOrderItemAllList = new ArrayList<>();

        for(OOrderItem item:oOrderItems) {
            // 查出商品所对应的供应商
            OGoodsSku goodsSku = goodsSkuService.getById(item.getGoodsSkuId());
            if (goodsSku != null) {
                OGoods goods = goodsService.getById(goodsSku.getGoodsId());
                if (goods != null && goods.getSupplierId() != null && goods.getSupplierId() > 0) {
                    OSupplierShipOrderItem shipOrderItem = new OSupplierShipOrderItem();
                    shipOrderItem.setOOrderId(Long.parseLong(item.getOrderId()));
                    shipOrderItem.setOOrderItemId(Long.parseLong(item.getId()));
                    shipOrderItem.setOrderNum(item.getOrderNum());
                    shipOrderItem.setSubOrderNum(item.getSubOrderNum());
                    shipOrderItem.setSupplierId(goods.getSupplierId());
                    shipOrderItem.setSkuId(item.getSkuId());
                    shipOrderItem.setProductId(item.getProductId());
                    shipOrderItem.setGoodsId(item.getGoodsId());
                    shipOrderItem.setGoodsSkuId(Long.parseLong(item.getGoodsSkuId()));
                    shipOrderItem.setRefundStatus(item.getRefundStatus());
                    shipOrderItem.setGoodsName(item.getGoodsTitle());
                    shipOrderItem.setGoodsNum(item.getGoodsNum());
                    shipOrderItem.setGoodsImg(item.getGoodsImg());
                    shipOrderItem.setSkuName(item.getGoodsSpec());
                    shipOrderItem.setSkuCode(item.getSkuNum());
                    shipOrderItem.setSendStatus(1);
                    shipOrderItem.setCreateTime(new Date());

                    if (item.getRefundCount() == null) item.setRefundCount(0);
                    shipOrderItem.setQuantity(item.getQuantity() - item.getRefundCount());
                    shipOrderItemAllList.add(shipOrderItem);
                } else {
                    fail++;
                }
            } else {
                fail++;
            }

        }
        // 先分组，看看有没有相同订单号和店铺的orderItem数据
        Map<Pair<Long, Long>, List<OSupplierShipOrderItem>> grouped = shipOrderItemAllList.stream()
                .collect(Collectors.groupingBy(item -> Pair.of(item.getSupplierId(), item.getOOrderId())));

        // 需要添加的所有shipOrderItem
        List<OSupplierShipOrderItem> shipOrderItemAddList = new ArrayList<>();
        List<OSupplierShipOrderItem> shipOrderItemUpdateList = new ArrayList<>();
        // 更新状态的oOrderItem
        List<OOrderItem> updateItemList = new ArrayList<>();
        // 输出分组结果
        for (Map.Entry<Pair<Long, Long>, List<OSupplierShipOrderItem>> entry : grouped.entrySet()) {
            Pair<Long, Long> key = entry.getKey();
//            System.out.println("SupplierId: " + key.getLeft() + ", OOrderId: " + key.getRight());
            OOrder oOrder = orderService.getById(key.getRight());
            // 分组后的订单
            OSupplierShipOrder shipOrder = new OSupplierShipOrder();
            List<OSupplierShipOrder> oSupplierShipOrders = shipOrderMapper.selectList(
                    new LambdaQueryWrapper<OSupplierShipOrder>()
                            .eq(OSupplierShipOrder::getOOrderId, key.getRight())
                            .eq(OSupplierShipOrder::getSupplierId,key.getLeft())
            );
            if (oSupplierShipOrders.isEmpty()) {

                if (oOrder != null) {
                    shipOrder.setOOrderId(Long.parseLong(oOrder.getId()));
                    shipOrder.setSupplierId(key.getLeft());
                    shipOrder.setOrderNum(oOrder.getOrderNum());
                    shipOrder.setOrderTime(oOrder.getOrderTime());
                    shipOrder.setShopType(oOrder.getShopType().longValue());
                    shipOrder.setShopId(oOrder.getShopId());
                    shipOrder.setRemark(oOrder.getRemark());
                    shipOrder.setBuyerMemo(oOrder.getBuyerMemo());
                    shipOrder.setSellerMemo(oOrder.getSellerMemo());
                    shipOrder.setSendStatus(1);
                    shipOrder.setCreateTime(new Date());
                    shipOrder.setProvince(oOrder.getProvince());
                    shipOrder.setCity(oOrder.getCity());
                    shipOrder.setTown(oOrder.getTown());
                    shipOrder.setOrderStatus(oOrder.getOrderStatus());
                    shipOrderMapper.insert(shipOrder);

                    for (OSupplierShipOrderItem item : entry.getValue()) {
                        item.setShipOrderId(shipOrder.getId());
                        shipOrderItemAddList.add(item);

                        OOrderItem up = new OOrderItem();
                        up.setId(item.getOOrderItemId().toString());
                        up.setShipSupplier(shipOrder.getSupplierId());
                        up.setShipType(1);
                        up.setShipStatus(1);
                        up.setUpdateTime(new Date());
                        updateItemList.add(up);
                        success++;
                    }
                } else {
                    fail += entry.getValue().size();
                }
            }else {
                if (oOrder != null) {
                    // 更新发货主表状态
                    shipOrder.setOrderStatus(oOrder.getOrderStatus());
                    shipOrder.setId(oSupplierShipOrders.get(0).getId());
                    shipOrderMapper.updateById(shipOrder);
                    //

                    // 更新发货子表状态
                    for (OSupplierShipOrderItem item : entry.getValue()) {

                        List<OSupplierShipOrderItem> oSupplierShipOrderItems = shipOrderItemService.list(new LambdaQueryWrapper<OSupplierShipOrderItem>().eq(OSupplierShipOrderItem::getOOrderItemId, item.getOOrderItemId()));
                        if(oSupplierShipOrderItems.isEmpty()){
                            // 新增
                            item.setShipOrderId(shipOrder.getId());
                            shipOrderItemAddList.add(item);
                        }else {
                            item.setId(oSupplierShipOrderItems.get(0).getId());
                            item.setShipOrderId(shipOrder.getId());
                            shipOrderItemUpdateList.add(item);
                            // 更新订单库子表
                            OOrderItem up = new OOrderItem();
                            up.setId(item.getOOrderItemId().toString());
                            up.setShipSupplier(shipOrder.getSupplierId());
                            up.setShipType(1);
                            up.setShipStatus(1);
                            up.setUpdateTime(new Date());
                            updateItemList.add(up);
                        }
                    }
                    exist += entry.getValue().size();
                }else {
                    fail+=entry.getValue().size();
                }

            }
        }

        // 批量插入shipOrderItem
        shipOrderItemService.saveBatch(shipOrderItemAddList);
        // 批量更新shipOrderItem
        shipOrderItemService.updateBatchById(shipOrderItemUpdateList);
        // 更新oOrderItem状态
        orderItemService.updateBatchById(updateItemList);
        // 更新订单库主表状态
        for(var oitem:updateItemList){
            // 查出没有被分配，并且没有退款的订单明细数量
            OOrderItem byId = orderItemService.getById(oitem.getId());
            if(byId!=null) {
                long count = orderItemService.list(new LambdaQueryWrapper<OOrderItem>()
                        .eq(OOrderItem::getOrderId, byId.getOrderId())
                        .eq(OOrderItem::getRefundStatus, 1)
                        .eq(OOrderItem::getShipStatus, 0)
                ).stream().count();
                if (count == 0) {
                    // 表示全部分配了
                    OOrder updateOrder = new OOrder();
                    updateOrder.setId(byId.getOrderId());
                    updateOrder.setDistStatus(2);
                    orderService.updateById(updateOrder);
                } else {
                    // 表示部分分配了
                    OOrder updateOrder = new OOrder();
                    updateOrder.setId(byId.getOrderId());
                    updateOrder.setDistStatus(1);
                    orderService.updateById(updateOrder);
                }
            }
        }

        // 更新oOrder状态
//        for(var item:updateItemList){
//            List<OOrderItem> collect = oOrderItems.stream().filter(x -> x.getId().equals(item.getId())).collect(Collectors.toList());
//            if(!collect.isEmpty() && collect.get(0).getRefundStatus()==1){
//                // 查询 同订单下的所有未退款和未分配的item
//                List<OOrderItem> waitDistList = orderItemService.list(new LambdaQueryWrapper<OOrderItem>()
//                        .eq(OOrderItem::getOrderId, collect.get(0).getOrderId())
//                        .eq(OOrderItem::getRefundStatus, 1)
//                        .eq(OOrderItem::getShipType, 0)
//                        .select(OOrderItem::getId)
//                );
//                if(waitDistList.isEmpty()){
//                    // 全部分配完成
//                    OOrder orderUpdate = new OOrder();
//                    orderUpdate.setId(collect.get(0).getOrderId());
////                    orderUpdate.setShipType(1);
//                    orderUpdate.setShipStatus(1);
//                    orderUpdate.setUpdateTime(new Date());
//                    orderUpdate.setUpdateBy("分配给供应商发货");
//                    orderService.updateById(orderUpdate);
//                }
//            }
//
//
//        }


        result.setTotal(orderItemIds.length);
        result.setSuccess(success);
        result.setFail(fail);
        result.setExist(exist);
        return ResultVo.success(result);
    }

    @Override
    public PageResult<OSupplierShipOrder> queryPageList(SupplierShipOrderSearchRequest bo, PageQuery pageQuery) {
        if(StringUtils.hasText(bo.getStartTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getStartTime());
            boolean b = matcher.find();
            if(b){
                bo.setStartTime(bo.getStartTime()+" 00:00:00");
            }
        }
        if(StringUtils.hasText(bo.getEndTime())){
            Matcher matcher = DATE_FORMAT.matcher(bo.getEndTime());
            boolean b = matcher.find();
            if(b){
                bo.setEndTime(bo.getEndTime()+" 23:59:59");
            }
        }
//        if(bo.getOrderStatus()==null) bo.setOrderStatus(1);

        LambdaQueryWrapper<OSupplierShipOrder> queryWrapper = new LambdaQueryWrapper<OSupplierShipOrder>()
                .eq(bo.getSupplierId()!=null,OSupplierShipOrder::getSupplierId,bo.getSupplierId())
                .eq(bo.getShopId()!=null,OSupplierShipOrder::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getOrderNum()),OSupplierShipOrder::getOrderNum,bo.getOrderNum())
                .eq(bo.getSendStatus()!=null,OSupplierShipOrder::getSendStatus,bo.getSendStatus())
                .eq(bo.getWaybillStatus()!=null,OSupplierShipOrder::getWaybillStatus,bo.getWaybillStatus())
                .eq(bo.getPlatformId()!=null,OSupplierShipOrder::getShopType,bo.getPlatformId())
                .ge(StringUtils.hasText(bo.getStartTime()),OSupplierShipOrder::getOrderTime,bo.getStartTime())
                .le(StringUtils.hasText(bo.getEndTime()),OSupplierShipOrder::getOrderTime,bo.getEndTime())
                .eq(bo.getOrderStatus()!=null,OSupplierShipOrder::getOrderStatus,bo.getOrderStatus());

        pageQuery.setOrderByColumn("order_time");
        pageQuery.setIsAsc("desc");
        Page<OSupplierShipOrder> pages = shipOrderMapper.selectPage(pageQuery.build(), queryWrapper);

        // 查询子订单
        if(pages.getRecords()!=null){
            for (var order:pages.getRecords()) {
                order.setItemList(shipOrderItemService.list(new LambdaQueryWrapper<OSupplierShipOrderItem>().eq(OSupplierShipOrderItem::getShipOrderId, order.getId())));
            }
        }

        return PageResult.build(pages);
    }

//    @Override
//    public PageResult<OSupplierShipOrder> queryStockUpPageList(String orderNum, Long supplierId, PageQuery pageQuery) {
//
//
//        LambdaQueryWrapper<OSupplierShipOrder> queryWrapper = new LambdaQueryWrapper<OSupplierShipOrder>()
//                .eq(OSupplierShipOrder::getSupplierId,supplierId)
//                .eq(StringUtils.hasText(orderNum),OSupplierShipOrder::getOrderNum,orderNum)
//                .eq(OSupplierShipOrder::getSendStatus,1)
//                .gt(OSupplierShipOrder::getWaybillStatus,0);
//
//        pageQuery.setOrderByColumn("order_time");
//        pageQuery.setIsAsc("desc");
//        Page<OSupplierShipOrder> pages = shipOrderMapper.selectPage(pageQuery.build(), queryWrapper);
//
//        // 查询子订单
//        if(pages.getRecords()!=null){
//            for (var order:pages.getRecords()) {
//                order.setItemList(shipOrderItemService.list(new LambdaQueryWrapper<OSupplierShipOrderItem>().eq(OSupplierShipOrderItem::getShipOrderId, order.getId())));
//            }
//        }
//
//        return PageResult.build(pages);
//    }
    @Override
    public PageResult<OSupplierShipOrder> queryStockUpPageList(SupplierShipOrderSearchRequest request, PageQuery pageQuery) {


        LambdaQueryWrapper<OSupplierShipOrder> queryWrapper = new LambdaQueryWrapper<OSupplierShipOrder>()
                .eq(request.getShopId()!=null,OSupplierShipOrder::getShopId,request.getShopId())
                .eq(request.getSupplierId()!=null,OSupplierShipOrder::getSupplierId,request.getSupplierId())
                .eq(StringUtils.hasText(request.getOrderNum()),OSupplierShipOrder::getOrderNum,request.getOrderNum())
                .eq(request.getSendStatus()!=null,OSupplierShipOrder::getSendStatus,request.getSendStatus())
                .eq(request.getWaybillStatus()!=null,OSupplierShipOrder::getWaybillStatus,request.getWaybillStatus())
                .eq(OSupplierShipOrder::getOrderStatus,1);

        pageQuery.setOrderByColumn("order_time");
        pageQuery.setIsAsc("desc");
        Page<OSupplierShipOrder> pages = shipOrderMapper.selectPage(pageQuery.build(), queryWrapper);

        // 查询子订单
        if(pages.getRecords()!=null){
            for (var order:pages.getRecords()) {
                order.setItemList(shipOrderItemService.list(new LambdaQueryWrapper<OSupplierShipOrderItem>().eq(OSupplierShipOrderItem::getShipOrderId, order.getId())));
            }
        }

        return PageResult.build(pages);
    }
    @Override
    public OSupplierShipOrder queryDetailById(Long id) {
        OSupplierShipOrder shipOrder = shipOrderMapper.selectById(id);
        if(shipOrder!=null){
            shipOrder.setItemList(shipOrderItemService.list(new LambdaQueryWrapper<OSupplierShipOrderItem>().eq(OSupplierShipOrderItem::getShipOrderId, shipOrder.getId())));
        }
        return shipOrder;
    }

    @Override
    public List<OSupplierShipOrderItem> getItemsByOrderId(Long shipOrderId) {
        List<OSupplierShipOrderItem> list = shipOrderItemService.list(
                new LambdaQueryWrapper<OSupplierShipOrderItem>()
                        .eq(OSupplierShipOrderItem::getShipOrderId, shipOrderId)
                        .eq(OSupplierShipOrderItem::getRefundStatus,1)
        );
        return list;
    }
    @Transactional
    @Override
    public ResultVo<Integer>  orderLogistics(SupplierOrderShipBo bo, String operator) {
        if(bo.getId()==null) return ResultVo.error("缺少参数：Id");
        if(!StringUtils.hasText(bo.getLogisticsCompany()) || !StringUtils.hasText(bo.getLogisticsCode()))
            return ResultVo.error("缺少参数：快递信息");

        OSupplierShipOrder shipOrder = shipOrderMapper.selectById(bo.getId());
        if (shipOrder == null) return ResultVo.error("找不到数据");
        if(shipOrder.getSendStatus().intValue() !=1) return ResultVo.error("已发货或已取消不能再发货");

        // 更新供应商订单状态
        OSupplierShipOrder oSupplierShipOrder = new OSupplierShipOrder();
        oSupplierShipOrder.setSendStatus(2);
        oSupplierShipOrder.setWaybillCompany(bo.getLogisticsCompany());
        oSupplierShipOrder.setWaybillCode(bo.getLogisticsCode());
        oSupplierShipOrder.setUpdateTime(new Date());
        oSupplierShipOrder.setUpdateBy("供应商手动发货");
        oSupplierShipOrder.setId(shipOrder.getId());
        shipOrderMapper.updateById(oSupplierShipOrder);

        // 添加发货记录
        List<OShipmentItem> shippingItemList = new ArrayList<>();
        List<String> subOrderNums = new ArrayList<>();
        // 自订单
        List<OSupplierShipOrderItem> shipOrderItemList = shipOrderItemService.list(
                new LambdaQueryWrapper<OSupplierShipOrderItem>()
                .eq(OSupplierShipOrderItem::getShipOrderId, bo.getId()));
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
                shipOrderItemService.updateById(shipOrderItem);
                // 更新订单明细o_order_item
                OOrderItem updateOrderItem =new OOrderItem();
                updateOrderItem.setId(item.getOOrderItemId().toString());
                updateOrderItem.setShipStatus(2);
                orderItemService.updateById(updateOrderItem);
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

}




