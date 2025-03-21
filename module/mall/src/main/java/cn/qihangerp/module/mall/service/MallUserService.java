package cn.qihangerp.module.mall.service;

import cn.qihangerp.module.mall.domain.MallUser;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【mall_user(市场用户表)】的数据库操作Service
* @createDate 2025-03-21 12:54:57
*/
public interface MallUserService extends IService<MallUser> {
    MallUser getByMobile(String mobile);
}
