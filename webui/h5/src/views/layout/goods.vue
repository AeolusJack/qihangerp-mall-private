<script >
import GoodsItem from "@/components/GoodsItem.vue";

import {listGoods} from "@/api/goods";

export default {
  components: {GoodsItem},
  data() {
    return {
      active: 0,
      proList:[]
    };
  },
  async created() {
    listGoods().then(resp => {
      this.proList = resp.data.records;
    })
  }
};
</script>

<template>
  <div style="background-color: #f3f3f3;">
    <van-nav-bar title="商品" fixed />
    <van-search
        readonly
        shape="round"
        background="#f1f1f2"
        placeholder="请在此输入搜索关键词"
        @click="$router.push('/search')"
    />
    <van-tabs v-model="active">
      <van-tab title="货源">
        <div class="guess">
          <div class="goods-list">
            <GoodsItem v-for="item in proList" :key="item.goodsId" :item="item"></GoodsItem>
          </div>
        </div>


      </van-tab>
      <van-tab title="求购">内容 2</van-tab>
    </van-tabs>
  </div>

</template>

<style scoped>
.goods-list {
  background-color: #f6f6f6;
}
</style>