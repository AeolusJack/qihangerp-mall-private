package cn.qihangerp.mall.controller;


import cn.qihangerp.common.*;
import cn.qihangerp.mall.response.CartResponse;
import cn.qihangerp.module.goods.domain.OGoods;
import cn.qihangerp.utils.JwtUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/cart")
public class CartController extends BaseController {
    /**
     * 查询商品管理列表
     */
    @GetMapping("/list")
    public AjaxResult list(OGoods goods, PageQuery pageQuery, HttpServletRequest request)
    {
        CartResponse response = new CartResponse();
        response.setCartTotal(1);
        List<CartResponse.Cart> goodsList = new ArrayList<>();
        CartResponse.Cart cart = new CartResponse.Cart();
        cart.setGoodsNum(1);
        cart.setGoodsSkuId("100");
        cart.setGoodsId(98);
        cart.setId(12);
        cart.setIsDelete(0);
        cart.setUserId(getUserId(request));
        cart.setCreateTime("2025-03-21 15:00:09");
        CartResponse.Cart.Goods goods2 = new CartResponse.Cart.Goods();
        goods2.setGoodsId(100);
        goods2.setGoodsName("[酒别重逢]贵州茅台酒 机场纪念茅台53度500ml+50ml*2酱香型白酒");
        goods2.setGoodsImage("http:\\/\\/smart-shop.itheima.net\\/uploads\\/10001\\/20230321\\/5c5c095502c09a9adae70d1d691b0166.jpg");

        CartResponse.Cart.Goods.SkuInfoDTO goodsSkuInfoDTO = new CartResponse.Cart.Goods.SkuInfoDTO();
        goodsSkuInfoDTO.setGoodsPrice("5999.00");
        goods2.setSkuInfo(goodsSkuInfoDTO);

        cart.setGoods(goods2);
        goodsList.add(cart);

        response.setList(goodsList);
        return AjaxResult.success(response);
    }
}
