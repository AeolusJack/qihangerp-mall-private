package cn.qihangerp.mall.controller.goods;

import cn.qihangerp.common.*;
import cn.qihangerp.mall.request.AcceptSourceOrderRequest;
import cn.qihangerp.mall.response.DataListResponse;
import cn.qihangerp.mall.response.ListResponse;
import cn.qihangerp.mall.response.UserOrderResponse;
import cn.qihangerp.module.mts.bo.GoodsSourcePublishRequest;
import cn.qihangerp.module.mts.domain.MtsGoodsSource;
import cn.qihangerp.module.mts.domain.MtsGoodsSourceOrder;
import cn.qihangerp.module.mts.service.MtsGoodsSourceOrderService;
import cn.qihangerp.module.mts.service.MtsGoodsSourceService;
import cn.qihangerp.module.user.domain.MallUser;
import cn.qihangerp.module.user.service.MallUserService;
import cn.qihangerp.utils.JwtUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.weaver.loadtime.Aj;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/goodsSource")
public class GoodsSourceOrderController extends BaseController {
    private final MtsGoodsSourceOrderService goodsSourceOrderService;
    private final MtsGoodsSourceService goodsSourceService;
    private final MallUserService mallUserService;

    @GetMapping("/order/list")
    public AjaxResult list(PageQuery pageQuery, HttpServletRequest request)
    {
        Long userId = JwtUtils.getUserIdFromToken(request);
        PageResult<MtsGoodsSourceOrder> pageList = goodsSourceOrderService.queryPageList(userId,null, pageQuery);

        DataListResponse response = new DataListResponse();
        ListResponse<MtsGoodsSourceOrder> listResponse = new ListResponse();
        listResponse.setData(pageList.getRecords());
        response.setList(listResponse);


        return AjaxResult.success(response);
    }


}
