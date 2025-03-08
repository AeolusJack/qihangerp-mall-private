package cn.qihangerp.mall.controller;

import cn.qihangerp.common.*;
import cn.qihangerp.module.mall.domain.MallBanner;
import cn.qihangerp.module.mall.service.MallBannerService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.AllArgsConstructor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/banner")
public class HomeBannerController extends BaseController {
    private final MallBannerService bannersService;
    @GetMapping("/list")
    public AjaxResult list(Integer which,Integer type,String position,String special)
    {
        LambdaQueryWrapper<MallBanner> queryWrapper = new LambdaQueryWrapper<MallBanner>()
                .eq(which!=null,MallBanner::getWhich,which)
                .eq(type!=null,MallBanner::getType,type)
                .eq(StringUtils.hasText(special),MallBanner::getSpecial,special)
                .eq(StringUtils.hasText(position),MallBanner::getPosition,position);

        List<MallBanner> list = bannersService.list(queryWrapper);
        return AjaxResult.success(list);
    }
}
