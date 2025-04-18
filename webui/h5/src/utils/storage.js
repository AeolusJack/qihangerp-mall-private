//约定一个键名
const INFO_KEY = 'hm_shopping_info'
const HISTORY_KEY = 'hm_history_list'

//获取个人信息
export const getInfo = () => {

  const defaultObj = { token: '', userId: '' }
  const result = localStorage.getItem(INFO_KEY)
  console.log('=====获取个人信息=====',result,result=='undefined')

  if(result==undefined||result=='undefined'){
    return defaultObj
  }else {
    return result ? JSON.parse(result) : defaultObj
  }

}
//设置个人信息
export const setInfo = (obj) => {
  console.log('=====重新设置个人信息=====',JSON.stringify(obj))
  localStorage.setItem(INFO_KEY, JSON.stringify(obj))
}

//移除个人信息
export const removeInfo = () => {
  localStorage.removeItem(INFO_KEY)
}

//获取搜索历史
export const getHistoryList = () => {
  const result = localStorage.getItem(HISTORY_KEY)
  return result ? JSON.parse(result) : []
}
//设置搜索历史
export const setHistoryList = (arr) => {
  localStorage.setItem(HISTORY_KEY, JSON.stringify(arr))
}