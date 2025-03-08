package cn.qihangerp.request;

import lombok.Data;

@Data
public class SupplierShipOrderSearchRequest {

    private String orderNum;
    private Integer sendStatus;
    private Integer orderStatus;
    private String startTime;
    private String endTime;
    private Long supplierId;
    private Integer platformId;
    private Integer waybillStatus;
    private Long shopId;
}
