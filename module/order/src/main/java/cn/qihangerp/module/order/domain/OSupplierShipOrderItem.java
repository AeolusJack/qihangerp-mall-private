package cn.qihangerp.module.order.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * @TableName o_supplier_ship_order_item
 */
@TableName(value ="o_supplier_ship_order_item")
@Data
public class OSupplierShipOrderItem implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 供应商发货订单id
     */
    private Long shipOrderId;

    /**
     * 订单号
     */
    private String orderNum;
    //子订单号
    private String subOrderNum;

    /**
     * o_order_id
     */
    private Long oOrderId;

    private Long oOrderItemId;

    /**
     * 供应商id
     */
    private Long supplierId;

    /**
     * 第三方平台skuId
     */
    private String skuId;
    /**
     * 第三方平台skuId
     */
    private String productId;

    /**
     * 商品id(o_goods外键)
     */
    private Long goodsId;

    /**
     * 商品skuid(o_goods_sku外键)
     */
    private Long goodsSkuId;

    /**
     * 商品标题
     */
    private String goodsName;

    /**
     * 商品图片
     */
    private String goodsImg;

    /**
     * 商品编码
     */
    private String goodsNum;

    /**
     * 商品规格
     */
    private String skuName;

    /**
     * 商品规格编码
     */
    private String skuCode;

    /**
     * 商品数量
     */
    private Integer quantity;

    /**
     * 备注
     */
    private String remark;

    /**
     * 发货状态1：待发货，2：已发货，
     */
    private Integer sendStatus;

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
    private String waybillCode;
    private Integer waybillStatus;
    private Integer refundStatus;
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}