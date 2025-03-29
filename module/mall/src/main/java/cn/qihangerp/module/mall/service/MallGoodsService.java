package cn.qihangerp.module.mall.service;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.module.mall.domain.MallGoods;
import cn.qihangerp.module.mall.domain.bo.GoodsPublishBo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【mall_goods(商品表)】的数据库操作Service
* @createDate 2025-03-29 15:21:00
*/
public interface MallGoodsService extends IService<MallGoods> {
    ResultVo<Long> publishGoods(Long userId , GoodsPublishBo goods);
}
