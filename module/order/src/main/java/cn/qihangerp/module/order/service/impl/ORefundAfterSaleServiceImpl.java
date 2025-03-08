package cn.qihangerp.module.order.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.order.domain.ORefundAfterSale;
import cn.qihangerp.module.order.mapper.ORefundAfterSaleMapper;
import cn.qihangerp.module.order.service.ORefundAfterSaleService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【o_after_sale(OMS售后处理表)】的数据库操作Service实现
* @createDate 2024-09-15 21:30:30
*/
@AllArgsConstructor
@Service
public class ORefundAfterSaleServiceImpl extends ServiceImpl<ORefundAfterSaleMapper, ORefundAfterSale>
    implements ORefundAfterSaleService {
    private final ORefundAfterSaleMapper mapper;
    @Override
    public PageResult<ORefundAfterSale> queryPageList(ORefundAfterSale bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ORefundAfterSale> queryWrapper = new LambdaQueryWrapper<ORefundAfterSale>()
        .eq( bo.getStatus()!=null, ORefundAfterSale::getStatus, bo.getStatus())
        .eq( bo.getSupplierId()!=null, ORefundAfterSale::getSupplierId, bo.getSupplierId())
                .eq( bo.getType()!=null, ORefundAfterSale::getType, bo.getType())
                .eq(StringUtils.isNotBlank(bo.getRefundNum()), ORefundAfterSale::getRefundNum, bo.getRefundNum())
                .eq(StringUtils.isNotBlank(bo.getOrderNum()), ORefundAfterSale::getOrderNum, bo.getOrderNum())
                .eq(StringUtils.isNotBlank(bo.getSkuCode()), ORefundAfterSale::getSkuCode, bo.getSkuCode())
                .eq(bo.getShopId() != null, ORefundAfterSale::getShopId, bo.getShopId());

        Page<ORefundAfterSale> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }
}




