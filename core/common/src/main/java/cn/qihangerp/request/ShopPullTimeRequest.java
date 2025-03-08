package cn.qihangerp.request;

import lombok.Data;

@Data
public class ShopPullTimeRequest {
    private Long id;
    private String orderStartTime;
    private String refundStartTime;
}
