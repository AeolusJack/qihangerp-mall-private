package cn.qihangerp.oms.controller.openApi;

import cn.qihangerp.common.annotation.BusinessType;
import cn.qihangerp.common.annotation.ErpEchoLogger;
import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.enums.HttpStatus;
import cn.qihangerp.module.goods.domain.bo.GoodsSkuAddBo;
import cn.qihangerp.module.goods.service.OGoodsService;
import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 商品相关openApi
 */
@AllArgsConstructor
@RestController
@RequestMapping("/openApi")
public class GoodsApiController extends BaseController {
    private final OGoodsService goodsService;

    /**
     * 单个添加商品
     * @param bo
     * @return
     */
    @ErpEchoLogger(title = "单个添加商品",businessType = BusinessType.RECEIVE_PUSH)
    @PostMapping("/goodsSku/add")
    public AjaxResult addSku(@RequestBody GoodsSkuAddBo bo)
    {
        if(StringUtils.isEmpty(bo.getErpSkuId())){
            return AjaxResult.error(HttpStatus.PARAMS_ERROR,"参数错误：缺失erpSkuId");
        }else if(StringUtils.isEmpty(bo.getErpSkuCode())){
            return AjaxResult.error(HttpStatus.PARAMS_ERROR,"参数错误：缺失erpSkuCode");
        }else if(StringUtils.isEmpty(bo.getErpSkuName())){
            return AjaxResult.error(HttpStatus.PARAMS_ERROR,"参数错误：缺失erpSkuName");
        }else if(StringUtils.isEmpty(bo.getProductSpec())){
            return AjaxResult.error(HttpStatus.PARAMS_ERROR,"参数错误：缺失productSpec");
        }
        return toAjax( goodsService.saveGoodsSku(bo));
    }

    /**
     * 批量添加商品
     * @param list
     * @return
     */
    @ErpEchoLogger(title = "批量添加商品",businessType = BusinessType.RECEIVE_PUSH)
    @PostMapping("/goodsSku/batchAdd")
    public AjaxResult batchAddSku(@RequestBody List<GoodsSkuAddBo> list)
    {
        if(list==null || list.isEmpty()){
            return AjaxResult.error(HttpStatus.PARAMS_ERROR,"参数错误：缺失List<GoodsSkuAddBo>");
        }

        return toAjax( goodsService.batchSaveGoodsSku(list));
    }
}
