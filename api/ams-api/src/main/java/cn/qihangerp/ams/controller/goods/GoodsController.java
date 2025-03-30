package cn.qihangerp.ams.controller.goods;


import cn.qihangerp.common.*;
import cn.qihangerp.module.goods.domain.OGoodsSku;
import cn.qihangerp.module.goods.domain.OGoods;

import cn.qihangerp.module.goods.domain.bo.GoodsAddBo;
import cn.qihangerp.module.goods.domain.vo.GoodsSpecListVo;
import cn.qihangerp.module.goods.service.OGoodsService;
import cn.qihangerp.module.goods.service.OGoodsSkuService;
import cn.qihangerp.module.mall.domain.MallGoods;
import cn.qihangerp.module.mall.service.MallGoodsService;
import cn.qihangerp.security.common.BaseController;
import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import lombok.AllArgsConstructor;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.NumberToTextConverter;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    private final OGoodsService goodsService;
    private final OGoodsSkuService skuService;

    /**
     * 查询商品管理列表
     */
    @PreAuthorize("@ss.hasPermi('goods:goods:list')")
    @GetMapping("/list")
    public TableDataInfo list(MallGoods goods, PageQuery pageQuery)
    {
        var pageList = mallGoodsService.querySalePageList(goods,pageQuery);

        return getDataTable(pageList);
    }

    /**
     * 获取商品管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('goods:goods:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(goodsService.selectGoodsById(id));
    }
    /**
     * 获取商品管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('goods:goods:query')")
    @GetMapping(value = "/sku/{id}")
    public AjaxResult getSkuInfo(@PathVariable("id") Long id)
    {
        return success(skuService.getById(id));
    }
    /**
     * 新增商品管理
     */
    @PreAuthorize("@ss.hasPermi('goods:goods:add')")
    @PostMapping("/add")
    public AjaxResult add(@RequestBody GoodsAddBo goods)
    {
        ResultVo<Long> resultVo = goodsService.insertGoods(getUsername(), goods);
        if(resultVo.getCode()!=0) return AjaxResult.error(resultVo.getMsg());
        else return AjaxResult.success(resultVo.getData());
//        goods.setCreateBy(getUsername());
//        int result = goodsService.insertGoods(goods);
//        if(result == -1) new AjaxResult(501,"商品编码已存在");
//        return toAjax(1);
    }



    /**
     * 修改商品管理
     */
    @PreAuthorize("@ss.hasPermi('goods:goods:edit')")
    @PutMapping
    public AjaxResult edit(@RequestBody OGoods goods)
    {
        return toAjax(goodsService.updateGoods(goods));
    }

    /**
     * 修改商品基本资料
     * @param sku
     * @return
     */
    @PutMapping("/sku")
    public AjaxResult editSku(@RequestBody OGoodsSku sku)
    {
        return toAjax(skuService.updateById(sku));
    }

    /**
     * 删除商品管理
     */
    @PreAuthorize("@ss.hasPermi('goods:goods:remove')")
    @DeleteMapping("/del/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        int result = goodsService.deleteGoodsByIds(ids);
        if(result==0) return AjaxResult.success();
        else if (result==-100) return AjaxResult.error("有关联的订单，不能删除！");
        else return AjaxResult.error();
    }

}
