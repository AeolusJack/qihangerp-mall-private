<template>
  <div class="order-list-item" v-if="item.id">
    <div class="tit">
      <div class="time">{{ item.acceptTime }}</div>
      <div class="status">

        <van-tag type="primary" v-if="item.status==0">已取消</van-tag>
        <van-tag type="primary" v-if="item.status==1">进行中</van-tag>
        <van-tag type="primary" v-if="item.status==2">发布审核中</van-tag>
        <van-tag type="primary" v-if="item.status==3">已发布</van-tag>
      </div>
    </div>
    <div class="list">
      <div class="list-item" >
        <div class="goods-img">
          <img :src="item.image" alt="" />
        </div>
        <div class="goods-content text-ellipsis-2">
          <span>
          <van-tag plain type="primary">{{item.model}}</van-tag>
          </span>
          <span style="padding-left: 10px;">
          <van-tag plain type="primary" >{{item.brand}}</van-tag>
          </span>
          <span style="padding-left: 10px;">
          <van-tag plain type="primary" >{{item.type}}</van-tag>
          </span>
        </div>
        <div class="goods-trade">
          <p>¥ {{ item.price }}</p>
          <p>x {{ item.quantity }}</p>
        </div>
      </div>
    </div>
<!--    <div class="total">-->
<!--&lt;!&ndash;      共 {{ item.total_num }} 件商品，总金额 ¥{{ item.total_price }}&ndash;&gt;-->
<!--      <van-button type="primary" size="small" @click="publish(item)">发布</van-button>-->
<!--    </div>-->
    <div class="actions">
      <div v-if="item.status === 1">
        <span v-if="item.status === 1" @click="$router.push({path:'/source/publishGoods',query:{id:item.goodsSourceId}})" >立刻发布</span>
        <span v-else-if="item.delivery_status === 10">申请取消</span>
        <span
          v-else-if="item.delivery_status === 20 || item.delivery_status === 30"
          >确认收货</span
        >
      </div>
      <div v-if="item.order_status === 30">
        <span>评价</span>
      </div>
    </div>
  </div>
</template>

<script>
import {Toast} from "vant";

export default {
  props: {
    item: {
      type: Object,
      default: () => {
        return {};
      },
    },
  },
  methods: {
    publishGoods(item){
      Toast("发布成功！请等待审核！")
    }
  }
};
</script>

<style lang="less" scoped>
.order-list-item {
  margin: 10px auto;
  width: 94%;
  padding: 15px;
  background-color: #ffffff;
  box-shadow: 0 0.5px 2px 0 rgba(0, 0, 0, 0.05);
  border-radius: 8px;
  color: #333;
  font-size: 13px;

  .tit {
    height: 24px;
    line-height: 24px;
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
    .status {
      color: #fa2209;
    }
  }

  .list-item {
    display: flex;
    .goods-img {
      width: 90px;
      height: 90px;
      margin: 0px 10px 10px 0;
      img {
        width: 100%;
        height: 100%;
      }
    }
    .goods-content {
      flex: 2;
      line-height: 18px;
      max-height: 36px;
      margin-top: 8px;
    }
    .goods-trade {
      flex: 1;
      line-height: 18px;
      text-align: right;
      color: #b39999;
      margin-top: 8px;
    }
  }

  .total {
    text-align: right;
  }
  .actions {
    text-align: right;
    span {
      display: inline-block;
      height: 28px;
      line-height: 28px;
      color: #383838;
      border: 0.5px solid #a8a8a8;
      font-size: 14px;
      padding: 0 15px;
      border-radius: 5px;
      margin: 10px 0;
    }
  }
}
</style>