//package cn.qihangerp.oms.feign;
//
//import com.alibaba.fastjson2.JSONObject;
//import org.springframework.cloud.openfeign.FeignClient;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestHeader;
//import org.springframework.web.bind.annotation.RequestParam;
//
//
//@FeignClient(name = "open-api")
//public interface TaoApiService {
//    /**
//     * 淘宝发货
//     * @param Token
//     * @return
//     */
//    @GetMapping(value = "/tao/ship/order_ship")
//    JSONObject orderShip(@RequestHeader(name = "Authorization",required = true) String Token, @RequestBody TaoOrderShipBo bo);
//
//    @GetMapping(value = "/tao/order/get_detail")
//    JSONObject getOrderDetail(@RequestParam String tid);
//
//    @GetMapping(value = "/tao/refund/get_detail")
//    JSONObject getRefundDetail(@RequestParam Long refundId);
//}
