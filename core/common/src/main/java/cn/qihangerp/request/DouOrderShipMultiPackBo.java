package cn.qihangerp.request;

import lombok.Data;

import java.util.List;

@Data
public class DouOrderShipMultiPackBo {
    private String orderId;
    private Long shopId;

    private List<DouOrderShipMultiPackListBo> pack_list;
}
