package cn.qihangerp.mall.controller.goods;


import cn.qihangerp.common.*;
import cn.qihangerp.module.mall.domain.MallGoods;
import cn.qihangerp.module.mall.domain.bo.GoodsPublishBo;
import cn.qihangerp.module.mall.service.MallGoodsService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

/**
 * 商品管理Controller
 * 
 * @author qihang
 * @date 2023-12-29
 */
@AllArgsConstructor
@RestController
@RequestMapping("/goodsComment")
public class GoodsCommentController extends BaseController
{
    private final MallGoodsService mallGoodsService;
    /**
     * 查询列表
     */
    @GetMapping("/list")
    public AjaxResult list(MallGoods goods,PageQuery pageQuery, HttpServletRequest request)
    {
        return AjaxResult.success(new ArrayList<>());
    }


}
