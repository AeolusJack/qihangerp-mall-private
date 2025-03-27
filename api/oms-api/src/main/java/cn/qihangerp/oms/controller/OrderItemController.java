package cn.qihangerp.oms.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.TableDataInfo;

import cn.qihangerp.module.order.domain.OOrderItem;
import cn.qihangerp.module.order.domain.bo.OrderItemListBo;
import cn.qihangerp.module.order.domain.bo.OrderItemSkuIdUpdateBo;
import cn.qihangerp.module.order.domain.bo.OrderItemSpecIdUpdateBo;
import cn.qihangerp.module.order.domain.vo.OrderItemListVo;
import cn.qihangerp.module.order.service.OOrderItemService;
import cn.qihangerp.module.order.service.OOrderService;
import cn.qihangerp.security.common.BaseController;
import cn.qihangerp.utils.poi.ExcelUtil;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import jakarta.servlet.http.HttpServletResponse;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 店铺订单Controller
 *
 * @author qihang
 * @date 2023-12-31
 */
@AllArgsConstructor
@RestController
@RequestMapping("/order")
public class OrderItemController extends BaseController
{
    private final OOrderItemService itemService;
    private final OOrderService orderService;

    /**
     * 查询店铺订单列表
     */
    @GetMapping("/item_list")
    public TableDataInfo list(OrderItemListBo bo, PageQuery pageQuery)
    {
        var pageList = itemService.selectPageVo(pageQuery,bo);
        return getDataTable(pageList);
    }

    @PostMapping("/item/export")
    public void export(HttpServletResponse response, OrderItemListBo bo)
    {
        List<OrderItemListVo> list = itemService.selectExportListVo(bo);
        for(var it:list){
            JSONArray spec = JSONArray.parse(it.getGoodsSpec());
            String skuName = "";
            for(int i=0;i<spec.size();i++){
                String s = spec.getJSONObject(i).getString("attr_value");
                if(!org.springframework.util.StringUtils.hasText(s)||s.equals("null")) {
                    s = spec.getJSONObject(i).getString("value");
                }
                skuName +=s +" ";
            }
            it.setSkuName(skuName);
            if(it.getRefundStatus().intValue()==1){
                it.setRefundStatusStr("无售后或售后关闭");
            }else if(it.getRefundStatus().intValue()==2){
                it.setRefundStatusStr("售后处理中");
            }else if(it.getRefundStatus().intValue()==3){
                it.setRefundStatusStr("退款中");
            }else if(it.getRefundStatus().intValue()==4){
                it.setRefundStatusStr("退款成功");
            }
            if(it.getShipStatus()==0){
                it.setShipStatusStr("未处理");
            }else if(it.getShipStatus()==1){
                it.setShipStatusStr("已分配给供应商");
            }else if(it.getShipStatus()==2){
                it.setShipStatusStr("已发货");
            }

        }
        ExcelUtil<OrderItemListVo> util = new ExcelUtil<OrderItemListVo>(OrderItemListVo.class);
        util.exportExcel(response, list, "订单明细");
    }

    /**
     * 修改订单明细specId
     * @param bo
     * @return
     */
//    @PostMapping("/order_item_spec_id_update")
//    public AjaxResult orderItemSpecIdUpdate(@RequestBody OrderItemSpecIdUpdateBo bo)
//    {
//        if(bo.getOrderItemId()==null || bo.getOrderItemId() ==0) return AjaxResult.error("参数错误：orderItemId为空");
//        if(bo.getErpGoodsSpecId()==null || bo.getErpGoodsSpecId() ==0) return AjaxResult.error("参数错误：ErpGoodsSpecId为空");
//
//        int result = itemService.orderItemSpecIdUpdate(bo);
//        if(result == -1) return AjaxResult.error("参数错误：orderItemId错误");
//        else if(result == -2) return AjaxResult.error("参数错误：找不到ErpGoodsSpec");
//
//        return toAjax(1);
//    }

    /**
     * 更新erp sku id
     * @param orderItem
     * @return
     */
    @PostMapping("/updateErpSkuId")
    public AjaxResult ship(@RequestBody OrderItemSkuIdUpdateBo orderItem)
    {
        if(orderItem.getId()==null || StringUtils.isEmpty(orderItem.getSkuCode())){
            return AjaxResult.error("确少必要参数");
        }
        var result = itemService.updateErpSkuId(orderItem.getId(), orderItem.getSkuCode());
        if(result.getCode()==0)
            return AjaxResult.success();
        else  return AjaxResult.error(result.getMsg());
    }
}
