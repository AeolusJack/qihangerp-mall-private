package cn.qihangerp.request;

import lombok.Data;

@Data
public class OrderSearchRequest {
    private Integer shopId;
    private Integer platformId;
    private String orderNum;
    private Integer orderStatus;
    private Integer refundStatus;
    private String startTime;
    private String endTime;
    private Integer shipStatus;
    private String receiverName;
    private String receiverMobile;
    private String shippingNumber;
}
