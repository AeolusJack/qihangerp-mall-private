package cn.qihangerp.oms.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.module.order.domain.bo.SupplierShipOrderItemListBo;
import cn.qihangerp.module.order.service.OSupplierShipOrderItemService;
import cn.qihangerp.module.order.service.OSupplierShipOrderService;
import cn.qihangerp.request.SupplierShipOrderSearchRequest;
import cn.qihangerp.utils.JwtUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 店铺订单Controller
 *
 * @author qihang
 */
@AllArgsConstructor
@RestController
@RequestMapping("/ship/order")
public class ShipOrderController extends BaseController
{
    private final OSupplierShipOrderService shipOrderService;
    private final OSupplierShipOrderItemService shipOrderItemService;


    /**
     * 查询发货订单列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SupplierShipOrderSearchRequest bo, PageQuery pageQuery, HttpServletRequest request)
    {
        var pageList = shipOrderService.queryPageList(bo,pageQuery);
        return getDataTable(pageList);
    }

    @GetMapping("/item_list")
    public TableDataInfo list(SupplierShipOrderItemListBo bo, PageQuery pageQuery, HttpServletRequest request)
    {
        var pageList = shipOrderItemService.queryPageList2(bo,pageQuery);
        return getDataTable(pageList);
    }

    /**
     * 获取店铺订单详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(shipOrderService.queryDetailById(id));
    }


//    /**
//     * 订单发货
//     * @param order
//     * @return
//     */
//    @Log(title = "店铺订单", businessType = BusinessType.UPDATE)
//    @PostMapping("/ship")
//    public AjaxResult ship(@RequestBody ErpOrder order)
//    {
//        order.setUpdateBy(getUsername());
//        int result = orderService.shipErpOrder(order);
//        if(result == -1) return new AjaxResult(501,"订单不存在！");
//        else if(result == -2) return new AjaxResult(502,"订单号已存在！");
//        return toAjax(result);
//    }

}
