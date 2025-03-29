package cn.qihangerp.module.mall.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName mall_goods_detail
 */
@TableName(value ="mall_goods_detail")
@Data
public class MallGoodsDetail implements Serializable {
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
    private String pcDetail;

    /**
     * 
     */
    private String mDetail;

    /**
     * 
     */
    private Integer modifyOn;

    /**
     * 
     */
    private String modifyBy;

    /**
     * 
     */
    private String attributeText;

    /**
     * 
     */
    private String specText;

    /**
     * 
     */
    private String detailText;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}