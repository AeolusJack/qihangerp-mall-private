package cn.qihangerp.oms.controller.openApi;


import cn.qihangerp.module.order.service.OOrderService;
import cn.qihangerp.module.order.service.OShipmentService;
import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 发货相关API
 */
@AllArgsConstructor
@RestController
@RequestMapping("/openApi")
public class ShipApiController extends BaseController {
    private final OOrderService orderService;
    private final OShipmentService shippingService;
    /**
     * 接收订单发货推送
     * @param bo
     * @return
     */
//    @ErpEchoLogger(title = "接收订单发货推送",businessType = BusinessType.RECEIVE_PUSH)
//    @PostMapping("/order/shipConfirm")
//    public AjaxResult addSku(@RequestBody OrderShipBo bo)
//    {
//        if(StringUtils.isEmpty(bo.getOrderId())){
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR,"参数错误：缺失OrderId");
//        } else if(StringUtils.isEmpty(bo.getOrderNum())){
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR,"参数错误：缺失OrderNum");
//        }else if(StringUtils.isEmpty(bo.getLogisticsCompanyCode())){
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR,"参数错误：缺失LogisticsCompanyCode");
//        }else if(StringUtils.isEmpty(bo.getWaybillCode())){
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR,"参数错误：缺失waybillCode");
//        }else if(StringUtils.isEmpty(bo.getShippingTime())){
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR,"参数错误：缺失shippingTime");
//        }
//        OOrderShipping orderShipping = new OOrderShipping();
//        BeanUtils.copyProperties(bo,orderShipping);
//        try {
//            orderShipping.setShippingTime(DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", bo.getShippingTime()));
//        }catch (Exception e){
//            return AjaxResult.error(HttpStatus.PARAMS_ERROR,"参数错误：发货时间格式错误");
//        }
//        if(StringUtils.isNotEmpty(bo.getPackageTime())){
//            try {
//                orderShipping.setPackageTime(DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", bo.getPackageTime()));
//            }catch (Exception e){}
//        }
//
//        orderShipping.setCreateBy("ERP发货推送");
////        orderShipping.setCreateTime(new Date());
//        var result = shippingService.handOrderShip(orderShipping);
//        if(result.getCode() == ResultVoEnum.SUCCESS.getIndex()){
//            // TODO:推送发货信息到各自平台
//            if(result.getData() == 1){
//                // 天猫平台发货
//            }
//            return AjaxResult.success("发货成功");
//        }else{
//            return AjaxResult.error(result.getCode(),result.getMsg());
//        }
//    }
}
