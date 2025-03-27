import httpInstance from '@/utils/http'

// 获取banner
export function getBannerAPI(params = {}) {
  return httpInstance({
    url: '/api/mall-api/banner/list',
    params: {
      which: 1,
      type:2,
      position:'HOME'
    }
  })
}
export function getNewBanner(params = {}) {
  return httpInstance({
    url: '/api/mall-api/banner/list',
    params: {
      which: 1,
      type:3,
      position:'HOME',
      special:'new'
    }
  })
}
export function getHotBanner(params = {}) {
  return httpInstance({
    url: '/api/mall-api/banner/list',
    params: {
      which: 1,
      type:3,
      position:'HOME',
      special:'hot'
    }
  })
}

// export function getBannerAPI(params = {}) {
//   // 默认为1 商品为2
//   const { distributionSite = '1' } = params
//   return httpInstance({
//     url: '/home/banner',
//     params: {
//       distributionSite
//     }
//   })
// }

export const getHomeNav = () => {
  return httpInstance.get('/api/mall-api/nav/list', {
    params: {
      pageId: 0
    }
  })
}

// export const getGoodsAPI = () => {
//   return httpInstance({
//     url: '/home/goods'
//   })
// }
export function getGoodsAPI(params = {}) {
  return httpInstance({
    url: '/api/mall-api/recCategory/list',
    params: {
    }
  })
}