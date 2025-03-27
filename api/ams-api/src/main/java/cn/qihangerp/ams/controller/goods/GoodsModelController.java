package cn.qihangerp.ams.controller.goods;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.module.goods.domain.OGoodsModel;
import cn.qihangerp.module.goods.service.OGoodsModelService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/goods")
public class GoodsModelController {
    private final OGoodsModelService goodsModelService;
    @GetMapping("/model/list")
    public AjaxResult list( HttpServletRequest request)
    {
        List<OGoodsModel> list = goodsModelService.list();
        return AjaxResult.success(list);
    }
}
