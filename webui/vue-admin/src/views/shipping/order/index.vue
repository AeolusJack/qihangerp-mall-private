<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">

      <el-tab-pane label="待分配发货商品清单" name="waitSendOrderItem">
        <wait-send-order-item></wait-send-order-item>
      </el-tab-pane>
      <el-tab-pane label="待分配发货订单" name="waitSendOrder" lazy>
        <wait-send-order></wait-send-order>
      </el-tab-pane>
    </el-tabs>

  </div>
</template>

<script>
import waitSendOrder  from "@/views/shipping/order/wait_order.vue";
import waitSendOrderItem  from "@/views/shipping/order/item_list.vue";

export default {
  name: "waitSend",
  components:{waitSendOrder,waitSendOrderItem},
  data() {
    return {
      activeName: 'waitSendOrderItem'
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
