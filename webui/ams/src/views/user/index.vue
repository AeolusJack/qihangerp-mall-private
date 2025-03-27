<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="88px">
      <el-form-item label="发布人" prop="userId">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入发布人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="标题" prop="title">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="型号" prop="modelId">
        <el-select v-model="queryParams.modelId" filterable  placeholder="请选择型号">
          <el-option v-for="item in modelList" :key="item.id" :label="item.name" :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="品牌" prop="brandId">
        <el-select v-model="queryParams.brandId" filterable  placeholder="请选择品牌">
          <el-option v-for="item in brandList" :key="item.id" :label="item.name" :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="类型" prop="typeId">
        <el-select v-model="queryParams.typeId" filterable  placeholder="请选择类型">
          <el-option v-for="item in typeList" :key="item.id" :label="item.name" :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="阶段" prop="phase">
        <el-select v-model="queryParams.phase" filterable  placeholder="阶段">
          <el-option label="货源信息" value="1"></el-option>
          <el-option label="货源商品" value="2"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" filterable  placeholder="状态">
          <el-option label="草稿中" value="0"></el-option>
          <el-option label="待审核" value="1"></el-option>
          <el-option label="放单中" value="2"></el-option>
          <el-option label="接单中" value="3"></el-option>
        </el-select>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="goodsList" @selection-change="handleSelectionChange">
<!--       <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="ID" align="center" prop="id" />

      <el-table-column label="图片" align="center" prop="image" width="70">
        <template slot-scope="scope">
          <image-preview :src="scope.row.image" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="标题" align="left" prop="title" width="300"/>
      <el-table-column label="型号" align="left" prop="modelId" >
        <template slot-scope="scope">
          {{modelList.find(x=>x.id == scope.row.modelId)?modelList.find(x=>x.id == scope.row.modelId).name:''}}
        </template>
      </el-table-column>
      <el-table-column label="品牌" align="left" prop="brandId" >
        <template slot-scope="scope">
          {{brandList.find(x=>x.id == scope.row.brandId)?brandList.find(x=>x.id == scope.row.brandId).name:''}}
        </template>
      </el-table-column>
      <el-table-column label="类型" align="left" prop="typeId" >
        <template slot-scope="scope">
          {{typeList.find(x=>x.id == scope.row.typeId)?typeList.find(x=>x.id == scope.row.typeId).name:''}}
        </template>
      </el-table-column>
      <!-- <el-table-column label="单位名称" align="center" prop="unitName" /> -->
<!--      <el-table-column label="商品分类" align="center" prop="categoryId" >-->
<!--        <template slot-scope="scope">-->
<!--          <el-tag size="small">{{categoryList.find(x=>x.id === scope.row.categoryId)?categoryList.find(x=>x.id === scope.row.categoryId).name:''}}</el-tag>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <!-- <el-table-column label="条码" align="center" prop="barCode" /> -->

      <!-- <el-table-column label="衣长/裙长/裤长" align="center" prop="length" />
      <el-table-column label="高度/袖长" align="center" prop="height" />
      <el-table-column label="宽度/胸阔(围)" align="center" prop="width" />
      <el-table-column label="肩阔" align="center" prop="width1" />
      <el-table-column label="腰阔" align="center" prop="width2" />
      <el-table-column label="臀阔" align="center" prop="width3" />
      <el-table-column label="重量" align="center" prop="weight" />
      <el-table-column label="0启用   1禁用" align="center" prop="disable" />
      <el-table-column label="保质期" align="center" prop="period" /> -->
      <el-table-column label="价格" align="center" prop="price" :formatter="amountFormatter"/>
      <el-table-column label="数量" align="center" prop="quantity" />
      <el-table-column label="最低起订量" align="center" prop="minQty" />
      <el-table-column label="发布人手机号" align="center" prop="userMobile" />
      <el-table-column label="信息提供人" align="left" prop="sourceContacts" >
        <template slot-scope="scope">
          {{scope.row.sourceContacts}}<br/>
          {{scope.row.sourceMobile}}<br/>
          {{scope.row.sourceWx}}
        </template>
      </el-table-column>
      <el-table-column label="卖家" align="left" prop="sellerContacts" >
        <template slot-scope="scope">
          {{scope.row.sellerContacts}}<br/>
          {{scope.row.sellerMobile}}<br/>
          {{scope.row.sellerWx}}
        </template>
      </el-table-column>

      <!-- <el-table-column label="品牌id" align="center" prop="brandId" />
      <el-table-column label="属性1：季节" align="center" prop="attr1" />
      <el-table-column label="属性2：分类" align="center" prop="attr2" />
      <el-table-column label="属性3：风格" align="center" prop="attr3" />
      <el-table-column label="属性4：年份" align="center" prop="attr4" />
      <el-table-column label="属性5：面料" align="center" prop="attr5" />
      <el-table-column label="外链url" align="center" prop="linkUrl" />
      <el-table-column label="最低库存" align="center" prop="lowQty" />
      <el-table-column label="最高库存" align="center" prop="highQty" /> -->
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status === 0">草稿中</el-tag>
          <el-tag size="small" v-if="scope.row.status === 1">待审核</el-tag>
          <el-tag size="small" v-if="scope.row.status === 2">放单中</el-tag>
          <el-tag size="small" v-if="scope.row.status === 3">抢单中</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-row>
            <el-button
              v-if="scope.row.status === 1"
              size="mini"
              type="text"
              icon="el-icon-arrow-down"
              @click="handleUpdateStatus(scope.row)"
            >审核通过</el-button>


          </el-row>

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


  </div>
</template>

<script>
import { listGoodsSource,updateGoodsSourceStatus } from "@/api/goods/goodsSource";
import {getToken} from "@/utils/auth";
import {getModelList} from "@/api/goods/model";
import {listBrand} from "@/api/goods/brand"
import {getTypeList} from "@/api/goods/type";
export default {
  name: "GoodsSource",
  data() {
    return {
      importOpen:false,
      headers: { 'Authorization': 'Bearer ' + getToken() },
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
      // 商品管理表格数据
      goodsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      skuOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        modelId: null,
        brandId: null,
        typeId: null,
        userMobile: null,
        status: null,
        phase: null,
      },
      // 表单参数
      form: {},
      modelList: [],
      brandList: [],
      typeList: [],

      // 表单校验
      rules: {}
    };
  },
  created() {
    getModelList().then(resp=>{
      this.modelList = resp.data
    })
    listBrand({pageSize:100}).then(resp=>{
      this.brandList = resp.rows
    })
    getTypeList().then(resp=>{
      this.typeList = resp.data
    })

    this.getList();
  },
  methods: {
    amountFormatter(row, column, cellValue, index) {
      return '￥' + parseFloat(cellValue).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
    },
    /** 查询列表 */
    getList() {
      this.loading = true;
      listGoodsSource(this.queryParams).then(response => {
        this.goodsList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
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
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    handleUpdateStatus(row) {
      var cz = "";
      var status;
      if (row.status === 1) {
        cz = '审核通过';
        status = 2;
      }
      this.$modal.confirm('是否进行' + cz + '操作？').then(function() {
        return updateGoodsSourceStatus({id:row.id,status:status});
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("审核成功");
      }).catch(() => {});
    },

  }
};
</script>
