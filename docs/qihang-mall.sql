/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : localhost:3306
 Source Schema         : qihang-mall

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 30/03/2025 18:25:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mall_banner
-- ----------------------------
DROP TABLE IF EXISTS `mall_banner`;
CREATE TABLE `mall_banner`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sort` int NOT NULL COMMENT ' 排序（升序）',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'url',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `type` int NOT NULL COMMENT '类型（1：logo 2：banner 3 special 专题 )',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '位置（HOME首页',
  `which` int NOT NULL COMMENT '展示端1：PC 2：H5',
  `special` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专题类别',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `show_price` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示价格',
  `start_time` int NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` int NULL DEFAULT NULL COMMENT '结束时间',
  `status` int NOT NULL COMMENT '状态 1正常 0下架',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_on` int NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城Banner' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_banner
-- ----------------------------
INSERT INTO `mall_banner` VALUES (1, 12, 'AA', 'aa', 'https://smart-shop.itheima.net/uploads/10001/20230320/6d239000de9c3f12aafa571349b63d22.jpg', 2, 'HOME', 2, NULL, NULL, NULL, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (2, 12, 'BB', 'aa', 'https://smart-shop.itheima.net/uploads/10001/20230320/5901a2e13e1075882950af75c98d0007.jpg', 2, 'HOME', 2, NULL, NULL, NULL, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (3, 12, 'CC', 'aa', 'https://smart-shop.itheima.net/uploads/10001/20230320/7143e84bf3dd41fa67b9675a9e5d81a3.jpg', 2, 'HOME', 2, NULL, NULL, NULL, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (4, 11, 'AA', '/category/1019000', 'http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-15/4a79180a-1a5a-4042-8a77-4db0b9c800a8.jpg', 2, 'HOME', 1, NULL, NULL, NULL, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (5, 11, 'AA', '/category/1019000', 'http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-15/1ba86bcc-ae71-42a3-bc3e-37b662f7f07e.jpg', 2, 'HOME', 1, NULL, NULL, NULL, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (6, 11, 'AA', '/category/1019000', 'http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-15/dfc11bb0-4af5-4e9b-9458-99f615cc685a.jpg', 2, 'HOME', 1, NULL, NULL, NULL, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (7, 11, 'AA', '/category/1019000', 'http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-15/6d202d8e-bb47-4f92-9523-f32ab65754f4.jpg', 2, 'HOME', 1, NULL, NULL, NULL, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (8, 11, 'AA', '/category/1019000', 'http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-15/e83efb1b-309c-46f7-98a3-f1fefa694338.jpg', 2, 'HOME', 1, NULL, NULL, NULL, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (9, 11, '黑科技专利款100%防水保暖针织毛线帽\", desc: \"黑科技专利，做到真正的保暖防水', '/category/1019000', 'https://yanxuan-item.nosdn.127.net/3683d874b9623434a10b4ab0c2e6be9f.png', 3, 'HOME', 1, 'new', NULL, '135.00', NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (10, 11, '探险者黑胶防晒防雨遮阳伞户外钓鱼伞', '/category/1019000', 'https://yanxuan-item.nosdn.127.net/66090c5de391e43e4516601e14870842.jpg', 3, 'HOME', 1, 'new', NULL, '169.00', NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (11, 11, '趣味小恐龙绣花，男童灯芯绒衬衫', '/category/1019000', 'https://yanxuan-item.nosdn.127.net/e68d406a58622a8d850de442aacfcf2e.jpg', 3, 'HOME', 1, 'new', NULL, '89.00', NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (12, 11, '日本冰块冰球制冰模具', '/category/1019000', 'https://yanxuan-item.nosdn.127.net/2be38fc160992fe41f7d4a45bd0f90e5.png', 3, 'HOME', 1, 'new', NULL, '29.80', NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (13, 11, '特惠推荐', '/category/1019000', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/tuxian/popular_1.jpg', 3, 'HOME', 1, 'hot', '它们最实惠', '29.80', NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (14, 11, '爆款推荐', '/category/1019000', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/tuxian/popular_2.jpg', 3, 'HOME', 1, 'hot', '它们最受欢迎', '29.80', NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (15, 11, '一站买全', '/category/1019000', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/tuxian/popular_3.jpg', 3, 'HOME', 1, 'hot', '使用场景下精心优选', '29.80', NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (16, 11, '领券中心', '/category/1019000', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/tuxian/popular_4.jpg', 3, 'HOME', 1, 'hot', '更多超值优惠券', '29.80', NULL, NULL, 1, 'admin', 1739754344);

-- ----------------------------
-- Table structure for mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods`;
CREATE TABLE `mall_goods`  (
  `goods_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_source_id` bigint NOT NULL COMMENT '货源id',
  `goods_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `main_image` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '\'产品主图\'',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '\'商品标题\'',
  `deputy_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品副标题',
  `price_max` decimal(8, 2) NULL DEFAULT NULL COMMENT '商品最高价',
  `price_min` decimal(8, 2) NULL DEFAULT NULL COMMENT '商品最低价',
  `line_price_max` decimal(8, 2) NULL DEFAULT NULL COMMENT '划线最高价',
  `line_price_min` decimal(8, 2) NULL DEFAULT NULL COMMENT '划线最低价',
  `sale_price` decimal(8, 2) NOT NULL COMMENT '销售价格',
  `market_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '市场价格',
  `commision_rate` decimal(3, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金比例(一级)',
  `commision_rate2` decimal(3, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金比例(二级)',
  `detail` varchar(545) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '\'产品简短介绍，参照京东商品红色文字\'',
  `detail_pics` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情图片（按顺序）',
  `goods_type_id` bigint NOT NULL COMMENT '商品类型id',
  `category_id` bigint NOT NULL DEFAULT 0 COMMENT '商品分类id',
  `category1` bigint NOT NULL DEFAULT 0 COMMENT '产品一级分类',
  `category2` bigint NOT NULL DEFAULT 0 COMMENT '产品二级分类',
  `category3` bigint NOT NULL DEFAULT 0 COMMENT '产品三级分类',
  `order_socre` decimal(6, 2) NOT NULL DEFAULT 5.00 COMMENT '排序综合得分',
  `comment_num` int NOT NULL DEFAULT 0 COMMENT '评论数量',
  `comment_socre` decimal(4, 2) NOT NULL DEFAULT 5.00 COMMENT '评论得分',
  `sale_num` int NOT NULL DEFAULT 0 COMMENT '累积销量',
  `sale_num_show` int NOT NULL DEFAULT 0 COMMENT '销量，用于前台显示',
  `sale_type` int NOT NULL DEFAULT 1 COMMENT '销售模式1现售2预售',
  `publish_status` int NOT NULL COMMENT '发布状态（2在库中1已上架）',
  `sale_status` int NOT NULL COMMENT '销售状态（2已下架1上架中）',
  `create_on` int NOT NULL COMMENT '创建时间',
  `create_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '\'创建人\'',
  `modify_on` int NULL DEFAULT NULL COMMENT '最后修改时间',
  `modify_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '\'最后修改人\'',
  `delivery_freight_template` int NULL DEFAULT 0 COMMENT '运费模版',
  `delivery_province` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '\n发货省份',
  `delivery_city` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货城市',
  `delivery_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货地文字（显示用，如：广东深圳）',
  `delivery_days` int NULL DEFAULT 0 COMMENT '预售发货天数',
  `keyword` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `is_promotion` int NOT NULL DEFAULT 0 COMMENT '是否在促销，0否1是默认0',
  `promotion_id` int NOT NULL DEFAULT 0 COMMENT '促销id',
  `promotion_type` int NOT NULL DEFAULT 0 COMMENT '促销类型',
  `promotion_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '促销标题',
  `promotion_rate` int NOT NULL DEFAULT 0 COMMENT '促销的折扣',
  `promotion_full_count` int NOT NULL DEFAULT 1 COMMENT '单品满折条件',
  `o_goods_id` int NOT NULL DEFAULT 0 COMMENT '商品库商品id',
  `shop_seller_id` bigint NOT NULL COMMENT '店铺卖家id（谁发布的）',
  `shop_contacts_id` bigint NOT NULL COMMENT '谈判人userId',
  `shop_contacts` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卖家联系人（谈判联系人）',
  `shop_mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卖家联系手机号（谈判联系人）',
  `shop_wx` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卖家联系微信（谈判联系人）',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods
-- ----------------------------
INSERT INTO `mall_goods` VALUES (1, 2, NULL, 'http://img.huayiyungou.com/Fp9wujQ7b5r3oyqODb_hp2NVP8bj', '供应A11芯片工厂出货量大从优', NULL, 1.25, 1.25, 1.25, 1.25, 1.25, 1.25, 0.00, 0.00, NULL, NULL, 1, 0, 0, 0, 0, 5.00, 0, 5.00, 0, 0, 1, 1, 1, 1743239704, '齐李平', NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, 0, 0, NULL, 0, 1, 0, 4, 4, '老齐', '15818590111', '23233');

-- ----------------------------
-- Table structure for mall_goods_attachment
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_attachment`;
CREATE TABLE `mall_goods_attachment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` bigint NOT NULL,
  `type` int NOT NULL COMMENT '附件类型（0图片1视频2文件3详情图片4详情视频5详情图文）',
  `url` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '\'附件链接地址\'',
  `comment` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '\'附件说明\'',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `sort` int NOT NULL COMMENT '排序asc（显示位置）',
  `create_on` int NOT NULL COMMENT '创建时间',
  `create_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '\'创建人\'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品附件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods_attachment
-- ----------------------------
INSERT INTO `mall_goods_attachment` VALUES (1, 1, 0, 'http://img.huayiyungou.com/Fp9wujQ7b5r3oyqODb_hp2NVP8bj', NULL, NULL, 0, 1743239704, '齐李平');

-- ----------------------------
-- Table structure for mall_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_attribute`;
CREATE TABLE `mall_goods_attribute`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` bigint NOT NULL,
  `attribute_id` bigint NOT NULL COMMENT '属性id',
  `attribute` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value_id` bigint NOT NULL COMMENT '属性值id',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品属性表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods_attribute
-- ----------------------------
INSERT INTO `mall_goods_attribute` VALUES (1, 1, 100, '型号', 1, 'NOR Flash');
INSERT INTO `mall_goods_attribute` VALUES (2, 1, 500, '品牌', 1, '梦小妮');

-- ----------------------------
-- Table structure for mall_goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_comment`;
CREATE TABLE `mall_goods_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `goods_id` bigint NOT NULL COMMENT '商品id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `score` float NOT NULL COMMENT '评分',
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `size` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int NOT NULL COMMENT '状态1评价2已删除',
  `create_on` int NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods_comment
-- ----------------------------

-- ----------------------------
-- Table structure for mall_goods_comment_image
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_comment_image`;
CREATE TABLE `mall_goods_comment_image`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment_id` bigint NOT NULL COMMENT '评价id',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int NOT NULL COMMENT '状态1评价2已删除',
  `goods_id` bigint NOT NULL COMMENT '商品id',
  `create_on` int NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品评论图片表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods_comment_image
-- ----------------------------

-- ----------------------------
-- Table structure for mall_goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_detail`;
CREATE TABLE `mall_goods_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goods_id` bigint NOT NULL,
  `pc_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `m_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `modify_on` int NULL DEFAULT NULL,
  `modify_by` varchar(33) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attribute_text` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `spec_text` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `detail_text` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品详情表（暂时没用）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods_detail
-- ----------------------------

-- ----------------------------
-- Table structure for mall_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_sku`;
CREATE TABLE `mall_goods_sku`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` bigint NOT NULL COMMENT '外键',
  `o_goods_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '商品库商品id',
  `o_goods_sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '商品库skuId',
  `sku_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '规格名',
  `sku_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格编码',
  `color_id` bigint NOT NULL DEFAULT 0 COMMENT '颜色id',
  `color_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色值',
  `color_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色图片',
  `size_id` bigint NOT NULL DEFAULT 0 COMMENT '尺码id',
  `size_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '尺码值(材质)',
  `style_id` bigint NOT NULL DEFAULT 0 COMMENT '款式id',
  `style_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '款式值',
  `price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '售价',
  `line_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '划线价',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `qty` int NOT NULL DEFAULT 0 COMMENT '库存数量',
  `min_qty` int NOT NULL DEFAULT 1 COMMENT '最低购买数量',
  `volume` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品体积',
  `length` float NOT NULL DEFAULT 0 COMMENT '衣长',
  `height` float NOT NULL DEFAULT 0 COMMENT '高度',
  `width` float NOT NULL DEFAULT 0 COMMENT '宽度',
  `weight` float NOT NULL DEFAULT 0 COMMENT '重量',
  `create_on` int NOT NULL COMMENT '创建时间',
  `create_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '\'创建人\'',
  `modify_on` int NULL DEFAULT NULL COMMENT '最后修改时间',
  `modify_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '\'最后修改人\'',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城商品SKU表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods_sku
-- ----------------------------
INSERT INTO `mall_goods_sku` VALUES (1, 1, '0', '0', 'NOR Flash', NULL, 100, 'NOR Flash', 'http://img.huayiyungou.com/Fp9wujQ7b5r3oyqODb_hp2NVP8bj', 0, NULL, 0, NULL, 1.25, 1.25, '', 1, 100000, 1, NULL, 0, 0, 0, 0, 1743239704, '齐李平', NULL, NULL);

-- ----------------------------
-- Table structure for mall_nav
-- ----------------------------
DROP TABLE IF EXISTS `mall_nav`;
CREATE TABLE `mall_nav`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示文本',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `image_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接path',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '位置（HOME首页',
  `which` int NOT NULL COMMENT '展示端1：PC 2：H5',
  `status` int NOT NULL COMMENT '状态 1正常 0下架',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_on` int NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城导航表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_nav
-- ----------------------------
INSERT INTO `mall_nav` VALUES (1, '新品首发', 'https://smart-shop.itheima.net/uploads/10001/20230320/58a7c1f62df4cb1eb47fe83ff0e566e6.png', 'icon-1.png', '/source/publish', 'HOME', 2, 1, NULL, NULL);
INSERT INTO `mall_nav` VALUES (2, '居家生活', 'https://smart-shop.itheima.net/uploads/10001/20230320/49c64dbbf449e9e8abfca314f92814bd.png', 'icon-2.png', 'pages/category/index', 'HOME', 2, 1, NULL, NULL);
INSERT INTO `mall_nav` VALUES (3, '服饰鞋包', 'https://smart-shop.itheima.net/uploads/10001/20230320/8573fbc5e87e8a88827e905fca284604.png', 'icon-2.png', 'pages/category/index', 'HOME', 2, 1, NULL, NULL);
INSERT INTO `mall_nav` VALUES (4, '美食酒水', 'https://smart-shop.itheima.net/uploads/10001/20230320/f01c5fc360f55c6053beec34913bc699.png', 'icon-2.png', 'pages/category/index', 'HOME', 2, 1, NULL, NULL);

-- ----------------------------
-- Table structure for mall_rec_category
-- ----------------------------
DROP TABLE IF EXISTS `mall_rec_category`;
CREATE TABLE `mall_rec_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` bigint NULL DEFAULT NULL,
  `sale_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城推荐分类展示' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_rec_category
-- ----------------------------
INSERT INTO `mall_rec_category` VALUES (1, '居家', 'http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-05-06/201516e3-25d0-48f5-bcee-7f0cafb14176.png', 'https://yjy-oss-files.oss-cn-zhangjiakou.aliyuncs.com/tuxian/home_goods_cover.jpg', 0, '2折狂欢');
INSERT INTO `mall_rec_category` VALUES (2, '居家生活用品', NULL, 'http://smart-shop.itheima.net/uploads/10001/20230320/f871b65f88d19fd894845451873c7035.png', 1, NULL);
INSERT INTO `mall_rec_category` VALUES (3, '收纳', NULL, 'http://smart-shop.itheima.net/uploads/10001/20230320/43db9277c381eef488544252757ebef8.png', 1, NULL);
INSERT INTO `mall_rec_category` VALUES (4, '宠物食品', NULL, 'http://smart-shop.itheima.net/uploads/10001/20230320/ff30e80831c1f16f4d090116f55c0912.png', 1, NULL);
INSERT INTO `mall_rec_category` VALUES (5, '艺术藏品', NULL, 'http://smart-shop.itheima.net/uploads/10001/20230320/a70fd1db54e5cb283a2e2c5bd20329ce.png', 1, NULL);
INSERT INTO `mall_rec_category` VALUES (6, '宠物用品', NULL, 'http://smart-shop.itheima.net/uploads/10001/20230320/a70fd1db54e5cb283a2e2c5bd20329ce.png', 1, NULL);
INSERT INTO `mall_rec_category` VALUES (7, '家庭医疗', NULL, 'http://smart-shop.itheima.net/uploads/10001/20230320/94842ecc23df77a534052ee01eb3989d.png', 1, NULL);
INSERT INTO `mall_rec_category` VALUES (8, '中医保健', NULL, 'http://smart-shop.itheima.net/uploads/10001/20230320/beab1b310c450d97ccf9ef85702afdca.png', 1, NULL);
INSERT INTO `mall_rec_category` VALUES (9, '美食', 'http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-05-06/cf82e5b4-bf1b-4c68-aa86-96f66e8e5282.png', 'https://yanxuan-item.nosdn.127.net/0d7d091a10faf1c22027046f517511cf.png?quality=95&thumbnail=610x610&imageView', 0, '全场3件8折');
INSERT INTO `mall_rec_category` VALUES (10, '南北干货', NULL, 'http://smart-shop.itheima.net/uploads/10001/20230320/cea722f494e41aad0307c7271f92aaf7.png', 9, NULL);
INSERT INTO `mall_rec_category` VALUES (11, '调味酱菜', NULL, 'http://smart-shop.itheima.net/uploads/10001/20230320/f0c5575a00bcb50929ae79560ae2d9dd.png', 9, NULL);
INSERT INTO `mall_rec_category` VALUES (12, '方便食品', NULL, 'http://smart-shop.itheima.net/uploads/10001/20230320/6166fdce6dea7c37fcd3917e3d119f30.png', 9, NULL);
INSERT INTO `mall_rec_category` VALUES (13, '米面粮油', NULL, 'http://smart-shop.itheima.net/uploads/10001/20230320/fd928229f9abf2a4c24ebd5aa5598d28.png', 9, NULL);
INSERT INTO `mall_rec_category` VALUES (14, '名酒馆', NULL, 'http://smart-shop.itheima.net/uploads/10001/20230320/eb38d6a3ff1e449000dd680352257b91.png', 9, NULL);
INSERT INTO `mall_rec_category` VALUES (15, '进口酒', NULL, 'http://smart-shop.itheima.net/uploads/10001/20230320/908a91724108f0dc170c4b0fc2d0e9a3.png', 9, NULL);
INSERT INTO `mall_rec_category` VALUES (16, '服饰', 'http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-05-06/33e1f5de-0fdb-4cfa-9ba9-781233024b53.png', 'https://yanxuan-item.nosdn.127.net/0d7d091a10faf1c22027046f517511cf.png?quality=95&thumbnail=610x610&imageView', 0, '全场3件8折');

-- ----------------------------
-- Table structure for mall_rec_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_rec_goods`;
CREATE TABLE `mall_rec_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goods_id` bigint NULL DEFAULT NULL,
  `goods_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_price_max` decimal(10, 2) NULL DEFAULT NULL,
  `goods_price_min` decimal(10, 2) NULL DEFAULT NULL,
  `goods_sales` int NULL DEFAULT NULL,
  `line_price_max` decimal(10, 2) NULL DEFAULT NULL,
  `line_price_min` decimal(10, 2) NULL DEFAULT NULL,
  `selling_poin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '位置（HOME首页',
  `which` int NOT NULL COMMENT '展示端1：PC 2：H5',
  `start_time` int NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` int NULL DEFAULT NULL COMMENT '结束时间',
  `category_id` bigint NOT NULL DEFAULT 0 COMMENT '所属分类id',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态 1正常 0下架',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_on` int NULL DEFAULT NULL COMMENT '创建时间',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '推荐商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_rec_goods
-- ----------------------------
INSERT INTO `mall_rec_goods` VALUES (1, 10052, 'http://smart-shop.itheima.net/uploads/10001/20230321/1d1801baa9c9b8d1d1524ec917d2adde.jpg', '蒙牛 特仑苏纯牛奶 250ml*12包 学生青少年营养早餐奶 送礼佳品 1月产', 49.00, 49.00, 1990, 59.00, 59.00, NULL, 'HOME', 2, NULL, NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `mall_rec_goods` VALUES (2, 10038, 'http://smart-shop.itheima.net/uploads/10001/20230321/8f505c6c437fc3d4b4310b57b1567544.jpg', '三星手机 SAMSUNG Galaxy S23 8GB+256GB 超视觉夜拍系统 超清夜景 悠雾紫 5G手机 游戏拍照旗舰机s23', 55.00, 55.00, 4554, 2333.00, 2333.00, NULL, 'HOME', 2, NULL, NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `mall_rec_goods` VALUES (3, 1233, 'http://smart-shop.itheima.net/uploads/10001/20230321/bfe7f91b8413f35f8a222450d630d0c0.jpg', '[郎酒旗舰店郎牌郎酒]郎酒 郎牌郎酒 普郎 53度酱香型白酒 500ml*6瓶 整箱装白酒普郎原箱', 1620.00, 1620.00, 3444, 2499.00, 2499.00, NULL, 'HOME', 2, NULL, NULL, 0, 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for mall_trade_account
-- ----------------------------
DROP TABLE IF EXISTS `mall_trade_account`;
CREATE TABLE `mall_trade_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint NOT NULL COMMENT '租户id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `market_id` bigint NOT NULL COMMENT '账户对应的交易市场id',
  `main_account_id` bigint NOT NULL COMMENT '主账户id（本身是主账户的情况下该字段值为0）',
  `type` int NOT NULL COMMENT '账户类型（0临时账户1主账户2子账户）',
  `account_identity` int NOT NULL COMMENT '账户身份（10买家身份20卖家身份）',
  `account_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账户名',
  `account_balance` int NOT NULL DEFAULT 0 COMMENT '账户余额（主账户才有余额）',
  `status` int NOT NULL COMMENT '状态0审核中1生效中2已失效',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `trade_fee` int NOT NULL COMMENT '交付费率（千分之）',
  `recharge_amount` int NOT NULL DEFAULT 0 COMMENT '充值余额（单位分，卖家才有该字段值）',
  `withdrawal_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提现密码',
  `password_salt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码加盐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '交易账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_trade_account
-- ----------------------------
INSERT INTO `mall_trade_account` VALUES (11, 63, 3, 1, 0, 0, 10, '临时账户', 0, 2, '新用户自动创建临时交易账户', '2024-10-16 19:15:47', '开通主账户，临时账户失效', '2024-10-28 09:46:55', 15, 0, NULL, NULL);
INSERT INTO `mall_trade_account` VALUES (12, 63, 3, 1, 0, 1, 10, '老顾的主账户', 10000, 1, '申请开通主账户', '2024-10-28 09:46:55', '在线充值支付成功更新余额', '2024-11-15 20:10:26', 15, 0, NULL, NULL);
INSERT INTO `mall_trade_account` VALUES (13, 63, 3, 1, 12, 2, 10, '子账号1', 0, 1, '申请开通主账户', '2024-10-28 09:46:55', NULL, NULL, 15, 0, NULL, NULL);
INSERT INTO `mall_trade_account` VALUES (14, 63, 3, 1, 12, 2, 10, '子账号2', 0, 1, '申请开通子账户', '2024-10-28 11:45:34', NULL, NULL, 15, 0, NULL, NULL);
INSERT INTO `mall_trade_account` VALUES (15, 63, 3, 1, 12, 2, 10, '子账号3', 0, 1, '申请开通子账户', '2024-10-28 11:48:08', NULL, NULL, 15, 0, NULL, NULL);
INSERT INTO `mall_trade_account` VALUES (16, 63, 3, 1, 12, 2, 10, '子账号4', 0, 1, '申请开通子账户', '2024-10-28 11:48:08', NULL, NULL, 15, 0, NULL, NULL);
INSERT INTO `mall_trade_account` VALUES (17, 63, 3, 1, 12, 2, 10, '子账号5', 0, 1, '申请开通子账户', '2024-10-28 11:48:09', NULL, NULL, 15, 0, NULL, NULL);
INSERT INTO `mall_trade_account` VALUES (18, 63, 3, 1, 12, 2, 10, '子账号6', 0, 1, '申请开通子账户', '2024-10-28 11:48:09', NULL, NULL, 15, 0, NULL, NULL);
INSERT INTO `mall_trade_account` VALUES (19, 63, 3, 1, 0, 1, 20, '老顾的主账户', 0, 1, '申请开通卖家主账户', '2024-10-28 16:05:20', '在线充值支付成功更新充值余额', '2024-11-26 11:15:49', 15, 10, 'bdcb22bd484fa84aefad0ca0df6cd2ca', 'rugJhE6MWH0RmPbI');
INSERT INTO `mall_trade_account` VALUES (20, 63, 3, 1, 19, 2, 20, '老顾的子账户', 0, 1, '申请开通卖家主账户', '2024-10-28 16:05:24', NULL, NULL, 15, 0, NULL, NULL);
INSERT INTO `mall_trade_account` VALUES (21, 63, 4, 1, 0, 1, 10, '主账号', 33650, 1, '申请开通主账户', '2024-10-28 16:47:34', '小票打印费扣费20241126212927278', '2024-11-26 21:29:28', 0, 0, NULL, NULL);
INSERT INTO `mall_trade_account` VALUES (22, 63, 4, 1, 21, 2, 10, '子账号QI', 0, 1, '申请开通主账户', '2024-10-28 16:47:34', NULL, NULL, 20, 0, NULL, NULL);
INSERT INTO `mall_trade_account` VALUES (23, 63, 4, 1, 0, 1, 20, '主账号', 0, 1, '申请开通卖家主账户', '2024-11-18 10:30:54', NULL, NULL, 15, 0, NULL, NULL);
INSERT INTO `mall_trade_account` VALUES (24, 63, 4, 1, 19, 2, 20, '子账号', 0, 1, '申请开通卖家主账户', '2024-11-18 10:30:54', NULL, NULL, 15, 0, NULL, NULL);
INSERT INTO `mall_trade_account` VALUES (25, 63, 4, 1, 21, 2, 10, '子账222', 0, 1, '申请开通主账户', '2024-10-28 16:47:34', NULL, NULL, 20, 0, NULL, NULL);
INSERT INTO `mall_trade_account` VALUES (26, 63, 3, 1, 19, 2, 20, '子账号3', 0, 0, '申请开通卖家子账户', '2024-11-27 00:04:26', NULL, NULL, 15, 0, NULL, NULL);

-- ----------------------------
-- Table structure for mall_upload_file
-- ----------------------------
DROP TABLE IF EXISTS `mall_upload_file`;
CREATE TABLE `mall_upload_file`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `file_type` int NOT NULL COMMENT '文件类型1图片2文件',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'URL地址',
  `object_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '对象名',
  `bucket` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '桶名',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城上传文件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_upload_file
-- ----------------------------
INSERT INTO `mall_upload_file` VALUES (1, 4, 1, '微信图片_20241116094147.jpg', '微信图片_20241116094147.jpg', 'jpg', 'http://img.huayiyungou.com/Fv-L0NKTHqxG_Xm95RnIqmWq-J3t', '微信图片_20241116094147.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 16:46:56', '', NULL);
INSERT INTO `mall_upload_file` VALUES (2, 4, 1, 'logo1.png', 'logo1.png', 'png', 'http://img.huayiyungou.com/FilhoR6LF_ZZspK5LsJEjjHroNb-', 'logo1.png', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:21:19', '', NULL);
INSERT INTO `mall_upload_file` VALUES (3, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:21:46', '', NULL);
INSERT INTO `mall_upload_file` VALUES (4, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:22:08', '', NULL);
INSERT INTO `mall_upload_file` VALUES (5, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:22:34', '', NULL);
INSERT INTO `mall_upload_file` VALUES (6, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:25:19', '', NULL);
INSERT INTO `mall_upload_file` VALUES (7, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:26:02', '', NULL);
INSERT INTO `mall_upload_file` VALUES (8, 4, 1, '微信图片_20240909215002.jpg', '微信图片_20240909215002.jpg', 'jpg', 'http://img.huayiyungou.com/FsdOmwhkhC2R2caFFmZxGJ8yN1WC', '微信图片_20240909215002.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:27:11', '', NULL);
INSERT INTO `mall_upload_file` VALUES (9, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:27:56', '', NULL);
INSERT INTO `mall_upload_file` VALUES (10, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:28:30', '', NULL);
INSERT INTO `mall_upload_file` VALUES (11, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:29:21', '', NULL);
INSERT INTO `mall_upload_file` VALUES (12, 4, 1, '微信图片_20240909215002.jpg', '微信图片_20240909215002.jpg', 'jpg', 'http://img.huayiyungou.com/FsdOmwhkhC2R2caFFmZxGJ8yN1WC', '微信图片_20240909215002.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:29:37', '', NULL);
INSERT INTO `mall_upload_file` VALUES (13, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:36:54', '', NULL);
INSERT INTO `mall_upload_file` VALUES (14, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:39:01', '', NULL);
INSERT INTO `mall_upload_file` VALUES (15, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:39:13', '', NULL);
INSERT INTO `mall_upload_file` VALUES (16, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 19:59:45', '', NULL);
INSERT INTO `mall_upload_file` VALUES (17, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 20:02:15', '', NULL);
INSERT INTO `mall_upload_file` VALUES (18, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 20:04:11', '', NULL);
INSERT INTO `mall_upload_file` VALUES (19, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 20:05:16', '', NULL);
INSERT INTO `mall_upload_file` VALUES (20, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 20:05:42', '', NULL);
INSERT INTO `mall_upload_file` VALUES (21, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 20:06:09', '', NULL);
INSERT INTO `mall_upload_file` VALUES (22, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 20:06:42', '', NULL);
INSERT INTO `mall_upload_file` VALUES (23, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 20:07:09', '', NULL);
INSERT INTO `mall_upload_file` VALUES (24, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 20:07:34', '', NULL);
INSERT INTO `mall_upload_file` VALUES (25, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 20:07:55', '', NULL);
INSERT INTO `mall_upload_file` VALUES (26, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 20:08:35', '', NULL);
INSERT INTO `mall_upload_file` VALUES (27, 4, 1, '微信图片_20240909215013.jpg', '微信图片_20240909215013.jpg', 'jpg', 'http://img.huayiyungou.com/FvN4kDL2x0XCLV6EPxru1tXFZ8iZ', '微信图片_20240909215013.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-24 22:17:52', '', NULL);
INSERT INTO `mall_upload_file` VALUES (28, 4, 1, 'gzh_qrcode.jpg', 'gzh_qrcode.jpg', 'jpg', 'http://img.huayiyungou.com/FkSMZ2oAe9ZjSrMiWo-V0hUwxtHK', 'gzh_qrcode.jpg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-25 22:10:06', '', NULL);
INSERT INTO `mall_upload_file` VALUES (29, 4, 1, '74f39b93a2254333a923fc93488ffc61.jpeg', '74f39b93a2254333a923fc93488ffc61.jpeg', 'jpeg', 'http://img.huayiyungou.com/FqRfttp0zehwayhPe0788WwH3oFq', '74f39b93a2254333a923fc93488ffc61.jpeg', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-26 15:28:01', '', NULL);
INSERT INTO `mall_upload_file` VALUES (30, 4, 1, 'logo.png', 'logo.png', 'png', 'http://img.huayiyungou.com/Fp9wujQ7b5r3oyqODb_hp2NVP8bj', 'logo.png', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-28 17:44:14', '', NULL);
INSERT INTO `mall_upload_file` VALUES (31, 4, 1, 'logo.png', 'logo.png', 'png', 'http://img.huayiyungou.com/Fp9wujQ7b5r3oyqODb_hp2NVP8bj', 'logo.png', 'ttxs100-cn-files', 0, '0', '0', '', '2025-03-28 17:48:01', '', NULL);

-- ----------------------------
-- Table structure for mall_user
-- ----------------------------
DROP TABLE IF EXISTS `mall_user`;
CREATE TABLE `mall_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号（可用于登录）',
  `user_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员名(实名认证后写入实名认证值，比如企业认证，就是公司名）',
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信昵称',
  `head_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信头像',
  `login_pwd` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录密码',
  `source` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '来源：小程序、小程序分享、交易终端',
  `referrer_id` bigint NULL DEFAULT NULL COMMENT '推荐人id',
  `user_type` int NOT NULL COMMENT '用户类型：10普通用户；100市场管理员；',
  `business_type` int NOT NULL DEFAULT 0 COMMENT '商务身份（10谈判人20商务）',
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别（男，女，未知）',
  `authn_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '实名认证姓名（法人老板）',
  `authn_card_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '实名认证身份证号',
  `authn_status` int NOT NULL COMMENT '实名认证状态0未实名1已实名',
  `authn_time` datetime NULL DEFAULT NULL COMMENT '实名认证成功时间',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `last_login_device_sn` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最后登录设备id',
  `last_login_market_id` bigint NULL DEFAULT NULL COMMENT '最后登录市场id',
  `reg_time` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `reg_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '注册ip',
  `wx_open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信openid',
  `wx_union_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信unionId',
  `wx_session_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信sessionkey',
  `status` int NOT NULL COMMENT '状态（1正常2禁用）',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `province` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `district` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nasi_mts_user_unique`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_user
-- ----------------------------
INSERT INTO `mall_user` VALUES (1, '18123800077', 'FS1812', NULL, NULL, '123456', '小程序', NULL, 100, 0, NULL, '', NULL, 0, NULL, '2024-10-15 17:17:10', NULL, NULL, NULL, '2024-10-15 17:06:53', NULL, '', NULL, NULL, 1, 'system', '2024-10-15 17:06:52', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mall_user` VALUES (3, '18333434342', 'AAAAA', '娃哈哈', NULL, '123456', '小程序', NULL, 10, 0, NULL, '', '', 0, NULL, '2024-11-26 19:40:50', NULL, '63d6559bea195278', 0, '2024-10-16 19:15:47', NULL, 'onDuZ5NqgX8dQqncHHDORhwhHoxk', NULL, NULL, 1, 'system', '2024-10-16 19:15:47', '切换店铺', '2024-11-27 00:17:39', NULL, NULL, NULL);
INSERT INTO `mall_user` VALUES (4, '15818590000', '启航', NULL, NULL, '123456', '小程序', NULL, 10, 10, NULL, '', '', 1, '2024-10-28 16:47:02', '2024-11-18 10:29:42', NULL, NULL, 0, '2024-10-28 16:45:50', NULL, 'onDuZ5HPfOsJCpIsfnyjpV1FcNt0', NULL, NULL, 1, 'system', '2024-10-28 16:45:50', '切换身份', '2024-11-19 15:22:28', NULL, NULL, NULL);
INSERT INTO `mall_user` VALUES (5, '13416470000', 'FS13416', NULL, NULL, '123456', '小程序', NULL, 10, 0, NULL, '', NULL, 0, NULL, '2024-11-27 00:21:40', NULL, NULL, 0, '2024-11-27 00:17:19', NULL, 'o8Uzs673VoJnHXUyahYzSy1aP5PA', NULL, NULL, 1, 'system', '2024-11-27 00:17:19', '切换身份', '2024-11-27 00:21:56', NULL, NULL, NULL);
INSERT INTO `mall_user` VALUES (6, '18608900000', 'FS1860', NULL, NULL, '123456', '小程序', NULL, 10, 0, NULL, '', NULL, 0, NULL, '2024-11-27 12:53:57', NULL, NULL, 0, '2024-11-27 12:53:57', NULL, 'o8Uzs68y18mqVkN6fAqtNX9impEs', NULL, NULL, 1, 'system', '2024-11-27 12:53:57', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mall_user` VALUES (7, '13312255555', 'FS1331', NULL, NULL, '123456', '小程序', NULL, 10, 0, NULL, '', NULL, 0, NULL, '2024-11-27 12:55:12', NULL, NULL, 0, '2024-11-27 12:55:12', NULL, 'o8Uzs666of_P7bim7TwbXqRlM400', NULL, NULL, 1, 'system', '2024-11-27 12:55:12', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for mall_user_authn
-- ----------------------------
DROP TABLE IF EXISTS `mall_user_authn`;
CREATE TABLE `mall_user_authn`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint NOT NULL COMMENT '租户id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `true_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '真实姓名',
  `id_card_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '身份证号',
  `pic1` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片1',
  `pic2` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片2',
  `pic3` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片3',
  `autograph` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '签名',
  `status` int NOT NULL COMMENT '实名认证状态0认证中1认证通过2认证失败',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户实名认证表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_user_authn
-- ----------------------------

-- ----------------------------
-- Table structure for mall_user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `mall_user_favorite`;
CREATE TABLE `mall_user_favorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goods_id` bigint NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `favorite_price` decimal(10, 2) NULL DEFAULT NULL,
  `create_on` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_user_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  `menu_type` int NULL DEFAULT NULL,
  `sort_num` int NULL DEFAULT NULL,
  `source` int NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_on` int NULL DEFAULT NULL,
  `modify_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modify_on` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media
-- ----------------------------

-- ----------------------------
-- Table structure for media_info
-- ----------------------------
DROP TABLE IF EXISTS `media_info`;
CREATE TABLE `media_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media_info
-- ----------------------------

-- ----------------------------
-- Table structure for mts_goods_source
-- ----------------------------
DROP TABLE IF EXISTS `mts_goods_source`;
CREATE TABLE `mts_goods_source`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(85) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主图',
  `pictures` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '多图（逗号隔开）',
  `model` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '型号',
  `model_id` bigint NULL DEFAULT NULL COMMENT '型号id',
  `brand` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `brand_id` bigint NULL DEFAULT NULL COMMENT '品牌id',
  `type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `type_id` bigint NULL DEFAULT NULL COMMENT '类型id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '信息发布者',
  `user_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信息发布人',
  `user_mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信息发布热手机号',
  `source_contacts` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信息提供人联系人',
  `source_mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信息提供人手机号',
  `source_wx` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信息提供人微信',
  `seller_contacts` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家联系人',
  `seller_mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家联系手机号',
  `seller_wx` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家联系微信',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `quantity` int NULL DEFAULT NULL COMMENT '数量',
  `min_qty` int NULL DEFAULT NULL COMMENT '最低数量',
  `fz` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封装',
  `pici` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次',
  `validity_period` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效期',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `files` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件列表',
  `status` int NOT NULL DEFAULT 0 COMMENT '状态0草稿中1待审核2已审核3已发布',
  `accept_status` int NOT NULL DEFAULT 0 COMMENT '0待谈判接单1谈判人已接单',
  `phase` int NOT NULL COMMENT '阶段0待谈判人接单1谈判人已接单2已发布商品',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `audit_user_id` bigint NULL DEFAULT NULL COMMENT '审核人userid',
  `audit_user_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `accept_user_id` bigint NULL DEFAULT NULL COMMENT '接单人（谈判人）userid',
  `accept_user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接单人username',
  `accept_user_mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接单人mobile',
  `accept_time` datetime NULL DEFAULT NULL COMMENT '接单时间',
  `accept_order_id` bigint NOT NULL DEFAULT 0 COMMENT '接单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '货源信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mts_goods_source
-- ----------------------------
INSERT INTO `mts_goods_source` VALUES (1, NULL, 'http://img.huayiyungou.com/Fp9wujQ7b5r3oyqODb_hp2NVP8bj', 'http://img.huayiyungou.com/Fp9wujQ7b5r3oyqODb_hp2NVP8bj', 'NOR Flash', 1, '梦小妮', 1, '闪存芯片', 1, 4, '15818590119', '15818590119', 'a', 'a', 'a', 'a', 'a', 'a', 1.25, 100000, NULL, '', '', '', '', NULL, 1, 0, 0, NULL, '2025-03-28 17:47:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `mts_goods_source` VALUES (2, NULL, 'http://img.huayiyungou.com/Fp9wujQ7b5r3oyqODb_hp2NVP8bj', 'http://img.huayiyungou.com/Fp9wujQ7b5r3oyqODb_hp2NVP8bj', 'NOR Flash', 1, '梦小妮', 1, '闪存芯片', 1, 4, '15818590119', '15818590119', '老齐', '15818590111', '23233', '张总', '1309909900', 'abc123', 1.25, 100000, NULL, '', '', '', '', NULL, 3, 1, 3, NULL, '2025-03-28 17:49:08', '齐李平', '2025-03-29 17:15:04', NULL, NULL, NULL, 4, '15818590119', '15818590119', '2025-03-28 21:28:30', 1);
INSERT INTO `mts_goods_source` VALUES (3, NULL, 'http://img.huayiyungou.com/Fp9wujQ7b5r3oyqODb_hp2NVP8bj', 'http://img.huayiyungou.com/Fp9wujQ7b5r3oyqODb_hp2NVP8bj', 'NOR Flash', 1, '梦小妮', 1, '闪存芯片', 1, 4, '15818590119', '15818590119', '老齐', '15818590111', '23233', '张总', '1309909900', 'abc123', 1.25, 100000, NULL, '', '', '', '', NULL, 1, 0, 0, NULL, '2025-03-29 11:43:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `mts_goods_source` VALUES (4, NULL, 'http://img.huayiyungou.com/Fp9wujQ7b5r3oyqODb_hp2NVP8bj', 'http://img.huayiyungou.com/Fp9wujQ7b5r3oyqODb_hp2NVP8bj', 'NOR Flash', 1, '梦小妮', 1, '闪存芯片', 1, 4, '15818590119', '15818590119', '老齐', '15818590111', '23233', '张总', '1309909900', 'abc123', 1.25, 100000, NULL, '', '', '', '', NULL, 1, 0, 0, NULL, '2025-03-29 11:43:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for mts_goods_source_order
-- ----------------------------
DROP TABLE IF EXISTS `mts_goods_source_order`;
CREATE TABLE `mts_goods_source_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `identity` int NOT NULL COMMENT '接单类型（10谈判人20商务)',
  `goods_source_id` bigint NOT NULL COMMENT '货源信息id',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态1接单中0已取消2发布审核中3已发布',
  `accept_time` datetime NOT NULL COMMENT '接单时间',
  `publish_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `publish_status` int NOT NULL DEFAULT 0 COMMENT '发布状态0待发布1待审核2已审核',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `audit_user` bigint NULL DEFAULT NULL COMMENT '审核人',
  `seller_contacts` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家联系人',
  `seller_mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家联系手机号',
  `seller_wx` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家联系微信',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `quantity` int NULL DEFAULT NULL COMMENT '数量',
  `min_qty` int NULL DEFAULT NULL COMMENT '最低数量',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主图',
  `model` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '型号',
  `brand` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '货源信息接单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mts_goods_source_order
-- ----------------------------
INSERT INTO `mts_goods_source_order` VALUES (1, 4, 10, 2, 3, '2025-03-28 21:28:30', '2025-03-29 17:15:04', 2, NULL, NULL, '张总', '1309909900', 'abc123', 1.25, 100000, NULL, 'http://img.huayiyungou.com/Fp9wujQ7b5r3oyqODb_hp2NVP8bj', 'NOR Flash', '梦小妮', '闪存芯片');

-- ----------------------------
-- Table structure for o_goods
-- ----------------------------
DROP TABLE IF EXISTS `o_goods`;
CREATE TABLE `o_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片地址',
  `outer_erp_goods_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品唯一ID',
  `goods_num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商品编号',
  `unit_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '单位名称',
  `category_id` bigint NULL DEFAULT 0 COMMENT '商品分类ID',
  `bar_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '条码',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态1销售中2已下架',
  `length` float NOT NULL DEFAULT 0 COMMENT '衣长/裙长/裤长',
  `height` float NOT NULL DEFAULT 0 COMMENT '高度/袖长',
  `width` float NOT NULL DEFAULT 0 COMMENT '宽度/胸阔(围)',
  `width1` float NOT NULL DEFAULT 0 COMMENT '肩阔',
  `width2` float NOT NULL DEFAULT 0 COMMENT '腰阔',
  `width3` float NOT NULL DEFAULT 0 COMMENT '臀阔',
  `weight` float NOT NULL DEFAULT 0 COMMENT '重量',
  `disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0启用   1禁用',
  `period` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '保质期',
  `pur_price` double NULL DEFAULT 0 COMMENT '预计采购价格',
  `whole_price` double NULL DEFAULT 0 COMMENT '建议批发价',
  `retail_price` double NULL DEFAULT 0 COMMENT '建议零售价',
  `unit_cost` double UNSIGNED NULL DEFAULT 0 COMMENT '单位成本',
  `supplier_id` bigint NULL DEFAULT 0 COMMENT '供应商id',
  `brand_id` bigint NULL DEFAULT 0 COMMENT '品牌id',
  `attr1` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性1：季节',
  `attr2` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性2：分类',
  `attr3` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性3：风格',
  `attr4` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性4：年份',
  `attr5` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性5：面料',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外链url',
  `low_qty` int NULL DEFAULT 0 COMMENT '最低库存（预警）',
  `high_qty` int NULL DEFAULT 0 COMMENT '最高库存（预警）',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货地省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货地市',
  `town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货地区',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `goods_id_unique`(`outer_erp_goods_id`) USING BTREE,
  INDEX `number`(`goods_num`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品库商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of o_goods
-- ----------------------------

-- ----------------------------
-- Table structure for o_goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `o_goods_brand`;
CREATE TABLE `o_goods_brand`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '品牌名',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品品牌表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of o_goods_brand
-- ----------------------------
INSERT INTO `o_goods_brand` VALUES (1, '梦小妮', 1, 'admin', '2023-12-29 13:44:29', 'admin', '2023-12-29 13:44:29');
INSERT INTO `o_goods_brand` VALUES (2, '启航牛', 1, 'admin', '2024-09-15 18:00:42', NULL, NULL);

-- ----------------------------
-- Table structure for o_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `o_goods_category`;
CREATE TABLE `o_goods_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `number` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类编码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '上架分类id',
  `path` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类路径',
  `sort` int NULL DEFAULT 0 COMMENT '排序值',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `isDelete` tinyint(1) NULL DEFAULT 0 COMMENT '0正常  1删除',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of o_goods_category
-- ----------------------------
INSERT INTO `o_goods_category` VALUES (1, 'NVZHUANG', '女装', NULL, 0, '', 0, NULL, 0, 'admin', '2024-12-08 14:46:46', NULL, NULL);
INSERT INTO `o_goods_category` VALUES (2, '上衣', 'SHANGYI', NULL, 1, '', 1, NULL, 0, 'admin', '2025-02-15 11:16:27', NULL, NULL);

-- ----------------------------
-- Table structure for o_goods_category_attribute
-- ----------------------------
DROP TABLE IF EXISTS `o_goods_category_attribute`;
CREATE TABLE `o_goods_category_attribute`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `category_id` bigint NOT NULL,
  `type` int NOT NULL DEFAULT 0 COMMENT '类型：0属性1规格',
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '\'属性名\'',
  `code` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固定值color颜色size尺码style款式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of o_goods_category_attribute
-- ----------------------------
INSERT INTO `o_goods_category_attribute` VALUES (1, 1, 1, '颜色', 'color');

-- ----------------------------
-- Table structure for o_goods_category_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `o_goods_category_attribute_value`;
CREATE TABLE `o_goods_category_attribute_value`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键，属性值id',
  `category_attribute_id` bigint NULL DEFAULT NULL COMMENT '属性id',
  `value` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性值文本',
  `sku_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成SKU的编码',
  `orderNum` int NULL DEFAULT 0,
  `isDelete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 426 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of o_goods_category_attribute_value
-- ----------------------------
INSERT INTO `o_goods_category_attribute_value` VALUES (308, 114, '黑色', '01', 999, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (309, 114, '米杏', '02', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (310, 114, '芒果黄', '03', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (311, 114, '中花灰', '04', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (312, 114, '浅杏', '05', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (313, 114, '中粉', '06', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (314, 114, '烟灰色', '07', 88, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (315, 114, '秋香绿', '08', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (316, 114, '花兰', '09', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (317, 114, '杏色', '10', 698, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (318, 114, '芥黄', '11', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (319, 114, '深蓝色', '12', 993, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (320, 114, '大红', '13', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (321, 114, '彩兰', '14', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (322, 114, '白色', '15', 99, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (323, 114, '花米驼', '16', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (324, 114, '粉红', '17', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (325, 114, '黄杏', '18', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (326, 114, '橙红', '19', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (327, 114, '木绿', '20', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (328, 114, '草绿', '21', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (329, 114, '早红', '22', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (330, 114, '咖啡', '23', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (331, 114, '灰色', '24', 99, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (332, 114, '浅绿', '25', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (333, 114, '大红色', '26', 99, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (334, 114, '桔色', '27', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (335, 114, '卡其', '28', 992, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (336, 114, '蓝灰色', '29', 996, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (337, 114, '湖蓝', '30', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (338, 114, '咖啡色', '31', 99, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (339, 114, '蓝绿', '32', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (340, 115, '均码', '00', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (341, 115, 'S', '01', 88, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (342, 115, 'M', '02', 87, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (343, 115, 'L', '03', 86, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (344, 115, 'XL', '04', 85, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (345, 115, '2XL', '05', 84, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (346, 115, '3XL', '06', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (347, 115, '4XL', '07', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (348, 115, '5XL', '08', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (349, 114, '雾霾蓝', '33', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (350, 114, '浅粉红', '34', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (351, 114, '蓝色', '35', 998, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (352, 114, '花色', '36', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (353, 114, '香槟色', '37', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (354, 114, '紫色', '38', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (355, 114, '砖红色', '39', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (356, 114, '复古蓝', '40', 995, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (357, 114, '烟灰', '41', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (358, 114, '橙黄', '42', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (359, 114, '黄色', '43', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (360, 114, '梅子色', '56', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (361, 114, '浅蓝色', '50', 994, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (362, 114, '宝蓝色', '44', 99, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (363, 114, '浅黄', '45', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (364, 114, '浅紫', '49', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (365, 114, '酒红', '57', 99, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (366, 114, '米白', '47', 99, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (367, 114, '复古蓝九分', '48', 88, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (368, 114, '卡灰', '51', 992, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (369, 114, '玫红', '52', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (370, 114, '彩蓝', '53', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (371, 114, '青蓝淡黄', '54', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (372, 114, '紫白', '55', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (373, 114, '碳灰', '58', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (374, 114, '深蓝色加绒', '59', 794, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (375, 114, '深紫色', '60', 99, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (376, 114, '橙色', '61', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (377, 114, '墨绿色', '62', 99, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (378, 114, '桃粉色', '63', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (379, 114, '蓝灰色九分', '64', 88, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (380, 114, '黑色九分', '65', 88, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (381, 114, '新洋米', '67', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (382, 114, '藏蓝色', '68', 99, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (383, 114, '深蓝九分', '69', 88, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (384, 114, '深蓝长款', '70', 88, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (385, 114, '米白色', '71', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (386, 114, '军绿色', '72', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (387, 114, '柠檬黄', '73', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (388, 114, '灰紫', '74', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (389, 114, '黑灰色', '75', 997, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (390, 114, '焦糖红', '76', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (391, 114, '酱紫', '78', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (392, 114, '红杏', '46', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (393, 114, '银灰', '79', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (394, 115, 'XS', '09', 89, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (395, 114, '无色', '00', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (396, 114, '条纹', '80', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (397, 114, '花色/彩色', '81', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (398, 114, '波点', '82', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (399, 114, '字母', '83', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (400, 114, '绿色', '84', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (401, 115, '25', '25', 69, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (402, 115, '26', '26', 68, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (403, 115, '27', '27', 67, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (404, 115, '28', '28', 66, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (405, 115, '29', '29', 65, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (406, 115, '30', '30', 64, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (407, 115, '31', '31', 63, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (408, 115, '32', '32', 62, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (409, 114, '黑色加绒', '101', 799, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (410, 114, '黑灰色加绒', '175', 798, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (411, 114, '蓝灰色加绒', '129', 797, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (412, 114, '复古蓝加绒', '140', 796, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (413, 114, '浅蓝色加绒', '150', 795, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (414, 116, '默认', NULL, 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (415, 116, '加长裤', 'JC', 66, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (416, 116, '长裤', 'CK', 68, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (417, 116, '九分', 'JF', 88, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (418, 116, '八分', 'BF', 86, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (419, 116, '九分加绒', 'JFR', 87, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (420, 116, '单裤', 'D', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (421, 116, '加绒', 'R', 0, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (422, 116, '长裤加绒', 'CR', 65, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (423, 116, '加长裤加绒', 'JCR', 67, 0);
INSERT INTO `o_goods_category_attribute_value` VALUES (425, 1, '默认', '00', 0, 0);

-- ----------------------------
-- Table structure for o_goods_model
-- ----------------------------
DROP TABLE IF EXISTS `o_goods_model`;
CREATE TABLE `o_goods_model`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品型号表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of o_goods_model
-- ----------------------------
INSERT INTO `o_goods_model` VALUES (1, 'NOR Flash', 1, 'admin', '2023-12-29 13:44:29', 'admin', '2023-12-29 13:44:29');
INSERT INTO `o_goods_model` VALUES (2, 'NAND Flash', 1, 'admin', '2024-09-15 18:00:42', NULL, NULL);
INSERT INTO `o_goods_model` VALUES (3, 'SRAM', 1, 'admin', '2025-03-25 15:53:57', NULL, NULL);
INSERT INTO `o_goods_model` VALUES (4, 'DRAM', 1, 'admin', '2025-03-25 15:54:00', NULL, NULL);

-- ----------------------------
-- Table structure for o_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `o_goods_sku`;
CREATE TABLE `o_goods_sku`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` bigint NOT NULL COMMENT '外键（o_goods）',
  `outer_erp_goods_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部erp系统商品id',
  `outer_erp_sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部erp系统skuId(唯一)',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `sku_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '规格名',
  `sku_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规格编码',
  `color_id` bigint NULL DEFAULT 0 COMMENT '颜色id',
  `color_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色值',
  `color_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色图片',
  `size_id` bigint NULL DEFAULT 0 COMMENT '尺码id',
  `size_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '尺码值(材质)',
  `style_id` bigint NULL DEFAULT 0 COMMENT '款式id',
  `style_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '款式值',
  `bar_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库存条形码',
  `pur_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '预计采购价格',
  `retail_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '建议零售价',
  `unit_cost` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '单位成本',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `low_qty` int NULL DEFAULT 0 COMMENT '最低库存（预警）',
  `high_qty` int NULL DEFAULT 0 COMMENT '最高库存（预警）',
  `volume` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'erp商品体积',
  `length` float NOT NULL DEFAULT 0 COMMENT '衣长',
  `height` float NOT NULL DEFAULT 0 COMMENT '高度',
  `width` float NOT NULL DEFAULT 0 COMMENT '宽度',
  `weight` float NOT NULL DEFAULT 0 COMMENT '重量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sku_id_unique`(`outer_erp_sku_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `number`(`sku_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品库SKU表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of o_goods_sku
-- ----------------------------
INSERT INTO `o_goods_sku` VALUES (1, 76, NULL, '11', '小众碎花连衣裙女夏高级感初恋裙子显瘦浪漫茶歇裙温柔风甜美气质', '黄色 S', 'DY36404301', 359, '黄色', 'http://223.83.100.30:9001/omsimage/images/2024/09/07/b28f4e15-8997-418c-bd32-b4beb4966f6b.jpg', 341, 'S', 0, '', NULL, 79.20, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (2, 76, NULL, '22', '小众碎花连衣裙女夏高级感初恋裙子显瘦浪漫茶歇裙温柔风甜美气质', '黄色 M', 'DY36404302', 359, '黄色', 'http://223.83.100.30:9001/omsimage/images/2024/09/07/b28f4e15-8997-418c-bd32-b4beb4966f6b.jpg', 342, 'M', 0, '', NULL, 79.20, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (3, 4, '10013', '1001', '橄醇油柑橄榄果汁饮料', '280g*6', '10013', 5, '净含量', 'http://8.138.114.135:9000/zpmalloss/images/2025/02/21/0584b9c4-43f8-46d4-8317-bdc8bb9c1fcf.jpg', 0, '', 0, '', NULL, 42.90, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (4, 5, '10024', '1002', '瀛养元牛肉（筋）丸礼盒8*250g', '250g*8', '10024', 7, '克重', 'http://8.138.114.135:9000/zpmalloss/images/2025/02/21/77a0fe44-4983-462b-9ee0-752e62c0ea05.jpg', 0, '', 0, '', NULL, 199.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (5, 6, '10035', '1003', '五指毛桃手撕鸡礼盒', '600g', '10035', 8, '净含量', 'http://8.138.114.135:9000/zpmalloss/images/2025/02/21/285e7e85-4f57-4762-9117-9e05b03e35cb.jpg', 0, '', 0, '', NULL, 99.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (6, 7, '10045', '1004', '文香潮州三宝特产佛手老香黄老药桔黄皮豉精选礼盒送礼佳品', '1500g', '10045', 9, '净含量', 'http://8.138.114.135:9000/zpmalloss/images/2025/02/21/de92a289-0837-49a5-a826-aa21851b79ac.jpg', 0, '', 0, '', NULL, 198.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (7, 79, NULL, NULL, 'aa', '默认', 'aa00', 425, '默认', 'https://cbu01.alicdn.com/img/ibank/O1CN01Aqa1cY1oPteJHyDYW_!!2217885915218-0-cib.jpg', 0, '', 0, '', NULL, 12.90, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (8, 80, NULL, NULL, '潮牌mm24秋冬新款时髦洋气字母提花短款羽绒面包服轻便保暖', '默认', 'ABC909338800', 425, '默认', 'https://cbu01.alicdn.com/img/ibank/O1CN01Mnbr4L2Exx8KntWGB_!!2215681298812-0-cib.jpg', 0, '', 0, '', NULL, 148.90, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (9, 81, NULL, NULL, '潮牌mm24秋冬新款时髦洋气字母提花短款羽绒面包服轻便保暖', '默认', 'ACDE3434300', 425, '默认', 'https://cbu01.alicdn.com/img/ibank/O1CN01Mnbr4L2Exx8KntWGB_!!2215681298812-0-cib.jpg', 0, '', 0, '', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (11, 82, NULL, NULL, 'aaa', 'aad 红色', '1233', 0, 'aad', 'aa', 0, '红色', 0, '', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (12, 82, NULL, NULL, 'aaa', 'aad 绿色', '1244', 0, 'aad', 'aa', 0, '绿色', 0, '', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (13, 82, NULL, NULL, 'aaa', 'dfdfd 红色', '1355', 0, 'dfdfd', 'aa', 0, '红色', 0, '', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (14, 82, NULL, NULL, 'aaa', 'dfdfd 绿色', '1345', 0, 'dfdfd', 'aa', 0, '绿色', 0, '', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (15, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 S 长款', 'ANK99380', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'S', 0, '长款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (16, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 S 短款', 'ANK99389', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'S', 0, '短款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (17, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 M 长款', 'ANK99382', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'M', 0, '长款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (18, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 M 短款', 'ANK99384', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'M', 0, '短款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (19, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 L 长款', 'ANK99381', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'L', 0, '长款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (20, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 L 短款', 'ANK99387', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'L', 0, '短款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (21, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 XL 长款', 'ANK99388', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'XL', 0, '长款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (22, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 XL 短款', 'ANK99383', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'XL', 0, '短款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (31, 76, NULL, '23', '小众碎花连衣裙女夏高级感初恋裙子显瘦浪漫茶歇裙温柔风甜美气质', '黄色 L', 'DY36404303', 359, '黄色', 'http://223.83.100.30:9001/omsimage/images/2024/09/07/b28f4e15-8997-418c-bd32-b4beb4966f6b.jpg', 343, 'L', 0, '', NULL, 79.20, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (41, 76, NULL, '52', '小众碎花连衣裙女夏高级感初恋裙子显瘦浪漫茶歇裙温柔风甜美气质', '黄色 XL', 'DY36404304', 359, '黄色', 'http://223.83.100.30:9001/omsimage/images/2024/09/07/b28f4e15-8997-418c-bd32-b4beb4966f6b.jpg', 344, 'XL', 0, '', NULL, 79.20, 0.00, 0.00, '', 2, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (51, 77, NULL, NULL, '开源电商ERP启航电商ERP系统多平台多店铺订单管理系统演示账号', '黑色', 'QIHANGNIUERP00122', 308, '黑色', 'https://img.pddpic.com/garner-api-new/ffca4d8bba93ecc7813d350de43d5c50.jpeg?imageView2/2/w/2125/q/85', 0, '', 0, '', NULL, 49.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (61, 78, NULL, NULL, '红罐加多宝', '大红色 均码', 'JIADUOBAO2600', 333, '大红色', 'https://cbu01.alicdn.com/img/ibank/O1CN012YyP5f1hbcSsvkd3k_!!2218127114296-0-cib.jpg', 340, '均码', 0, '11', NULL, 19.00, 25.90, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for o_goods_sku_attr
-- ----------------------------
DROP TABLE IF EXISTS `o_goods_sku_attr`;
CREATE TABLE `o_goods_sku_attr`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goods_id` bigint NOT NULL,
  `type` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `k` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kid` int NULL DEFAULT NULL,
  `vid` int NULL DEFAULT NULL,
  `v` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 700 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of o_goods_sku_attr
-- ----------------------------
INSERT INTO `o_goods_sku_attr` VALUES (1, 1, 'color', '颜色', 1, 0, '250ml', 'http://img.huayikeji.com/wveyzkbvilkzaj3eu9084pmqb9405hag');
INSERT INTO `o_goods_sku_attr` VALUES (2, 4, 'color', '颜色', 1, 0, '香辣味1瓶+麻辣味1瓶', 'http://img.huayikeji.com/kw5i7anb3tydpu8kz0f7o8jrszuczlw1');
INSERT INTO `o_goods_sku_attr` VALUES (3, 4, 'color', '颜色', 1, 0, '麻辣味420g*2瓶中辣', 'http://img.huayikeji.com/8ltvsrs9huscohzi2qd20qj0daynz012');
INSERT INTO `o_goods_sku_attr` VALUES (4, 4, 'color', '颜色', 1, 0, '香辣味420g*2瓶微辣', 'http://img.huayikeji.com/z01l0tjah6vwpwdp4yhppthum9l44our');
INSERT INTO `o_goods_sku_attr` VALUES (5, 5, 'color', '颜色', 1, 0, '5A精品', 'http://img.huayikeji.com/kx3ikkjuand5huibpsh3s4o7jsuzilfa');
INSERT INTO `o_goods_sku_attr` VALUES (6, 6, 'color', '颜色', 1, 0, '甜味型20袋', 'http://img.huayikeji.com/u4ga7xp1swww4t7y40eh3gvgs3kikf83');
INSERT INTO `o_goods_sku_attr` VALUES (7, 7, 'color', '颜色', 1, 0, '深蓝色', 'http://img.huayikeji.com/0lzoyn7adrkv8iv7xjy8kcejl9yelkcg');
INSERT INTO `o_goods_sku_attr` VALUES (8, 7, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/ahc832bn59qoxq7vlrnvue9lrsiqxsbd');
INSERT INTO `o_goods_sku_attr` VALUES (9, 7, 'color', '颜色', 1, 0, '欧美白', 'http://img.huayikeji.com/df8eqd6e9t46vfjx3j7tk84z72yhc3uy');
INSERT INTO `o_goods_sku_attr` VALUES (10, 7, 'size', '尺码', 2, 0, '5寸', '');
INSERT INTO `o_goods_sku_attr` VALUES (11, 7, 'size', '尺码', 2, 0, '6寸', '');
INSERT INTO `o_goods_sku_attr` VALUES (12, 7, 'size', '尺码', 2, 0, '8寸', '');
INSERT INTO `o_goods_sku_attr` VALUES (13, 8, 'color', '颜色', 1, 0, '30g * 5包', 'http://img.huayikeji.com/0n40n4ctz61o2rtdlt9wldmxucsio789');
INSERT INTO `o_goods_sku_attr` VALUES (14, 9, 'color', '颜色', 1, 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (15, 9, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (16, 9, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01F1W2O12FOyB2UfQnX_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (17, 9, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (18, 9, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (19, 9, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (20, 9, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (21, 9, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (22, 9, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (23, 10, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (24, 10, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AWoRY32FOyFNn0erQ_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (25, 10, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (26, 10, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (27, 10, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (28, 10, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (29, 10, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (30, 10, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (31, 11, 'color', '颜色', 1, 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN013LdA8s2FOyBfwOjXh_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (32, 11, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01giGdo92FOyBjYLUBx_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (33, 11, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN017OhDC42FOyBpOE5Xh_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (34, 11, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN018SPmsV1Bs2ghEUUei_!!0-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (35, 11, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BMEINy2FOyBhvpaPZ_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (36, 11, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (37, 11, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (38, 11, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (39, 11, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (40, 11, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (41, 12, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01UR16Tw2FOyJNPJHCZ_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (42, 12, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (43, 12, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (44, 12, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (45, 12, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (46, 12, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (47, 13, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gJpwlK2FOyGoJJ3sH_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (48, 13, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01wZ3ye12FOyGhhUDOe_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (49, 13, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01453F082FOyGp5H3Gv_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (50, 13, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (51, 13, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (52, 13, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (53, 13, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (54, 13, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (55, 14, 'color', '颜色', 1, 331, '灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J0a5Ij2FOyGVsqune_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (56, 14, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01i45X3r2FOyGVsraSQ_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (57, 14, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yx4kr52FOyGOtErWx_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (58, 14, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (59, 14, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (60, 14, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (61, 14, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (62, 14, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (63, 15, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01rXl5A92FOyBlp8KB2_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (64, 15, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lW8xsq2FOyBboDwmS_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (65, 15, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eRnnro2FOyBl7HmaB_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (66, 15, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN010pmtuT2FOyGqBp6dx_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (67, 15, 'color', '颜色', 1, 324, '粉色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jE2Cq12FOyGlWgGFO_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (68, 15, 'color', '颜色', 1, 359, '黄色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Fc0SiP2FOyGwQA0CS_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (69, 15, 'color', '颜色', 1, 0, '薄荷绿', 'https://cbu01.alicdn.com/img/ibank/O1CN010KmHBz2FOyGrTpnqo_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (70, 15, 'color', '颜色', 1, 335, '卡其色', 'https://cbu01.alicdn.com/img/ibank/O1CN01VRmnz72FOyGuOVemn_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (71, 15, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (72, 15, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (73, 15, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (74, 15, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (75, 15, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (76, 16, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/ux09zfd120aalurr55707gndmhn1rf21');
INSERT INTO `o_goods_sku_attr` VALUES (77, 16, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (78, 16, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (79, 16, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (80, 16, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (81, 16, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (82, 17, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/gm40mpqfc53scyxjou2epwqhjqbqp8cv');
INSERT INTO `o_goods_sku_attr` VALUES (83, 17, 'color', '颜色', 1, 322, '白色', 'http://img.huayikeji.com/k1bcjvacakh7t65tt541z636hrbv086m');
INSERT INTO `o_goods_sku_attr` VALUES (84, 17, 'color', '颜色', 1, 0, '粉色', 'http://img.huayikeji.com/wsqqp8sdqc5e8x9noarg9fswdo17wtu4');
INSERT INTO `o_goods_sku_attr` VALUES (85, 17, 'color', '颜色', 1, 0, '深灰色', 'http://img.huayikeji.com/68dgqc2s773upieznl528i0sqs8ib484');
INSERT INTO `o_goods_sku_attr` VALUES (86, 17, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (87, 17, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (88, 17, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (89, 17, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (90, 18, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic');
INSERT INTO `o_goods_sku_attr` VALUES (91, 18, 'color', '颜色', 1, 0, '复古蓝', 'http://img.huayikeji.com/tc51gyersphju6cgsns937bc3x7m2ph5');
INSERT INTO `o_goods_sku_attr` VALUES (92, 18, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/l1dj9ovhl9xkcln5lrv09txbvbd4i4ug');
INSERT INTO `o_goods_sku_attr` VALUES (93, 18, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (94, 18, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (95, 18, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (96, 18, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (97, 18, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (98, 19, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs');
INSERT INTO `o_goods_sku_attr` VALUES (99, 19, 'color', '颜色', 1, 0, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf');
INSERT INTO `o_goods_sku_attr` VALUES (100, 19, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr');
INSERT INTO `o_goods_sku_attr` VALUES (101, 19, 'color', '颜色', 1, 0, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2');
INSERT INTO `o_goods_sku_attr` VALUES (102, 19, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `o_goods_sku_attr` VALUES (103, 19, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (104, 19, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (105, 19, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (106, 19, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (107, 19, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (108, 19, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (109, 19, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (110, 20, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38');
INSERT INTO `o_goods_sku_attr` VALUES (111, 20, 'color', '颜色', 1, 0, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4');
INSERT INTO `o_goods_sku_attr` VALUES (112, 20, 'color', '颜色', 1, 0, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4');
INSERT INTO `o_goods_sku_attr` VALUES (113, 20, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `o_goods_sku_attr` VALUES (114, 20, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (115, 20, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (116, 20, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (117, 20, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (118, 20, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (119, 20, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (120, 20, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (121, 21, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol');
INSERT INTO `o_goods_sku_attr` VALUES (122, 21, 'color', '颜色', 1, 0, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh');
INSERT INTO `o_goods_sku_attr` VALUES (123, 21, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym');
INSERT INTO `o_goods_sku_attr` VALUES (124, 21, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `o_goods_sku_attr` VALUES (125, 21, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (126, 21, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (127, 21, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (128, 21, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (129, 21, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (130, 22, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f');
INSERT INTO `o_goods_sku_attr` VALUES (131, 22, 'color', '颜色', 1, 0, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z');
INSERT INTO `o_goods_sku_attr` VALUES (132, 22, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8');
INSERT INTO `o_goods_sku_attr` VALUES (133, 22, 'color', '颜色', 1, 0, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g');
INSERT INTO `o_goods_sku_attr` VALUES (134, 22, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `o_goods_sku_attr` VALUES (135, 22, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (136, 22, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (137, 22, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (138, 22, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (139, 22, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (140, 22, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (141, 22, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (142, 23, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig');
INSERT INTO `o_goods_sku_attr` VALUES (143, 23, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik');
INSERT INTO `o_goods_sku_attr` VALUES (144, 23, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj');
INSERT INTO `o_goods_sku_attr` VALUES (145, 23, 'color', '颜色', 1, 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr');
INSERT INTO `o_goods_sku_attr` VALUES (146, 23, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `o_goods_sku_attr` VALUES (147, 23, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (148, 23, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (149, 23, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (150, 23, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (151, 23, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (152, 23, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (153, 23, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (154, 24, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayikeji.com/tglr5vq19k3f9kpt25bn3hxvwue8s8o9');
INSERT INTO `o_goods_sku_attr` VALUES (155, 24, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (156, 24, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (157, 24, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (158, 24, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (159, 24, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (160, 25, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0');
INSERT INTO `o_goods_sku_attr` VALUES (161, 25, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql');
INSERT INTO `o_goods_sku_attr` VALUES (162, 25, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `o_goods_sku_attr` VALUES (163, 25, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (164, 25, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (165, 25, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (166, 25, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (167, 25, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (168, 25, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (169, 25, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (170, 26, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd');
INSERT INTO `o_goods_sku_attr` VALUES (171, 26, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/86rh8lzpijus7pc7zcx4ld052uyzew7p');
INSERT INTO `o_goods_sku_attr` VALUES (172, 26, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayikeji.com/6193racfe6v2gls3c5582rxs6h6xpvqo');
INSERT INTO `o_goods_sku_attr` VALUES (173, 26, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (174, 26, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (175, 26, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (176, 26, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (177, 26, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (178, 27, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1');
INSERT INTO `o_goods_sku_attr` VALUES (179, 27, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw');
INSERT INTO `o_goods_sku_attr` VALUES (180, 27, 'color', '颜色', 1, 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo');
INSERT INTO `o_goods_sku_attr` VALUES (181, 27, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7');
INSERT INTO `o_goods_sku_attr` VALUES (182, 27, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `o_goods_sku_attr` VALUES (183, 27, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (184, 27, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (185, 27, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (186, 27, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (187, 27, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (188, 27, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (189, 27, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (190, 9, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gpoCDV2FOyAxsRAur_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (191, 9, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (197, 28, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (198, 28, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/657/708/20862807756_900849200.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (199, 28, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/080/060/20938060080_900849200.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (200, 28, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (201, 28, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (202, 28, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (203, 28, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (204, 28, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (205, 29, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (206, 29, 'color', '颜色', 1, 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (207, 29, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (208, 29, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (209, 29, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (210, 29, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (211, 29, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (212, 29, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (213, 30, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (214, 30, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (215, 30, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (216, 30, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (217, 30, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (218, 30, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (219, 31, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (220, 31, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/343/344/22330443343_900849200.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (221, 31, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/195/327/22411723591_900849200.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (222, 31, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/2020/281/876/22411678182_900849200.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (223, 31, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/024/282/22502282420_900849200.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (224, 31, 'color', '颜色', 1, 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/2020/685/864/22502468586_900849200.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (225, 31, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (226, 31, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (227, 31, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (228, 31, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (229, 31, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (230, 32, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (231, 32, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01zhhpHl2FOyGk0i8Nf_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (232, 32, 'color', '颜色', 1, 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01u87ebo2FOyGsDbhyd_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (233, 32, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (234, 32, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (235, 32, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (236, 32, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (237, 32, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (238, 33, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (239, 33, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01T4m3Jm2FOyCuMBQ9v_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (240, 33, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eWGzKH2FOyCrd3HjP_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (241, 33, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01zJ8R7I2FOyCr3v2cC_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (242, 33, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (243, 33, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (244, 33, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (245, 33, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (246, 33, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (247, 34, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (248, 34, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01HLBVQl2FOyEn4nMnB_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (249, 34, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YPm5Yc2FOyEkRHf9E_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (250, 34, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01TLlyFy2FOyEkRLLyI_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (251, 34, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (252, 34, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (253, 34, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (254, 34, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (255, 34, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (256, 35, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (257, 35, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (258, 35, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (259, 35, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (260, 35, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (261, 35, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (262, 36, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (263, 36, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kn6Ove2FOyDUNlzou_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (264, 36, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (265, 36, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (266, 36, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (267, 36, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (268, 36, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (269, 37, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (270, 37, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01C6Sn4s2FOyCMDu0n5_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (271, 37, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN013vTM8R2FOyCEFuCQk_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (272, 37, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (273, 37, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (274, 37, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (275, 37, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (276, 37, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (277, 38, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (278, 38, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01y01tnq2FOyAbctZxT_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (279, 38, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (280, 38, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (281, 38, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (282, 38, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (283, 38, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (284, 39, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (285, 39, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (286, 39, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (287, 39, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (288, 39, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (289, 39, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (290, 39, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (291, 39, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (292, 39, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (293, 40, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (294, 40, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D3ndSV2FOy9hbKsqA_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (295, 40, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YsByd92FOy9lGqpvL_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (296, 40, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (297, 40, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (298, 40, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (299, 40, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (300, 40, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (301, 41, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (302, 41, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01a2j3nN2FOyHBXnetl_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (303, 41, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (304, 41, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (305, 41, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (306, 41, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (307, 41, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (308, 42, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (309, 42, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (310, 42, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (311, 42, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (312, 42, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (313, 42, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (314, 42, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (315, 42, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (316, 42, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (317, 43, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (318, 43, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/705/941/21730149507_900849200.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (319, 43, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (320, 43, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (321, 43, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (322, 43, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (323, 43, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (324, 44, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (325, 44, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016QWq2N2FOyCSH3gt9_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (326, 44, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01evRAWu2FOyCUPwcyo_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (327, 44, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (328, 44, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (329, 44, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (330, 44, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (331, 44, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (332, 44, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (333, 45, 'color', '颜色', 1, 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (334, 45, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01WpxUo32FOyCb3IFRu_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (335, 45, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01LNgHTm2FOyCf3KXQX_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (336, 45, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01A6gZ4a2FOyChQ6oRF_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (337, 45, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (338, 45, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (339, 45, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (340, 45, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (341, 45, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (342, 46, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (343, 46, 'color', '颜色', 1, 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (344, 46, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (345, 46, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (346, 46, 'color', '颜色', 1, 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (347, 46, 'color', '颜色', 1, 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (348, 46, 'color', '颜色', 1, 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (349, 46, 'color', '颜色', 1, 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (350, 46, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (351, 46, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (352, 46, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (353, 46, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (354, 46, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (355, 46, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (356, 46, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (357, 47, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (358, 47, 'color', '颜色', 1, 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (359, 47, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `o_goods_sku_attr` VALUES (360, 47, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (361, 47, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (362, 47, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (363, 47, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (364, 47, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (365, 33, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kv2ymz2FOyCNsDP1S_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (366, 33, 'color', '颜色', 1, 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O3yq8p2FOyCOMzdUR_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (367, 33, 'color', '颜色', 1, 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01wWwtXm2FOyDIpC0BY_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (368, 33, 'color', '颜色', 1, 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01lqQeRn2FOyDLJRi9c_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (369, 33, 'color', '颜色', 1, 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tQBYWC2FOyD8HYB3p_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (370, 33, 'color', '颜色', 1, 412, '复古蓝加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tS1yRE2FOyDMvwj7p_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (371, 33, 'color', '颜色', 1, 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN010gs0ON2FOyDNfPddh_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (372, 33, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (373, 33, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (374, 33, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (375, 33, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (376, 33, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (377, 22, 'color', '颜色', 1, 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (378, 22, 'color', '颜色', 1, 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (379, 22, 'color', '颜色', 1, 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (380, 22, 'color', '颜色', 1, 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (381, 22, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `o_goods_sku_attr` VALUES (382, 22, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (383, 22, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (384, 22, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (385, 22, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (386, 22, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (387, 22, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (388, 22, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (389, 48, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (390, 48, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (391, 48, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (392, 48, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (393, 48, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (394, 48, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (395, 49, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4');
INSERT INTO `o_goods_sku_attr` VALUES (396, 49, 'color', '颜色', 1, 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp');
INSERT INTO `o_goods_sku_attr` VALUES (397, 49, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2');
INSERT INTO `o_goods_sku_attr` VALUES (398, 49, 'color', '颜色', 1, 412, '复古蓝加绒', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4');
INSERT INTO `o_goods_sku_attr` VALUES (399, 49, 'color', '颜色', 1, 411, '蓝灰色加绒', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp');
INSERT INTO `o_goods_sku_attr` VALUES (400, 49, 'color', '颜色', 1, 409, '黑色加绒', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2');
INSERT INTO `o_goods_sku_attr` VALUES (401, 49, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (402, 49, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (403, 49, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (404, 49, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (405, 49, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (406, 49, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (407, 49, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (408, 49, 'color', '颜色', 1, 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4');
INSERT INTO `o_goods_sku_attr` VALUES (409, 49, 'color', '颜色', 1, 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp');
INSERT INTO `o_goods_sku_attr` VALUES (410, 49, 'color', '颜色', 1, 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2');
INSERT INTO `o_goods_sku_attr` VALUES (411, 49, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (412, 49, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (413, 49, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (414, 49, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (415, 49, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (416, 49, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (417, 49, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (418, 53, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/2ekpro9obesysm6vf1h0ihhfx1z9bgqz');
INSERT INTO `o_goods_sku_attr` VALUES (419, 53, 'color', '颜色', 1, 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80');
INSERT INTO `o_goods_sku_attr` VALUES (420, 53, 'color', '颜色', 1, 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9');
INSERT INTO `o_goods_sku_attr` VALUES (421, 53, 'color', '颜色', 1, 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6');
INSERT INTO `o_goods_sku_attr` VALUES (422, 53, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `o_goods_sku_attr` VALUES (423, 53, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (424, 53, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (425, 53, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (426, 53, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (427, 53, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (428, 53, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (429, 53, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (430, 53, 'style', '款式', 3, 417, '九分', '');
INSERT INTO `o_goods_sku_attr` VALUES (431, 53, 'style', '款式', 3, 418, '八分', '');
INSERT INTO `o_goods_sku_attr` VALUES (432, 53, 'style', '款式', 3, 419, '九分加绒', '');
INSERT INTO `o_goods_sku_attr` VALUES (433, 54, 'color', '颜色', 1, 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi');
INSERT INTO `o_goods_sku_attr` VALUES (434, 54, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4');
INSERT INTO `o_goods_sku_attr` VALUES (435, 54, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (436, 54, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (437, 54, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (438, 54, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (439, 54, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (440, 54, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (441, 55, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5');
INSERT INTO `o_goods_sku_attr` VALUES (442, 55, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h');
INSERT INTO `o_goods_sku_attr` VALUES (443, 55, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `o_goods_sku_attr` VALUES (444, 55, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (445, 55, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (446, 55, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (447, 55, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (448, 55, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (449, 56, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk');
INSERT INTO `o_goods_sku_attr` VALUES (450, 56, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `o_goods_sku_attr` VALUES (451, 56, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (452, 56, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (453, 56, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (454, 56, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (455, 56, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (456, 56, 'style', '款式', 3, 416, '长款', '');
INSERT INTO `o_goods_sku_attr` VALUES (457, 56, 'style', '款式', 3, 415, '加长款', '');
INSERT INTO `o_goods_sku_attr` VALUES (458, 59, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k');
INSERT INTO `o_goods_sku_attr` VALUES (459, 59, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `o_goods_sku_attr` VALUES (460, 59, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (461, 59, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (462, 59, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (463, 59, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (464, 59, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (465, 59, 'style', '款式', 3, 416, '长款', '');
INSERT INTO `o_goods_sku_attr` VALUES (466, 59, 'style', '款式', 3, 415, '加长款', '');
INSERT INTO `o_goods_sku_attr` VALUES (467, 60, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr');
INSERT INTO `o_goods_sku_attr` VALUES (468, 60, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q');
INSERT INTO `o_goods_sku_attr` VALUES (469, 60, 'color', '颜色', 1, 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi');
INSERT INTO `o_goods_sku_attr` VALUES (470, 60, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `o_goods_sku_attr` VALUES (471, 60, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (472, 60, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (473, 60, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (474, 60, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (475, 60, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (476, 60, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (477, 60, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (478, 61, 'color', '颜色', 1, 351, '蓝色', 'http://img.huayiyungou.com/q3t7loa0mz6lokizz93fp52cltgxhuq2');
INSERT INTO `o_goods_sku_attr` VALUES (479, 61, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayiyungou.com/qx67wj65nlvrs514g02bs7ocptl5b6ec');
INSERT INTO `o_goods_sku_attr` VALUES (480, 61, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `o_goods_sku_attr` VALUES (481, 61, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (482, 61, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (483, 61, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (484, 61, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (485, 61, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (486, 62, 'color', '颜色', 1, 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (487, 62, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (488, 62, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (489, 62, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `o_goods_sku_attr` VALUES (490, 62, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (491, 62, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (492, 62, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (493, 62, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (494, 62, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (495, 62, 'style', '款式', 3, 417, '九分', '');
INSERT INTO `o_goods_sku_attr` VALUES (496, 62, 'style', '款式', 3, 416, '长款', '');
INSERT INTO `o_goods_sku_attr` VALUES (497, 63, 'color', '颜色', 1, 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (498, 63, 'color', '颜色', 1, 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (499, 63, 'color', '颜色', 1, 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (500, 63, 'color', '颜色', 1, 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (501, 63, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `o_goods_sku_attr` VALUES (502, 63, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (503, 63, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (504, 63, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (505, 63, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (506, 63, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (507, 63, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (508, 63, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (509, 63, 'style', '款式', 3, 420, '单裤', '');
INSERT INTO `o_goods_sku_attr` VALUES (510, 63, 'style', '款式', 3, 421, '加绒', '');
INSERT INTO `o_goods_sku_attr` VALUES (511, 64, 'color', '颜色', 1, 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (512, 64, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (513, 64, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG');
INSERT INTO `o_goods_sku_attr` VALUES (514, 64, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `o_goods_sku_attr` VALUES (515, 64, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (516, 64, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (517, 64, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (518, 64, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (519, 64, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (520, 64, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (521, 64, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (522, 64, 'style', '款式', 3, 417, '九分', '');
INSERT INTO `o_goods_sku_attr` VALUES (523, 64, 'style', '款式', 3, 416, '长款', '');
INSERT INTO `o_goods_sku_attr` VALUES (524, 65, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lfHUDo1p3HVme2o7Q_!!2214743335304-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (525, 65, 'color', '颜色', 1, 338, '咖啡色', 'https://cbu01.alicdn.com/img/ibank/O1CN01kneLsV1p3HVu8u1xi_!!2214743335304-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (526, 65, 'color', '颜色', 1, 377, '墨绿色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nPrwCh1p3HVouHmtq_!!2214743335304-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (527, 65, 'size', '尺码', 2, 340, '均码', '');
INSERT INTO `o_goods_sku_attr` VALUES (528, 66, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (529, 66, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `o_goods_sku_attr` VALUES (530, 66, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (531, 66, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (532, 66, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (533, 66, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (534, 66, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (535, 66, 'style', '款式', 3, 420, '单裤', '');
INSERT INTO `o_goods_sku_attr` VALUES (536, 66, 'style', '款式', 3, 421, '加绒', '');
INSERT INTO `o_goods_sku_attr` VALUES (537, 67, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (538, 67, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png');
INSERT INTO `o_goods_sku_attr` VALUES (539, 67, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `o_goods_sku_attr` VALUES (540, 67, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (541, 67, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (542, 67, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (543, 67, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (544, 67, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (545, 67, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (546, 67, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (547, 67, 'style', '款式', 3, 416, '长裤', '');
INSERT INTO `o_goods_sku_attr` VALUES (548, 67, 'style', '款式', 3, 422, '长裤加绒', '');
INSERT INTO `o_goods_sku_attr` VALUES (549, 67, 'style', '款式', 3, 415, '加长裤', '');
INSERT INTO `o_goods_sku_attr` VALUES (550, 67, 'style', '款式', 3, 423, '加长裤加绒', '');
INSERT INTO `o_goods_sku_attr` VALUES (551, 62, 'color', '颜色', 1, 384, '深蓝长款', '');
INSERT INTO `o_goods_sku_attr` VALUES (552, 62, 'color', '颜色', 1, 383, '深蓝九分', '');
INSERT INTO `o_goods_sku_attr` VALUES (553, 62, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `o_goods_sku_attr` VALUES (554, 62, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (555, 62, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (556, 62, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (557, 62, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (558, 62, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (559, 68, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (560, 68, 'color', '颜色', 1, 314, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (561, 68, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `o_goods_sku_attr` VALUES (562, 68, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `o_goods_sku_attr` VALUES (563, 68, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `o_goods_sku_attr` VALUES (564, 68, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (565, 68, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `o_goods_sku_attr` VALUES (566, 69, 'color', '颜色', 1, 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (567, 69, 'color', '颜色', 1, 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (568, 69, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (569, 69, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (570, 69, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (571, 69, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (572, 69, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (573, 69, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (574, 69, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (575, 70, 'color', '颜色', 1, 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (576, 70, 'color', '颜色', 1, 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg');
INSERT INTO `o_goods_sku_attr` VALUES (577, 70, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `o_goods_sku_attr` VALUES (578, 70, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `o_goods_sku_attr` VALUES (579, 70, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `o_goods_sku_attr` VALUES (580, 70, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `o_goods_sku_attr` VALUES (581, 70, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `o_goods_sku_attr` VALUES (582, 70, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `o_goods_sku_attr` VALUES (583, 70, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `o_goods_sku_attr` VALUES (584, 71, 'color', '颜色', 114, 413, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (585, 71, 'color', '颜色', 114, 412, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (586, 71, 'size', '尺码', 115, 406, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (587, 71, 'size', '尺码', 115, 405, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (588, 71, 'style', '款式', 116, 413, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (589, 71, 'style', '款式', 116, 412, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (597, 74, 'color', '颜色', 114, 413, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (598, 74, 'color', '颜色', 114, 412, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (599, 74, 'size', '尺码', 115, 408, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (600, 74, 'size', '尺码', 115, 407, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (601, 74, 'style', '款式', 116, 413, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (602, 74, 'style', '款式', 116, 412, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (603, 76, 'color', '颜色', 114, 359, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (611, 76, 'size', '尺码', 115, 341, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (612, 76, 'size', '尺码', 115, 342, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (613, 76, 'size', '尺码', 115, 343, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (614, 76, 'size', '尺码', 115, 344, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (615, 76, 'style', '款式', 116, 359, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (616, 77, 'color', '颜色', 114, 308, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (617, 77, 'style', '款式', 116, 308, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (618, 78, 'color', '颜色', 114, 333, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (619, 78, 'size', '尺码', 115, 340, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (620, 78, 'style', '款式', 116, 333, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (621, 79, 'color', '颜色', 114, 425, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (622, 79, 'style', '款式', 116, 425, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (623, 80, 'color', '颜色', 114, 425, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (624, 80, 'style', '款式', 116, 425, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (625, 81, 'color', '颜色', 114, 425, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (626, 81, 'style', '款式', 116, 425, NULL, NULL);

-- ----------------------------
-- Table structure for o_goods_supplier
-- ----------------------------
DROP TABLE IF EXISTS `o_goods_supplier`;
CREATE TABLE `o_goods_supplier`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `number` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商编码',
  `login_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登陆名',
  `login_pwd` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登陆密码',
  `login_slat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tax_rate` double NULL DEFAULT 0 COMMENT '税率',
  `amount` double NULL DEFAULT 0 COMMENT '期初应付款',
  `period_money` double NULL DEFAULT 0 COMMENT '期初预付款',
  `dif_money` double NULL DEFAULT 0 COMMENT '初期往来余额',
  `begin_date` date NULL DEFAULT NULL COMMENT '余额日期',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `place` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '职位',
  `link_man` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系方式',
  `province` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `county` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区县',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货地址详情',
  `pin_yin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `disable` tinyint(1) NULL DEFAULT 0 COMMENT '0启用   1禁用',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '0正常 1删除',
  `purchaser_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分管采购员',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of o_goods_supplier
-- ----------------------------
INSERT INTO `o_goods_supplier` VALUES (1, '潮州市橄醇食品有限公司', 'CZGCSPYXGS001', '15895890060', '139cef1f475a0d38c92dcd1f60433113', 'OfPVeJM9DqkIQu/X/OcEdg==', 0, 0, 0, 0, NULL, '', '', NULL, '15895890060', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2025-02-20 10:31:21', NULL, '2025-02-22 11:10:54', 'admin');
INSERT INTO `o_goods_supplier` VALUES (2, '潮州市潮安区文祠镇文香食品厂', 'CZSCAQWCZWXSPC01', '18023923550', '0cd39e343921e052b953a2c202b3fdbb', 'g/bkGLv16a1TEEgBYlFlCA==', 0, 0, 0, 0, NULL, '', '', '廖先生', '18023923550', NULL, NULL, NULL, '潮州市潮安区文祠镇文香食品厂', '', 0, 0, NULL, '2025-02-20 10:33:06', NULL, '2025-02-20 17:38:02', 'admin');
INSERT INTO `o_goods_supplier` VALUES (3, '广东优玖食品有限公司', 'GDYJSPYXGS', NULL, NULL, NULL, 0, 0, 0, 0, NULL, '', '', NULL, '15895890070', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2025-02-20 10:35:19', NULL, NULL, NULL);
INSERT INTO `o_goods_supplier` VALUES (4, '潮州奉旨打丸食品有限公司', 'CZFZDWSPYXGS01', NULL, NULL, NULL, 0, 0, 0, 0, NULL, '', '', NULL, '15895890080', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2025-02-20 10:36:22', NULL, NULL, NULL);
INSERT INTO `o_goods_supplier` VALUES (10, '自营仓库', 'A0001', NULL, NULL, NULL, 0, 0, 0, 0, NULL, '', '', NULL, '15000000000', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2023-12-29 11:01:02', NULL, NULL, NULL);
INSERT INTO `o_goods_supplier` VALUES (26, '韩牛服饰', 'HN', NULL, NULL, NULL, 0, 0, 0, 0, NULL, '', '', NULL, '13249570000', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2023-12-29 11:01:03', NULL, NULL, NULL);
INSERT INTO `o_goods_supplier` VALUES (28, '广州衣菲妮服装厂', 'YIFEINI', NULL, NULL, NULL, 0, 0, 0, 0, NULL, '', '', NULL, '13600000000', NULL, NULL, NULL, NULL, '', 1, 1, NULL, '2023-12-29 11:01:03', NULL, NULL, NULL);
INSERT INTO `o_goods_supplier` VALUES (29, '中山欧熙妮服饰有限公司', 'ZSOXNFS', 'aaaa', 'a5ead77077e942c124095b5b087ca9dd', 'dllatjrQeENR2lpfL29tHQ==', 0, 0, 0, 0, NULL, '', '', NULL, '13600000000', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2023-12-29 11:01:03', NULL, '2025-02-24 14:44:19', 'admin');
INSERT INTO `o_goods_supplier` VALUES (31, '中山市金客隆服饰有限公司', 'JKL', '15818590110', '8e59dc7a07f8dc42ae560241cdc6ff94', 'vVDp5copKRcCt0gkOO9fQg==', 0, 0, 0, 0, NULL, '', '', NULL, '13600000000', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2023-12-29 11:01:04', NULL, '2025-02-16 21:21:50', 'admin');
INSERT INTO `o_goods_supplier` VALUES (33, '中山裤豪', 'ZSKH', '15818590119', 'f51a0012146d898d241bec1d72f14971', '6ib7ZVI36ovekRJISa3Wtg==', 0, 0, 0, 0, NULL, '', '', '', '', NULL, NULL, NULL, '中山市沙溪镇水牛城三区二楼35-38卡', '', 0, 0, NULL, '2023-12-29 11:01:04', NULL, '2025-02-24 15:57:24', 'admin');

-- ----------------------------
-- Table structure for o_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `o_goods_type`;
CREATE TABLE `o_goods_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of o_goods_type
-- ----------------------------
INSERT INTO `o_goods_type` VALUES (1, '闪存芯片', 1, 'admin', '2023-12-29 13:44:29', 'admin', '2023-12-29 13:44:29');
INSERT INTO `o_goods_type` VALUES (2, '其他芯片', 1, 'admin', '2024-09-15 18:00:42', NULL, NULL);

-- ----------------------------
-- Table structure for order_goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `order_goods_comment`;
CREATE TABLE `order_goods_comment`  (
  `id` bigint NOT NULL,
  `order_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `size` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `create_on` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_goods_comment
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '系统名称', 'sys.name', '启航电商ERP系统', 'Y', 'admin', '2023-08-07 19:31:38', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-08-07 19:31:38', '', NULL, '是否开启验证码功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '启航技术', 0, '老齐', '15888888888', '280645618@qq.com', '0', '0', 'admin', '2023-08-07 19:31:37', 'admin', '2024-09-15 17:52:12');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '研发中心', 1, '老齐', '15888888888', '280645618@qq.com', '0', '0', 'admin', '2023-08-07 19:31:37', 'admin', '2024-09-15 17:52:47');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '市场中心', 2, '方', '15888888888', 'market@qihangerp.cn', '0', '0', 'admin', '2023-08-07 19:31:37', 'admin', '2024-09-15 17:53:28');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2142 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (20, '商品管理', 0, 20, 'goods', 'Layout', '', 1, 0, 'M', '0', '0', '', 'international', 'admin', '2023-12-29 16:53:03', 'admin', '2025-03-30 18:16:36', '');
INSERT INTO `sys_menu` VALUES (30, '用户管理', 0, 30, 'user', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'peoples', 'admin', '2025-03-27 11:54:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (50, '订单管理', 0, 50, '/order', 'Layout', '', 1, 0, 'M', '0', '0', '', 'shopping', 'admin', '2023-12-27 15:00:27', 'admin', '2025-03-27 11:53:29', '系统管理目录');
INSERT INTO `sys_menu` VALUES (98, '商城装修', 0, 80, 'shop', 'Layout', '', 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2023-12-29 13:29:44', 'admin', '2025-03-30 18:19:27', '');
INSERT INTO `sys_menu` VALUES (99, '系统设置', 0, 99, '/system', 'Layout', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-12-27 15:00:27', 'admin', '2023-12-29 09:07:42.856856', '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '订单管理', 50, 1, 'order_list', 'order/index', '', 1, 0, 'C', '0', '0', '', 'shopping', 'admin', '2023-12-27 15:00:27', 'admin', '2025-03-30 18:13:40', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (104, '售后管理', 50, 10, 'refund_list', 'refund/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-27 15:00:27', 'admin', '2025-03-30 18:13:57', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (106, '发货管理', 50, 25, 'shipping_list', 'order/shipping', '', 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2023-12-27 15:00:27', 'admin', '2025-03-30 18:24:57', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (116, '用户管理', 99, 0, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2023-12-27 15:00:27', 'admin', '2025-02-17 22:03:15', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (117, '菜单管理', 99, 1, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2023-12-27 15:00:27', '', '', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (1001, '添加ERP商品', 20, 99, 'create', 'goods/create', NULL, 1, 0, 'C', '1', '0', '', 'checkbox', 'admin', '2024-03-18 07:59:57', 'admin', '2024-09-07 16:41:46', '');
INSERT INTO `sys_menu` VALUES (1002, '商品库管理', 20, 0, 'goods_list', 'goods/index', NULL, 1, 0, 'C', '0', '0', 'goods', 'example', 'admin', '2024-08-25 14:35:54', 'admin', '2024-09-08 16:14:12', '');
INSERT INTO `sys_menu` VALUES (1003, '型号管理', 20, 10, 'sku_list', 'goods/spec/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-29 16:35:55', 'admin', '2025-02-17 20:54:42', '');
INSERT INTO `sys_menu` VALUES (1004, '分类管理', 20, 80, 'category_list', 'goods/category/index', NULL, 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2024-08-25 18:43:28', 'admin', '2024-09-07 15:47:44', '');
INSERT INTO `sys_menu` VALUES (1005, '品牌管理', 20, 81, 'brand_list', 'goods/brand/index', NULL, 1, 0, 'C', '0', '0', '', 'icon', 'admin', '2024-08-25 18:45:47', 'admin', '2024-09-07 15:48:31', '');
INSERT INTO `sys_menu` VALUES (1006, '分类规格属性', 20, 101, 'goods_category/attribute', 'goods/category/categoryAttribute', NULL, 1, 0, 'C', '1', '0', '', 'button', 'admin', '2024-08-25 18:49:22', 'admin', '2024-09-07 16:17:01', '');
INSERT INTO `sys_menu` VALUES (1007, '规格属性值', 20, 102, 'goods_category/attribute_value', 'goods/category/categoryAttributeValue', NULL, 1, 0, 'C', '1', '0', '', 'date', 'admin', '2024-08-25 18:51:55', 'admin', '2024-09-07 16:23:53', '');
INSERT INTO `sys_menu` VALUES (1008, '类型管理', 20, 82, 'type_list', NULL, NULL, 1, 0, 'C', '0', '0', NULL, 'clipboard', 'admin', '2025-03-27 11:51:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '供应商管理', 20, 90, 'supplier_list', 'goods/supplier/index', NULL, 1, 0, 'C', '0', '0', '', 'people', 'admin', '2024-08-25 18:27:55', 'admin', '2024-09-07 15:51:17', '');
INSERT INTO `sys_menu` VALUES (1010, '添加商品', 20, 2, 'create2', 'goods/create_new', NULL, 1, 0, 'C', '1', '0', '', '404', 'admin', '2025-02-24 18:14:06', 'admin', '2025-03-04 19:56:06', '');
INSERT INTO `sys_menu` VALUES (2079, '字典管理', 99, 9, 'dict', 'system/dict/index', NULL, 1, 0, 'C', '0', '0', '', 'dict', 'admin', '2024-03-18 08:43:55', 'admin', '2024-03-18 08:44:08', '');
INSERT INTO `sys_menu` VALUES (2086, '定时任务配置', 98, 99, 'sys_task', 'system/task/index', NULL, 1, 0, 'C', '0', '0', '', 'time-range', 'admin', '2024-03-22 19:29:20', 'admin', '2025-02-17 20:39:48', '');
INSERT INTO `sys_menu` VALUES (2088, '发货快递管理', 98, 99, 'ship_logistics_company', 'shipping/logistics/company', NULL, 1, 0, 'C', '0', '0', '', 'checkbox', 'admin', '2024-03-30 17:37:01', 'admin', '2025-03-27 09:40:41', '');
INSERT INTO `sys_menu` VALUES (2090, '角色管理', 99, 2, 'role', 'system/role/index', NULL, 1, 0, 'C', '0', '0', NULL, 'peoples', 'admin', '2024-03-31 12:40:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2091, '部门管理', 99, 3, 'dept', 'system/dept/index', NULL, 1, 0, 'C', '0', '0', NULL, 'tree', 'admin', '2024-03-31 12:42:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2092, '售后处理记录', 50, 50, 'process', 'refund/after_process.vue', NULL, 1, 0, 'C', '0', '0', '', 'documentation', 'admin', '2024-04-06 17:27:03', 'admin', '2025-03-30 18:22:43', '');
INSERT INTO `sys_menu` VALUES (2093, '订单明细', 50, 2, 'order_item_list', 'order/item_list', NULL, 1, 0, 'C', '0', '0', NULL, 'chart', 'admin', '2024-04-06 18:58:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2103, '手动创建订单', 50, 49, 'offline_order_create', 'offline/order/create', NULL, 1, 0, 'C', '1', '0', '', 'date', 'admin', '2024-07-27 20:30:07', 'admin', '2024-09-07 23:20:43', '');
INSERT INTO `sys_menu` VALUES (2105, '库存管理', 0, 40, 'wms', NULL, NULL, 1, 0, 'M', '0', '1', '', 'lock', 'admin', '2024-08-25 15:54:14', 'admin', '2025-03-27 11:57:00', '');
INSERT INTO `sys_menu` VALUES (2106, '商品入库管理', 2105, 10, 'stock_in', 'wms/stockIn/index.vue', NULL, 1, 0, 'C', '0', '0', '', 'download', 'admin', '2024-08-25 15:56:04', 'admin', '2024-09-22 14:52:26', '');
INSERT INTO `sys_menu` VALUES (2114, '仓库仓位设置', 2105, 90, 'warehouse', 'wms/warehouse/index.vue', NULL, 1, 0, 'C', '0', '0', '', 'cascader', 'admin', '2024-09-21 20:07:26', 'admin', '2024-09-22 11:51:25', '');
INSERT INTO `sys_menu` VALUES (2115, '商品库存管理', 2105, 0, 'goods_inventory', 'goods/goodsInventory/index.vue', NULL, 1, 0, 'C', '0', '0', '', 'chart', 'admin', '2024-09-21 20:43:00', 'admin', '2024-10-05 16:30:35', '');
INSERT INTO `sys_menu` VALUES (2116, '商品出库管理', 2105, 20, 'stock_out', 'wms/stockOut/index', NULL, 1, 0, 'C', '0', '0', '', 'guide', 'admin', '2024-09-21 20:44:46', 'admin', '2024-09-22 14:52:37', '');
INSERT INTO `sys_menu` VALUES (2117, '仓位管理', 2105, 91, 'position', 'wms/warehouse/position', NULL, 1, 0, 'C', '1', '0', '', '404', 'admin', '2024-09-22 11:52:18', 'admin', '2024-09-22 14:48:21', '');
INSERT INTO `sys_menu` VALUES (2118, '新建商品入库单', 2105, 11, 'stock_in/create', 'wms/stockIn/create.vue', NULL, 1, 0, 'C', '1', '0', '', '404', 'admin', '2024-09-22 14:49:40', 'admin', '2024-09-22 15:30:10', '');
INSERT INTO `sys_menu` VALUES (2128, '新建商品出库单', 2105, 21, 'stock_out/create', 'wms/stockOut/create', NULL, 1, 0, 'C', '1', '0', '', 'color', 'admin', '2025-02-15 21:03:45', 'admin', '2025-02-15 21:04:07', '');
INSERT INTO `sys_menu` VALUES (2140, '普通用户', 30, 10, 'list', 'user/index', NULL, 1, 0, 'C', '0', '0', '', 'qq', 'admin', '2025-03-27 11:54:29', 'admin', '2025-03-27 20:35:39', '');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'URL地址',
  `object_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '对象名',
  `bucket` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '桶名',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES (1, '主图画板 1.jpg', '主图画板 1.jpg', '.jpg', 'http://127.0.0.1:9000/images/2024/09/07/a3e935aa-d1b3-4524-bd84-e567df01f2e3.jpg', '/images/2024/09/07/a3e935aa-d1b3-4524-bd84-e567df01f2e3.jpg', 'ecerp', 0, '0', '0', '', '2024-09-07 17:38:57', '', NULL);
INSERT INTO `sys_oss` VALUES (2, '主图画板2.jpg', '主图画板2.jpg', '.jpg', 'http://127.0.0.1:9000/images/2024/09/07/1dbe1530-787f-4461-9f20-3efa3c332588.jpg', '/images/2024/09/07/1dbe1530-787f-4461-9f20-3efa3c332588.jpg', 'ecerp', 0, '0', '0', '', '2024-09-07 17:57:54', '', NULL);
INSERT INTO `sys_oss` VALUES (3, '主图画板5.jpg', '主图画板5.jpg', '.jpg', 'http://127.0.0.1:9000/images/2024/09/07/2dc06b89-8661-4a72-a7cd-7f85f4545c6e.jpg', '/images/2024/09/07/2dc06b89-8661-4a72-a7cd-7f85f4545c6e.jpg', 'ecerp', 0, '0', '0', '', '2024-09-07 18:03:24', '', NULL);
INSERT INTO `sys_oss` VALUES (4, '主图画板 4.jpg', '主图画板 4.jpg', '.jpg', 'http://127.0.0.1:9000/ecerp//images/2024/09/07/3ed00452-5973-4c7e-91ae-5e87aa32dd23.jpg', '/images/2024/09/07/3ed00452-5973-4c7e-91ae-5e87aa32dd23.jpg', 'ecerp', 0, '0', '0', '', '2024-09-07 18:03:46', '', NULL);
INSERT INTO `sys_oss` VALUES (5, '主图画板5.jpg', '主图画板5.jpg', '.jpg', 'http://127.0.0.1:9000/ecerp/images/2024/09/07/4b2583ae-65ae-45b6-9227-ebbee99d6558.jpg', '/images/2024/09/07/4b2583ae-65ae-45b6-9227-ebbee99d6558.jpg', 'ecerp', 0, '0', '0', '', '2024-09-07 18:04:47', '', NULL);
INSERT INTO `sys_oss` VALUES (6, '主图画板2.jpg', '主图画板2.jpg', '.jpg', 'http://223.83.100.30:9001/omsimage/images/2024/09/07/a64ff14b-09d4-42d6-8d52-0344360efdbf.jpg', '/images/2024/09/07/a64ff14b-09d4-42d6-8d52-0344360efdbf.jpg', 'omsimage', 0, '0', '0', '', '2024-09-07 19:10:39', '', NULL);
INSERT INTO `sys_oss` VALUES (7, '主图画板 1.jpg', '主图画板 1.jpg', '.jpg', 'http://223.83.100.30:9001/omsimage/images/2024/09/07/af19385d-a1dd-4efb-8257-3099706d1272.jpg', '/images/2024/09/07/af19385d-a1dd-4efb-8257-3099706d1272.jpg', 'omsimage', 0, '0', '0', '', '2024-09-07 19:26:36', '', NULL);
INSERT INTO `sys_oss` VALUES (8, '主图画板 1.jpg', '主图画板 1.jpg', '.jpg', 'http://223.83.100.30:9001/omsimage/images/2024/09/07/5aac40e1-ddc1-41a8-a468-28d81e699980.jpg', '/images/2024/09/07/5aac40e1-ddc1-41a8-a468-28d81e699980.jpg', 'omsimage', 0, '0', '0', '', '2024-09-07 20:37:14', '', NULL);
INSERT INTO `sys_oss` VALUES (9, '主图画板 1.jpg', '主图画板 1.jpg', '.jpg', 'http://223.83.100.30:9001/omsimage/images/2024/09/07/b28f4e15-8997-418c-bd32-b4beb4966f6b.jpg', '/images/2024/09/07/b28f4e15-8997-418c-bd32-b4beb4966f6b.jpg', 'omsimage', 0, '0', '0', '', '2024-09-07 20:37:51', '', NULL);
INSERT INTO `sys_oss` VALUES (10, 'kjds..png', 'kjds..png', '.png', 'http://8.138.114.135:9000/zpmalloss/images/2025/02/21/76f75113-710f-4ff4-b3f9-213f89d6242a.png', '/images/2025/02/21/76f75113-710f-4ff4-b3f9-213f89d6242a.png', 'zpmalloss', 0, '0', '0', '', '2025-02-21 20:16:23', '', NULL);
INSERT INTO `sys_oss` VALUES (11, 'kjds..png', 'kjds..png', '.png', 'http://8.138.114.135:9000/zpmalloss/images/2025/02/21/91b45bfa-58cb-4aef-826d-1601a1c27e89.png', '/images/2025/02/21/91b45bfa-58cb-4aef-826d-1601a1c27e89.png', 'zpmalloss', 0, '0', '0', '', '2025-02-21 20:16:36', '', NULL);
INSERT INTO `sys_oss` VALUES (50, 'x4.jpg', 'x4.jpg', '.jpg', 'http://127.0.0.1:9000/images/2024/08/28/x4.jpg', '/images/2024/08/28/x4.jpg', 'ecerp', 0, '0', '0', '', '2024-08-28 22:39:05', '', NULL);
INSERT INTO `sys_oss` VALUES (51, 'x11.jpg', 'x11.jpg', '.jpg', 'http://127.0.0.1:9000/images/2024/08/28/x11.jpg', '/images/2024/08/28/x11.jpg', 'ecerp', 0, '0', '0', '', '2024-08-28 22:47:11', '', NULL);
INSERT INTO `sys_oss` VALUES (52, '主图画板 4.jpg', '主图画板 4.jpg', '.jpg', 'http://127.0.0.1:9000/images/2024/09/07/主图画板 4.jpg', '/images/2024/09/07/主图画板 4.jpg', 'ecerp', 0, '0', '0', '', '2024-09-07 17:31:44', '', NULL);
INSERT INTO `sys_oss` VALUES (53, '主图画板 4.jpg', '主图画板 4.jpg', '.jpg', 'http://127.0.0.1:9000/images/2024/09/07/主图画板 4.jpg', '/images/2024/09/07/主图画板 4.jpg', 'ecerp', 0, '0', '0', '', '2024-09-07 17:35:41', '', NULL);
INSERT INTO `sys_oss` VALUES (54, '主图画板 1.jpg', '主图画板 1.jpg', '.jpg', 'http://127.0.0.1:9000/images/2024/09/07/f35a3cb8-1b9e-41f4-8158-31d458c7efb3.jpg', '/images/2024/09/07/f35a3cb8-1b9e-41f4-8158-31d458c7efb3.jpg', 'ecerp', 0, '0', '0', '', '2024-09-07 17:36:09', '', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-08-07 19:31:37', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-08-07 19:31:37', 'admin', '2025-03-27 09:38:41', '普通角色');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_supplier_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_supplier_menu`;
CREATE TABLE `sys_supplier_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_supplier_menu
-- ----------------------------
INSERT INTO `sys_supplier_menu` VALUES (1, '订单管理', 0, 10, '/order', 'Layout', '', 1, 0, 'M', '0', '0', '', 'shopping', 'admin', '2023-12-27 15:00:27', 'admin', '2024-08-25 15:45:43', '系统管理目录');
INSERT INTO `sys_supplier_menu` VALUES (2, '售后管理', 0, 30, '/refund', 'Layout', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-12-27 15:00:27', 'admin', '2024-08-25 15:45:54', '至简官网地址');
INSERT INTO `sys_supplier_menu` VALUES (4, '商品管理', 0, 1, '/goods', 'Layout', '', 1, 0, 'M', '0', '0', '', 'international', 'admin', '2023-12-29 16:53:03', 'admin', '2024-09-07 15:44:10', '');
INSERT INTO `sys_supplier_menu` VALUES (5, '发货管理', 0, 20, '/ship', NULL, NULL, 1, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-03-30 17:36:10', 'admin', '2024-08-25 15:45:48', '');
INSERT INTO `sys_supplier_menu` VALUES (100, '订单中心', 1, 1, 'order_list', 'order/index', '', 1, 0, 'C', '0', '0', '', 'shopping', 'admin', '2023-12-27 15:00:27', 'admin', '2024-09-15 16:57:59', '用户管理菜单');
INSERT INTO `sys_supplier_menu` VALUES (101, '订单明细', 1, 2, 'order_item_list', 'order/item_list', NULL, 1, 0, 'C', '0', '0', NULL, 'chart', 'admin', '2024-04-06 18:58:06', '', NULL, '');
INSERT INTO `sys_supplier_menu` VALUES (201, '售后中心', 2, 1, 'refund_list', 'refund/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-27 15:00:27', 'admin', '2024-09-15 18:58:16', '岗位管理菜单');
INSERT INTO `sys_supplier_menu` VALUES (202, '售后处理记录', 2, 5, 'after_sale_record', 'refund/processRecordList', NULL, 1, 0, 'C', '0', '0', '', 'documentation', 'admin', '2024-04-06 17:27:03', 'admin', '2024-07-28 18:59:41', '');
INSERT INTO `sys_supplier_menu` VALUES (203, '物流跟踪', 5, 5, 'logistics', 'shipping/logistics/logistics', NULL, 1, 0, 'C', '0', '1', '', 'list', 'admin', '2024-07-20 11:54:18', 'admin', '2024-07-30 23:10:13', '');
INSERT INTO `sys_supplier_menu` VALUES (401, '商品管理', 4, 0, 'goods_list', 'goods/index', NULL, 1, 0, 'C', '0', '0', 'goods', 'example', 'admin', '2024-08-25 14:35:54', 'admin', '2024-09-08 16:14:12', '');
INSERT INTO `sys_supplier_menu` VALUES (402, '添加ERP商品', 4, 99, 'create', 'goods/create', NULL, 1, 0, 'C', '1', '0', '', 'checkbox', 'admin', '2024-03-18 07:59:57', 'admin', '2024-09-07 16:41:46', '');
INSERT INTO `sys_supplier_menu` VALUES (502, '订单打印', 5, 1, 'print', 'shipping/ewaybillPrint/index', NULL, 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2024-07-20 11:04:54', 'admin', '2024-07-28 18:46:09', '');
INSERT INTO `sys_supplier_menu` VALUES (503, '发货记录', 5, 3, 'record', 'shipping/index', NULL, 1, 0, 'C', '0', '0', '', 'guide', 'admin', '2024-03-30 17:37:42', 'admin', '2024-07-28 18:56:02', '');
INSERT INTO `sys_supplier_menu` VALUES (504, '备货出库', 5, 2, 'stockup', 'shipping/stockup', NULL, 1, 0, 'C', '0', '0', '', 'email', 'admin', '2024-07-20 11:53:24', 'admin', '2024-07-28 20:44:10', '');
INSERT INTO `sys_supplier_menu` VALUES (505, '发货快递管理', 5, 9, 'ship_logistics', 'shipping/logistics/company', NULL, 1, 0, 'C', '0', '0', '', 'checkbox', 'admin', '2024-03-30 17:37:01', 'admin', '2024-12-08 16:19:02', '');
INSERT INTO `sys_supplier_menu` VALUES (506, '待发清单', 5, 0, 'wait_ship_order', 'shipping/order/index', NULL, 1, 0, 'C', '0', '0', '', 'clipboard', 'admin', '2025-02-18 08:42:31', 'admin', '2025-02-18 08:43:37', '');

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `id` int NOT NULL,
  `task_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 0 COMMENT '状态1开启0关闭',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台任务配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES (11, '推送待发货订单到供应商', '-', NULL, '推送待发货订单到供应商', '2025-02-26 16:22:29', 1);
INSERT INTO `sys_task` VALUES (21, '推送待发货订单到ERP', '-', NULL, '推送待发货订单到ERP', '2024-04-22 15:48:48', 1);
INSERT INTO `sys_task` VALUES (22, '推送待处理售后到ERP', '-', NULL, '推送待处理售后到ERP', '2024-04-22 15:48:48', 1);
INSERT INTO `sys_task` VALUES (23, '推送已取消的订单到ERP', '-', NULL, '推送已取消的订单到ERP', '2024-05-29 17:57:02', 1);
INSERT INTO `sys_task` VALUES (101, '拉取淘宝天猫订单', '-', NULL, '定时更新淘宝订单', '2024-03-07 09:52:40', 1);
INSERT INTO `sys_task` VALUES (102, '拉取淘宝天猫退款', '-', NULL, '定时拉取天猫退款', '2024-04-09 11:25:43', 1);
INSERT INTO `sys_task` VALUES (201, '拉取京东POP订单', '-', NULL, '拉取京东POP订单', '2024-03-07 09:23:36', 1);
INSERT INTO `sys_task` VALUES (202, '拉取京东POP售后', '-', NULL, '定时拉取京东售后', '2024-04-09 11:26:26', 1);
INSERT INTO `sys_task` VALUES (281, '拉取京东自营订单', '-', NULL, '拉取京东自营订单', '2024-05-27 10:57:44', 1);
INSERT INTO `sys_task` VALUES (282, '拉取京东自营退货', '-', NULL, '拉取京东自营退货', '2025-02-21 15:09:54', 1);
INSERT INTO `sys_task` VALUES (301, '拉取拼多多订单', '-', NULL, '定时拉取拼多多订单', '2024-04-09 11:24:14', 1);
INSERT INTO `sys_task` VALUES (302, '拉取拼多多退款', '-', NULL, '定时拉取拼多多退款', '2024-04-09 11:27:01', 1);
INSERT INTO `sys_task` VALUES (401, '拉取抖店订单', '-', NULL, '定时拉取抖店订单', '2024-04-09 11:24:54', 1);
INSERT INTO `sys_task` VALUES (402, '拉取抖店退款', '-', NULL, '定时拉取抖店退款', '2024-04-09 11:27:38', 1);
INSERT INTO `sys_task` VALUES (501, '拉取微信小店订单', '-', NULL, '拉取微信小店订单', '2025-02-21 15:00:51', 1);
INSERT INTO `sys_task` VALUES (502, '拉取微信小店退款', '-', NULL, '拉取微信小店订单', '2025-02-21 15:01:12', 1);

-- ----------------------------
-- Table structure for sys_task_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_logs`;
CREATE TABLE `sys_task_logs`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `task_id` int NULL DEFAULT NULL COMMENT '任务ID',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '结果',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始运行时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `status` int NULL DEFAULT NULL COMMENT '状态1运行中，2已结束',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台任务运行日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_task_logs
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, NULL, 'admin', '启航老齐', '00', '280645618@qq.com', '18123879144', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-03-30 18:10:37', 'admin', '2023-08-07 19:31:37', '', '2025-03-30 18:10:37', '管理员');
INSERT INTO `sys_user` VALUES (2, NULL, 'openapi', 'openApi接口专用', '00', '2806456181@qq.com', '15818590000', '0', '', '$2a$10$fHkhoqbMiyracAsTzl38H.55bu.M.of1FXk2EK7RQBjfic3tLU0Ue', '0', '0', '127.0.0.1', '2024-06-24 10:23:35', 'admin', '2024-03-17 14:55:22', 'admin', '2024-06-24 10:23:35', NULL);
INSERT INTO `sys_user` VALUES (101, 101, '15818590119', 'aaa123', '00', '', '', '0', '', '$2a$10$pXcT6cHaObMeKuYd9vZb5uEb8PyUdF2AcqqRN1cBqiA9rV4qYQW7G', '0', '2', '', NULL, 'admin', '2024-08-15 13:45:25', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (102, 101, '15818590119', '老齐', '00', '', '', '0', '', '$2a$10$ysk.zgJ8wh25c7vOjKyZ8uarM2hkG0S51j8GYdJSo2kZmc3f8HdKe', '0', '0', '', NULL, 'admin', '2024-08-15 13:49:59', 'admin', '2025-02-10 16:26:20', NULL);
INSERT INTO `sys_user` VALUES (103, 100, '18025303180', '老方', '00', '', '', '0', '', '$2a$10$QnLM3NluG5q1xpmWep0QUOFfvNrd02hwenL4HkV0uhMbm4cEX1uIG', '0', '0', '', NULL, 'admin', '2024-09-21 17:17:56', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (102, 2);
INSERT INTO `sys_user_role` VALUES (103, 2);

SET FOREIGN_KEY_CHECKS = 1;
