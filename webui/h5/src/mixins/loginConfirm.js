export default {
  //此处编写的是 vue组件实例额配置项 通过语法 可以直接混入到组件内部
  // data methods computed
  data() {
    return {
      title: '标题'
    }
  },
  methods: {
    sayHi() {
      // console.log('你好');
    },
    loginConfirm() {
      //判断token是否存在
      //如果token不存在 弹确认框
      //如果token存在 请求继续操作
      if (!this.$store.getters.token) {
        //弹确认框
        this.$dialog
          .confirm({
            title: "温馨提示",
            message: "此时需要先登录才能继续操作哦",
            confirmButtonText: "去登陆",
            cancelButtonText: "再逛逛",
          })
          .then(() => {
            //如果希望跳转到登录 并且登录后回调回来 需要跳转时携带参数(当前的路径地址)
            this.$router.replace({
              path: "/login",
              query: {
                backUrl: this.$route.fullPath,
              },
            });
          })
          .catch(() => { });
        return true;
      }
      return false;
    },
  },
}