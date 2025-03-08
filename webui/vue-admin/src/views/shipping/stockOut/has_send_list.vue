<template>
  <div class="app-container" >
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单号" prop="orderNum">
        <el-input
          v-model="queryParams.orderNum"
          placeholder="请输入订单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="供应商" prop="supplierId">
        <el-select v-model="queryParams.supplierId" filterable  placeholder="选择供应商" >
          <el-option v-for="item in supplierList" :key="item.id" :label="item.name" :value="item.id">
            <span style="float: left">{{ item.name }}</span>
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="店铺" prop="shopId">
        <el-select v-model="queryParams.shopId" filterable clearable  placeholder="选择店铺" @change="handleQuery">
          <el-option v-for="item in shopList" :key="item.id" :label="item.name" :value="item.id">
            <span style="float: left">{{ item.name }}</span>

              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 500">微信小店</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 200">京东POP</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 280">京东自营</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 100">淘宝天猫</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 300">拼多多</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 400">抖店</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 999">线下渠道</span>
          </el-option>
          </el-select>
      </el-form-item>
<!--      <el-form-item label="发货状态" prop="sendStatus">-->
<!--        <el-select v-model="queryParams.sendStatus" placeholder="请选择">-->
<!--        <el-option-->
<!--          v-for="item in statusList"-->
<!--          :key="item.value"-->
<!--          :label="item.label"-->
<!--          :value="item.value">-->
<!--        </el-option>-->
<!--        </el-select>-->
<!--      </el-form-item>-->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-document-copy"-->
<!--          size="mini"-->

<!--          @click="handlePushSend"-->
<!--        >一键发货</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>
    <el-table v-loading="loading" :data="shippingList" @selection-change="handleSelectionChange"  >
       <el-table-column type="selection" width="55"  align="center" />
<!--       <el-table-column label="主键" align="center" prop="id" />-->
      <el-table-column label="订单号" align="left" prop="orderNum" width="150">
        <template slot-scope="scope">
        <el-button
          size="mini"
          type="text"
          icon="el-icon-view"
          @click="handleDetail(scope.row)"
        >{{scope.row.orderNum}} </el-button><br/>
        <el-tag type="info">{{ shopList.find(x=>x.id === scope.row.shopId) ? shopList.find(x=>x.id === scope.row.shopId).name : '' }}</el-tag>
        </template>
      </el-table-column>
<!--       <el-table-column label="店铺" align="left" prop="shopId" width="200">-->
<!--        <template slot-scope="scope">-->
<!--          <el-tag>{{ shopList.find(x=>x.id === scope.row.shopId)?shopList.find(x=>x.id === scope.row.shopId).name:''  }}</el-tag>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="发货供应商" align="left" prop="supplierId" width="200px">
        <template slot-scope="scope">
          {{supplierList.find(x=>x.id === scope.row.supplierId)?supplierList.find(x=>x.id === scope.row.supplierId).name:''}}
        </template>
      </el-table-column>
      <el-table-column label="商品明细" align="left" width="680px">
        <template slot="header">
            <table>
              <th>
                <td width="50px">图片</td>
                <td width="250px" align="left">商品标题</td>
                <td width="150" align="left">规格</td>
                <td width="150" align="left">Sku编码</td>
<!--                <td width="150" align="left">系统SkuId</td>-->
                <td width="50" align="left">数量</td>
              </th>
            </table>
        </template>
        <template slot-scope="scope">
          <el-table :data="scope.row.itemList"  :show-header="false" style="width: 100%"  >
                  <el-table-column label="商品图片" width="50px">
                    <template slot-scope="scope">
                          <el-image  style="width: 40px; height: 40px;" :src="scope.row.goodsImg" :preview-src-list="[scope.row.goodsImg]"></el-image>
                    </template>
                  </el-table-column>

            <el-table-column label="商品标题" align="left" width="250px" prop="goodsName" >
              <template slot-scope="scope">
              {{scope.row.goodsName}}
              <el-tag size="small" v-if="scope.row.refundStatus === 2">售后处理中</el-tag>
              <el-tag size="small" v-if="scope.row.refundStatus === 3">退款中</el-tag>
              <el-tag size="small" v-if="scope.row.refundStatus === 4">退款成功</el-tag>
              </template>
            </el-table-column>
                  <el-table-column label="规格" align="left" prop="skuName" width="150">
                      <template slot-scope="scope">
                        {{ getSkuValues(scope.row.skuName)}}
                      </template>
                  </el-table-column>
            <el-table-column label="Sku编码" align="left" prop="skuCode" width="150"/>

                   <el-table-column label="商品数量" align="center" prop="quantity" width="50px">
                     <template slot-scope="scope">
                     <el-tag size="small">{{scope.row.quantity}}</el-tag>
                     </template>
                   </el-table-column>
          </el-table>
        </template>
      </el-table-column>
      <el-table-column label="电子面单号" align="center" prop="waybillCode" >
      </el-table-column>
      <el-table-column label="打单状态" align="center" prop="waybillStatus" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.waybillStatus === 0">未取号</el-tag>
          <el-tag size="small" v-if="scope.row.waybillStatus === 1">已取号</el-tag>
          <el-tag size="small" v-if="scope.row.waybillStatus === 2">已打印</el-tag>
          <el-tag size="small" v-if="scope.row.waybillStatus === 3">已发货</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="发货状态" align="center" prop="sendStatus" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.sendStatus === 0">待备货</el-tag>
          <el-tag size="small" v-if="scope.row.sendStatus === 1">待发货</el-tag>
          <el-tag size="small" v-if="scope.row.sendStatus === 2">已发货</el-tag>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 对话框 -->

    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body >
      <div id="dialogContent">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" inline>

        <el-divider content-position="center" v-if="isGen">订单列表</el-divider>
        <el-table :data="form.sendShopOrderList" :row-class-name="rowItemIndex" ref="skuItem">
