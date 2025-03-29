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
 * 货源信息接单表
 * @TableName mts_goods_source_order
 */
@TableName(value ="mts_goods_source_order")
@Data
public class MtsGoodsSourceOrder implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 接单类型（10谈判人20商务)
     */
    private Integer identity;

    /**
     * 货源信息id
     */
    private Long goodsSourceId;

    /**
     * 状态1接单中0已取消2发布审核中3已发布
     */
    private Integer status;

    /**
     * 接单时间
     */
    private Date acceptTime;

    /**
     * 发布时间
     */
    private Date publishTime;

    /**
     * 发布状态0待发布1待审核2已审核
     */
    private Integer publishStatus;

    /**
     * 审核时间
     */
    private Date auditTime;

    /**
     * 审核人
     */
    private Long auditUser;

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
     * 主图
     */
    private String image;

    /**
     * 型号
     */
    private String model;

    /**
     * 品牌
     */
    private String brand;

    /**
     * 类型
     */
    private String type;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}