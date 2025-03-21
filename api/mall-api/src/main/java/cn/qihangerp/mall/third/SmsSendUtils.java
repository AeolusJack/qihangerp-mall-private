package cn.qihangerp.mall.third;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.utils.OkHttpClientHelper;
import com.alibaba.fastjson2.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * @program: admin
 * @description
 * @author: qi
 * @create: 2024-09-11 14:02
 **/
@Component
public class SmsSendUtils {

    @Value("${sms.url}")
    private String apiUrl;
    @Value("${sms.appkey}")
    private String appkey;
    @Value("${sms.appsecret}")
    private String appsecret;
    @Value("${sms.template}")
    private String template;
    @Value("${sms.signName}")
    private String signName;

    /**
     * 发送短信验证码
     * @param
     * @param
     * @return
     */
    public ResultVo<Boolean> sendVerificationCode(String phone, String code) {
        try {
            Map<String, String> bodys = new HashMap<String, String>();
            bodys.put("key", appkey);
            bodys.put("secret", appsecret);
            bodys.put("phone", phone);
            bodys.put("template_code", template);
            bodys.put("sign_name", signName);
            bodys.put("data", "{\"code\":"+code+"}");

            Map<String, String> headers = new HashMap<String, String>();
            //根据API的要求，定义相对应的Content-Type
            headers.put("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

            String resultStr = OkHttpClientHelper.postForm(apiUrl, bodys, headers);
            JSONObject jsonObject = JSONObject.parseObject(resultStr);
            Integer result = jsonObject.getInteger("result");
            if (result == 1000) {
                return ResultVo.success(true);
            }else{
                return ResultVo.error(501,jsonObject.getString("msg"));
            }
        }catch (Exception e){
            return ResultVo.error(500,"接口请求错误");
        }
    }

}
