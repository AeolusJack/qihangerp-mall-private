package cn.qihangerp.module.mts.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

/**
 * 
 * @TableName mts_goods_source
 */
@TableName(value ="mts_goods_source")
@Data
public class MtsGoodsSource implements Serializable {
    /**
     * 
     */
    @TableId
    private Long id;

    /**
     * 标题
     */
    private String title;

    /**
     * 主图
     */
    private String image;

    /**
     * 多图（逗号隔开）
     */
    private String pictures;

    /**
     * 型号
     */
    private String model;

    /**
     * 型号id
     */
    private Long modelId;

    /**
     * 品牌
     */
    private String brand;

    /**
     * 品牌id
     */
    private Long brandId;

    /**
     * 类型
     */
    private String type;

    /**
     * 类型id
     */
    private Long typeId;

    /**
     * 信息发布者
     */
    private Long userId;

    /**
     * 信息提供人联系人
     */
    private String sourceContacts;

    /**
     * 信息提供人手机号
     */
    private String sourceMobile;

    /**
     * 信息提供人微信
     */
    private String sourceWx;

    /**
     * 卖家联系人
     */
    private String sellerContacts;

    /**
     * 卖家联系手机号
     */
    private String sellerMobile;

    /**
     * 卖家联系微信
     */
    private String sellerWx;

    /**
     * 价格
     */
    private BigDecimal price;

    /**
     * 数量
     */
    private Integer quantity;

    /**
     * 最低数量
     */
    private Integer minQty;

    /**
     * 封装
     */
    private String fz;

    /**
     * 批次
     */
    private String pici;

    /**
     * 有效期
     */
    private String validityPeriod;

    /**
     * 备注
     */
    private String remark;

    /**
     * 文件列表
     */
    private String files;

    /**
     * 状态0草稿中1待审核2已审核3接单中
     */
    private Integer status;

    /**
     * 阶段1货源信息2货源
     */
    private Integer phase;

    /**
     * 谈判人
     */
    private String negotiator;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新人
     */
    private String updateBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}