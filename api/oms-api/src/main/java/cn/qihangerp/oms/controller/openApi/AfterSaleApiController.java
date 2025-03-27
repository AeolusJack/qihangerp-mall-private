package cn.qihangerp.oms.controller.openApi;

import cn.qihangerp.common.annotation.BusinessType;
import cn.qihangerp.common.annotation.ErpEchoLogger;
import cn.qihangerp.common.AjaxResult;

import cn.qihangerp.module.order.service.OOrderService;
import cn.qihangerp.module.order.service.OShipmentService;
import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 发货相关API
 */
@AllArgsConstructor
@RestController
@RequestMapping("/openApi")
public class AfterSaleApiController extends BaseController {
    private final OOrderService orderService;
    private final OShipmentService shippingService;
    /**
     * 接收处理售后结果推送
     * @param bo
     * @return
     */
    @ErpEchoLogger(title = "接收处理售后结果推送",businessType = BusinessType.RECEIVE_PUSH)
    @PostMapping("/afterSale/process")
    public AjaxResult addSku(@RequestBody AfterSaleApiBo bo)
    {

        return AjaxResult.success("未实现");
    }
}
