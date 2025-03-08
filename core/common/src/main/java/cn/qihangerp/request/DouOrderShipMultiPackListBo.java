package cn.qihangerp.request;

import lombok.Data;

import java.util.List;

@Data
public class DouOrderShipMultiPackListBo {
    private String logistics_code;
    private String company;
    private String company_code;
    private List<DouOrderShipMultiPackListShippedOrderInfoBo> shipped_order_info;
}
