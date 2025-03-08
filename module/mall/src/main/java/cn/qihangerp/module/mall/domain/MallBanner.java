package cn.qihangerp.module.mall.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 商城Banner
 * @TableName mall_banner
 */
@TableName(value ="mall_banner")
@Data
public class MallBanner implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     *  排序（升序）
     */
    private Integer sort;

    /**
     * 标题
     */
    private String title;

    /**
     * url
     */
    private String url;

    /**
     * 图片地址
     */
    private String image;

    /**
     * 类型（1：logo 2：banner 3 special 专题 )
     */
    private Integer type;

    /**
     * 位置（HOME首页
     */
    private String position;

    /**
     * 展示端1：PC 2：H5
     */
    private Integer which;

    /**
     * 专题类别
     */
    private String special;

    /**
     * 描述
     */
    private String remark;

    /**
     * 显示价格
     */
    private String showPrice;

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