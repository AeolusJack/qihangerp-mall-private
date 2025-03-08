package cn.qihangerp.module.order.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.module.order.domain.ORefund;
import cn.qihangerp.module.order.domain.OSupplierRefund;
import cn.qihangerp.module.order.domain.bo.RefundProcessingBo;
import cn.qihangerp.module.order.domain.bo.RefundSearchBo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【o_supplier_refund(供应商售后表)】的数据库操作Service
* @createDate 2025-02-22 11:22:40
*/
public interface OSupplierRefundService extends IService<OSupplierRefund> {
    PageResult<OSupplierRefund> queryPageList(RefundSearchBo bo, PageQuery pageQuery);
    /**
     * 售后处理
     * @param processingBo
     * @return
     */
    ResultVo<Long> refundProcessing(RefundProcessingBo processingBo, String createBy,Long supplierId);
}
