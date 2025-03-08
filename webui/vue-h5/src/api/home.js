import request from '@/utils/request'

//获取首页数据
export const getHomeData = () => {
  return request.get('/page/detail', {
    params: {
      pageId: 0
    }
  })
}
// export function getHomeBanner(data) {
//   return request.get({
//     url: '/api/mall-api/banner/list',
//     method: 'post',
//     data: data
//   })
// }
export const getHomeBanner = () => {
  return request.get('/api/mall-api/banner/list', {
    params: {
      which: 2,
      type:2,
      position:'HOME'
    }
  })
}

export const getHomeNav = () => {
  return request.get('/api/mall-api/nav/list', {
    params: {
      pageId: 0
    }
  })
}

export const getHomeGoods = () => {
  return request.get('/api/mall-api/recGoods/list', {
    params: {
      which: 2,
      position:'HOME'
    }
  })
}