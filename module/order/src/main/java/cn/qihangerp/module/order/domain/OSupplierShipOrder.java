package cn.qihangerp.module.order.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 供应商发货订单
 * @TableName o_supplier_ship_order
 */
@TableName(value ="o_supplier_ship_order")
@Data
public class OSupplierShipOrder implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 供应商id
     */
    private Long supplierId;

    /**
     * 关联订单id
     */
    private Long oOrderId;

    /**
     * 订单编号（第三方平台订单号）
     */
    private String orderNum;

    /**
     * 订单下单时间
     */
    private Date orderTime;

    /**
     * 店铺类型
     */
    private Long shopType;

    /**
     * 店铺ID
     */
    private Long shopId;

    /**
     * 订单备注
     */
    private String remark;

    /**
     * 买家留言信息
     */
    private String buyerMemo;

    /**
     * 卖家留言信息
     */
    private String sellerMemo;

    /**
     * 发货状态1：待发货，2：已发货，
     */
    private Integer sendStatus;

    /**
     * 发货时间
     */
    private Date shippingTime;

    /**
     * 快递单号
     */
    private String shippingNumber;

    /**
     * 物流公司
     */
    private String shippingCompany;

    /**
     * 发货人
     */
    private String shippingMan;

    /**
     * 发货费用
     */
    private BigDecimal shippingCost;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 更新人
     */
    private String updateBy;

    /**
     * 省
     */
    private String province;

    /**
     * 市
     */
    private String city;
    private String waybillCode;
    private Integer waybillStatus;
    private String waybillCompany;
    private Integer orderStatus;

    /**
     * 打印数据
     */
    @TableField(exist = false)
    private String printData;

    /**
     * 电子面单订单id(仅视频号)
     */
    @TableField(exist = false)
    private String waybillOrderId;
    /**
     * 区
     */
    private String town;
    @TableField(exist = false)
    private List<OSupplierShipOrderItem> itemList;
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}