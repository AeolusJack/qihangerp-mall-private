package cn.qihangerp.module.mall.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.domain.OShop;
import cn.qihangerp.module.mall.domain.MallShop;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author qilip
* @description 针对表【mall_shop(店铺表)】的数据库操作Service
* @createDate 2025-03-30 20:36:34
*/
public interface MallShopService extends IService<MallShop> {
    PageResult<MallShop> queryPageList(MallShop bo, PageQuery pageQuery);
    List<MallShop> selectShopList(MallShop shop);
    int insertShop(MallShop shop);
    int updateShopById(MallShop shop);
}
