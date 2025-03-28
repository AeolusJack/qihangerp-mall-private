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
      <span class="all">共<i>{{ list.length }}</i>单可抢单</span>

    </div>

    <div v-if="list.length>0">
      <!-- 可抢单列表 -->
      <div class="cart-list" v-for="item in list">
      <van-cell-group inset>
      <van-card style="background-color: #FFFFFF"
          :num="item.quantity"
          :price="item.price"
          :desc="item.remark"
          :title="item.title?item.title:'货源信息'"
          :thumb="item.image"
      >
        <template #tags>
          <span>
          <van-tag plain type="primary">{{item.model}}</van-tag>
          </span>
          <span style="padding-left: 10px;">
          <van-tag plain type="primary" >{{item.brand}}</van-tag>
          </span>
          <span style="padding-left: 10px;">
          <van-tag plain type="primary" >{{item.type}}</van-tag>
          </span>
        </template>
        <template #footer>
          <van-button type="primary" size="small" @click="acceptSourceOrder(item)">抢单</van-button>

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
import {getUserInfoDetail} from "@/api/user";
import {listPendingGoodsSource, acceptSourceOrder} from "@/api/goodssource";
import {Toast} from "vant";
export default {
  name: "GoodsSourceOrderPage",
  components: {
    CountBox,
  },
  data() {
    return {
      isEdit: false,
      userInfo:null,
      list:[]
    };
  },
  computed: {

  },

  created() {
    this.getUserInfo()
  },
  methods: {
    async getUserInfo() {
      const response = await getUserInfoDetail();
      console.log("========返回userinfo======",response);
      if(response.code === 200){
        this.userInfo = response.data.userInfo;
        this.getPendingSourceList()
      }
    },
    async getPendingSourceList() {
      listPendingGoodsSource().then(resp=>{
        console.log('=========返回的货源列表===========',resp.rows)
        this.list = resp.rows
      })
    },
    acceptSourceOrder(goods){
      console.log('=======抢单============',goods)
      acceptSourceOrder({id:goods.id}).then(resp=>{
        console.log('======抢单提交结果======',resp)
        if(resp.code == 200){
          Toast("接单成功")
          this.getPendingSourceList()
        } else if(resp.code == 500){
          Toast(resp.msg)
        }
      })
    }
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