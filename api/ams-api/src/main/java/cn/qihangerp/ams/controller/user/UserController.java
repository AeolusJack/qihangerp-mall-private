package cn.qihangerp.ams.controller.user;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.module.goods.domain.OGoods;
import cn.qihangerp.module.goods.service.OGoodsService;
import cn.qihangerp.module.user.domain.MallUser;
import cn.qihangerp.module.user.service.MallUserService;
import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
@RequestMapping("/user")
public class UserController extends BaseController {
    private final OGoodsService goodsService;
    private final MallUserService mallUserService;
    @GetMapping("/list")
    public TableDataInfo list(MallUser bo, PageQuery pageQuery)
    {
        PageResult<MallUser> pageList = mallUserService.queryPageList(bo, pageQuery);
        return getDataTable(pageList);
    }
}
