<script >
export default {
  data() {
    return {
      active: 0,
    };
  },
};
</script>

<template>
  <van-tabs v-model="active">
    <van-tab title="货源">内容 1</van-tab>
    <van-tab title="求购">内容 2</van-tab>
  </van-tabs>
</template>

<style scoped lang="scss">

</style>