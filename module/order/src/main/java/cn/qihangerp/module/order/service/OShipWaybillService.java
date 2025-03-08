package cn.qihangerp.module.order.service;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.module.order.domain.OShipWaybill;
import cn.qihangerp.module.order.domain.OSupplierShipOrder;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author qilip
* @description 针对表【o_ship_waybill(发货电子面单记录表（打单记录）)】的数据库操作Service
* @createDate 2024-07-28 18:29:53
*/
public interface OShipWaybillService extends IService<OShipWaybill> {
     ResultVo<Integer> waybillUpdate(OShipWaybill shipWaybill);
     List<OShipWaybill> getListByOrderIds(Long shopId, String[] orderIds);
     List<OShipWaybill> getListBySupplierShipOrderIds( String[] orderIds);
     ResultVo<Integer> printSuccess(Long shopId,String[] orderIds);
     ResultVo<Integer> supplierPrintSuccess(String supplierShipOrderId);
     ResultVo<Integer> pushShipSend(Long shopId,String[] orderIds);
     ResultVo<Integer> pushSupplierShipSend(String supplierShipOrderId);
     ResultVo<OShipWaybill> cancelWaybillCode(Long supplierShipOrderId,String orderNum);

     ResultVo<Long> updateWaybillCode(OSupplierShipOrder supplierShipOrder,String templateUrl,int waybillStatus);
     ResultVo<Long> updateSendStatus(Long supplierShipOrderId);

}
