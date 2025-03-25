package cn.qihangerp.mall.controller.goods;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.mall.response.PickerValueResponse;
import cn.qihangerp.module.goods.domain.OGoodsModel;
import cn.qihangerp.module.goods.domain.OGoodsType;
import cn.qihangerp.module.goods.service.OGoodsModelService;
import cn.qihangerp.module.goods.service.OGoodsTypeService;
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
public class GoodsTypeController {
    private final OGoodsTypeService goodsTypeService;
    @GetMapping("/type/list")
    public AjaxResult list( HttpServletRequest request)
    {
        List<PickerValueResponse> responseList = new ArrayList<>();
        List<OGoodsType> list = goodsTypeService.list();
        for(OGoodsType type : list){
            PickerValueResponse pickerValueResponse = new PickerValueResponse();
            BeanUtils.copyProperties(type, pickerValueResponse);
            responseList.add(pickerValueResponse);
        }
        return AjaxResult.success(responseList);
    }
}
