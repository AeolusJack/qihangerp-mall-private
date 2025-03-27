package cn.qihangerp.mall.controller.goods;

import cn.qihangerp.common.*;
import cn.qihangerp.module.goods.domain.OGoods;
import cn.qihangerp.module.mts.bo.GoodsSourcePublishRequest;
import cn.qihangerp.module.mts.domain.MtsGoodsSource;
import cn.qihangerp.module.mts.service.MtsGoodsSourceService;
import cn.qihangerp.utils.JwtUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping("/goodsSource")
public class GoodsSourceController extends BaseController {
    private final MtsGoodsSourceService goodsSourceService;

    @GetMapping("/list")
    public TableDataInfo list(PageQuery pageQuery, HttpServletRequest request)
    {
        Long userId = JwtUtils.getUserIdFromToken(request);
        PageResult<MtsGoodsSource> pageList = goodsSourceService.queryPageList(userId,2,1, pageQuery);
        return getDataTable(pageList);
    }


    @PostMapping("/publish")
    public AjaxResult list(@RequestBody GoodsSourcePublishRequest publish ,HttpServletRequest request)
    {
        Long userId =0L;
        try {
            userId = JwtUtils.getUserIdFromToken(request);
        }catch (Exception e) {
            return AjaxResult.error("请登录");
        }
        ResultVo resultVo = goodsSourceService.addSource(publish, userId,JwtUtils.getUsernameFromToken(request));
        if(resultVo.getCode() == 0)
            return AjaxResult.success();
        else
            return AjaxResult.error(resultVo.getMsg());
    }

    @GetMapping("/pendingSourceList")
    public TableDataInfo pendingSourceList(PageQuery pageQuery, HttpServletRequest request)
    {
        MtsGoodsSource source = new MtsGoodsSource();
        source.setPhase(1);
        source.setStatus(2);
        PageResult<MtsGoodsSource> pageList = goodsSourceService.queryPageList(source, pageQuery);
        return getDataTable(pageList);
    }
}
