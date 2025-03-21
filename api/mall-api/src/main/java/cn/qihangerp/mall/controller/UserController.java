package cn.qihangerp.mall.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.response.UserInfoResponse;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
@RequestMapping("/user/")
public class UserController extends BaseController {
    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("/getUserInfo")
    public AjaxResult getInfo(HttpServletRequest request)
    {
        UserInfoResponse userInfoResponse = new UserInfoResponse();
        userInfoResponse.setToken(getToken(request));
        userInfoResponse.setUserId(getUserId(request));
        userInfoResponse.setMobile(getUsername(request));
        return AjaxResult.success(userInfoResponse);
    }
}
