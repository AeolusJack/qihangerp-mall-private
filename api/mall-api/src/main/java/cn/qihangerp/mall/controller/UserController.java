package cn.qihangerp.mall.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.mall.response.UserInfoResponse;
import cn.qihangerp.response.UserInfo;
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
        String mobile = getUsername(request);
        if(mobile!=null&&mobile.length()>3){
            String first = mobile.substring(0,3);
            String last = "";
            if(mobile.length()>7) {
                last = mobile.substring(7);
            }
            mobile = first+"****"+last;
        }
        UserInfoResponse response = new UserInfoResponse();

        UserInfo userInfo = new UserInfo();
        userInfo.setToken(getToken(request));
        userInfo.setUserId(getUserId(request));
        userInfo.setMobile(mobile);
        userInfo.setNickName(mobile);
        userInfo.setAvatar("https://kkimgs.yisou.com/ims?kt=url&at=ori&key=aHR0cHM6Ly93dzQuc2luYWltZy5jbi9tdzY5MC8wMDhzS0oxTWx5MWhlazc3bnFrMzVqMzBncTBncW15Ny5qcGc=&sign=yx:rmrlV53zJus_CcG0OkGc_I0w284=&tv=0_0");

        response.setUserInfo(userInfo);

        return AjaxResult.success(response);
    }
}
