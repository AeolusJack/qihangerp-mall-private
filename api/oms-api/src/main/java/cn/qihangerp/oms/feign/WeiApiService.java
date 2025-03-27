//package cn.qihangerp.oms.feign;
//
//import com.alibaba.fastjson2.JSONObject;
//import org.springframework.cloud.openfeign.FeignClient;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//@FeignClient(name = "open-api")
//public interface WeiApiService {
//    @GetMapping(value = "/wei/order/get_detail")
//    JSONObject getOrderDetail(@RequestParam String orderId);
//
//    @GetMapping(value = "/wei/refund/get_detail")
//    JSONObject getRefundDetail(@RequestParam String afterSaleOrderId);
//}
