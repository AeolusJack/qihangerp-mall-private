package cn.qihangerp.module.order.domain.vo;

import cn.qihangerp.utils.poi.Excel;
import lombok.Data;

import java.util.Date;

@Data
public class OrderItemListVo {
    private String id;
    /**
     * 订单ID（o_order外键）
     */

    private String orderId;

    /**
     * 子订单号（第三方平台）
     */
    @Excel(name = "子订单号",sort = 1)
    private String subOrderNum;
    @Excel(name = "订单号",sort = 2)
    private String orderNum;
    private Integer shopId;
    @Excel(name = "店铺",sort = 3)
    private String shopName;
    @Excel(name = "供应商",sort = 4)
    private String shipSupplierName;
    private Long shipSupplier;
//    @Excel(name = "商品图片",sort = 5)
    private String goodsImg;
    @Excel(name = "商品标题",sort = 6)
    private String goodsTitle;
    @Excel(name = "规格",sort = 7)
    private String skuName;
    private String goodsSpec;
    @Excel(name = "电商平台SKUID",sort = 8)
    private String skuId;
    private String goodsSkuId;
    private String outerErpSkuId;
    private String goodsId;
    @Excel(name = "SKU编码",sort = 9)
    private String skuNum;
    private Double goodsPrice;
    @Excel(name = "子订单金额",sort = 11)
    private Double itemAmount;
    private Double payment;
    @Excel(name = "优惠金额",sort = 12)
    private Double discountAmount;
    @Excel(name = "数量",sort = 10)
    private Integer quantity;
    private String remark;
    private Integer refundCount;

    private Integer refundStatus;
    @Excel(name = "退款状态",sort = 13)
    private String refundStatusStr;
    private Integer orderStatus;
    private Integer hasPushErp;
    private Date createTime;
    private Date orderTime;
    private int shipType;
    @Excel(name = "发货状态",sort = 14)
    private String shipStatusStr;
    private int shipStatus;

}
