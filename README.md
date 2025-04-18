# 集火电商OMS系统-私域版（含商城）
## 项目介绍

集火电商OMS系统-私域版（含商城），该项目包含商城管理后台、H5商城、PC商城、订单OMS系统等子系统组成，可以处理商城订单也可以手动导入订单。

### 子系统介绍
#### 1、ams商城管理系统
基本的参数配置以及管理前端商城装修管理，功能包括：商城管理、用户管理、商品库管理、分类属性管理、商城订单管理。

#### 2、oms订单系统
管理订单、售后、发货、库存等，支持商城订单以及线下私域订单导入，后续会计划支持公域订单api导入。

#### 3、mall-api商城api
h5和pc商城后端api项目


## 项目结构
**项目后端采用SpringCloud微服务架构开发**

### 后端项目结构
#### api
**微服务对外api模块**
##### 1、gateway
网关
##### 2、ams-api
商城后台管理接口

##### 3、mall-api
商城前端api

##### 4、oms-api
订单系统api

### 前端结构

##### 1、ams
商城管理后台
##### 2、h5
h5商城
##### 3、pc
PC商城

##### 4、oms
oms订单系统


