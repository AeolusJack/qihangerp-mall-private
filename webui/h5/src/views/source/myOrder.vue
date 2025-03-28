<template>
  <div class="order">
    <van-nav-bar title="我的接单" left-arrow @click-left="$router.go(-1)" />
    <van-tabs v-model="active" sticky>
<!--      <van-tab name="pending" title="可接单"></van-tab>-->
      <van-tab name="accept" title="接单中"></van-tab>
      <van-tab name="complete" title="已完成"></van-tab>

    </van-tabs>

    <SourceOrderListItem
      v-for="item in list"
      :key="item.id"
      :item="item"
    ></SourceOrderListItem>
  </div>
</template>

<script>
import SourceOrderListItem from "@/components/SourceOrderListItem.vue";
import { getMySourceOrderList } from "@/api/goodssource";
export default {
  name: "SourceOrderPage",
  components: {
    SourceOrderListItem,
  },
  data() {
    return {
      active: this.$route.query.dataType || "all",
      page: 1,
      list: [],
    };
  },
  methods: {
    async getOrderList() {
      const {
        data: { list },
      } = await getMySourceOrderList(this.active, this.page);
      list.data.forEach((item) => {
        item.total_num = 0;
        // item.goods.forEach((goods) => {
        //   item.total_num += goods.total_num;
        // });
      });
      this.list = list.data;
    },
  },
  watch: {
    active: {
      immediate: true,
      handler() {
        this.getOrderList();
      },
    },
  },
};
</script>

<style lang="less" scoped>
.order {
  background-color: #fafafa;
}
.van-tabs {
  position: sticky;
  top: 0;
}
</style>