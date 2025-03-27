package cn.qihangerp.module.user.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.module.user.domain.MallUser;
import cn.qihangerp.module.user.service.MallUserService;
import cn.qihangerp.module.user.mapper.MallUserMapper;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【mall_user(市场用户表)】的数据库操作Service实现
* @createDate 2025-03-27 20:52:20
*/
@Service
public class MallUserServiceImpl extends ServiceImpl<MallUserMapper, MallUser>
    implements MallUserService{

    @Override
    public PageResult<MallUser> queryPageList(MallUser bo, PageQuery pageQuery) {
        LambdaQueryWrapper<MallUser> queryWrapper = new LambdaQueryWrapper<>();

        Page<MallUser> pages = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }
}




