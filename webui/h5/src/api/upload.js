import request from '@/utils/request'

export function updateImage(formData) {
  // const formData = new FormData();
  // formData.append('file', file);
  return request({
    url: '/api/mall-api/upload/image',
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data' // 确保请求头是 multipart/form-data
    }
  })
}