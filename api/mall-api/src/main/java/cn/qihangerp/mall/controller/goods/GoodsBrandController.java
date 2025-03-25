package cn.qihangerp.mall.controller.goods;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.mall.response.PickerValueResponse;
import cn.qihangerp.module.goods.domain.OGoods;
import cn.qihangerp.module.goods.domain.OGoodsBrand;
import cn.qihangerp.module.goods.domain.OGoodsModel;
import cn.qihangerp.module.goods.service.OGoodsBrandService;
import cn.qihangerp.utils.JwtUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/goods")
public class GoodsBrandController {
    private final OGoodsBrandService goodsBrandService;
    @GetMapping("/brand/list")
    public AjaxResult list( HttpServletRequest request) {
        List<PickerValueResponse> responseList = new ArrayList<>();
        List<OGoodsBrand> list = goodsBrandService.list();
        for(OGoodsBrand brand : list){
            PickerValueResponse pickerValueResponse = new PickerValueResponse();
            BeanUtils.copyProperties(brand, pickerValueResponse);
            responseList.add(pickerValueResponse);
        }
        return AjaxResult.success(responseList);
    }
}
