package cn.qihangerp.module.mall.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.module.mall.domain.MallGoodsAttachment;
import cn.qihangerp.module.mall.domain.MallGoodsAttribute;
import cn.qihangerp.module.mall.domain.MallGoodsSku;
import cn.qihangerp.module.mall.domain.bo.GoodsPublishBo;
import cn.qihangerp.module.mall.service.MallGoodsAttachmentService;
import cn.qihangerp.module.mall.service.MallGoodsAttributeService;
import cn.qihangerp.module.mall.service.MallGoodsSkuService;
import cn.qihangerp.module.user.domain.MallUser;
import cn.qihangerp.module.user.service.MallUserService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.module.mall.domain.MallGoods;
import cn.qihangerp.module.mall.service.MallGoodsService;
import cn.qihangerp.module.mall.mapper.MallGoodsMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;

/**
* @author qilip
* @description 针对表【mall_goods(商品表)】的数据库操作Service实现
* @createDate 2025-03-29 15:21:00
*/
@AllArgsConstructor
@Service
public class MallGoodsServiceImpl extends ServiceImpl<MallGoodsMapper, MallGoods>
    implements MallGoodsService{

    private final MallUserService mallUserService;
    private final MallGoodsAttachmentService goodsAttachmentService;
    private final MallGoodsAttributeService goodsAttributeService;
    private final MallGoodsSkuService goodsSkuService;

    @Override
    public PageResult<MallGoods> querySalePageList(MallGoods bo, PageQuery pageQuery) {
        LambdaQueryWrapper<MallGoods> queryWrapper = new LambdaQueryWrapper<MallGoods>();
        queryWrapper.eq(MallGoods::getSaleStatus,1);
        queryWrapper.eq(bo.getCategoryId()!=null,MallGoods::getCategoryId,bo.getCategoryId());
        pageQuery.setOrderByColumn("goods_id");
        pageQuery.setIsAsc("desc");
        Page<MallGoods> pages = this.baseMapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(pages);
    }

    @Override
    public MallGoods queryById(Long id) {
        MallGoods goods = this.baseMapper.selectById(id);
        if(goods!=null){
            goods.setGoodsImages(goodsAttachmentService.list(new LambdaQueryWrapper<MallGoodsAttachment>()
                    .eq(MallGoodsAttachment::getGoodsId,goods.getGoodsId())
                    .eq(MallGoodsAttachment::getType,0)
            ));
        }
        return goods;
    }

    /**
     * 发布商城商品
     * @param userId
     * @param goods
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public ResultVo<Long> publishGoods(Long userId, GoodsPublishBo goods) {
        MallUser user = mallUserService.getById(userId);
        if(user==null) return ResultVo.error("用户不存在");
        else if (user.getBusinessType()!=10) {
            return ResultVo.error("只能谈判人身份发布商品信息");
        }

        // 添加商城商品
        MallGoods good = new MallGoods();
        good.setGoodsSourceId(0L);
        good.setTitle(goods.getTitle());
        good.setMainImage(goods.getPicList()[0]);
//        good.setGoodsTypeId(source.getTypeId());
        if(goods.getCategoryId()!=null){
            good.setCategoryId(goods.getCategoryId());
        }
        good.setPriceMax(goods.getPrice());
        good.setPriceMin(goods.getPrice());
        good.setLinePriceMax(goods.getPrice());
        good.setLinePriceMin(goods.getPrice());
        good.setSalePrice(goods.getPrice());
        good.setMarketPrice(goods.getPrice());
        good.setDetail(goods.getDetail());
        if(goods.getDetailPicList()!=null && goods.getDetailPicList().length>0) {
            good.setDetailPics(String.join(",", goods.getDetailPicList()));
        }
        good.setPublishStatus(1);
        good.setSaleStatus(1);
        good.setCreateOn(System.currentTimeMillis()/1000);
        good.setCreateBy(user.getUserName());
        good.setShopSellerId(userId);
//        good.setShopContactsId(source.getUserId());
//        good.setShopContacts(source.getSourceContacts());
//        good.setShopMobile(source.getSourceMobile());
//        good.setShopWx(source.getSourceWx());
        this.baseMapper.insert(good);

        // 添加附件
        int picSort = 0;
        for(String pic:goods.getPicList()){
            MallGoodsAttachment attachment = new MallGoodsAttachment();
            attachment.setGoodsId(good.getGoodsId());
            attachment.setType(0);
            attachment.setUrl(pic);
            attachment.setSort(picSort);
            attachment.setCreateOn(System.currentTimeMillis()/1000);
            attachment.setCreateBy(user.getUserName());
            goodsAttachmentService.save(attachment);
            picSort++;
        }

        // 添加属性
        MallGoodsAttribute model = new MallGoodsAttribute();
        model.setGoodsId(good.getGoodsId());
        model.setAttributeId(100L);//固定ID
        model.setAttribute("型号");
//        model.setValueId(source.getModelId());
//        model.setValue(source.getModel());
        goodsAttributeService.save(model);

        MallGoodsAttribute brand = new MallGoodsAttribute();
        brand.setGoodsId(good.getGoodsId());
        brand.setAttributeId(500L);
        brand.setAttribute("品牌");
//        brand.setValueId(source.getBrandId());
//        brand.setValue(source.getBrand());
        goodsAttributeService.save(brand);
        if(StringUtils.hasText(goods.getFz())) {
            MallGoodsAttribute fz = new MallGoodsAttribute();
            fz.setGoodsId(good.getGoodsId());
            fz.setAttributeId(0L);
            fz.setAttribute("封装");
            fz.setValueId(0L);
            fz.setValue(goods.getFz());
            goodsAttributeService.save(fz);
        }
        if(StringUtils.hasText(goods.getPici())) {
            MallGoodsAttribute pici = new MallGoodsAttribute();
            pici.setGoodsId(good.getGoodsId());
            pici.setAttributeId(0L);
            pici.setAttribute("批次");
            pici.setValueId(0L);
            pici.setValue(goods.getPici());
            goodsAttributeService.save(pici);
        }
        if(StringUtils.hasText(goods.getValidityPeriod())) {
            MallGoodsAttribute period = new MallGoodsAttribute();
            period.setGoodsId(good.getGoodsId());
            period.setAttributeId(0L);
            period.setAttribute("有效期");
            period.setValueId(0L);
            period.setValue(goods.getValidityPeriod());
            goodsAttributeService.save(period);
        }
        //添加sku
        MallGoodsSku sku = new MallGoodsSku();
        sku.setGoodsId(good.getGoodsId());
//        sku.setSkuName(source.getModel());
        sku.setColorId(100L);
//        sku.setColorValue(source.getModel());
        sku.setColorImage(good.getMainImage());
        sku.setPrice(goods.getPrice());
        sku.setLinePrice(goods.getPrice());
        sku.setQty(goods.getQuantity());
        sku.setMinQty(goods.getMinQty());
        sku.setCreateOn(System.currentTimeMillis()/1000);
        sku.setCreateBy(user.getUserName());
        goodsSkuService.save(sku);

        return ResultVo.success(good.getGoodsId());
    }
}




