package cn.qihangerp.module.mall.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 商品属性表
 * @TableName mall_goods_attribute
 */
@TableName(value ="mall_goods_attribute")
@Data
public class MallGoodsAttribute implements Serializable {
    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 
     */
    private Long goodsId;

    /**
     * 属性id
     */
    private Long attributeId;

    /**
     * 
     */
    private String attribute;

    /**
     * 属性值id
     */
    private Long valueId;

    /**
     * 
     */
    private String value;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}