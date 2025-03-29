package cn.qihangerp.module.mall.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import lombok.Data;

/**
 * 商城商品SKU表
 * @TableName mall_goods_sku
 */
@TableName(value ="mall_goods_sku")
@Data
public class MallGoodsSku implements Serializable {
    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 外键
     */
    private Long goodsId;

    /**
     * 商品库商品id
     */
    private String oGoodsId;

    /**
     * 商品库skuId
     */
    private String oGoodsSkuId;

    /**
     * 规格名
     */
    private String skuName;

    /**
     * 规格编码
     */
    private String skuCode;

    /**
     * 颜色id
     */
    private Long colorId;

    /**
     * 颜色值
     */
    private String colorValue;

    /**
     * 颜色图片
     */
    private String colorImage;

    /**
     * 尺码id
     */
    private Long sizeId;

    /**
     * 尺码值(材质)
     */
    private String sizeValue;

    /**
     * 款式id
     */
    private Long styleId;

    /**
     * 款式值
     */
    private String styleValue;

    /**
     * 售价
     */
    private BigDecimal price;

    /**
     * 划线价
     */
    private BigDecimal linePrice;

    /**
     * 备注
     */
    private String remark;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 库存数量
     */
    private Integer qty;

    /**
     * 最低购买数量
     */
    private Integer minQty;

    /**
     * 商品体积
     */
    private String volume;

    /**
     * 衣长
     */
    private Double length;

    /**
     * 高度
     */
    private Double height;

    /**
     * 宽度
     */
    private Double width;

    /**
     * 重量
     */
    private Double weight;

    /**
     * 创建时间
     */
    private Long createOn;

    /**
     * '创建人'
     */
    private String createBy;

    /**
     * 最后修改时间
     */
    private Integer modifyOn;

    /**
     * '最后修改人'
     */
    private String modifyBy;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}