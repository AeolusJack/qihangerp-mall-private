package cn.qihangerp.oms.controller.offline;

import cn.qihangerp.common.AjaxResult;
import com.hankcs.hanlp.HanLP;
import com.hankcs.hanlp.dictionary.CustomDictionary;
import com.hankcs.hanlp.seg.common.Term;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@RestController
@RequestMapping("/offline_address")
public class AddressNLPController {

    @PostMapping(value = "/recognition")
    public AjaxResult textRecognition(@RequestBody String text)
    {
        text = "广东省阳江市阳西县溪头镇自由路13号下村对虾养殖场【配送拨打:17896431283转5716】卢先生，17896431283-5716";
        text = "王建洪18359327028福建省龙岩市新罗区南城街道 东环路厦鑫博世园2期18幢1梯2501";
        text = "马书兴 17897698261-3046\n" +
                "河北省 邯郸市 曲周县依庄乡宋庄村村东光伏电站【配送拨打:17897698261转3046】";
        text = "黄建兵 15951329069\n" +
                "江苏省 南通市 如东县岔河镇岔北瑶华快递点";

        extractInfo(text);
        return AjaxResult.success();
    }


    // 更新后的电话号码正则表达式，支持带转接号和连字符格式
    private static final String PHONE_REGEX = "(1[3-9])\\d{9}(?:[-\\s]?\\d+)?"; // 支持带“-”或“转”后的部分
    private static final String LANDLINE_PHONE_REGEX = "(\\d{3,4}-\\d{7,8})(?:[-\\s]?\\d+)?";  // 匹配带有“-”的固定电话号码

    // 提取收件人、地址、电话等信息
    public static void extractInfo(String text) {
        // 提取收件人（假设收件人是人名，一般为中文）
        List<String> names = extractNames(text);
        List<String> addr = extractProvince(text);
        // 提取电话
        List<String> phoneNumbers = extractPhoneNumbers(text);

        // 提取地址
//        List<String> addresses = extractAddresses(text);

        // 输出提取的信息
        System.out.println("收件人： " + names);
        System.out.println("省市区： " + addr);
        System.out.println("电话： " + phoneNumbers);
//        System.out.println("地址： " + addresses);
    }

    // 提取收件人信息（通过命名实体识别）
    private static List<String> extractNames(String text) {

        List<String> names = new ArrayList<>();
        List<Term> terms = HanLP.segment(text);
        for (Term term : terms) {
            if (term.nature.toString().equals("nr")) {  // "nr"是人名的标记
                names.add(term.word);
            }
        }
        return names;
    }

        // 提取电话信息（正则表达式匹配）
    private static List<String> extractPhoneNumbers(String text) {
        List<String> phoneNumbers = new ArrayList<>();
        // 匹配手机号码，支持带“-”或“转”后的部分
        Matcher matcher = Pattern.compile(PHONE_REGEX).matcher(text);
        while (matcher.find()) {
            phoneNumbers.add(matcher.group());
        }
        // 匹配固定电话号码，支持带“-”或“转”后的部分
        matcher = Pattern.compile(LANDLINE_PHONE_REGEX).matcher(text);
        while (matcher.find()) {
            phoneNumbers.add(matcher.group());
        }
        return phoneNumbers;
    }

//    // 提取地址信息（正则表达式匹配）
//    private static List<String> extractAddresses(String text) {
//        List<String> addresses = new ArrayList<>();
//        Matcher matcher = Pattern.compile(ADDRESS_REGEX).matcher(text);
//        while (matcher.find()) {
//            addresses.add(matcher.group());
//        }
//        return addresses;
//    }
    private static List<String> extractProvince(String text) {
        List<String> add = new ArrayList<>();
        CustomDictionary.add("阳西县", "ns");  // 手动添加一个词
        List<Term> terms = HanLP.segment(text);
        // 输出识别结果
        for (Term term : terms) {
            if (term.nature.toString().startsWith("ns")) {  // "ns" 是地点词的标记
                System.out.println("地名: " + term.word);
                add.add(term.word);
            }
        }
        return add;
    }
}
