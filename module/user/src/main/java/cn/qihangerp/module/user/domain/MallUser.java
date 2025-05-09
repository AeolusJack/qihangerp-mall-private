package cn.qihangerp.module.user.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 市场用户表
 * @TableName mall_user
 */
@TableName(value ="mall_user")
@Data
public class MallUser implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 手机号（可用于登录）
     */
    private String mobile;

    /**
     * 会员名(实名认证后写入实名认证值，比如企业认证，就是公司名）
     */
    private String userName;

    /**
     * 微信昵称
     */
    private String nickName;

    /**
     * 微信头像
     */
    private String headImg;

    /**
     * 登录密码
     */
    private String loginPwd;

    /**
     * 来源：小程序、小程序分享、交易终端
     */
    private String source;

    /**
     * 推荐人id
     */
    private Long referrerId;

    /**
     * 用户类型：10普通用户；100市场管理员；
     */
    private Integer userType;

    /**
     * 商务身份（10谈判人20商务）
     */
    private Integer businessType;

    /**
     * 性别（男，女，未知）
     */
    private String gender;

    /**
     * 实名认证姓名（法人老板）
     */
    private String authnName;

    /**
     * 实名认证身份证号
     */
    private String authnCardNo;

    /**
     * 实名认证状态0未实名1已实名
     */
    private Integer authnStatus;

    /**
     * 实名认证成功时间
     */
    private Date authnTime;

    /**
     * 最后登录时间
     */
    private Date lastLoginTime;

    /**
     * 最后登录IP
     */
    private String lastLoginIp;

    /**
     * 最后登录设备id
     */
    private String lastLoginDeviceSn;

    /**
     * 最后登录市场id
     */
    private Long lastLoginMarketId;

    /**
     * 注册时间
     */
    private Date regTime;

    /**
     * 注册ip
     */
    private String regIp;

    /**
     * 微信openid
     */
    private String wxOpenId;

    /**
     * 微信unionId
     */
    private String wxUnionId;

    /**
     * 微信sessionkey
     */
    private String wxSessionKey;

    /**
     * 状态（1正常2禁用）
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

    /**
     * 省
     */
    private String province;

    /**
     * 市
     */
    private String city;

    /**
     * 区
     */
    private String district;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}