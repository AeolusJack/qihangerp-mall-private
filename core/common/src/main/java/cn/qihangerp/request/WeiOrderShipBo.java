package cn.qihangerp.request;

import lombok.Data;

import java.util.List;

@Data
public class WeiOrderShipBo {
    private String orderId;
    private Long shopId;
    private String waybillCode;
    private String waybillCompany;
    private List<WeiOrderShipProductInfo> productInfoList;
}
