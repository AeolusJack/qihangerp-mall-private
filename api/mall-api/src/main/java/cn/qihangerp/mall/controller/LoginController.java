package cn.qihangerp.mall.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.common.LoginBody;
import cn.qihangerp.common.config.RedisCache;
import cn.qihangerp.common.constant.CacheConstants;
import cn.qihangerp.module.goods.service.OGoodsSupplierService;
import cn.qihangerp.module.mall.domain.MallUser;
import cn.qihangerp.module.mall.service.MallUserService;
import cn.qihangerp.response.LoginUserInfoResponse;
import cn.qihangerp.utils.JwtUtils;
import cn.qihangerp.utils.StringUtils;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 登录验证
 *
 * @author qihang
 */
@AllArgsConstructor
@RestController
public class LoginController extends BaseController {
    private final MallUserService mallUserService;

    @Autowired
    private RedisCache redisCache;


    @PostMapping("/logout")
    public AjaxResult logout() {
        return AjaxResult.success();
    }

    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody) {
        if (loginBody == null) return AjaxResult.error("缺少参数");
        if (StringUtils.isBlank(loginBody.getMobile())) return AjaxResult.error("缺少参数mobile");
        if (StringUtils.isBlank(loginBody.getSmsCode())) return AjaxResult.error("缺少参数code");
        String code = redisCache.getCacheObject(CacheConstants.SMS_VERIFICATION_CODE_KEY+loginBody.getMobile());
//        if(StringUtils.isBlank(code)) {
//            return AjaxResult.error("验证码不存在！请获取新验证码");
//        }
//        if(!loginBody.getSmsCode().equals(code)){
//            return AjaxResult.error("验证码不正确");
//        }
        MallUser byMobile = mallUserService.getByMobile(loginBody.getMobile());
        if(byMobile == null){
            return AjaxResult.error("手机号不存在");
        }
//        OGoodsSupplier supplier = supplierService.getByLoginName(loginBody.getMobile());
//        if (supplier == null) return AjaxResult.error(1500, "供应商账号不存在");
//        String pwd = PasswordUtils.hashPasswordWithSalt(loginBody.getPassword(), supplier.getLoginSlat());
//        if (!pwd.equals(supplier.getLoginPwd())) return AjaxResult.error(1504, "账号密码不正确");
//



        // 验证用户名和密码（略）
        // 如果验证成功，生成 JWT
        String token = JwtUtils.generateToken(loginBody.getMobile(),byMobile.getId());

//            // 根据uuid将loginUser缓存
//        String userKey =  "login_tokens:"+tokenUuid;
//        redisCache.setCacheObject(userKey, supplier, expireTime, TimeUnit.MINUTES);
        LoginUserInfoResponse response = new LoginUserInfoResponse();
        response.setToken(token);
        response.setMobile(loginBody.getMobile());
        response.setUserId(byMobile.getId());
        return AjaxResult.success(response);
//        AjaxResult ajax = AjaxResult.success();
//        ajax.put(Constants.TOKEN, token);
//        return ajax;
    }



}
