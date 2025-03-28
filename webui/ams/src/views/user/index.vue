<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="88px">
      <el-form-item label="手机号" prop="mobile">
        <el-input
          v-model="queryParams.mobile"
          placeholder="请输入手机号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="姓名" prop="authnName">
        <el-input
          v-model="queryParams.authnName"
          placeholder="请输入姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="是否商务" prop="isBusinessPerson">
        <el-select v-model="queryParams.isBusinessPerson" filterable  placeholder="是否商务">
          <el-option label="是" value="1"></el-option>
          <el-option label="否" value="0"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="是否谈判人" prop="isNegotiator">
        <el-select v-model="queryParams.isNegotiator" filterable  placeholder="是否谈判人">
          <el-option label="否" value="0"></el-option>
          <el-option label="是" value="1"></el-option>
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

    <el-table v-loading="loading" :data="userList" @selection-change="handleSelectionChange">
<!--       <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="ID" align="center" prop="id" />

      <el-table-column label="头像" align="center" prop="headImg" width="70">
        <template slot-scope="scope">
          <image-preview :src="scope.row.headImg" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="会员名" align="left" prop="userName" />
      <el-table-column label="昵称" align="left" prop="nickName" />
       <el-table-column label="手机号" align="center" prop="mobile" />
       <el-table-column label="实名" align="left" prop="authnName" />
      <el-table-column label="商务身份" align="center" prop="isNegotiator" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.businessType === 10">谈判人</el-tag>
          <el-tag size="small" v-if="scope.row.businessType === 20">商务</el-tag>
        </template>
      </el-table-column>

<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">-->
<!--        <template slot-scope="scope">-->
<!--          <el-row>-->
<!--            <el-button-->
<!--              v-if="scope.row.status === 1"-->
<!--              size="mini"-->
<!--              type="text"-->
<!--              icon="el-icon-arrow-down"-->
<!--              @click="handleUpdateStatus(scope.row)"-->
<!--            >审核通过</el-button>-->


<!--          </el-row>-->

<!--        </template>-->
<!--      </el-table-column>-->
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
import { listUser } from "@/api/user/user";
import {getToken} from "@/utils/auth";

export default {
  name: "UserList",
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
      userList: [],
      // 表单校验
      rules: {}
    };
  },
  created() {
    this.getList();
  },
  methods: {
    amountFormatter(row, column, cellValue, index) {
      return '￥' + parseFloat(cellValue).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
    },
    /** 查询列表 */
    getList() {
      this.loading = true;
      listUser(this.queryParams).then(response => {
        this.userList = response.rows;
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
