package cn.qihangerp.module.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.module.mall.domain.MallUser;
import cn.qihangerp.module.mall.service.MallUserService;
import cn.qihangerp.module.mall.mapper.MallUserMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【mall_user(市场用户表)】的数据库操作Service实现
* @createDate 2025-03-21 12:54:57
*/
@AllArgsConstructor
@Service
public class MallUserServiceImpl extends ServiceImpl<MallUserMapper, MallUser>
    implements MallUserService{

    @Override
    public MallUser getByMobile(String mobile) {
        return this.baseMapper.selectOne(new LambdaQueryWrapper<MallUser>().eq(MallUser::getMobile, mobile));
    }
}




