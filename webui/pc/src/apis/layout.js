import httpInstance from '@/utils/http'

// export function getCategoryAPI() {
//   return httpInstance({
//     url: 'home/category/head'
//   })
// }
export function getCategoryAPI() {
  return httpInstance({
    url: '/api/mall-api/recCategory/list'
  })
}