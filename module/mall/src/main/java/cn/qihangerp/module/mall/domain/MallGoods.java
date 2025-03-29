package cn.qihangerp.module.mall.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * 商品表
 * @TableName mall_goods
 */
@TableName(value ="mall_goods")
@Data
public class MallGoods implements Serializable {
    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long goodsId;

    /**
     * 货源id
     */
    private Long goodsSourceId;

    /**
     * 商品编码
     */
    private String goodsCode;

    /**
     * '产品主图'
     */
    private String mainImage;

    /**
     * '商品标题'
     */
    private String title;

    /**
     * 商品副标题
     */
    private String deputyTitle;

    /**
     * 商品最高价
     */
    private BigDecimal priceMax;

    /**
     * 商品最低价
     */
    private BigDecimal priceMin;

    /**
     * 划线最高价
     */
    private BigDecimal linePriceMax;

    /**
     * 划线最低价
     */
    private BigDecimal linePriceMin;

    /**
     * 销售价格
     */
    private BigDecimal salePrice;

    /**
     * 市场价格
     */
    private BigDecimal marketPrice;

    /**
     * 佣金比例(一级)
     */
    private BigDecimal commisionRate;

    /**
     * 佣金比例(二级)
     */
    private BigDecimal commisionRate2;

    /**
     * '产品简短介绍，参照京东商品红色文字'
     */
    private String detail;

    /**
     * 详情图片（按顺序）
     */
    private String detailPics;

    /**
     * 商品类型id
     */
    private Long goodsTypeId;

    /**
     * 商品分类id
     */
    private Long categoryId;

    /**
     * 产品一级分类
     */
    private Long category1;

    /**
     * 产品二级分类
     */
    private Long category2;

    /**
     * 产品三级分类
     */
    private Long category3;

    /**
     * 排序综合得分
     */
    private BigDecimal orderSocre;

    /**
     * 评论数量
     */
    private Integer commentNum;

    /**
     * 评论得分
     */
    private BigDecimal commentSocre;

    /**
     * 累积销量
     */
    private Integer saleNum;

    /**
     * 销量，用于前台显示
     */
    private Integer saleNumShow;

    /**
     * 销售模式1现售2预售
     */
    private Integer saleType;

    /**
     * 发布状态（2在库中1已上架）
     */
    private Integer publishStatus;

    /**
     * 销售状态（2已下架1上架中）
     */
    private Integer saleStatus;

    /**
     * 创建时间
     */
    private Long createOn;

    /**
     * '创建人'
     */
    private String createBy;

    /**
     * 最后修改时间
     */
    private Integer modifyOn;

    /**
     * '最后修改人'
     */
    private String modifyBy;

    /**
     * 运费模版
     */
    private Integer deliveryFreightTemplate;

    /**
     * 
发货省份
     */
    private String deliveryProvince;

    /**
     * 发货城市
     */
    private String deliveryCity;

    /**
     * 发货地文字（显示用，如：广东深圳）
     */
    private String deliveryAddress;

    /**
     * 预售发货天数
     */
    private Integer deliveryDays;

    /**
     * 关键词
     */
    private String keyword;

    /**
     * 是否在促销，0否1是默认0
     */
    private Integer isPromotion;

    /**
     * 促销id
     */
    private Integer promotionId;

    /**
     * 促销类型
     */
    private Integer promotionType;

    /**
     * 促销标题
     */
    private String promotionTitle;

    /**
     * 促销的折扣
     */
    private Integer promotionRate;

    /**
     * 单品满折条件
     */
    private Integer promotionFullCount;

    /**
     * 商品库商品id
     */
    private Integer oGoodsId;

    /**
     * 店铺卖家id（谁发布的）
     */
    private Long shopSellerId;

    /**
     * 谈判人userId
     */
    private Long shopContactsId;

    /**
     * 卖家联系人（谈判联系人）
     */
    private String shopContacts;

    /**
     * 卖家联系手机号（谈判联系人）
     */
    private String shopMobile;

    /**
     * 卖家联系微信（谈判联系人）
     */
    private String shopWx;

    @TableField(exist = false)
    @JsonProperty("goods_images")
    private List<MallGoodsAttachment> goodsImages;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}