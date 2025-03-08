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

 Date: 08/03/2025 12:36:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods_commend
-- ----------------------------
DROP TABLE IF EXISTS `goods_commend`;
CREATE TABLE `goods_commend`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deputy_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_num` int NULL DEFAULT NULL,
  `sort_num` int NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  `banner_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `commend_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_commend
-- ----------------------------

-- ----------------------------
-- Table structure for goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `goods_detail`;
CREATE TABLE `goods_detail`  (
  `id` bigint NOT NULL,
  `goods_id` bigint NOT NULL,
  `pc_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `m_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `modify_on` int NULL DEFAULT NULL,
  `modify_by` varchar(33) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attribute_text` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `spec_text` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `detail_text` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_detail
-- ----------------------------

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
  `type` int NOT NULL COMMENT '类型（1：logo 2：banner )',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '位置（HOME首页',
  `which` int NOT NULL COMMENT '展示端1：PC 2：H5',
  `start_time` int NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` int NULL DEFAULT NULL COMMENT '结束时间',
  `status` int NOT NULL COMMENT '状态 1正常 0下架',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_on` int NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城Banner' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_banner
-- ----------------------------
INSERT INTO `mall_banner` VALUES (1, 12, 'AA', 'aa', 'https://smart-shop.itheima.net/uploads/10001/20230320/6d239000de9c3f12aafa571349b63d22.jpg', 2, 'HOME', 2, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (2, 12, 'BB', 'aa', 'https://smart-shop.itheima.net/uploads/10001/20230320/5901a2e13e1075882950af75c98d0007.jpg', 2, 'HOME', 2, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (3, 12, 'CC', 'aa', 'https://smart-shop.itheima.net/uploads/10001/20230320/7143e84bf3dd41fa67b9675a9e5d81a3.jpg', 2, 'HOME', 2, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (4, 11, 'AA', '/category/1019000', 'http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-15/4a79180a-1a5a-4042-8a77-4db0b9c800a8.jpg', 2, 'HOME', 1, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (5, 11, 'AA', '/category/1019000', 'http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-15/1ba86bcc-ae71-42a3-bc3e-37b662f7f07e.jpg', 2, 'HOME', 1, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (6, 11, 'AA', '/category/1019000', 'http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-15/dfc11bb0-4af5-4e9b-9458-99f615cc685a.jpg', 2, 'HOME', 1, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (7, 11, 'AA', '/category/1019000', 'http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-15/6d202d8e-bb47-4f92-9523-f32ab65754f4.jpg', 2, 'HOME', 1, NULL, NULL, 1, 'admin', 1739754344);
INSERT INTO `mall_banner` VALUES (8, 11, 'AA', '/category/1019000', 'http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-15/e83efb1b-309c-46f7-98a3-f1fefa694338.jpg', 2, 'HOME', 1, NULL, NULL, 1, 'admin', 1739754344);

-- ----------------------------
-- Table structure for mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods`;
CREATE TABLE `mall_goods`  (
  `goods_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_code` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '商品编码',
  `goods_image` varchar(245) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '\'产品主图\'',
  `goods_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '\'商品标题\'',
  `deputy_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品副标题',
  `category_id` bigint NOT NULL DEFAULT 0 COMMENT '商品分类id',
  `goods_price_max` decimal(8, 2) NULL DEFAULT NULL COMMENT '商品最高价',
  `goods_price_min` decimal(8, 2) NULL DEFAULT NULL COMMENT '商品最低价',
  `line_price_max` decimal(8, 2) NULL DEFAULT NULL COMMENT '划线最高价',
  `line_price_min` decimal(8, 2) NULL DEFAULT NULL COMMENT '划线最低价',
  `sale_price` decimal(8, 2) NOT NULL COMMENT '销售价格',
  `cost_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '成本价格(采购价)',
  `market_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '市场价格',
  `commision_rate` decimal(3, 2) NOT NULL DEFAULT 0.20 COMMENT '佣金比例(一级)',
  `commision_rate2` decimal(3, 2) NOT NULL DEFAULT 0.10 COMMENT '佣金比例(二级)',
  `comment` varchar(145) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '\'产品简短介绍，参照京东商品红色文字\'',
  `category1` bigint NOT NULL COMMENT '产品一级分类',
  `category2` bigint NOT NULL COMMENT '产品二级分类',
  `category3` bigint NOT NULL COMMENT '产品三级分类',
  `order_socre` decimal(6, 2) NOT NULL COMMENT '排序综合得分',
  `is_stickypost` int NOT NULL COMMENT '是否置顶(是1，否0)',
  `comment_num` int NOT NULL COMMENT '评论数量',
  `comment_socre` decimal(4, 2) NOT NULL COMMENT '评论得分',
  `goods_sales` int NOT NULL DEFAULT 0 COMMENT '累积销量',
  `goods_sales_show` int NULL DEFAULT 0 COMMENT '销量，用于前台显示',
  `publish_state` int NOT NULL COMMENT '发布状态（2在库中1已上架）',
  `sales_status` int NOT NULL COMMENT '销售状态（2已下架1上架中）',
  `create_on` int NOT NULL COMMENT '创建时间',
  `create_by` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '\'创建人\'',
  `modify_on` int NULL DEFAULT NULL COMMENT '最后修改时间',
  `modify_by` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '\'最后修改人\'',
  `delivery_freight_template` int NULL DEFAULT NULL COMMENT '运费模版',
  `delivery_province` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '\n发货省份',
  `delivery_city` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '发货城市',
  `delivery_address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '发货地文字（显示用，如：广东深圳）',
  `keyword` varchar(245) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `is_promotion` int NOT NULL DEFAULT 0 COMMENT '是否在促销，0否1是默认0',
  `promotion_id` int NOT NULL DEFAULT 0 COMMENT '促销id',
  `promotion_type` int NOT NULL DEFAULT 0 COMMENT '促销类型',
  `promotion_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '促销标题',
  `promotion_rate` int NOT NULL DEFAULT 0 COMMENT '促销的折扣',
  `promotion_full_count` int NOT NULL DEFAULT 1 COMMENT '单品满折条件',
  `erp_goods_id` int NOT NULL DEFAULT 0 COMMENT 'ERP商品id',
  `sales_type` int NOT NULL DEFAULT 1 COMMENT '销售模式1现售2预售',
  `send_days` int NULL DEFAULT NULL COMMENT '预售发货天数',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods
-- ----------------------------

-- ----------------------------
-- Table structure for mall_goods_attachment
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_attachment`;
CREATE TABLE `mall_goods_attachment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` bigint NOT NULL,
  `type` int NOT NULL COMMENT '附件类型（0图片1视频2文件3详情图片4详情视频5详情图文）',
  `url` varchar(245) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '\'附件链接地址\'',
  `comment` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '\'附件说明\'',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `create_on` int NOT NULL COMMENT '创建时间',
  `create_by` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '\'创建人\'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品附件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for mall_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_attribute`;
CREATE TABLE `mall_goods_attribute`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` bigint NOT NULL,
  `attribute_id` int NOT NULL COMMENT '属性id',
  `attribute` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `value_id` int NOT NULL COMMENT '属性值id',
  `value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for mall_goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_comment`;
CREATE TABLE `mall_goods_comment`  (
  `id` bigint NOT NULL,
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_goods_comment
-- ----------------------------

-- ----------------------------
-- Table structure for mall_goods_comment_image
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_comment_image`;
CREATE TABLE `mall_goods_comment_image`  (
  `id` bigint NOT NULL,
  `comment_id` bigint NOT NULL COMMENT '评价id',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int NOT NULL COMMENT '状态1评价2已删除',
  `create_on` int NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_goods_comment_image
-- ----------------------------

-- ----------------------------
-- Table structure for mall_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods_sku`;
CREATE TABLE `mall_goods_sku`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` bigint NOT NULL COMMENT '外键（o_goods）',
  `erp_goods_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部erp系统商品id',
  `erp_goods_sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部erp系统skuId(唯一)',
  `sku_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '规格名',
  `sku_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规格编码',
  `color_id` bigint NULL DEFAULT 0 COMMENT '颜色id',
  `color_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色值',
  `color_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色图片',
  `size_id` bigint NULL DEFAULT 0 COMMENT '尺码id',
  `size_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '尺码值(材质)',
  `style_id` bigint NULL DEFAULT 0 COMMENT '款式id',
  `style_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '款式值',
  `goods_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '售价',
  `line_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '划线价',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `stock_num` int NOT NULL DEFAULT 0 COMMENT '库存',
  `volume` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品体积',
  `length` float NOT NULL DEFAULT 0 COMMENT '衣长',
  `height` float NOT NULL DEFAULT 0 COMMENT '高度',
  `width` float NOT NULL DEFAULT 0 COMMENT '宽度',
  `weight` float NOT NULL DEFAULT 0 COMMENT '重量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sku_id_unique`(`erp_goods_sku_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `number`(`sku_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1865649758294282256 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'OMS商品SKU表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_goods_sku
-- ----------------------------
INSERT INTO `mall_goods_sku` VALUES (1, 76, NULL, '11', '黄色 S', 'DY36404301', 359, '黄色', 'http://223.83.100.30:9001/omsimage/images/2024/09/07/b28f4e15-8997-418c-bd32-b4beb4966f6b.jpg', 341, 'S', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (2, 76, NULL, '22', '黄色 M', 'DY36404302', 359, '黄色', 'http://223.83.100.30:9001/omsimage/images/2024/09/07/b28f4e15-8997-418c-bd32-b4beb4966f6b.jpg', 342, 'M', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (3, 4, '10013', '1001', '280g*6', '10013', 5, '净含量', 'http://8.138.114.135:9000/zpmalloss/images/2025/02/21/0584b9c4-43f8-46d4-8317-bdc8bb9c1fcf.jpg', 0, '', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (4, 5, '10024', '1002', '250g*8', '10024', 7, '克重', 'http://8.138.114.135:9000/zpmalloss/images/2025/02/21/77a0fe44-4983-462b-9ee0-752e62c0ea05.jpg', 0, '', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (5, 6, '10035', '1003', '600g', '10035', 8, '净含量', 'http://8.138.114.135:9000/zpmalloss/images/2025/02/21/285e7e85-4f57-4762-9117-9e05b03e35cb.jpg', 0, '', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (6, 7, '10045', '1004', '1500g', '10045', 9, '净含量', 'http://8.138.114.135:9000/zpmalloss/images/2025/02/21/de92a289-0837-49a5-a826-aa21851b79ac.jpg', 0, '', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (7, 79, NULL, NULL, '默认', 'aa00', 425, '默认', 'https://cbu01.alicdn.com/img/ibank/O1CN01Aqa1cY1oPteJHyDYW_!!2217885915218-0-cib.jpg', 0, '', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (8, 80, NULL, NULL, '默认', 'ABC909338800', 425, '默认', 'https://cbu01.alicdn.com/img/ibank/O1CN01Mnbr4L2Exx8KntWGB_!!2215681298812-0-cib.jpg', 0, '', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (9, 81, NULL, NULL, '默认', 'ACDE3434300', 425, '默认', 'https://cbu01.alicdn.com/img/ibank/O1CN01Mnbr4L2Exx8KntWGB_!!2215681298812-0-cib.jpg', 0, '', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (31, 76, NULL, '23', '黄色 L', 'DY36404303', 359, '黄色', 'http://223.83.100.30:9001/omsimage/images/2024/09/07/b28f4e15-8997-418c-bd32-b4beb4966f6b.jpg', 343, 'L', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (41, 76, NULL, '52', '黄色 XL', 'DY36404304', 359, '黄色', 'http://223.83.100.30:9001/omsimage/images/2024/09/07/b28f4e15-8997-418c-bd32-b4beb4966f6b.jpg', 344, 'XL', 0, '', 0.00, 0.00, '', 2, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (51, 77, NULL, NULL, '黑色', 'QIHANGNIUERP00122', 308, '黑色', 'https://img.pddpic.com/garner-api-new/ffca4d8bba93ecc7813d350de43d5c50.jpeg?imageView2/2/w/2125/q/85', 0, '', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (61, 78, NULL, NULL, '大红色 均码', 'JIADUOBAO2600', 333, '大红色', 'https://cbu01.alicdn.com/img/ibank/O1CN012YyP5f1hbcSsvkd3k_!!2218127114296-0-cib.jpg', 340, '均码', 0, '11', 25.90, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (1865649758294282244, 82, NULL, NULL, 'aad 红色', '1233', 0, 'aad', 'aa', 0, '红色', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (1865649758294282245, 82, NULL, NULL, 'aad 绿色', '1244', 0, 'aad', 'aa', 0, '绿色', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (1865649758294282246, 82, NULL, NULL, 'dfdfd 红色', '1355', 0, 'dfdfd', 'aa', 0, '红色', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (1865649758294282247, 82, NULL, NULL, 'dfdfd 绿色', '1345', 0, 'dfdfd', 'aa', 0, '绿色', 0, '', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (1865649758294282248, 83, NULL, NULL, '红色 S 长款', 'ANK99380', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'S', 0, '长款', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (1865649758294282249, 83, NULL, NULL, '红色 S 短款', 'ANK99389', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'S', 0, '短款', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (1865649758294282250, 83, NULL, NULL, '红色 M 长款', 'ANK99382', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'M', 0, '长款', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (1865649758294282251, 83, NULL, NULL, '红色 M 短款', 'ANK99384', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'M', 0, '短款', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (1865649758294282252, 83, NULL, NULL, '红色 L 长款', 'ANK99381', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'L', 0, '长款', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (1865649758294282253, 83, NULL, NULL, '红色 L 短款', 'ANK99387', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'L', 0, '短款', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (1865649758294282254, 83, NULL, NULL, '红色 XL 长款', 'ANK99388', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'XL', 0, '长款', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);
INSERT INTO `mall_goods_sku` VALUES (1865649758294282255, 83, NULL, NULL, '红色 XL 短款', 'ANK99383', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'XL', 0, '短款', 0.00, 0.00, '', 1, 0, NULL, 0, 0, 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_nav
-- ----------------------------
INSERT INTO `mall_nav` VALUES (1, '新品首发', 'https://smart-shop.itheima.net/uploads/10001/20230320/58a7c1f62df4cb1eb47fe83ff0e566e6.png', 'icon-1.png', 'pages/category/index', 'HOME', 2, 1, NULL, NULL);
INSERT INTO `mall_nav` VALUES (2, '居家生活', 'https://smart-shop.itheima.net/uploads/10001/20230320/49c64dbbf449e9e8abfca314f92814bd.png', 'icon-2.png', 'pages/category/index', 'HOME', 2, 1, NULL, NULL);
INSERT INTO `mall_nav` VALUES (3, '服饰鞋包', 'https://smart-shop.itheima.net/uploads/10001/20230320/8573fbc5e87e8a88827e905fca284604.png', 'icon-2.png', 'pages/category/index', 'HOME', 2, 1, NULL, NULL);
INSERT INTO `mall_nav` VALUES (4, '美食酒水', 'https://smart-shop.itheima.net/uploads/10001/20230320/f01c5fc360f55c6053beec34913bc699.png', 'icon-2.png', 'pages/category/index', 'HOME', 2, 1, NULL, NULL);

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
  `status` int NOT NULL DEFAULT 1 COMMENT '状态 1正常 0下架',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_on` int NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '推荐商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_rec_goods
-- ----------------------------
INSERT INTO `mall_rec_goods` VALUES (1, 10052, 'http://smart-shop.itheima.net/uploads/10001/20230321/1d1801baa9c9b8d1d1524ec917d2adde.jpg', '蒙牛 特仑苏纯牛奶 250ml*12包 学生青少年营养早餐奶 送礼佳品 1月产', 49.00, 49.00, 1990, 59.00, 59.00, NULL, 'HOME', 2, NULL, NULL, 1, NULL, NULL);
INSERT INTO `mall_rec_goods` VALUES (2, 10038, 'http://smart-shop.itheima.net/uploads/10001/20230321/8f505c6c437fc3d4b4310b57b1567544.jpg', '三星手机 SAMSUNG Galaxy S23 8GB+256GB 超视觉夜拍系统 超清夜景 悠雾紫 5G手机 游戏拍照旗舰机s23', 55.00, 55.00, 4554, 2333.00, 2333.00, NULL, 'HOME', 2, NULL, NULL, 1, NULL, NULL);
INSERT INTO `mall_rec_goods` VALUES (3, 1233, 'http://smart-shop.itheima.net/uploads/10001/20230321/bfe7f91b8413f35f8a222450d630d0c0.jp', '[郎酒旗舰店郎牌郎酒]郎酒 郎牌郎酒 普郎 53度酱香型白酒 500ml*6瓶 整箱装白酒普郎原箱', 1620.00, 1620.00, 3444, 2499.00, 2499.00, NULL, 'HOME', 2, NULL, NULL, 1, NULL, NULL);

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
-- Table structure for mall_user
-- ----------------------------
DROP TABLE IF EXISTS `mall_user`;
CREATE TABLE `mall_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号（可用于登录）',
  `user_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员名(实名认证后写入实名认证值，比如企业认证，就是公司名）',
  `login_pwd` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录密码',
  `source` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '来源：小程序、小程序分享、交易终端',
  `source_market_id` bigint NULL DEFAULT NULL COMMENT '来源市场id',
  `source_device_sn` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来源设备sn',
  `referrer_id` bigint NULL DEFAULT NULL COMMENT '推荐人id',
  `user_type` int NOT NULL COMMENT '用户类型：10普通用户；100市场管理员；',
  `curr_identity` int NOT NULL COMMENT '当前身份（10买家身份20卖家身份；默认买家身份，当用户切换了买家卖家之后当前身份根据切换的身份做变更）',
  `curr_market_id` bigint NOT NULL COMMENT '当前选择的市场id',
  `curr_shop_user_id` bigint NOT NULL COMMENT '当前店铺userid',
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
  `wx_head_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信头像',
  `wx_nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信昵称',
  `status` int NOT NULL COMMENT '状态（1正常2禁用）',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nasi_mts_user_unique`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '市场用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mall_user
-- ----------------------------
INSERT INTO `mall_user` VALUES (1, '18123879144', 'FS18123879144', '123456', '小程序', 1, NULL, NULL, 100, 20, 1, 9, NULL, '非实名用户18123879144', NULL, 0, NULL, '2024-10-15 17:17:10', NULL, NULL, NULL, '2024-10-15 17:06:53', NULL, '', NULL, NULL, NULL, NULL, 1, 'system', '2024-10-15 17:06:52', NULL, NULL);
INSERT INTO `mall_user` VALUES (3, '18302634341', '顾光俊', '123456', '小程序', 1, '63d6559bea195278', NULL, 10, 20, 1, 3, NULL, '顾光俊', '520181199610194110', 1, NULL, '2024-11-26 19:40:50', NULL, '63d6559bea195278', 0, '2024-10-16 19:15:47', NULL, 'onDuZ5NqgX8dQqncHHDORhwhHoxk', NULL, NULL, NULL, '娃哈哈', 1, 'system', '2024-10-16 19:15:47', '切换店铺', '2024-11-27 00:17:39');
INSERT INTO `mall_user` VALUES (4, '15818590119', '齐李平', '123456', '小程序', 0, NULL, NULL, 10, 10, 1, 22, NULL, '齐李平', '362329198402035716', 1, '2024-10-28 16:47:02', '2024-11-18 10:29:42', NULL, NULL, 0, '2024-10-28 16:45:50', NULL, 'onDuZ5HPfOsJCpIsfnyjpV1FcNt0', NULL, NULL, NULL, NULL, 1, 'system', '2024-10-28 16:45:50', '切换身份', '2024-11-19 15:22:28');
INSERT INTO `mall_user` VALUES (5, '13416472917', 'FS13416472917', '123456', '小程序', 0, NULL, NULL, 10, 10, 2, 5, NULL, '非实名用户13416472917', NULL, 0, NULL, '2024-11-27 00:21:40', NULL, NULL, 0, '2024-11-27 00:17:19', NULL, 'o8Uzs673VoJnHXUyahYzSy1aP5PA', NULL, NULL, NULL, NULL, 1, 'system', '2024-11-27 00:17:19', '切换身份', '2024-11-27 00:21:56');
INSERT INTO `mall_user` VALUES (6, '18608922623', 'FS18608922623', '123456', '小程序', 0, NULL, NULL, 10, 10, 0, 6, NULL, '非实名用户18608922623', NULL, 0, NULL, '2024-11-27 12:53:57', NULL, NULL, 0, '2024-11-27 12:53:57', NULL, 'o8Uzs68y18mqVkN6fAqtNX9impEs', NULL, NULL, NULL, NULL, 1, 'system', '2024-11-27 12:53:57', NULL, NULL);
INSERT INTO `mall_user` VALUES (7, '13312276298', 'FS13312276298', '123456', '小程序', 0, NULL, NULL, 10, 10, 0, 7, NULL, '非实名用户13312276298', NULL, 0, NULL, '2024-11-27 12:55:12', NULL, NULL, 0, '2024-11-27 12:55:12', NULL, 'o8Uzs666of_P7bim7TwbXqRlM400', NULL, NULL, NULL, NULL, 1, 'system', '2024-11-27 12:55:12', NULL, NULL);

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
INSERT INTO `mall_user_authn` VALUES (1, 0, 3, '顾光俊', '520181199610194110', '/imgo/s/e12a34a762e4051948aef15e62893117', '/imgo/s/37ffef310d7b5a17cf1a9c0a7afe4e97', NULL, NULL, 1, NULL, '2024-10-16 17:33:00', NULL, '2024-10-16 17:33:00');
INSERT INTO `mall_user_authn` VALUES (2, 0, 4, '齐李平', '362329198402035716', '/imgo/s/0103154084e0eb68415b0566077e1208', '/imgo/s/8e21f813afb75f8561320d94fa860168', NULL, NULL, 1, NULL, '2024-10-28 16:47:01', NULL, '2024-10-28 16:47:02');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media_info
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'OMS商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of o_goods
-- ----------------------------
INSERT INTO `o_goods` VALUES (4, '橄醇油柑橄榄果汁饮料', 'http://8.138.114.135:9000/zpmalloss/images/2025/02/21/0584b9c4-43f8-46d4-8317-bdc8bb9c1fcf.jpg', NULL, '1001', '', 2, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 42.9, 0, 42.9, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'admin', '2025-02-21 19:43:42', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `o_goods` VALUES (5, '瀛养元牛肉（筋）丸礼盒8*250g', 'http://8.138.114.135:9000/zpmalloss/images/2025/02/21/77a0fe44-4983-462b-9ee0-752e62c0ea05.jpg', NULL, '1002', '', 3, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 199, 0, 199, 0, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'admin', '2025-02-21 19:53:58', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `o_goods` VALUES (6, '五指毛桃手撕鸡礼盒', 'http://8.138.114.135:9000/zpmalloss/images/2025/02/21/285e7e85-4f57-4762-9117-9e05b03e35cb.jpg', NULL, '1003', '', 3, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 99, 0, 99, 0, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'admin', '2025-02-21 19:57:44', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `o_goods` VALUES (7, '文香潮州三宝特产佛手老香黄老药桔黄皮豉精选礼盒送礼佳品', 'http://8.138.114.135:9000/zpmalloss/images/2025/02/21/de92a289-0837-49a5-a826-aa21851b79ac.jpg', NULL, '1004', '', 4, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 198, 0, 198, 0, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'admin', '2025-02-21 20:01:30', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `o_goods` VALUES (76, '小众碎花连衣裙女夏高级感初恋裙子显瘦浪漫茶歇裙温柔风甜美气质', 'https://cbu01.alicdn.com/img/ibank/O1CN01xdnKrK1QTVwN1LmhE_!!2206619961977-0-cib.jpg', NULL, 'DY3640', '', 4, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 79.2, 0, 0, NULL, 33, 0, NULL, NULL, NULL, NULL, NULL, 'https://detail.1688.com/offer/762820871441.html', 0, 0, 'admin', '2024-09-07 20:40:01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `o_goods` VALUES (77, '开源电商ERP启航电商ERP系统多平台多店铺订单管理系统演示账号', 'https://img.pddpic.com/garner-api-new/ffca4d8bba93ecc7813d350de43d5c50.jpeg?imageView2/2/w/2125/q/85', NULL, 'QIHANGNIUERP', '', 34, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 49, 0, 0, NULL, 1832709347197698050, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'admin', '2024-09-15 18:04:41', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `o_goods` VALUES (78, '红罐加多宝', 'https://cbu01.alicdn.com/img/ibank/O1CN012YyP5f1hbcSsvkd3k_!!2218127114296-0-cib.jpg', NULL, 'JIADUOBAO', '', 35, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 19, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'admin', '2024-09-15 18:13:43', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `o_goods` VALUES (79, 'aaBBBDCD', 'https://cbu01.alicdn.com/img/ibank/O1CN01Aqa1cY1oPteJHyDYW_!!2217885915218-0-cib.jpg', NULL, 'aa', '', 1, '', '', 2, 0, 0, 0, 0, 0, 0, 0, 0, '0', 12.9, 0, 0, NULL, 26, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'admin', '2024-12-08 14:48:59', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `o_goods` VALUES (80, '潮牌mm24秋冬新款时髦洋气字母提花短款羽绒面包服轻便保暖', 'https://cbu01.alicdn.com/img/ibank/O1CN01Mnbr4L2Exx8KntWGB_!!2215681298812-0-cib.jpg', NULL, 'ABC9093388', '', 1, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 148.9, 0, 0, NULL, 33, 0, NULL, NULL, NULL, NULL, NULL, 'https://detail.1688.com/offer/846685761500.html', 0, 0, 'admin', '2024-12-08 16:11:46', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `o_goods` VALUES (81, '潮牌mm24秋冬新款时髦洋气字母提花短款羽绒面包服轻便保暖', 'https://cbu01.alicdn.com/img/ibank/O1CN01Mnbr4L2Exx8KntWGB_!!2215681298812-0-cib.jpg,http://8.138.114.135:9000/zpmalloss/images/2025/02/21/91b45bfa-58cb-4aef-826d-1601a1c27e89.png', NULL, 'ACDE34343', '', 1, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 12344444444, 0, 0, NULL, 31, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'admin', '2024-12-08 16:14:06', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `o_goods` VALUES (82, 'aaa', 'https://cbu01.alicdn.com/img/ibank/O1CN01iZcJDm1IAisYqtE1V_!!1014640853-0-cib.jpg', NULL, 'aadsf', '', 1, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 123, 0, 0, 0, 33, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'admin', '2025-02-25 10:04:42', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `o_goods` VALUES (83, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01e1lQey1ZOK3VeQyfj_!!2019463184-0-cib.jpg', NULL, 'ANK9938A', '', 2, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 123, 0, 0, 0, 33, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'admin', '2025-02-25 10:14:16', NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1865649758294282256 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'OMS商品SKU表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `o_goods_sku` VALUES (31, 76, NULL, '23', '小众碎花连衣裙女夏高级感初恋裙子显瘦浪漫茶歇裙温柔风甜美气质', '黄色 L', 'DY36404303', 359, '黄色', 'http://223.83.100.30:9001/omsimage/images/2024/09/07/b28f4e15-8997-418c-bd32-b4beb4966f6b.jpg', 343, 'L', 0, '', NULL, 79.20, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (41, 76, NULL, '52', '小众碎花连衣裙女夏高级感初恋裙子显瘦浪漫茶歇裙温柔风甜美气质', '黄色 XL', 'DY36404304', 359, '黄色', 'http://223.83.100.30:9001/omsimage/images/2024/09/07/b28f4e15-8997-418c-bd32-b4beb4966f6b.jpg', 344, 'XL', 0, '', NULL, 79.20, 0.00, 0.00, '', 2, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (51, 77, NULL, NULL, '开源电商ERP启航电商ERP系统多平台多店铺订单管理系统演示账号', '黑色', 'QIHANGNIUERP00122', 308, '黑色', 'https://img.pddpic.com/garner-api-new/ffca4d8bba93ecc7813d350de43d5c50.jpeg?imageView2/2/w/2125/q/85', 0, '', 0, '', NULL, 49.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (61, 78, NULL, NULL, '红罐加多宝', '大红色 均码', 'JIADUOBAO2600', 333, '大红色', 'https://cbu01.alicdn.com/img/ibank/O1CN012YyP5f1hbcSsvkd3k_!!2218127114296-0-cib.jpg', 340, '均码', 0, '11', NULL, 19.00, 25.90, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (1865649758294282244, 82, NULL, NULL, 'aaa', 'aad 红色', '1233', 0, 'aad', 'aa', 0, '红色', 0, '', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (1865649758294282245, 82, NULL, NULL, 'aaa', 'aad 绿色', '1244', 0, 'aad', 'aa', 0, '绿色', 0, '', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (1865649758294282246, 82, NULL, NULL, 'aaa', 'dfdfd 红色', '1355', 0, 'dfdfd', 'aa', 0, '红色', 0, '', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (1865649758294282247, 82, NULL, NULL, 'aaa', 'dfdfd 绿色', '1345', 0, 'dfdfd', 'aa', 0, '绿色', 0, '', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (1865649758294282248, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 S 长款', 'ANK99380', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'S', 0, '长款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (1865649758294282249, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 S 短款', 'ANK99389', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'S', 0, '短款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (1865649758294282250, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 M 长款', 'ANK99382', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'M', 0, '长款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (1865649758294282251, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 M 短款', 'ANK99384', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'M', 0, '短款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (1865649758294282252, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 L 长款', 'ANK99381', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'L', 0, '长款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (1865649758294282253, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 L 短款', 'ANK99387', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'L', 0, '短款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (1865649758294282254, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 XL 长款', 'ANK99388', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'XL', 0, '长款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);
INSERT INTO `o_goods_sku` VALUES (1865649758294282255, 83, NULL, NULL, ' 窄版直筒牛仔裤女2025春秋新款高腰宽松显瘦复古小个子百搭阔腿裤', '红色 XL 短款', 'ANK99383', 0, '红色', 'https://cbu01.alicdn.com/img/ibank/O1CN015iiIIu20L6wxuXRr0_!!3823476832-0-cib.jpg', 0, 'XL', 0, '短款', NULL, 123.00, 0.00, 0.00, '', 1, 0, 0, NULL, 0, 0, 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1832398130583224339 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224322, 76, 'color', '颜色', 114, 359, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224323, 76, 'size', '尺码', 115, 341, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224324, 76, 'size', '尺码', 115, 342, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224325, 76, 'size', '尺码', 115, 343, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224326, 76, 'size', '尺码', 115, 344, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224327, 76, 'style', '款式', 116, 359, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224328, 77, 'color', '颜色', 114, 308, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224329, 77, 'style', '款式', 116, 308, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224330, 78, 'color', '颜色', 114, 333, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224331, 78, 'size', '尺码', 115, 340, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224332, 78, 'style', '款式', 116, 333, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224333, 79, 'color', '颜色', 114, 425, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224334, 79, 'style', '款式', 116, 425, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224335, 80, 'color', '颜色', 114, 425, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224336, 80, 'style', '款式', 116, 425, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224337, 81, 'color', '颜色', 114, 425, NULL, NULL);
INSERT INTO `o_goods_sku_attr` VALUES (1832398130583224338, 81, 'style', '款式', 116, 425, NULL, NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_goods_comment
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reg_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_developer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wx_union_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `balance` int NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `recommender_id` int NULL DEFAULT NULL,
  `reg_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reg_device` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_count` int NULL DEFAULT NULL,
  `last_login_time` int NULL DEFAULT NULL,
  `last_login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_login_device` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite`;
CREATE TABLE `user_favorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goods_id` bigint NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `favorite_price` decimal(10, 2) NULL DEFAULT NULL,
  `create_on` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_favorite
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
