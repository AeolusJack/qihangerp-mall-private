package cn.qihangerp.common;

import cn.qihangerp.common.enums.HttpStatus;
import cn.qihangerp.utils.JwtUtils;
import cn.qihangerp.utils.StringUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * web层通用数据处理
 * 
 * @author qihang
 */
public class BaseController
{
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());



    /**
     * 返回成功
     */
    public AjaxResult success()
    {
        return AjaxResult.success();
    }

    /**
     * 返回失败消息
     */
    public AjaxResult error()
    {
        return AjaxResult.error();
    }

    /**
     * 返回成功消息
     */
    public AjaxResult success(String message)
    {
        return AjaxResult.success(message);
    }
    
    /**
     * 返回成功消息
     */
    public AjaxResult success(Object data)
    {
        return AjaxResult.success(data);
    }

    /**
     * 返回失败消息
     */
    public AjaxResult error(String message)
    {
        return AjaxResult.error(message);
    }

    /**
     * 返回警告消息
     */
    public AjaxResult warn(String message)
    {
        return AjaxResult.warn(message);
    }

    /**
     * 响应返回结果
     * 
     * @param rows 影响行数
     * @return 操作结果
     */
    protected AjaxResult toAjax(int rows)
    {
        return rows > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 响应返回结果
     * 
     * @param result 结果
     * @return 操作结果
     */
    protected AjaxResult toAjax(boolean result)
    {
        return result ? success() : error();
    }

    /**
     * 页面跳转
     */
    public String redirect(String url)
    {
        return StringUtils.format("redirect:{}", url);
    }


    /**
     * 获取登录用户id
     */
    public Long getUserId(HttpServletRequest request) {
        Long userId = JwtUtils.getUserIdFromToken(request); // 你需要实现此方法
        return userId;

    }

    /**
     * 获取登录用户名
     */
    public String getUsername(HttpServletRequest request)
    {
        String token = request.getHeader("Authorization");
        if (token != null && token.startsWith("Bearer ")) {
            token = token.substring(7); // 去掉 "Bearer " 前缀
            // 解析 JWT 获取 userName (同样是伪代码)
            String userName = JwtUtils.getUsernameFromToken(token); // 你需要实现此方法
            return userName;
        }
        return null;
//        return JwtUtils.getUsernameFromToken("");
//        return getLoginUser().getUsername();
    }

    /**
     * 响应请求分页数据
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    protected TableDataInfo getDataTable(List<?> list)
    {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");
        rspData.setRows(list);
//        rspData.setTotal(new PageInfo(list).getTotal());
        rspData.setTotal(list.size());
        return rspData;
    }
    protected TableDataInfo getDataTable(PageResult<?> pageResult)
    {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");
        rspData.setRows(pageResult.getRecords());
//        rspData.setTotal(new PageInfo(list).getTotal());
        rspData.setTotal(pageResult.getTotal());
        return rspData;
    }


}
