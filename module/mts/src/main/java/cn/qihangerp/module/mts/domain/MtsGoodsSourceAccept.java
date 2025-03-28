package cn.qihangerp.module.mts.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 货源信息接单表
 * @TableName mts_goods_source_accept
 */
@TableName(value ="mts_goods_source_accept")
@Data
public class MtsGoodsSourceAccept implements Serializable {
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
     * 状态1接单中0已取消
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

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}