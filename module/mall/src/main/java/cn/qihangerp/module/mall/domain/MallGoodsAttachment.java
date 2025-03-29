package cn.qihangerp.module.mall.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 商品附件表
 * @TableName mall_goods_attachment
 */
@TableName(value ="mall_goods_attachment")
@Data
public class MallGoodsAttachment implements Serializable {
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
     * 附件类型（0图片1视频2文件3详情图片4详情视频5详情图文）
     */
    private Integer type;

    /**
     * '附件链接地址'
     */
    private String url;

    /**
     * '附件说明'
     */
    private String comment;

    /**
     * 
     */
    private String content;

    /**
     * 排序asc（显示位置）
     */
    private Integer sort;

    /**
     * 创建时间
     */
    private Long createOn;

    /**
     * '创建人'
     */
    private String createBy;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}