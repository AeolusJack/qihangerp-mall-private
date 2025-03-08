package cn.qihangerp.module.order.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.order.domain.OSupplierShipOrder;
import cn.qihangerp.module.order.domain.OSupplierShipOrderItem;
import cn.qihangerp.module.order.domain.bo.SupplierShipOrderItemListBo;
import cn.qihangerp.request.SupplierShipOrderSearchRequest;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【o_supplier_ship_order_item】的数据库操作Service
* @createDate 2025-02-18 13:48:13
*/
public interface OSupplierShipOrderItemService extends IService<OSupplierShipOrderItem> {
    PageResult<OSupplierShipOrderItem> queryPageList2(SupplierShipOrderItemListBo bo, PageQuery pageQuery);
}
