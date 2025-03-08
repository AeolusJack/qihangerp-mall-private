package cn.qihangerp.request;

import lombok.Data;

@Data
public class WeiOrderShipProductInfo {
    private String product_id;
    private Integer product_cnt;
    private String sku_id;
}
