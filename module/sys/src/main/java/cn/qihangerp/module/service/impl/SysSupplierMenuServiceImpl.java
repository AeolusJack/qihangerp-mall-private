//package cn.qihangerp.module.service.impl;
//
//import cn.qihangerp.common.constant.Constants;
//import cn.qihangerp.common.constant.UserConstants;
//import cn.qihangerp.utils.StringUtils;
//import cn.qihangerp.domain.vo.MetaVo;
//import cn.qihangerp.domain.vo.RouterVo;
//import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
//import cn.qihangerp.module.domain.SysSupplierMenu;
//import cn.qihangerp.module.service.SysSupplierMenuService;
//import cn.qihangerp.module.mapper.SysSupplierMenuMapper;
//import lombok.AllArgsConstructor;
//import org.springframework.stereotype.Service;
//
//import java.util.ArrayList;
//import java.util.Iterator;
//import java.util.LinkedList;
//import java.util.List;
//
///**
//* @author qilip
//* @description 针对表【sys_supplier_menu(菜单权限表)】的数据库操作Service实现
//* @createDate 2025-02-16 16:29:43
//*/
//@AllArgsConstructor
//@Service
//public class SysSupplierMenuServiceImpl extends ServiceImpl<SysSupplierMenuMapper, SysSupplierMenu>
//    implements SysSupplierMenuService{
//    private final SysSupplierMenuMapper menuMapper;
//
//    @Override
//    public List<SysSupplierMenu> selectMenuTreeByUserId(Long userId) {
//        List<SysSupplierMenu> menus = menuMapper.selectMenuTreeAll();
//        return getChildPerms(menus, 0);
//    }
//
//    public List<SysSupplierMenu> getChildPerms(List<SysSupplierMenu> list, int parentId)
//    {
//        List<SysSupplierMenu> returnList = new ArrayList<SysSupplierMenu>();
//        for (Iterator<SysSupplierMenu> iterator = list.iterator(); iterator.hasNext();)
//        {
//            SysSupplierMenu t = (SysSupplierMenu) iterator.next();
//            // 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
//            if (t.getParentId() == parentId)
//            {
//                recursionFn(list, t);
//                returnList.add(t);
//            }
//        }
//        return returnList;
//    }
//
//    /**
//     * 递归列表
//     *
//     * @param list 分类表
//     * @param t 子节点
//     */
//    private void recursionFn(List<SysSupplierMenu> list, SysSupplierMenu t)
//    {
//        // 得到子节点列表
//        List<SysSupplierMenu> childList = getChildList(list, t);
//        t.setChildren(childList);
//        for (SysSupplierMenu tChild : childList)
//        {
//            if (hasChild(list, tChild))
//            {
//                recursionFn(list, tChild);
//            }
//        }
//    }
//
//    /**
//     * 得到子节点列表
//     */
//    private List<SysSupplierMenu> getChildList(List<SysSupplierMenu> list, SysSupplierMenu t)
//    {
//        List<SysSupplierMenu> tlist = new ArrayList<SysSupplierMenu>();
//        Iterator<SysSupplierMenu> it = list.iterator();
//        while (it.hasNext())
//        {
//            SysSupplierMenu n = (SysSupplierMenu) it.next();
//            if (n.getParentId().longValue() == t.getMenuId().longValue())
//            {
//                tlist.add(n);
//            }
//        }
//        return tlist;
//    }
//
//    /**
//     * 判断是否有子节点
//     */
//    private boolean hasChild(List<SysSupplierMenu> list, SysSupplierMenu t)
//    {
//        return getChildList(list, t).size() > 0;
//    }
//    /**
//     * 构建前端路由所需要的菜单
//     *
//     * @param menus 菜单列表
//     * @return 路由列表
//     */
//    @Override
//    public List<RouterVo> buildMenus(List<SysSupplierMenu> menus)
//    {
//        List<RouterVo> routers = new LinkedList<RouterVo>();
//        for (SysSupplierMenu menu : menus)
//        {
//            RouterVo router = new RouterVo();
//            router.setHidden("1".equals(menu.getVisible()));
//            router.setName(getRouteName(menu));
//            router.setPath(getRouterPath(menu));
//            router.setComponent(getComponent(menu));
//            router.setQuery(menu.getQuery());
//            router.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon(), StringUtils.equals("1", menu.getIsCache()), menu.getPath()));
//            List<SysSupplierMenu> cMenus = menu.getChildren();
//            if (StringUtils.isNotEmpty(cMenus) && UserConstants.TYPE_DIR.equals(menu.getMenuType()))
//            {
//                router.setAlwaysShow(true);
//                router.setRedirect("noRedirect");
//                router.setChildren(buildMenus(cMenus));
//            }
//            else if (isMenuFrame(menu))
//            {
//                router.setMeta(null);
//                List<RouterVo> childrenList = new ArrayList<RouterVo>();
//                RouterVo children = new RouterVo();
//                children.setPath(menu.getPath());
//                children.setComponent(menu.getComponent());
//                children.setName(StringUtils.capitalize(menu.getPath()));
//                children.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon(), StringUtils.equals("1", menu.getIsCache()), menu.getPath()));
//                children.setQuery(menu.getQuery());
//                childrenList.add(children);
//                router.setChildren(childrenList);
//            }
//            else if (menu.getParentId().intValue() == 0 && isInnerLink(menu))
//            {
//                router.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon()));
//                router.setPath("/");
//                List<RouterVo> childrenList = new ArrayList<RouterVo>();
//                RouterVo children = new RouterVo();
//                String routerPath = innerLinkReplaceEach(menu.getPath());
//                children.setPath(routerPath);
//                children.setComponent(UserConstants.INNER_LINK);
//                children.setName(StringUtils.capitalize(routerPath));
//                children.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon(), menu.getPath()));
//                childrenList.add(children);
//                router.setChildren(childrenList);
//            }
//            routers.add(router);
//        }
//        return routers;
//    }
//    /**
//     * 获取组件信息
//     *
//     * @param menu 菜单信息
//     * @return 组件信息
//     */
//    public String getComponent(SysSupplierMenu menu)
//    {
//        String component = UserConstants.LAYOUT;
//        if (StringUtils.isNotEmpty(menu.getComponent()) && !isMenuFrame(menu))
//        {
//            component = menu.getComponent();
//        }
//        else if (StringUtils.isEmpty(menu.getComponent()) && menu.getParentId().intValue() != 0 && isInnerLink(menu))
//        {
//            component = UserConstants.INNER_LINK;
//        }
//        else if (StringUtils.isEmpty(menu.getComponent()) && isParentView(menu))
//        {
//            component = UserConstants.PARENT_VIEW;
//        }
//        return component;
//    }
//    /**
//     * 是否为parent_view组件
//     *
//     * @param menu 菜单信息
//     * @return 结果
//     */
//    public boolean isParentView(SysSupplierMenu menu)
//    {
//        return menu.getParentId().intValue() != 0 && UserConstants.TYPE_DIR.equals(menu.getMenuType());
//    }
//    /**
//     * 获取路由名称
//     *
//     * @param menu 菜单信息
//     * @return 路由名称
//     */
//    public String getRouteName(SysSupplierMenu menu)
//    {
//        String routerName = StringUtils.capitalize(menu.getPath());
//        // 非外链并且是一级目录（类型为目录）
//        if (isMenuFrame(menu))
//        {
//            routerName = StringUtils.EMPTY;
//        }
//        return routerName;
//    }
//    /**
//     * 是否为菜单内部跳转
//     *
//     * @param menu 菜单信息
//     * @return 结果
//     */
//    public boolean isMenuFrame(SysSupplierMenu menu)
//    {
//        return menu.getParentId().intValue() == 0 && UserConstants.TYPE_MENU.equals(menu.getMenuType())
//                && menu.getIsFrame().equals(UserConstants.NO_FRAME);
//    }
//
//    /**
//     * 获取路由地址
//     *
//     * @param menu 菜单信息
//     * @return 路由地址
//     */
//    public String getRouterPath(SysSupplierMenu menu)
//    {
//        String routerPath = menu.getPath();
//        // 内链打开外网方式
//        if (menu.getParentId().intValue() != 0 && isInnerLink(menu))
//        {
//            routerPath = innerLinkReplaceEach(routerPath);
//        }
//        // 非外链并且是一级目录（类型为目录）
//        if (0 == menu.getParentId().intValue() && UserConstants.TYPE_DIR.equals(menu.getMenuType())
//                && UserConstants.NO_FRAME.equals(menu.getIsFrame()))
//        {
//            routerPath = "/" + menu.getPath();
//        }
//        // 非外链并且是一级目录（类型为菜单）
//        else if (isMenuFrame(menu))
//        {
//            routerPath = "/";
//        }
//        return routerPath;
//    }
//    /**
//     * 是否为内链组件
//     *
//     * @param menu 菜单信息
//     * @return 结果
//     */
//    public boolean isInnerLink(SysSupplierMenu menu)
//    {
//        return menu.getIsFrame().equals(UserConstants.NO_FRAME) && StringUtils.ishttp(menu.getPath());
//    }
//    /**
//     * 内链域名特殊字符替换
//     *
//     * @return 替换后的内链域名
//     */
//    public String innerLinkReplaceEach(String path)
//    {
//        return StringUtils.replaceEach(path, new String[] { Constants.HTTP, Constants.HTTPS, Constants.WWW, "." },
//                new String[] { "", "", "", "/" });
//    }
//}
//
//
//
//
