package cn.qihangerp.mall.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.module.mall.domain.MallNav;
import cn.qihangerp.module.mall.service.MallNavService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/nav")
public class HomeNavController extends BaseController {
    private final MallNavService navService;
    @GetMapping("/list")
    public AjaxResult list()
    {
        List<MallNav> list = navService.list();
        return AjaxResult.success(list);
    }
}
