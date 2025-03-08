package cn.qihangerp.module.order.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.order.domain.OSupplierShipOrder;
import cn.qihangerp.module.order.domain.bo.SupplierShipOrderItemListBo;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.module.order.domain.OSupplierShipOrderItem;
import cn.qihangerp.module.order.service.OSupplierShipOrderItemService;
import cn.qihangerp.module.order.mapper.OSupplierShipOrderItemMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
* @author qilip
* @description 针对表【o_supplier_ship_order_item】的数据库操作Service实现
* @createDate 2025-02-18 13:48:13
*/
@AllArgsConstructor
@Service
public class OSupplierShipOrderItemServiceImpl extends ServiceImpl<OSupplierShipOrderItemMapper, OSupplierShipOrderItem>
    implements OSupplierShipOrderItemService{
    private final OSupplierShipOrderItemMapper shipOrderItemMapper;

    @Override
    public PageResult<OSupplierShipOrderItem> queryPageList2(SupplierShipOrderItemListBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OSupplierShipOrderItem> queryWrapper = new LambdaQueryWrapper<OSupplierShipOrderItem>()
                .eq(OSupplierShipOrderItem::getSupplierId,bo.getSupplierId())
                .eq(StringUtils.hasText(bo.getOrderNum()),OSupplierShipOrderItem::getOrderNum,bo.getOrderNum())
                .eq(StringUtils.hasText(bo.getSkuCode()),OSupplierShipOrderItem::getSkuCode,bo.getSkuCode())
                .eq(bo.getSendStatus()!=null,OSupplierShipOrderItem::getSendStatus,bo.getSendStatus())
                .eq(bo.getRefundStatus()!=null,OSupplierShipOrderItem::getRefundStatus,bo.getRefundStatus());

        pageQuery.setOrderByColumn("id");
        pageQuery.setIsAsc("desc");
        Page<OSupplierShipOrderItem> pages = shipOrderItemMapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(pages);
    }
}




