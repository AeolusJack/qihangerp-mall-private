package cn.qihangerp.module.user.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.user.domain.MallUser;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【mall_user(市场用户表)】的数据库操作Service
* @createDate 2025-03-27 20:52:20
*/
public interface MallUserService extends IService<MallUser> {
    MallUser getByMobile(String mobile);
    PageResult<MallUser> queryPageList(MallUser bo, PageQuery pageQuery);
}
