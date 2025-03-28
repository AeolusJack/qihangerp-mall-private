package cn.qihangerp.module.mts.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;

import cn.qihangerp.module.mts.bo.GoodsSourcePublishRequest;
import cn.qihangerp.module.mts.domain.MtsGoodsSourceAccept;
import cn.qihangerp.module.mts.mapper.MtsGoodsSourceAcceptMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.module.mts.domain.MtsGoodsSource;
import cn.qihangerp.module.mts.service.MtsGoodsSourceService;
import cn.qihangerp.module.mts.mapper.MtsGoodsSourceMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
* @author qilip
* @description 针对表【mts_goods_source】的数据库操作Service实现
* @createDate 2025-03-26 10:14:16
*/
@Slf4j
@AllArgsConstructor
@Service
public class MtsGoodsSourceServiceImpl extends ServiceImpl<MtsGoodsSourceMapper, MtsGoodsSource>
    implements MtsGoodsSourceService{
    private final MtsGoodsSourceAcceptMapper mtsGoodsSourceAcceptMapper;
    @Override
    public PageResult<MtsGoodsSource> queryPageList(MtsGoodsSource bo, PageQuery pageQuery) {
        LambdaQueryWrapper<MtsGoodsSource> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(bo.getAcceptStatus() != null, MtsGoodsSource::getAcceptStatus, bo.getAcceptStatus());
        queryWrapper.eq(bo.getPhase() != null, MtsGoodsSource::getPhase, bo.getPhase());
        queryWrapper.eq(bo.getStatus() != null, MtsGoodsSource::getStatus, bo.getStatus());
        Page<MtsGoodsSource> pages = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }

    @Override
    public PageResult<MtsGoodsSource> queryPageList(Long userId,Integer status, Integer phase, PageQuery pageQuery) {
        LambdaQueryWrapper<MtsGoodsSource> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(MtsGoodsSource::getUserId, userId);
        queryWrapper.eq(MtsGoodsSource::getStatus, status);
        queryWrapper.eq(MtsGoodsSource::getPhase, phase);
        Page<MtsGoodsSource> pages = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }

    @Override
    public ResultVo addSource(GoodsSourcePublishRequest publish,Long userId,String userName) {
        if(publish.getPicList()==null || publish.getPicList().length==0){
            return ResultVo.error("至少需要上传一张图片");
        }
        MtsGoodsSource mtsGoodsSource = new MtsGoodsSource();
        mtsGoodsSource.setUserId(userId);
        mtsGoodsSource.setUserName(userName);
        mtsGoodsSource.setUserMobile(userName);
        mtsGoodsSource.setImage(publish.getPicList()[0]);
        mtsGoodsSource.setPictures(String.join(",", publish.getPicList()));
        mtsGoodsSource.setModel(publish.getModel());
        mtsGoodsSource.setModelId(publish.getModelId());
        mtsGoodsSource.setBrand(publish.getBrand());
        mtsGoodsSource.setBrandId(publish.getBrandId());
        mtsGoodsSource.setType(publish.getType());
        mtsGoodsSource.setTypeId(publish.getTypeId());
        mtsGoodsSource.setSourceContacts(publish.getSourceContacts());
        mtsGoodsSource.setSourceMobile(publish.getSourceMobile());
        mtsGoodsSource.setSourceWx(publish.getSourceWx());
        mtsGoodsSource.setSellerContacts(publish.getSellerContacts());
        mtsGoodsSource.setSellerMobile(publish.getSellerMobile());
        mtsGoodsSource.setSellerWx(publish.getSellerWx());
        mtsGoodsSource.setPrice(publish.getPrice());
        mtsGoodsSource.setQuantity(publish.getQuantity());
        mtsGoodsSource.setMinQty(publish.getMinQty());
        mtsGoodsSource.setFz(publish.getFz());
        mtsGoodsSource.setPici(publish.getPici());
        mtsGoodsSource.setValidityPeriod(publish.getValidityPeriod());
        mtsGoodsSource.setRemark(publish.getRemark());
        mtsGoodsSource.setStatus(1);
        mtsGoodsSource.setAcceptStatus(0);
        mtsGoodsSource.setPhase(0);
        mtsGoodsSource.setCreateTime(new Date());
        this.baseMapper.insert(mtsGoodsSource);
        return ResultVo.success();
    }

    @Override
    public ResultVo audit(Long id, Long userId, String userName) {
        MtsGoodsSource mtsGoodsSource = this.baseMapper.selectById(id);
        if(mtsGoodsSource==null){
            return ResultVo.error("数据不存在");
        }else if(mtsGoodsSource.getStatus()!=1){
            return ResultVo.error("状态不对");
        }
        MtsGoodsSource update = new MtsGoodsSource();
        update.setId(id);
        update.setStatus(2);
        update.setAuditUserId(userId);
        update.setAuditUserName(userName);
        update.setAuditTime(new Date());
        update.setUpdateTime(new Date());
        this.baseMapper.updateById(update);
        return ResultVo.success();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public ResultVo acceptSourceOrder(Long id, Long userId, String userName) {
        MtsGoodsSource mtsGoodsSource = this.baseMapper.selectById(id);
        if(mtsGoodsSource==null){return ResultVo.error("未找到数据");
        }else if(mtsGoodsSource.getStatus()!=2 && mtsGoodsSource.getAcceptStatus()!=0){
            return ResultVo.error("状态不对，无法操作");
        } else if (mtsGoodsSource.getPhase()!=0) {
            return ResultVo.error("已被接单");
        }
        // 加入接单数据
        MtsGoodsSourceAccept accept = new MtsGoodsSourceAccept();
        accept.setGoodsSourceId(id);
        accept.setUserId(userId);
        accept.setIdentity(10);
        accept.setStatus(1);
        accept.setAcceptTime(new Date());
        mtsGoodsSourceAcceptMapper.insert(accept);
        // 更新自己的状态
        MtsGoodsSource update = new MtsGoodsSource();
        update.setId(id);
        update.setAcceptStatus(1);
        update.setPhase(1);
        update.setAcceptUserId(userId);
        update.setAcceptUserName(userName);
        update.setAcceptUserMobile(userName);
        update.setUpdateTime(new Date());
        update.setAcceptTime(new Date());
        this.baseMapper.updateById(update);
        return ResultVo.success();
    }
}




