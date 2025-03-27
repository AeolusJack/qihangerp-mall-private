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
//public interface JdApiService {
//
//    @GetMapping(value = "/jd/order/get_detail")
//    JSONObject getOrderDetail(@RequestParam Long orderId,@RequestParam Integer vc);
//
//    @GetMapping(value = "/jd/refund/get_detail")
//    JSONObject getRefundDetail(@RequestParam Long refundId,@RequestParam Integer vc);
//}
