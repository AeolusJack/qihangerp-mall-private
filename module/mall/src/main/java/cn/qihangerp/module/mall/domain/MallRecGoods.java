package cn.qihangerp.module.mall.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import lombok.Data;

/**
 * 推荐商品表
 * @TableName mall_rec_goods
 */
@TableName(value ="mall_rec_goods")
@Data
public class MallRecGoods implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 
     */
    private Long goodsId;

    /**
     * 
     */
    private String goodsImage;

    /**
     * 
     */
    private String goodsName;

    /**
     * 
     */
    private BigDecimal goodsPriceMax;

    /**
     * 
     */
    private BigDecimal goodsPriceMin;

    /**
     * 
     */
    private Integer goodsSales;

    /**
     * 
     */
    private BigDecimal linePriceMax;

    /**
     * 
     */
    private BigDecimal linePriceMin;

    /**
     * 
     */
    private String sellingPoin;

    /**
     * 位置（HOME首页
     */
    private String position;

    /**
     * 展示端1：PC 2：H5
     */
    private Integer which;

    /**
     * 开始时间
     */
    private Integer startTime;

    /**
     * 结束时间
     */
    private Integer endTime;

    /**
     * 状态 1正常 0下架
     */
    private Integer status;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 创建时间
     */
    private Integer createOn;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}