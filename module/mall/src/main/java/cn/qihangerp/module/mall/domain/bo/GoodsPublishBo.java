package cn.qihangerp.module.mall.domain.bo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 商品管理对象 erp_goods
 *
 * @author qihang
 * @date 2023-12-29
 */
@Data
public class GoodsPublishBo
{

    /** goodsSourceId */
    private Long goodsSourceId;
    private Long goodsSourceOrderId;

    /** 商品名称 */
    private String title;

    /** 商品图片地址 */
    private String image;
    private String[] picList;
    private BigDecimal price;
    private Integer quantity;
    /** 商品分类ID */
    private Long categoryId;

    private String fz;
    private String pici;
    private String validityPeriod;
    private String remark;
    private Integer minQty;

    /** 详情 **/
    private String[] detailPicList;
    private String detail;

}
