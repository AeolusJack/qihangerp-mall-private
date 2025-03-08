package cn.qihangerp.module.order.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.module.order.domain.OOrder;
import cn.qihangerp.module.order.domain.OSupplierShipOrder;
import cn.qihangerp.module.order.domain.OSupplierShipOrderItem;
import cn.qihangerp.module.order.domain.bo.OfflineOrderShipBo;
import cn.qihangerp.module.order.domain.bo.SupplierOrderShipBo;
import cn.qihangerp.module.order.domain.vo.DistributeSupplierShipResult;
import cn.qihangerp.request.OrderSearchRequest;
import cn.qihangerp.request.SupplierShipOrderSearchRequest;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author qilip
* @description 针对表【o_supplier_ship_order(供应商发货订单)】的数据库操作Service
* @createDate 2025-02-18 11:56:14
*/
public interface OSupplierShipOrderService extends IService<OSupplierShipOrder> {
    ResultVo<DistributeSupplierShipResult> distributeSupplierShip(String[] orderItemIds);
    PageResult<OSupplierShipOrder> queryPageList(SupplierShipOrderSearchRequest bo, PageQuery pageQuery);
//    PageResult<OSupplierShipOrder> queryStockUpPageList(String orderNum,Long supplierId, PageQuery pageQuery);
    PageResult<OSupplierShipOrder> queryStockUpPageList(SupplierShipOrderSearchRequest request, PageQuery pageQuery);
    OSupplierShipOrder queryDetailById(Long id);
    List<OSupplierShipOrderItem> getItemsByOrderId(Long shipOrderId);

    /**
     * 供应商发货
     * @param bo
     * @param operator
     * @return
     */
    ResultVo<Integer> orderLogistics(SupplierOrderShipBo bo, String operator);

}
