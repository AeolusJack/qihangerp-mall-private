package cn.qihangerp.module.mall.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName mall_nav
 */
@TableName(value ="mall_nav")
@Data
public class MallNav implements Serializable {
    /**
     * 
     */
    @TableId
    private Long id;

    /**
     * 显示文本
     */
    private String text;

    /**
     * 图片地址
     */
    private String imgUrl;

    /**
     * 图片名称
     */
    private String imageName;

    /**
     * 链接path
     */
    private String path;

    /**
     * 位置（HOME首页
     */
    private String position;

    /**
     * 展示端1：PC 2：H5
     */
    private Integer which;

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