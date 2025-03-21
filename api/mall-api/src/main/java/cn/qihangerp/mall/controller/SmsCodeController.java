package cn.qihangerp.mall.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.config.RedisCache;
import cn.qihangerp.common.constant.CacheConstants;
import cn.qihangerp.mall.request.MobileCodeRequest;
import cn.qihangerp.mall.third.SmsSendUtils;
import cn.qihangerp.utils.NumberUtils;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.concurrent.TimeUnit;

/**
 * 手机验证码
 */
@Slf4j
@AllArgsConstructor
@RequestMapping("/sms")
@RestController
public class SmsCodeController {
    private final RedisCache redisCache;
    private final SmsSendUtils smsSendUtils;

    /**
     * 获取手机验证码
     * @param request
     * @return
     */

    @PostMapping("/getMobileVerificationCode")
    public AjaxResult getCode(@RequestBody MobileCodeRequest request){
        log.info("=====getMobileVerificationCode===={}", request.getMobile());
        if (StringUtils.isBlank(request.getMobile())) {
            return AjaxResult.error("缺少参数：mobile");
        }
        String code = NumberUtils.generateRandomNumber();
        log.info("=====验证码===={}", code);
        redisCache.setCacheObject(CacheConstants.SMS_VERIFICATION_CODE_KEY+request.getMobile(),code,5, TimeUnit.MINUTES);
//        smsSendUtils.sendVerificationCode(mobile,code);
//        Object cacheMapValue = redisCache.getCacheObject(CacheConstants.SMS_VERIFICATION_CODE_KEY+mobile);
//        if(cacheMapValue == null){
//
//        }
        return AjaxResult.success();

    }

}
