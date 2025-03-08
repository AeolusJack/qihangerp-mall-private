package cn.qihangerp.request;

import lombok.Data;

@Data
public class TaoOrderShipBo {
    private String tid;
    private Long shopId;
    private String waybillCode;
    private String waybillCompany;
}
