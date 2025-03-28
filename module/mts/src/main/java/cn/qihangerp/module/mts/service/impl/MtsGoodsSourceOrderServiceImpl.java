package cn.qihangerp.module.mts.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.mts.domain.MtsGoodsSource;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.module.mts.domain.MtsGoodsSourceOrder;
import cn.qihangerp.module.mts.service.MtsGoodsSourceOrderService;
import cn.qihangerp.module.mts.mapper.MtsGoodsSourceOrderMapper;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【mts_goods_source_accept(货源信息接单表)】的数据库操作Service实现
* @createDate 2025-03-28 18:04:15
*/
@Service
public class MtsGoodsSourceOrderServiceImpl extends ServiceImpl<MtsGoodsSourceOrderMapper, MtsGoodsSourceOrder>
    implements MtsGoodsSourceOrderService {

    @Override
    public PageResult<MtsGoodsSourceOrder> queryPageList(Long userId, Integer status, PageQuery pageQuery) {
        LambdaQueryWrapper<MtsGoodsSourceOrder> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(MtsGoodsSourceOrder::getUserId, userId);
        queryWrapper.eq(status!=null,MtsGoodsSourceOrder::getStatus, status);

        Page<MtsGoodsSourceOrder> pages = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }
}




