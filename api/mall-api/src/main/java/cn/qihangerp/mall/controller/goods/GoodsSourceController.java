package cn.qihangerp.mall.controller.goods;

import cn.qihangerp.common.*;
import cn.qihangerp.mall.request.AcceptSourceOrderRequest;

import cn.qihangerp.module.mts.bo.GoodsSourcePublishRequest;
import cn.qihangerp.module.mts.domain.MtsGoodsSource;
import cn.qihangerp.module.mts.service.MtsGoodsSourceService;
import cn.qihangerp.module.user.domain.MallUser;
import cn.qihangerp.module.user.service.MallUserService;
import cn.qihangerp.utils.JwtUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/goodsSource")
public class GoodsSourceController extends BaseController {
    private final MtsGoodsSourceService goodsSourceService;
    private final MallUserService mallUserService;
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
        Long userId = JwtUtils.getUserIdFromToken(request);
        if(userId!=null) {
            MallUser user = mallUserService.getById(userId);
            if(user!=null && user.getBusinessType()==10) {
                // 如果用户身份是：谈判人，查询出待谈判人接单的列表
                MtsGoodsSource source = new MtsGoodsSource();
                source.setPhase(0);
                source.setAcceptStatus(0);
                source.setStatus(2);
                PageResult<MtsGoodsSource> pageList = goodsSourceService.queryPageList(source, pageQuery);
                return getDataTable(pageList);
            }else {
                log.error("用户{}不是谈判人身份",userId);
            }

        }
        return getDataTable(new ArrayList<>());
    }

    @PostMapping("/acceptSourceOrder")
    public AjaxResult acceptSourceOrder(@RequestBody AcceptSourceOrderRequest source, HttpServletRequest request){
        if(source.getId()==null) return AjaxResult.error("缺少参数:id");
        Long userId = JwtUtils.getUserIdFromToken(request);
        if(userId==null||userId==0) return AjaxResult.error("未登录");
        MallUser user = mallUserService.getById(userId);
        if(user==null) return AjaxResult.error("用户不存在");
        else if (user.getBusinessType()!=10) {
            return AjaxResult.error("你还不是谈判人，无法接单！请成为谈判人！");
        }
        ResultVo resultVo = goodsSourceService.acceptSourceOrder(source.getId(), userId, getUsername(request));
        if(resultVo.getCode() == 0)
            return AjaxResult.success();
        else{
            log.error("接单错误：{}",resultVo.getMsg());
            return AjaxResult.error(resultVo.getMsg());
        }
    }
}
