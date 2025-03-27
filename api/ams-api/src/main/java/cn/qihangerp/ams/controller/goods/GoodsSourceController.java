package cn.qihangerp.ams.controller.goods;


import cn.qihangerp.common.*;
import cn.qihangerp.module.goods.domain.OGoods;
import cn.qihangerp.module.goods.domain.OGoodsSku;
import cn.qihangerp.module.goods.domain.bo.GoodsAddBo;
import cn.qihangerp.module.goods.domain.vo.GoodsSpecListVo;
import cn.qihangerp.module.goods.service.OGoodsService;
import cn.qihangerp.module.goods.service.OGoodsSkuService;
import cn.qihangerp.module.mts.domain.MtsGoodsSource;
import cn.qihangerp.module.mts.service.MtsGoodsSourceService;
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
@RequestMapping("/goodsSource")
public class GoodsSourceController extends BaseController
{
    private final MtsGoodsSourceService mtsGoodsSourceService;

    /**
     * 查询列表
     */
    @GetMapping("/list")
    public TableDataInfo list(MtsGoodsSource bo, PageQuery pageQuery)
    {
        PageResult<MtsGoodsSource> pageList = mtsGoodsSourceService.queryPageList(bo, pageQuery);
        return getDataTable(pageList);
    }

    /**
     * 获取商品管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('goods:goods:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(mtsGoodsSourceService.getById(id));
    }



    @PostMapping("/audit")
    public AjaxResult audit(@RequestBody MtsGoodsSource bo){
        mtsGoodsSourceService.audit(bo.getId(),getUserId(),getUsername());
        return AjaxResult.success();
    }


}
