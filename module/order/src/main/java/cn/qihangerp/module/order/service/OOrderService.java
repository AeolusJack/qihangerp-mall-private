package cn.qihangerp.module.order.service;


import cn.qihangerp.module.order.domain.OOrder;
import cn.qihangerp.module.order.domain.OOrderItem;
import cn.qihangerp.module.order.domain.vo.SalesDailyVo;
import cn.qihangerp.request.OrderSearchRequest;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;



import java.util.List;

/**
* @author qilip
* @description 针对表【o_order(订单表)】的数据库操作Service
* @createDate 2024-03-09 13:15:57
*/
public interface OOrderService extends IService<OOrder> {
    ResultVo<Integer> jdOrderMessage(String orderId, JSONObject orderDetail);
    ResultVo<Integer> jdvcOrderMessage(String orderId,JSONObject orderDetail );
    ResultVo<Integer> taoOrderMessage(String tid,JSONObject orderDetail );
    ResultVo<Integer> pddOrderMessage(String orderSn,JSONObject orderDetail );
    ResultVo<Integer> douOrderMessage(String orderId,JSONObject orderDetail );
    ResultVo<Integer> offlineOrderMessage(String orderNum);
    ResultVo<Integer> weiOrderMessage(String orderNum,JSONObject orderDetail );

    List<OOrder> getList(OOrder order);
    PageResult<OOrder> queryPageList(OrderSearchRequest bo, PageQuery pageQuery);
    PageResult<OOrder> queryWaitDistOrderPageList(OrderSearchRequest bo, PageQuery pageQuery);

    /**
     * 备货清单 - 已取号 未发货的订单
     * @param orderNum
     * @param shopId
     * @param pageQuery
     * @return
     */
//    PageResult<OOrder> queryStockUpPageList(String orderNum,Long shopId, PageQuery pageQuery);

    OOrder queryDetailById(Long id);

    List<OOrder> searchOrderConsignee(String consignee);
    List<OOrderItem> searchOrderItemByReceiverMobile(String receiverMobile);

    /**
     * 手动添加订单
     * @param bo
     * @return
     */
//    int insertErpOrder(OrderCreateBo bo,String createBy);

    List<SalesDailyVo> salesDaily();
    SalesDailyVo getTodaySalesDaily();

//    ResultVo<Integer> saveWaybillCode(String orderNum,Long shopId,Integer shopType, String WaybillCode);

}
