<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">

      <el-tab-pane label="备货订单-发货出库" name="stockupOrder">
        <ship-stockup-order></ship-stockup-order>
      </el-tab-pane>
<!--      <el-tab-pane label="备货商品明细" name="stockupOrderItem" lazy>-->
<!--        <ship-stockup-order-item></ship-stockup-order-item>-->
<!--      </el-tab-pane>-->
      <el-tab-pane label="供应商已发货-推送到平台" name="hasSendOrder" lazy>
        <has-send-order></has-send-order>
      </el-tab-pane>
<!--      <el-tab-pane label="京东自营" name="jdvcOrder" lazy>-->
<!--        <order-jd-vc></order-jd-vc>-->
<!--      </el-tab-pane>-->
<!--      <el-tab-pane label="抖店" name="douOrder" lazy>-->
<!--        <order-dou></order-dou>-->
<!--      </el-tab-pane>-->
<!--      <el-tab-pane label="拼多多" name="pddOrder" lazy>-->
<!--        <order-pdd></order-pdd>-->
<!--      </el-tab-pane>-->
    </el-tabs>

  </div>
</template>

<script>
import ShipStockupOrder  from "@/views/shipping/stockOut/ShipStockupOrder.vue";
import ShipStockupOrderItem  from "@/views/shipping/stockOut/order_item_list.vue";
import HasSendOrder  from "@/views/shipping/stockOut/has_send_list.vue";

export default {
  name: "stockup",
  components:{ShipStockupOrder,ShipStockupOrderItem,HasSendOrder},
  data() {
    return {
      activeName: 'stockupOrder'
    };
  },
  created() {

  },
  mounted() {

  },
  methods: {
    handleClick(tab, event) {
      console.log(tab, event);
    }
  }
};
</script>
