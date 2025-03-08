

<template>
  <div>
    <!-- PayPal 按钮容器 -->
    <div id="paypal-button-container"></div>
  </div>
</template>
<script>
export default {
  mounted() {
    // 检查是否已经加载了 PayPal SDK，如果没有则动态加载
    if (!window.paypal) {
      const script = document.createElement('script');
      script.src = 'https://www.paypal.com/sdk/js?client-id=ATcPCvMqtvkQuqoaj3UTtxGEyBBhI7TT2c4CmZoRDtESYhpB42ZELTQbga3WrsypS91nU9X08itiWaYD'; // 替换为你的 PayPal 客户端 ID
      script.onload = this.renderPaypalButton; // 加载完成后调用渲染 PayPal 按钮的方法
      document.body.appendChild(script);
    } else {
      this.renderPaypalButton(); // 如果 PayPal SDK 已经加载，直接渲染按钮
    }
  },
  methods: {
    renderPaypalButton() {
      // 渲染 PayPal 按钮
      window.paypal.Buttons({
        createOrder(data, actions) {
          return actions.order.create({
            purchase_units: [{
              amount: {
                value: '0.10' // 设置支付金额
              }
            }]
          });
        },
        onApprove(data, actions) {
          return actions.order.capture().then(function(details) {
            alert('Transaction completed by ' + details.payer.name.given_name); // 支付完成后的回调
          });
        }
      }).render('#paypal-button-container'); // 渲染 PayPal 按钮到指定容器
    }
  }
};
</script>
<style scoped lang="scss">

</style>
