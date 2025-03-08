package cn.qihangerp.module.order.domain.bo;

import lombok.Data;

@Data
public class OrderItemSpecIdUpdateBo {
    private Long orderItemId;
    private Long erpGoodsSpecId;
}