<!--          <el-table-column type="selection" width="50" align="center" />-->
          <el-table-column label="序号" align="center" prop="index" width="50"/>

          <el-table-column label="订单号" prop="orderNum" ></el-table-column>
          <el-table-column label="电子面单号" prop="waybillCode" ></el-table-column>
          <el-table-column label="发货供应商" prop="supplierId" >
            <template slot-scope="scope">
              {{supplierList.find(x=>x.id === scope.row.supplierId)?supplierList.find(x=>x.id === scope.row.supplierId).name:''}}
            </template>
          </el-table-column>
<!--          <el-table-column label="数量" prop="quantity"></el-table-column>-->
<!--          <el-table-column label="仓库库存" prop="inventory"></el-table-column>-->

        </el-table>
      </el-form>
    </div>
      <div slot="footer" class="dialog-footer" v-if="isGen">
        <el-button type="primary" @click="submitForm">确认发货</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
      <div slot="footer" class="dialog-footer" v-if="!isGen">
        <el-button v-print="'#dialogContent'">打印</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import {
  listShipStockup,
  pushShopOrderSend
} from "@/api/shipping/stockOut";

import { listShop } from "@/api/shop/shop";

import {listSupplier} from "@/api/goods/supplier";
export default {
  name: "HasSendOrder",
  // computed: {
  //   supplier() {
  //     return supplier
  //   }
  // },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 仓库订单发货表格数据
      shippingList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      skuIdUpdateOpen: false,
      isGen:true,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 100,
        shopId: null,
        supplierId: null,
        orderNum:null,
        sendStatus:'2'
      },
      // 表单参数
      form: {
        shopId:null,
        sendShopOrderList:[]
      },

      shopList: [],
      skuList:[],
      supplierList:[],
      statusList: [
         {
          value: '1',
          label: '待发货'
        }, {
          value: '2',
          label: '已发货'
        }
      ],
      // 表单校验
      rules: {
        stockOutNum: [{ required: true, message: "单号不能为空", trigger: "blur" }],
        goodsId: [{ required: true, message: "erp系统商品id不能为空", trigger: "blur" }],
        specId: [{ required: true, message: "erp系统商品规格id不能为空", trigger: "blur" }],
        quantity: [{ required: true, message: "商品数量不能为空", trigger: "blur" }],
      },
      rules1: {
        supplierId: [{ required: true, message: "请选择供应商", trigger: "blur" }],
      },
      rules2: {
        erpGoodsSpecId: [{ required: true, message: "请选择填写ERP商品SkuId", trigger: "blur" }],
      }
    };
  },
  mounted() {

  },
  created() {
    listSupplier({}).then(response => {
      this.supplierList = response.rows;
      listShop({}).then(response => {
        this.shopList = response.rows;
        this.getList();
      });

    });

    // if(this.$route.query.status){
    //   this.queryParams.status = this.$route.query.status
    // }else {
    //   this.queryParams.status = '0'
    // }
    // this.getList();
  },
  methods: {
    getSkuValues(spec){
      try {
        // 解析 JSON，返回一个数组
        const parsedSpec = JSON.parse(spec) || [];

        // 使用 map 提取所有 value，使用 join() 用逗号连接
        return parsedSpec.map(item => item.attr_value || item.value).join(', ') || '';
      } catch (error) {
        return spec; // 如果 JSON 解析出错，返回空字符串
      }
    },
    rowItemIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 查询仓库订单发货列表 */
    getList() {
      this.loading = true;
      listShipStockup(this.queryParams).then(response => {
        this.shippingList = response.rows;
        this.total = response.total;

        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.skuList = []
      this.open = false;
      this.skuIdUpdateOpen = false;
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.orderNum)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 提交按钮 */
    submitForm() {
      console.log("=============确认发货提交===",this.ids)
      this.$refs["form"].validate(valid => {
        if (valid) {
          if(!this.form.sendShopOrderList || this.form.sendShopOrderList.length === 0){
            this.$modal.msgError("没有要发货的订单");
            return
          }
          this.form.shopId = this.queryParams.shopId;
          this.form.ids = this.form.sendShopOrderList.map(order => order.id);
          pushShopOrderSend(this.form).then(response => {
            this.$modal.msgSuccess(response.msg);
            this.open = false;
            this.getList();
          });

        }
      });
    },
    /** 推送发货到平台 */
    handlePushSend(){
      if(!this.queryParams.shopId){
        this.$modal.msgError("请选择店铺进行发货！不允许多店铺同时发货！");
      }else {
        listShipStockup(this.queryParams).then(response => {
          this.form.sendShopOrderList = response.rows;
          this.title = '店铺订单发货清单'
          this.open = true;
        });
        // this.$modal.confirm('一键发货将为该店铺所有已发货的信息推送到电商平台店铺，请问确定发货吗？').then(function() {
        //
        // }).then(() => {
        //   listShipStockup(this.queryParams).then(response => {
        //     this.form.sendShopOrderList = response.rows;
        //     this.title = '店铺订单发货清单'
        //     this.open = true;
        //   });
        //
        //   // this.getList();
        //   // this.$modal.msgSuccess("删除成功");
        // }).catch(() => {});

      }
    }


  }
};
</script>
