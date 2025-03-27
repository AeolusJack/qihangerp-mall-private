import request from '@/utils/request'

// 获取分类数据
// export const getCategoryData = () => {
//   return request.get('/category/list')
// }

export function getCategoryData() {
  return request.get( '/api/mall-api/recCategory/list')
}