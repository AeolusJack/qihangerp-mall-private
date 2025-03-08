package cn.qihangerp.mall.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.module.mall.domain.MallBanner;
import cn.qihangerp.module.mall.domain.MallNav;
import cn.qihangerp.module.mall.domain.MallRecGoods;
import cn.qihangerp.module.mall.service.MallNavService;
import cn.qihangerp.module.mall.service.MallRecGoodsService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.AllArgsConstructor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@AllArgsConstructor
@RestController
@RequestMapping("/recGoods")
public class HomeRecGoodsController extends BaseController {
    private final MallRecGoodsService recGoodsService;
    @GetMapping("/list")
    public AjaxResult list(Integer which ,String position)
    {
        LambdaQueryWrapper<MallRecGoods> queryWrapper = new LambdaQueryWrapper<MallRecGoods>()
                .eq(which!=null,MallRecGoods::getWhich,which)
                .eq(StringUtils.hasText(position),MallRecGoods::getPosition,position);
        List<MallRecGoods> list = recGoodsService.list();
        return AjaxResult.success(list);
    }
}
