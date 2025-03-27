//package cn.qihangerp.oms.feign;
//
//import com.alibaba.fastjson2.JSONObject;
//import org.springframework.cloud.openfeign.FeignClient;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestHeader;
//import org.springframework.web.bind.annotation.RequestParam;
//
//@FeignClient(name = "open-api")
//public interface PddApiService {
//    @GetMapping(value = "/pdd/order/get_detail")
//    JSONObject getOrderDetail(@RequestParam String sn);
//
//    @GetMapping(value = "/pdd/refund/get_detail")
//    JSONObject getRefundDetail(@RequestParam Long id);
//}
