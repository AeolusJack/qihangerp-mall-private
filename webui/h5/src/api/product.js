import request from '@/utils/request'

//获取商品列表数据
export const getProList = (obj) => {
  const { categoryId, goodsName, page } = obj
  return request.get('/goods/list', {
    params: {
      categoryId,
      goodsName,
      page
    }
  })
}

//获取商品详情数据
export const getProDetail = (goodsId) => {
  return request.get('/api/mall-api/goods/detail', {
    params: {
      goodsId
    }
  })
}

//获取商品评价数据
export const getProComments = (goodsId, limit) => {
  return request.get('/api/mall-api/goodsComment/list', {
    params: {
      goodsId,
      limit
    }
  })
}
