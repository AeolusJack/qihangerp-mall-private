package cn.qihangerp.mall.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.BaseController;
import cn.qihangerp.module.mall.domain.MallRecCategory;
import cn.qihangerp.module.mall.domain.MallRecGoods;
import cn.qihangerp.module.mall.service.MallRecCategoryService;
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
@RequestMapping("/recCategory")
public class HomeRecCategoryController extends BaseController {
    private final MallRecCategoryService recCategoryService;
    private final MallRecGoodsService recGoodsService;
    @GetMapping("/list")
    public AjaxResult list()
    {
        List<MallRecCategory> parentList = recCategoryService.list(new LambdaQueryWrapper<>(MallRecCategory.class).eq(MallRecCategory::getParentId, 0));
        for (MallRecCategory recCategory : parentList) {
            recCategory.setChildren(recCategoryService.list(new LambdaQueryWrapper<>(MallRecCategory.class).eq(MallRecCategory::getParentId, recCategory.getId())));
            recCategory.setGoods(recGoodsService.list());
        }
        return AjaxResult.success(parentList);
    }
}
