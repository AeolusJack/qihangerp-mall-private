<script >
import {updateImage} from "@/api/upload";
import {Toast} from "vant";
import {getGoodsSource} from "@/api/goodssource"
import {publishGoods} from "@/api/goods";
export default {
  data() {
    return {
      showPopup: false,
      showPicker: false,
      showPickerType:'',
      picList: [],
      detailPicList: [],
      fileList: [],
      columns : [],
      selectedValue:null,
      form:{
        goodsSourceId:null,
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
        detailPicList:[],
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
    console.log('========id======',this.$route.query.id)
    getGoodsSource(this.$route.query.id).then(resp=>{
      this.form = resp.data
      this.form.goodsSourceId = resp.data.id
      this.form.goodsSourceOrderId = resp.data.acceptOrderId
      this.form.picList=[]
      const pics = resp.data.pictures.split(",")
      for(let pic of pics){
        this.picList.push({url:pic,isImage: true})
        this.form.picList.push(pic)
      }
      console.log("====图片=====",this.picList)
      console.log("====图片form=====",this.form.picList)
    })
  },
  methods: {
    // 自定义验证函数
    checkNumber( value) {
      return /^(\d+)(\.\d{1,2})?$/.test(value.toString());
    },

    beforeDelete(file){
      console.log('=======删除文件==========',file.url)
      const index = this.form.picList.indexOf(file.url);
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
        publishGoods(this.form).then(resp=>{
          if(resp.code === 200){
            Toast("发布成功")
            this.$router.push('/home')
          }else{
            Toast(resp.msg)
          }

        })
      }).catch(() => {
        // 如果验证失败
        console.log('表单验证失败');
      });
    },


  },
};
</script>

<template>
  <div>
    <van-nav-bar title="发布" left-arrow @click-left="$router.go(-1)" />
    <van-form ref="form" @submit="onSubmit" >
    <van-cell-group title="完善货源信息" inset>
      <van-field name="uploader" label="主图" required :rules="[{ required: true, message: '请上传图片' }]">
        <template #input>
          <van-uploader :after-read="afterRead" :before-delete="beforeDelete" v-model="picList" multiple :max-count="3"/>
        </template>
      </van-field>
      <van-field v-model="form.title" label="标题" placeholder="标题有助于搜索" required :rules="[{ required: true, message: '请填写标题' }]" />
      <van-field
          v-model="form.model"
          label="型号"
          readonly
          required
      />
      <van-field
          v-model="form.brand"
          label="品牌"
          readonly
          required
      />
      <van-field
          v-model="form.type"
          label="类型"
          readonly
          required
      />
<!--      <van-cell title="芯片型号" v-model="form.model" is-link  @click="showModel('model')" :rules="modelRules"/>-->
<!--      <van-cell title="品牌" v-model="form.brand" is-link  @click="showModel('brand')"/>-->
<!--      <van-cell title="type" v-model="form.type" is-link  @click="showModel('type')"/>-->
<!--      <van-field v-model="form.type" label="type" placeholder="请输入" />-->
      <van-field v-model="form.price" label="价格" required placeholder="请输入" :rules="priceRules" />
      <van-field v-model="form.quantity" label="数量" required placeholder="请输入" :rules="quantityRules"/>
    </van-cell-group>
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
        </van-form>
      </van-cell-group>
    <van-cell-group title="货主信息" inset>
      <van-field v-model="form.sellerContacts" label="联系人" readonly placeholder="请输入" />
      <van-field v-model="form.sellerMobile" label="联系方式" readonly placeholder="请输入" />
      <van-field v-model="form.sellerWx" label="微信号" readonly placeholder="请输入"  />
    </van-cell-group>
      <van-cell-group title="详情描述" inset>
        <van-field
            v-model="form.detail"
            rows="5"
            autosize
            label="详情描述"
            type="textarea"
            maxlength="50"
            placeholder="详情描述"
        />
        <van-field name="uploader" label="详情图">
          <template #input>
            <van-uploader :after-read="afterRead" :before-delete="beforeDelete" v-model="detailPicList" multiple :max-count="3"/>
          </template>
        </van-field>

      </van-cell-group>

      <div style="margin: 16px;">
        <van-button round block type="info" native-type="submit">提交</van-button>
      </div>
    </van-form>

  </div>
</template>

<style scoped>

</style>