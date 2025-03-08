//package cn.qihangerp.mall.controller;
//
//import cn.qihangerp.common.*;
//import cn.qihangerp.domain.OLogisticsCompany;
//import cn.qihangerp.module.service.OLogisticsCompanyService;
//import jakarta.servlet.http.HttpServletRequest;
//import lombok.AllArgsConstructor;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
//@AllArgsConstructor
//@RestController
//@RequestMapping("/logistics")
//public class LogisticsController extends BaseController {
//    private final OLogisticsCompanyService logisticsCompanyService;
//    @GetMapping("/company_list")
//    public TableDataInfo logisticsStatusList(Integer status, Integer shopType, Integer shopId, HttpServletRequest request)
//    {
//        List<OLogisticsCompany> list = logisticsCompanyService.queryListByStatus(status, shopType, shopId, getUserId(request));
//        return getDataTable(list);
//    }
////    @GetMapping("/company_list")
////    public TableDataInfo logisticsList(Integer type, Integer shopId, PageQuery pageQuery)
////    {
////        PageResult<OLogisticsCompany> result = logisticsCompanyService.queryPageList(type, shopId, pageQuery);
////        return getDataTable(result);
////    }
//
//    /**
//     * 新增物流公司
//     */
//    @PostMapping("/add")
//    public AjaxResult add(@RequestBody OLogisticsCompany company, HttpServletRequest request)
//    {
//        company.setSupplierId(getUserId(request));
//        return toAjax(logisticsCompanyService.save(company));
//    }
//
//    @PutMapping("/updateStatus")
//    public AjaxResult logisticsUpdateStatus(@RequestBody OLogisticsCompany company)
//    {
//        Integer newStatus = null;
//        if(company.getStatus()==null || company.getStatus().intValue() ==0){
//            newStatus = 1;
//        }else{
//            newStatus = 0;
//        }
//        return toAjax(logisticsCompanyService.updateStatus(company.getId(),newStatus));
//    }
//}
