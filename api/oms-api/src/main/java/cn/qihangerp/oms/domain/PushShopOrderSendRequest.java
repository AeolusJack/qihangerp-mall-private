package cn.qihangerp.oms.domain;

import lombok.Data;

@Data
public class PushShopOrderSendRequest {
    private Long shopId;
    private Long[] ids;
}
