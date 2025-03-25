<script >
import {updateImage} from "@/api/upload";
import {Toast} from "vant";

export default {
  data() {
    return {
      fileList: [],
      form:{
        model:'',
        brand:'',
        type:'',
        price:'',
        num:'',
        fileUrlList:[],
      }

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
    isLogin() {
      console.log('======token=======',this.$store.getters.token)
      return this.$store.getters.token;
    },
    beforeDelete(file){
      console.log('=======删除文件==========',file.file.url)
      const index = this.form.fileUrlList.indexOf(file.file.url);
      if (index !== -1) {
        this.form.fileUrlList.splice(index, 1);  // 从 urlList 中删除对应的 URL
        console.log("删除成功，当前的 URL 列表：", this.form.fileUrlList);
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
        this.form.fileUrlList.push(resp.url)
        console.log('=====图片结果111======',this.fileList)
        console.log('=====图片结果======',this.form.fileUrlList)
      })
    }
  },
};
</script>

<template>
  <div>
    <van-nav-bar title="发布货源" left-arrow @click-left="$router.go(-1)" />
    <van-cell-group title="填写芯片信息">
      <van-cell >
      <van-uploader :after-read="afterRead" :before-delete="beforeDelete" v-model="fileList" multiple :max-count="3"/>
      </van-cell>
    </van-cell-group>
    <van-cell-group>
      <van-field v-model="form.model" label="芯片型号" placeholder="请输入" />
      <van-field v-model="form.brand" label="品牌" placeholder="请输入" />
      <van-field v-model="form.type" label="类型" placeholder="请输入" />
      <van-field v-model="form.price" label="价格" placeholder="请输入" />
      <van-field v-model="form.num" label="数量" placeholder="请输入" />

      <van-cell title="芯片规格" value="封装、批次等 > "  />
    </van-cell-group>
    <van-row>


    </van-row>

  </div>
</template>

<style scoped lang="scss">

</style>