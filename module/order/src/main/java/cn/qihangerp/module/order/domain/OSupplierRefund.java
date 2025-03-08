package cn.qihangerp.module.order.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 供应商售后表
 * @TableName o_supplier_refund
 */
@TableName(value ="o_supplier_refund")
@Data
public class OSupplierRefund implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 关联的售后表id
     */
    private Long oRefundId;

    /**
     * 退货单号
     */
    private String refundNum;

    /**
     * 类型(1-售前退款 10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)
     */
    private Integer refundType;

    /**
     * 订单金额
     */
    private Double orderAmount;

    /**
     * 退款金额
     */
    private Double refundFee;

    /**
     * 退款原因
     */
    private String refundReason;

    /**
     * 源订单号
     */
    private String orderNum;

    /**
     * 子订单号或id
     */
    private String orderItemNum;

    /**
     * 源skuId
     */
    private Long skuId;

    /**
     * 商品id(o_goods外键)
     */
    private Long goodsId;

    /**
     * 商品skuid(o_goods_sku外键)
     */
    private Long goodsSkuId;

    /**
     * sku编码
     */
    private String skuNum;

    /**
     * 买家是否需要退货。可选值:1(是),0(否)
     */
    private Integer hasGoodReturn;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 商品sku
     */
    private String goodsSku;

    /**
     * 商品图片
     */
    private String goodsImage;

    /**
     * 退货数量
     */
    private Long quantity;

    /**
     * 退货物流公司
     */
    private String returnLogisticsCompany;

    /**
     * 退货物流单号
     */
    private String returnLogisticsCode;

    /**
     * 收货时间
     */
    private Date receiveTime;

    /**
     * 备注
     */
    private String remark;

    /**
     * 状态（10001待审核 10002等待买家退货 10003等待平台审核 10004待买家处理 10005等待卖家处理 10006等待卖家发货 14000拒绝退款 10011退款关闭 10010退款完成 10020售后成功 10021售后失败 10090退款中 10091换货成功 10092换货失败 10093维修关闭 10094维修成功 ）
     */
    private Integer status;

    /**
     * 订单创建时间
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
     * 是否处理0未处理1已处理
     */
    private Integer hasProcessing;

    /**
     * 处理id
     */
    private String afterSaleId;

    /**
     * 供应商id
     */
    private Long supplierId;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}