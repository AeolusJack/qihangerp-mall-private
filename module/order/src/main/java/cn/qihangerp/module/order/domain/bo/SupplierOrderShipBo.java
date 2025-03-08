package cn.qihangerp.module.order.domain.bo;

import lombok.Data;

@Data
public class SupplierOrderShipBo {
    private Long id;
    private String logisticsCompany;
    private String logisticsCode;

}
