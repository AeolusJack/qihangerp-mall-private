package cn.qihangerp.mall.controller.goods;


import cn.qihangerp.common.*;
import cn.qihangerp.module.mall.domain.MallGoods;
import cn.qihangerp.module.mall.domain.bo.GoodsPublishBo;

import cn.qihangerp.module.mall.service.MallGoodsService;
import lombok.AllArgsConstructor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletRequest;

/**
 * 商品管理Controller
 * 
 * @author qihang
 * @date 2023-12-29
 */
@AllArgsConstructor
@RestController
@RequestMapping("/goods")
public class GoodsController extends BaseController
{
    private final MallGoodsService mallGoodsService;
    /**
     * 查询商品管理列表
     */
    @GetMapping("/list")
    public AjaxResult list(MallGoods goods,PageQuery pageQuery, HttpServletRequest request)
    {
        PageResult<MallGoods> pageList = mallGoodsService.querySalePageList(goods, pageQuery);
        return AjaxResult.success(pageList);
    }

    @GetMapping("/detail")
    public AjaxResult detail(@RequestParam("goodsId") Long goodsId)
    {
        MallGoods goods = mallGoodsService.queryById(goodsId);
        return AjaxResult.success(goods);
    }

    @PostMapping("/publish")
    public AjaxResult publish(@RequestBody GoodsPublishBo goods, HttpServletRequest request)
    {
        if(goods.getGoodsSourceId()==null) return AjaxResult.error("缺少参数:goodsSourceId");
        if(goods.getGoodsSourceOrderId()==null) return AjaxResult.error("缺少参数:goodsSourceOrderId");
        if(!StringUtils.hasText(goods.getTitle())) return AjaxResult.error("请填写标题");
        if(goods.getPicList()==null||goods.getPicList().length==0) return AjaxResult.error("请上传图片");
        ResultVo<Long> resultVo = mallGoodsService.publishGoods(getUserId(request), goods);
        if(resultVo.getCode()!=0) return AjaxResult.error(resultVo.getMsg());
        else return AjaxResult.success(resultVo.getData());
    }
}
