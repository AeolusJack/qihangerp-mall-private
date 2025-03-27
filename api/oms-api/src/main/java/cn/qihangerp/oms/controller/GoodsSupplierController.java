package cn.qihangerp.oms.controller;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.utils.PasswordUtils;
import cn.qihangerp.module.goods.domain.OGoodsSupplier;
import cn.qihangerp.module.goods.service.OGoodsSupplierService;
import cn.qihangerp.security.common.BaseController;
import lombok.AllArgsConstructor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;

@AllArgsConstructor
@RestController
@RequestMapping("/supplier")
public class GoodsSupplierController extends BaseController {
    private final OGoodsSupplierService supplierService;

    @GetMapping("/list")
    public TableDataInfo list(OGoodsSupplier bo, PageQuery pageQuery)
    {
        var pageList = supplierService.queryPageList(bo,pageQuery);
        return getDataTable(pageList);
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(supplierService.getById(id));
    }

    /**
     * 新增【请填写功能名称】
     */
    @PostMapping
    public AjaxResult add(@RequestBody OGoodsSupplier scmSupplier)
    {
        scmSupplier.setCreateTime(new Date());
        scmSupplier.setIsDelete(0);
        return toAjax(supplierService.save(scmSupplier));
    }

    /**
     * 修改【请填写功能名称】
     */
    @PutMapping
    public AjaxResult edit(@RequestBody OGoodsSupplier scmSupplier)
    {
        return toAjax(supplierService.updateById(scmSupplier));
    }

    /**
     * 删除【请填写功能名称】
     */
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(supplierService.removeByIds(Arrays.stream(ids).toList()));
    }

    @PostMapping("/setLoginName")
    public AjaxResult setLoginName(@RequestBody OGoodsSupplier scmSupplier)
    {
        if(scmSupplier.getId()==null) return AjaxResult.error("缺少参数：id");
        if(!StringUtils.hasText(scmSupplier.getLoginName())) return AjaxResult.error("请输入登录名");
        if(!StringUtils.hasText(scmSupplier.getLoginPwd())) return AjaxResult.error("请输入登录密码");

        OGoodsSupplier supplier = supplierService.getById(scmSupplier.getId());
        if(supplier==null) return AjaxResult.error("供应商不存在");
        if(StringUtils.isEmpty(supplier.getLoginName())  || !supplier.getLoginName().equals(scmSupplier.getLoginName())) {
            OGoodsSupplier tmp = supplierService.getByLoginName(scmSupplier.getLoginName());
            if (tmp != null) return AjaxResult.error("登录账号已存在");
        }
        OGoodsSupplier update = new OGoodsSupplier();
        update.setId(supplier.getId());
        update.setLoginName(scmSupplier.getLoginName());
        String salt = PasswordUtils.generateSalt();
        update.setLoginSlat(salt);
        update.setLoginPwd(PasswordUtils.hashPasswordWithSalt(scmSupplier.getLoginPwd(),salt));
        update.setUpdateBy(getUsername());
        update.setUpdateTime(new Date());
        supplierService.updateById(update);

        return AjaxResult.success();
    }
}
