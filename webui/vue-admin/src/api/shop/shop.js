import request from '@/utils/request'

// 查询店铺列表
export function listShop(query) {
  return request({
    url: '/api/oms-api/shop/list',
    method: 'get',
    params: query
  })
}

export function listShopPage(query) {
  return request({
    url: '/api/oms-api/shop/pageList',
    method: 'get',
    params: query
  })
}
// 获取店铺拉取时间
export function getShopPullTime(id) {
  return request({
    url: '/api/oms-api/shop/getPullTime/' + id,
    method: 'get'
  })
}
// 保存店铺拉取时间
export function saveShopPullTime(data) {
  return request({
    url: '/api/oms-api/shop/saveShopPullTime',
    method: 'post',
    data: data
  })
}

// 查询店铺详细
export function getShop(id) {
  return request({
    url: '/api/oms-api/shop/shop/' + id,
    method: 'get'
  })
}

// 新增店铺
export function addShop(data) {
  return request({
    url: '/api/oms-api/shop/shop',
    method: 'post',
    data: data
  })
}

// 修改店铺
export function updateShop(data) {
  return request({
    url: '/api/oms-api/shop/shop',
    method: 'put',
    data: data
  })
}

// 删除店铺
export function delShop(id) {
  return request({
    url: '/api/oms-api/shop/shop/' + id,
    method: 'delete'
  })
}


export function updateShopManage(data) {

  return request({
    url: '/api/oms-api/shop/shop/updateShopManage',
    method: 'put',
    data: data
  })
}
// 查询店铺平台列表
export function listPlatform(query) {
  return request({
    url: '/api/oms-api/shop/platformList',
    method: 'get',
    params: query
  })
}

// 查询店铺详细
export function getPlatform(id) {
  return request({
    url: '/api/oms-api/shop/platform/' + id,
    method: 'get'
  })
}

// 修改店铺
export function updatePlatform(data) {
  return request({
    url: '/api/oms-api/shop/platform',
    method: 'put',
    data: data
  })
}

// 角色状态修改
export function changePlatformStatus(id, status) {
  const data = {
    id,
    status
  }
  return request({
    url: '/api/oms-api/shop/platform/changeStatus',
    method: 'put',
    data: data
  })
}

// 新增店铺
export function addPlatform(data) {
  return request({
    url: '/api/oms-api/shop/platform',
    method: 'post',
    data: data
  })
}

export function listLogistics(query) {
  return request({
    url: '/api/oms-api/shop/logistics',
    method: 'get',
    params: query
  })
}
export function listLogisticsStatus(query) {
  return request({
    url: '/api/oms-api/shop/logistics_status',
    method: 'get',
    params: query
  })
}

// 新增物流公司
export function addLogistics(data) {
  return request({
    url: '/api/oms-api/logistics',
    method: 'post',
    data: data
  })
}

// 查询物流公司详细
export function getLogistics(id) {
  return request({
    url: '/api/oms-api/logistics/' + id,
    method: 'get'
  })
}


// 修改物流公司
export function updateLogistics(data) {
  return request({
    url: '/api/oms-api/logistics',
    method: 'put',
    data: data
  })
}

// 删除物流公司
export function delLogistics(id) {
  return request({
    url: '/api/oms-api/logistics/' + id,
    method: 'delete'
  })
}


export function listShopPullLogs(query) {
  return request({
    url: '/api/oms-api/shop/pull_logs_list',
    method: 'get',
    params: query
  })
}
// 修改物流状态
export function updateStatus(data) {
  return request({
    url: '/api/oms-api/shop/logistics/updateStatus',
    method: 'put',
    data: data
  })
}
