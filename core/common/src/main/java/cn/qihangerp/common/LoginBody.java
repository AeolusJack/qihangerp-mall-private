package cn.qihangerp.common;

import lombok.Data;

/**
 * 用户登录对象
 * 
 * @author qihang
 */
@Data
public class LoginBody
{
    private String mobile;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 验证码
     */
    private String smsCode;

    /**
     * 唯一标识
     */
    private String uuid;

}
