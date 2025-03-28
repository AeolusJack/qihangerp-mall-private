package cn.qihangerp.mall.controller.order;

import cn.qihangerp.common.*;
import cn.qihangerp.domain.OShopPlatform;
import cn.qihangerp.mall.request.UserOrderRequest;
import cn.qihangerp.mall.response.DataListResponse;
import cn.qihangerp.mall.response.ListResponse;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 店铺Controller
 *
 * @author qihang
 * @date 2023-12-31
 */
@AllArgsConstructor
@RestController
@RequestMapping("/order")
public class OrderController extends BaseController {


    @GetMapping("/list")
    public AjaxResult list(UserOrderRequest bo, HttpServletRequest request)
    {
        DataListResponse response = new DataListResponse();
        ListResponse listResponse = new ListResponse();
        response.setList(listResponse);

        return AjaxResult.success(response);
    }

}
