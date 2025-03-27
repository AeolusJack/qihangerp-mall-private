package cn.qihangerp.oms.domain;

import java.io.Serializable;
import lombok.Data;

/**
 * ERP系统交互配置表
 * @TableName erp_echo_config
 */
@Data
public class ErpEchoConfig implements Serializable {
    /**
     * 
     */
    private Integer id;

    /**
     * ERP接口服务器名
     */
    private String serverName;

    /**
     * ERP接口服务器url
     */
    private String serverUrl;

    /**
     * ERP接口登录用户名
     */
    private String loginUserName;

    /**
     * ERP接口登录密码
     */
    private String loginPassword;

    /**
     * ERP接口Token
     */
    private String token;
    private Integer isOn;

    private static final long serialVersionUID = 1L;
}