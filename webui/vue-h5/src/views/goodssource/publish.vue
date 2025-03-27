<script >
import {updateImage} from "@/api/upload";
import {Toast} from "vant";
import {getModelList,getBrandList,getTypeList} from "@/api/picker"
import {publishGoodsSource} from "@/api/goodssource"
export default {
  data() {
    return {
      showPopup: false,
      showPicker: false,
      showPickerType:'',
      picList: [],
      fileList: [],
      columns : [],
      selectedValue:null,
      form:{
        model:'',
        modelId:null,
        brand:'',
        brandId:null,
        type:'',
        typeId:null,
        price:null,
        quantity:null,
        checked:null,
        picList:[],
        fileList:[],
        sellerContacts:'',
        sellerMobile:'',
        sellerWx:'',
        sourceContacts:'',
        sourceMobile:'',
        sourceWx:'',
        fz:'',
        pici:'',
        validityPeriod:'',
        remark:'',
        minQty:null
      },
      modelRules:[{ required: true, message: '必填项', trigger: 'blur' }],
      priceRules: [
        { required: true, message: '必填项', trigger: 'blur' },
        { validator: this.checkNumber,message: '请输入有效的数字', trigger: 'blur' }
      ],
      quantityRules: [
        { required: true, message: '必填项', trigger: 'blur' },
        { validator: this.checkNumber,message: '请输入有效的数字', trigger: 'blur' }
      ],
    };
  },
  mounted() {
    //必须是登录过的用户 才能获取购物车列表
    console.log('============登陆信息=========',this.isLogin())
    if (!this.isLogin) {
      Toast.fail('请先登录')
      this.$router.push("/login");
    }
  },
  methods: {
    // 自定义验证函数
    checkNumber( value) {
      return /^(\d+)(\.\d{1,2})?$/.test(value.toString());
    },
    isLogin() {
      console.log('======token=======',this.$store.getters.token)
      return this.$store.getters.token;
    },
    beforeDelete(file){
      console.log('=======删除文件==========',file.file.url)
      const index = this.form.picList.indexOf(file.file.url);
      if (index !== -1) {
        this.form.picList.splice(index, 1);  // 从 urlList 中删除对应的 URL
        console.log("删除成功，当前的 URL 列表：", this.form.picList);
        return true
      }else{
        Toast.fail("删除失败！请重试！")
      }

    },
    afterRead(file) {
      // 此时可以自行将文件上传至服务器
      console.log(file);
      this.uploadFile(file.file);
    },
    uploadFile(file) {
      const formData = new FormData();
      formData.append('file', file); // 'file' 是后端期望的字段名，根据实际情况修改
      console.log('======图片顺序=======',file)
      updateImage(formData).then(resp=>{
        console.log("==========上传图片========",resp)
        file.url = resp.url
        this.form.picList.push(resp.url)
        console.log('=====图片结果111======',this.fileList)
        console.log('=====图片结果======',this.form.picList)
      })
    },
    // 提交表单
    onSubmit(){
      // 手动触发表单验证
      this.$refs.form.validate().then(() => {
        // 如果验证成功
        console.log('表单验证成功', this.form);
        publishGoodsSource(this.form).then(resp=>{
          Toast("成功")
        })
      }).catch(() => {
        // 如果验证失败
        console.log('表单验证失败');
      });
    },
    // 显示规格
    showDetail(){
      this.showPopup = true
    },
    showModel(type){
      this.showPickerType = type
      if(type==='model'){
        getModelList().then(resp=>{
          this.showPicker = true
          this.columns = resp.data
        })
      }else if(type==='brand'){
        getBrandList().then(resp=>{
          this.showPicker = true
          this.columns = resp.data
        })
      }else if(type==='type'){
        getTypeList().then(resp=>{
          this.showPicker = true
          this.columns = resp.data
        })
      }


    },
    onConfirm (selected) {
      console.log('=======选择了=======',selected)
      if(this.showPickerType==='model'){
        this.form.model = selected.text
        this.form.modelId = selected.value
      }else if(this.showPickerType==='brand'){
        this.form.brand = selected.text
        this.form.brandId = selected.value
      }else if(this.showPickerType==='type'){
        this.form.type = selected.text
        this.form.typeId = selected.value
      }
      this.showPicker = false;
    },
    onCancel() {
      this.showPicker = false;
    }
  },
};
</script>

<template>
  <div>
    <van-nav-bar title="发布货源" left-arrow @click-left="$router.go(-1)" />
    <van-form ref="form" @submit="onSubmit" >
    <van-cell-group title="填写芯片信息" inset>
      <van-field name="uploader" label="货源图片" required :rules="[{ required: true, message: '请上传图片' }]">
        <template #input>
          <van-uploader :after-read="afterRead" :before-delete="beforeDelete" v-model="picList" multiple :max-count="3"/>
        </template>
      </van-field>
      <van-field
          v-model="form.model"
          label="芯片型号"
          readonly
          required
          input-align="right"
          is-link
          placeholder="请选择"
          @click="showModel('model')"
          :rules="modelRules"
      />
      <van-field
          v-model="form.brand"
          label="品牌"
          readonly
          required
          input-align="right"
          is-link
          placeholder="请选择"
          @click="showModel('brand')"
          :rules="modelRules"
      />
      <van-field
          v-model="form.type"
          label="类型"
          readonly
          required
          input-align="right"
          is-link
          placeholder="请选择"
          @click="showModel('type')"
          :rules="modelRules"
      />
