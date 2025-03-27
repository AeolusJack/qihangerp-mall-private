package cn.qihangerp.oms.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.module.order.domain.ORefund;
import cn.qihangerp.module.order.domain.bo.RefundProcessingBo;
import cn.qihangerp.module.order.domain.bo.RefundSearchBo;
import cn.qihangerp.module.order.service.ORefundService;


import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * 退换货Controller
 * 
 * @author qihang
 * @date 2024-01-13
 */
@AllArgsConstructor
@RestController
@RequestMapping("/refund")
public class RefundController extends BaseController
{

    private final ORefundService refundService;


    /**
     * 查询退换货列表
     */
    @PreAuthorize("@ss.hasPermi('api:returned:list')")
    @GetMapping("/list")
    public TableDataInfo list(RefundSearchBo bo, PageQuery pageQuery)
    {
        var pageList = refundService.queryPageList(bo,pageQuery);
        return getDataTable(pageList);
    }


    /**
     * 获取退换货详细信息
     */
    @PreAuthorize("@ss.hasPermi('api:returned:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(refundService.selectById(id));
    }




    @PostMapping("/processing")
    public AjaxResult refundProcessing(@RequestBody RefundProcessingBo bo ) {
        if (bo.getRefundId() == null) return AjaxResult.error(500, "缺少参数refundId");
        ResultVo<Long> resultVo = refundService.refundProcessing(bo,getUsername());
        if(resultVo.getCode() == 0) return success();
        else return AjaxResult.error(resultVo.getMsg());
    }
}
