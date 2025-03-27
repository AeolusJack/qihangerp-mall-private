package cn.qihangerp.oms.controller.openApi;

import lombok.Data;

import java.util.Date;

@Data
public class OrderShipBo {
    private String orderId;//订单表主键id
    private String orderNum;//订单编号
    private String logisticsCompany;//物流公司
    private String logisticsCompanyCode;//物流公司编码
    private String waybillCode;//物流单号
    /**
     * 发货时间，格式yyyy-MM-dd HH:mm:ss
     */
    private String shippingTime;

    /**
     * 发货操作人
     */
    private String shippingOperator;

    private Float packageWeight;
    private Float packageLength;
    private Float packageWidth;
    private Float packageHeight;
    private String packageOperator;
    private String packageTime;//打包时间，格式yyyy-MM-dd HH:mm:ss
    /**
     * 包裹内容JSON
     */
    private String packages;

    private String remark;//备注

}
