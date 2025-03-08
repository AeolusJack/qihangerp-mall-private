package cn.qihangerp.mall.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.common.LoginBody;
import cn.qihangerp.common.config.RedisCache;
import cn.qihangerp.domain.SysUser;
import cn.qihangerp.module.goods.domain.OGoodsSupplier;
import cn.qihangerp.module.goods.service.OGoodsSupplierService;
import cn.qihangerp.utils.JwtUtils;
import cn.qihangerp.utils.PasswordUtils;
import com.alibaba.nacos.api.common.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 登录验证
 *
 * @author qihang
 */
@RestController
public class LoginController extends BaseController {

    @Autowired
    private OGoodsSupplierService supplierService;

    @Autowired
    private RedisCache redisCache;
    private static int expireTime = 30;
    protected static final long MILLIS_SECOND = 1000;
    protected static final long MILLIS_MINUTE = 60 * MILLIS_SECOND;

    @PostMapping("/logout")
    public AjaxResult logout() {
        return AjaxResult.success();
    }

    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody) {
        OGoodsSupplier supplier = supplierService.getByLoginName(loginBody.getUsername());
        if (supplier == null) return AjaxResult.error(1500, "供应商账号不存在");
        String pwd = PasswordUtils.hashPasswordWithSalt(loginBody.getPassword(), supplier.getLoginSlat());
        if (!pwd.equals(supplier.getLoginPwd())) return AjaxResult.error(1504, "账号密码不正确");
        // 验证用户名和密码（略）
        // 如果验证成功，生成 JWT
        String token = JwtUtils.generateToken(loginBody.getUsername(),supplier.getId());

//            // 根据uuid将loginUser缓存
//        String userKey =  "login_tokens:"+tokenUuid;
//        redisCache.setCacheObject(userKey, supplier, expireTime, TimeUnit.MINUTES);

        AjaxResult ajax = AjaxResult.success();
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo()
    {
//        if(SecurityUtils.getLoginUser().getIsSupplier()==null) return AjaxResult.error(401,"shibai");
//        // 角色集合
////        Set<String> roles = permissionService.getRolePermission(user);
////        // 权限集合
////        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", new SysUser());
        ajax.put("roles", null);
        ajax.put("permissions", null);
        return ajax;
    }

}
