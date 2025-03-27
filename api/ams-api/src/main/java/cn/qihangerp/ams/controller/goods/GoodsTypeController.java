package cn.qihangerp.ams.controller.goods;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.module.goods.domain.OGoodsType;
import cn.qihangerp.module.goods.service.OGoodsTypeService;
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
public class GoodsTypeController {
    private final OGoodsTypeService goodsTypeService;
    @GetMapping("/type/list")
    public AjaxResult list( HttpServletRequest request)
    {
        List<OGoodsType> list = goodsTypeService.list();
        return AjaxResult.success(list);
    }
}
