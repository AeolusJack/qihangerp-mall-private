package cn.qihangerp.mall.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
public class CartResponse {
    private Integer cartTotal;
    private List<Cart> list;
    @NoArgsConstructor
    @Data
    public static class Cart{

        @JsonProperty("id")
        private Integer id;
        @JsonProperty("goods_id")
        private Integer goodsId;
        @JsonProperty("goods_sku_id")
        private String goodsSkuId;
        @JsonProperty("goods_num")
        private Integer goodsNum;
        @JsonProperty("user_id")
        private Long userId;
        @JsonProperty("is_delete")
        private Integer isDelete;
        @JsonProperty("store_id")
        private Integer storeId;
        @JsonProperty("create_time")
        private String createTime;
        @JsonProperty("update_time")
        private String updateTime;
        @JsonProperty("goods")
        private Goods goods;

        @NoArgsConstructor
        @Data
        public static class Goods{

            @JsonProperty("goods_id")
            private Integer goodsId;
            @JsonProperty("goods_name")
            private String goodsName;
            @JsonProperty("goods_no")
            private String goodsNo;
            @JsonProperty("video_id")
            private Integer videoId;
            @JsonProperty("video_cover_id")
            private Integer videoCoverId;
            @JsonProperty("selling_point")
            private String sellingPoint;
            @JsonProperty("spec_type")
            private Integer specType;
            @JsonProperty("goods_price_min")
            private String goodsPriceMin;
            @JsonProperty("goods_price_max")
            private String goodsPriceMax;
            @JsonProperty("line_price_min")
            private String linePriceMin;
            @JsonProperty("line_price_max")
            private String linePriceMax;
            @JsonProperty("stock_total")
            private Integer stockTotal;
            @JsonProperty("delivery_id")
            private Integer deliveryId;
            @JsonProperty("is_points_gift")
            private Integer isPointsGift;
            @JsonProperty("is_points_discount")
            private Integer isPointsDiscount;
            @JsonProperty("is_alone_points_discount")
            private Integer isAlonePointsDiscount;
            @JsonProperty("points_discount_config")
            private String pointsDiscountConfig;
            @JsonProperty("is_enable_grade")
            private Integer isEnableGrade;
            @JsonProperty("is_alone_grade")
            private Integer isAloneGrade;
            @JsonProperty("alone_grade_equity")
            private List<?> aloneGradeEquity;
            @JsonProperty("status")
            private Integer status;
            @JsonProperty("goods_image")
            private String goodsImage;
            @JsonProperty("goods_sales")
            private Integer goodsSales;
            @JsonProperty("is_user_grade")
            private Boolean isUserGrade;
            @JsonProperty("skuInfo")
            private SkuInfoDTO skuInfo;

            @NoArgsConstructor
            @Data
            public static class SkuInfoDTO {
                @JsonProperty("id")
                private Integer id;
                @JsonProperty("goods_sku_id")
                private String goodsSkuId;
                @JsonProperty("goods_id")
                private Integer goodsId;
                @JsonProperty("image_id")
                private Integer imageId;
                @JsonProperty("goods_sku_no")
                private String goodsSkuNo;
                @JsonProperty("goods_price")
                private String goodsPrice;
                @JsonProperty("line_price")
                private String linePrice;
                @JsonProperty("stock_num")
                private Integer stockNum;
                @JsonProperty("goods_weight")
                private Integer goodsWeight;
                @JsonProperty("goods_props")
                private Object goodsProps;
                @JsonProperty("spec_value_ids")
                private Object specValueIds;
                @JsonProperty("store_id")
                private Integer storeId;
                @JsonProperty("create_time")
                private String createTime;
                @JsonProperty("update_time")
                private String updateTime;
            }
        }
    }
}
