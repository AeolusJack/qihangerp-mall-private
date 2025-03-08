package cn.qihangerp.module.order.domain.vo;

import lombok.Data;

/**
 * 分配供应商发货结果
 */
@Data
public class DistributeSupplierShipResult {
    private int total;
    private int success;
    private int fail;
    private int exist;
}