<!--      <van-cell title="芯片型号" v-model="form.model" is-link  @click="showModel('model')" :rules="modelRules"/>-->
<!--      <van-cell title="品牌" v-model="form.brand" is-link  @click="showModel('brand')"/>-->
<!--      <van-cell title="type" v-model="form.type" is-link  @click="showModel('type')"/>-->
<!--      <van-field v-model="form.type" label="type" placeholder="请输入" />-->
      <van-field v-model="form.price" label="价格" required placeholder="请输入" :rules="priceRules" />
      <van-field v-model="form.quantity" label="数量" required placeholder="请输入" :rules="quantityRules"/>

      <van-cell title="芯片规格" value="封装、批次等  " is-link @click="showDetail" />
    </van-cell-group>
    <van-cell-group title=" " inset>
      <van-cell title="货主信息" icon="shop-o">
        <template #right-icon>
          <van-switch v-model="form.checked"  size="18px" />
        </template>
      </van-cell>
      <van-field v-model="form.sellerContacts" label="联系人" placeholder="请输入" required :rules="[{ required: true, message: '不能为空' }]" />
      <van-field v-model="form.sellerMobile" label="联系方式" placeholder="请输入" required :rules="[{ required: true, message: '不能为空' }]" />
      <van-field v-model="form.sellerWx" label="微信号" placeholder="请输入" required :rules="[{ required: true, message: '不能为空' }]" />
    </van-cell-group>
    <van-cell-group title=" " inset>
      <van-cell title="信息提供人" icon="shop-o">
        <template #right-icon>
          <van-switch v-model="form.checked"  size="18px" />
        </template>
      </van-cell>
      <van-field v-model="form.sourceContacts" label="联系人" placeholder="请输入" required :rules="[{ required: true, message: '不能为空' }]" />
      <van-field v-model="form.sourceMobile" label="联系方式" placeholder="请输入" required :rules="[{ required: true, message: '不能为空' }]" />
      <van-field v-model="form.sourceWx" label="微信号" placeholder="请输入" required :rules="[{ required: true, message: '不能为空' }]" />
    </van-cell-group>

    <van-cell-group title="指定谈判人" inset>
    <van-field v-model="form.model" label="指定谈判人" placeholder="请输入" />
    </van-cell-group>
    </van-form>
    <van-submit-bar  button-text="发布货源" @submit="onSubmit">
<!--      <van-checkbox v-model="checked">全选</van-checkbox>-->
      <template #tip>
        支持匿名发货货源
<!--        , <span @click="onClickEditAddress">修改地址</span>-->
      </template>
    </van-submit-bar>

    <van-popup v-model:show="showPicker" position="bottom">
      <van-picker
          v-model="selectedValue"
          :columns="columns"
          show-toolbar
          @confirm="onConfirm"
          @cancel="onCancel"
      />
    </van-popup>

    <van-popup
        v-model="showPopup"
        round
        style="width: 90%"
        position="center"
        get-container="body"
        transition="fade"
        closeable
    >
      <div class="popup-content">
        <van-cell-group title="芯片规格" inset>
          <van-form @submit="onSubmit">
          <van-field
              v-model="form.fz"
              label="封装"
              placeholder="封装"
              :rules="[{ required: true, message: '请填写封装' }]"
          />
          <van-field
              v-model="form.pici"
              label="批次"
              placeholder="批次"
              :rules="[{ required: true, message: '请填写批次' }]"
          />
            <van-field
                v-model="form.validityPeriod"
                label="有效期"
                placeholder="有效期"
                :rules="[{ required: true, message: '请填写有效期' }]"
            />
            <van-field
                v-model="form.minQty"
                label="起订量"
                placeholder="起订量"
                :rules="[{ required: true, message: '请填写起订量' }]"
            />
            <van-field
                v-model="form.remark"
                rows="2"
                autosize
                label="备注"
                type="textarea"
                maxlength="50"
                placeholder="备注"
            />
<!--            <van-field name="uploader" label="规格书">-->
<!--              <template #input>-->
<!--                <van-uploader  :after-read="afterRead" :before-delete="beforeDelete" v-model="fileList" multiple :max-count="3"/>-->
<!--              </template>-->
<!--            </van-field>-->
          <div style="margin: 16px;">
            <van-button round block type="info" native-type="submit">提交</van-button>
          </div>
          </van-form>
        </van-cell-group>
<!--        <van-button @click="showPopup = false">关闭弹出层</van-button>-->
      </div>
    </van-popup>
  </div>
</template>

<style scoped>

</style>