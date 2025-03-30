package cn.qihangerp.module.mall.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.domain.OShop;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.module.mall.domain.MallShop;
import cn.qihangerp.module.mall.service.MallShopService;
import cn.qihangerp.module.mall.mapper.MallShopMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
* @author qilip
* @description 针对表【mall_shop(店铺表)】的数据库操作Service实现
* @createDate 2025-03-30 20:36:34
*/
@AllArgsConstructor
@Service
public class MallShopServiceImpl extends ServiceImpl<MallShopMapper, MallShop>
    implements MallShopService{

    @Override
    public PageResult<MallShop> queryPageList(MallShop bo, PageQuery pageQuery) {
        LambdaQueryWrapper<MallShop> queryWrapper = new LambdaQueryWrapper<MallShop>()
                .likeRight(StringUtils.hasText(bo.getName()), MallShop::getName, bo.getName())
                .eq(bo.getType()!=null, MallShop::getType, bo.getType())
                .eq(bo.getRegionId() != null, MallShop::getRegionId, bo.getRegionId());

        Page<MallShop> pages = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }

    @Override
    public List<MallShop> selectShopList(MallShop shop) {
        LambdaQueryWrapper<MallShop> qw = new LambdaQueryWrapper<MallShop>()
                .eq(shop.getType()!=null, MallShop::getType,shop.getType())
                .eq(shop.getShopGroupId()!=null, MallShop::getShopGroupId,shop.getShopGroupId())
                .eq(shop.getManageUserId()!=null&&shop.getManageUserId()!=1,MallShop::getManageUserId,shop.getManageUserId())
                ;
        return this.baseMapper.selectList(qw);
    }

    @Override
    public int insertShop(MallShop shop) {
        return this.baseMapper.insert(shop);
    }

    @Override
    public int updateShopById(MallShop shop) {
        return this.baseMapper.updateById(shop);
    }
}




