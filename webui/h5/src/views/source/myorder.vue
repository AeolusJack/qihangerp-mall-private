<template>
  <div class="cart">
    <van-nav-bar title="订单" fixed  />
    <div style="padding-top: 16px;"></div>
<!--    <van-cell-group inset >-->
    <div class="my-asset" >
      <div class="asset-left">
        <div class="asset-left-item">
          <span>0</span>
          <span>待接单</span>
        </div>
        <div class="asset-left-item">
          <span>0</span>
          <span>进行中</span>
        </div>
        <div class="asset-left-item">
          <span>0</span>
          <span>已完成</span>
        </div>
      </div>
      <div class="asset-right">
        <div class="asset-right-item">
          <van-icon name="balance-pay" />
          <span>我的订单</span>
        </div>
      </div>
    </div>
<!--    </van-cell-group>-->
    <!-- 可抢单开头 -->
    <div class="cart-title">
      <span class="all">共<i>{{ cartTotal }}</i>单可抢单</span>

    </div>

    <div v-if="isLogin ">
      <!-- 可抢单列表 -->
      <div class="cart-list">
      <van-cell-group inset>
<!--        <van-cell title="型号" value="内容" />-->
<!--        <van-cell title="单元格" value="内容" label="描述信息" />-->
<!--      </van-cell-group>-->
<!--      <van-cell-group title="" inset>-->
      <van-card style="background-color: #FFFFFF"
          num="200000"
          price="2.00"
          desc="描述信息"
          title="商品标题"
          thumb="https://img01.yzcdn.cn/vant/ipad.jpeg"
      >
        <template #tags>
          <van-tag plain type="danger">型号</van-tag>
          <van-tag plain type="danger">标签</van-tag>
        </template>
        <template #footer>
          <van-button type="primary" size="small">抢单</van-button>

        </template>
      </van-card>
      </van-cell-group>
      </div>
      <div class="cart-list" >
      <van-cell-group inset>
        <!--        <van-cell title="型号" value="内容" />-->
        <!--        <van-cell title="单元格" value="内容" label="描述信息" />-->
        <!--      </van-cell-group>-->
        <!--      <van-cell-group title="" inset>-->
        <van-card style="background-color: #FFFFFF"
                  num="200000"
                  price="2.00"
                  desc="描述信息"
                  title="商品标题"
                  thumb="https://img01.yzcdn.cn/vant/ipad.jpeg"
        >
          <template #tags>
            <van-tag plain type="danger">型号</van-tag>
            <van-tag plain type="danger">标签</van-tag>
          </template>
          <template #footer>
            <van-button type="primary" size="small">抢单</van-button>

          </template>
        </van-card>
      </van-cell-group>
      </div>
    </div>

    <div class="empty-cart" v-else>
      <img src="../../assets/empty.png" alt="" />
      <div class="tips">您的购物车是空的, 快去逛逛吧</div>
      <div class="btn" @click="$router.push('/')">去逛逛</div>
    </div>
  </div>

</template>

<script>
import CountBox from "@/components/CountBox.vue";
import { mapGetters, mapState } from "vuex";
export default {
  name: "GoodsSourceOrderPage",
  components: {
    CountBox,
  },
  data() {
    return {
      isEdit: false,
    };
  },
  computed: {
    ...mapState("cart", ["cartList"]),
    ...mapGetters("cart", [
      "cartTotal",
      "selCartList",
      "selCount",
      "selPrice",
      "isAllChecked",
    ]),
    isLogin() {
      return this.$store.getters.token;
    },
  },
  created() {
    //必须是登录过的用户 才能获取购物车列表
    if (this.isLogin) {
      // this.$store.dispatch("cart/getCartAction");
    }
  },
  methods: {


  },
  watch: {

  },
};
</script>

<style lang="less" scoped>
// 主题 padding
.cart {
  padding-top: 46px;
  padding-bottom: 100px;
  background-color: #f5f5f5;
  min-height: 100vh;
  .cart-title {
    height: 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 10px;
    font-size: 14px;

    .all {
      i {
        font-style: normal;
        margin: 0 2px;
        color: #fa2209;
        font-size: 16px;
      }
    }
    .edit {
      .van-icon {
        font-size: 18px;
      }
    }
  }
  .cart-list{
    padding-top: 10px;
  }

  .cart-item {
    margin: 0 10px 10px 10px;
    padding: 10px;
    display: flex;
    justify-content: space-between;
    background-color: #ffffff;
    border-radius: 5px;

    .show img {
      width: 100px;
      height: 100px;
    }
    .info {
      width: 210px;
      padding: 10px 5px;
      font-size: 14px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;

      .bottom {
        display: flex;
        justify-content: space-between;
        .price {
          display: flex;
          align-items: flex-end;
          color: #fa2209;
          font-size: 12px;
          span {
            font-size: 16px;
          }
        }
        .count-box {
          display: flex;
          width: 110px;
          .add,
          .minus {
            width: 30px;
            height: 30px;
            outline: none;
            border: none;
          }
          .inp {
            width: 40px;
            height: 30px;
            outline: none;
            border: none;
            background-color: #efefef;
            text-align: center;
            margin: 0 5px;
          }
        }
      }
    }
  }

  .my-asset {
    display: flex;
    padding: 20px 0;
    font-size: 14px;
    background-color: #fff;
    .asset-left {
      display: flex;
      justify-content: space-evenly;
      flex: 3;
      .asset-left-item {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        span:first-child {
          margin-bottom: 5px;
          color: #ff0000;
          font-size: 16px;
        }
      }
    }
    .asset-right {
      flex: 1;
      .asset-right-item {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        .van-icon {
          font-size: 24px;
          margin-bottom: 5px;
        }
      }
    }
  }
}

.footer-fixed {
  position: fixed;
  left: 0;
  bottom: 50px;
  height: 50px;
  width: 100%;
  border-bottom: 1px solid #ccc;
  background-color: #fff;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 10px;

  .all-check {
    display: flex;
    align-items: center;
    .van-checkbox {
      margin-right: 5px;
    }
  }

  .all-total {
    display: flex;
    line-height: 36px;
    .price {
      font-size: 14px;
      margin-right: 10px;
      .totalPrice {
        color: #fa2209;
        font-size: 18px;
        font-style: normal;
      }
    }

    .goPay,
    .delete {
      min-width: 100px;
      height: 36px;
      line-height: 36px;
      text-align: center;
      background-color: #fa2f21;
      color: #fff;
      border-radius: 18px;
      &.disabled {
        background-color: #ff9779;
      }
    }
  }
}

.empty-cart {
  padding: 80px 30px;
  img {
    width: 140px;
    height: 92px;
    display: block;
    margin: 0 auto;
  }
  .tips {
    text-align: center;
    color: #666;
    margin: 30px;
  }
  .btn {
    width: 110px;
    height: 32px;
    line-height: 32px;
    text-align: center;
    background-color: #fa2c20;
    border-radius: 16px;
    color: #fff;
    display: block;
    margin: 0 auto;
  }
  //.user {
  //  min-height: 100vh;
  //  background-color: #f7f7f7;
  //  padding-bottom: 50px;
  //}

}
</style>