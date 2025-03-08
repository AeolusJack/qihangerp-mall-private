package cn.qihangerp.module.mall.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.List;

import lombok.Data;

/**
 * 商城推荐分类展示
 * @TableName mall_rec_category
 */
@TableName(value ="mall_rec_category")
@Data
public class MallRecCategory implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 
     */
    private String name;

    /**
     * 
     */
    private String picture;

    /**
     * 
     */
    private Long parentId;

    /**
     * 
     */
    private String saleInfo;
    @TableField(exist = false)
    private List<MallRecCategory> children;

    @TableField(exist = false)
    private List<MallRecGoods> goods;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}