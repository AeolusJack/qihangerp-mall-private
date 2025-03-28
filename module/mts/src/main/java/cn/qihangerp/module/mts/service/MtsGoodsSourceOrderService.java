package cn.qihangerp.module.mts.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.mts.domain.MtsGoodsSource;
import cn.qihangerp.module.mts.domain.MtsGoodsSourceOrder;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【mts_goods_source_accept(货源信息接单表)】的数据库操作Service
* @createDate 2025-03-28 18:04:15
*/
public interface MtsGoodsSourceOrderService extends IService<MtsGoodsSourceOrder> {
    PageResult<MtsGoodsSourceOrder> queryPageList(Long userId, Integer status, PageQuery pageQuery);
}
