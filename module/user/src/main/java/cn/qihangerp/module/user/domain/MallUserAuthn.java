package cn.qihangerp.module.user.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 用户实名认证表
 * @TableName mall_user_authn
 */
@TableName(value ="mall_user_authn")
@Data
public class MallUserAuthn implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 租户id
     */
    private Long tenantId;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 真实姓名
     */
    private String trueName;

    /**
     * 身份证号
     */
    private String idCardNo;

    /**
     * 图片1
     */
    private String pic1;

    /**
     * 图片2
     */
    private String pic2;

    /**
     * 图片3
     */
    private String pic3;

    /**
     * 签名
     */
    private String autograph;

    /**
     * 实名认证状态0认证中1认证通过2认证失败
     */
    private Integer status;

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