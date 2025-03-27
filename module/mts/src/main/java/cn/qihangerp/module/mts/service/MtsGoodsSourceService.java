package cn.qihangerp.module.mts.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.module.mts.bo.GoodsSourcePublishRequest;
import cn.qihangerp.module.mts.domain.MtsGoodsSource;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【mts_goods_source】的数据库操作Service
* @createDate 2025-03-26 10:14:16
*/
public interface MtsGoodsSourceService extends IService<MtsGoodsSource> {
    PageResult<MtsGoodsSource> queryPageList(Long userId,Integer status,Integer phase, PageQuery pageQuery);
    ResultVo addSource(GoodsSourcePublishRequest publish,Long userId);
}
