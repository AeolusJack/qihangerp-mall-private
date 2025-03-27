package cn.qihangerp.module.mts.bo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class GoodsSourcePublishRequest {
    private String model;
    private Long modelId;
    private String brand;
    private Long brandId;
    private String type;
    private Long typeId;
    private String[] picList;
    private BigDecimal price;
    private Integer quantity;
    private String[] fileList;
    private String sellerContacts;
    private String sellerMobile;
    private String sellerWx;
    private String sourceContacts;
    private String sourceMobile;
    private String sourceWx;
    private String fz;
    private String pici;
    private String validityPeriod;
    private String remark;
    private Integer minQty;
}
