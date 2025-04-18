package cn.qihangerp.ams.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.module.mall.domain.MallShop;
import cn.qihangerp.module.mall.service.MallShopService;
import cn.qihangerp.security.common.BaseController;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * 店铺Controller
 * 
 * @author qihang
 * @date 2023-12-31
 */
@AllArgsConstructor
@RestController
@RequestMapping("/shop")
public class ShopController extends BaseController {
    private final MallShopService shopService;

    /**
     * 查询店铺列表
     */
    @GetMapping("/list")
    public TableDataInfo list(MallShop shop)
    {
        List<MallShop> list = shopService.selectShopList(shop);
        return getDataTable(list);
    }

    @GetMapping("/pageList")
    public TableDataInfo pageList(MallShop shop, PageQuery pageQuery)
    {
        PageResult<MallShop> pageList = shopService.queryPageList(shop, pageQuery);
        return getDataTable(pageList);
    }


    /**
     * 获取店铺详细信息
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:query')")
    @GetMapping(value = "/shop/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(shopService.getById(id));
    }

    /**
     * 新增店铺
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:add')")
    @PostMapping("/shop")
    public AjaxResult add(@RequestBody MallShop shop)
    {
        shop.setModifyOn(System.currentTimeMillis()/1000);
        return toAjax(shopService.insertShop(shop));
    }

    /**
     * 修改店铺
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:edit')")
    @PutMapping("/shop")
    public AjaxResult edit(@RequestBody MallShop shop)
    {
        if(shop.getId()==null) return AjaxResult.error("缺少参数：id");
        shop.setModifyOn(System.currentTimeMillis() /1000);
        shopService.updateShopById(shop);
//        try{
//            erpPushHelper.shopSave(shopService.getById(shop.getId()));
//        }catch (Exception x){
//        }

        return toAjax(1);
    }

    /**
     * 删除店铺
     */
    @PreAuthorize("@ss.hasPermi('shop:shop:remove')")
    @DeleteMapping("/shop/id")
    public AjaxResult remove(@PathVariable Long id)
    {
        return toAjax(shopService.removeById(id));
    }


    //platformList
    /**
     * 获取平台列表
     */
    @GetMapping("/platformList")
    public AjaxResult platformList()
    {
        ArrayList<Object> objects = new ArrayList<>();
//        JSONObject jsonObject = new JSONObject();
//        jsonObject.put("code", "100");
//        objects.add(jsonObject);
        return error("失败");
    }
}
