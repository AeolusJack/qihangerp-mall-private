package cn.qihangerp.oms.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.module.order.service.OSupplierShipOrderService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/shipping")
public class ShipDistributeController extends BaseController {
    private final OSupplierShipOrderService supplierShipOrderService;
    /**
     * 分配给供应商发货
     * @param
     * @return
     */
    @PostMapping("/supplier_ship_dist")
    public AjaxResult SupplierShipDist(@RequestBody String[] orderItemIds)
    {
        var result = supplierShipOrderService.distributeSupplierShip(orderItemIds);
        if(result.getCode() == 0) {
            String msg="总计："+result.getData().getTotal()+" 成功："+result.getData().getSuccess()+" 已存在："+result.getData().getExist()+" 失败："+result.getData().getFail();
            return AjaxResult.success(msg);
        }else{
            return AjaxResult.error("操作失败");
        }
    }


}
