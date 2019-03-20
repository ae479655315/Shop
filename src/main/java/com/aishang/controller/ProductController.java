package com.aishang.controller;

import com.aishang.model.*;
import com.aishang.service.ICategoryService;
import com.aishang.service.IProductService;

import com.aishang.service.IStoreService;
import com.aishang.util.CategoryUtil;
import com.aishang.util.PageBeanForProduct;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Resource
    private ICategoryService categoryService;

    @Resource
    private IProductService productService;

    @Resource
    private IStoreService storeService;

    //商品搜索
    @RequestMapping("/showProuctsByCaOrPn")
    public String showProuctsByCaOrPn(Model model, PageBeanForProduct pageBean, Integer by) {
        if (by != null && by == 2) {
            //查询店铺
            try {
                pageBean.setPname(new String(pageBean.getPname().getBytes("iso-8859-1"), "UTF-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            List<StoreWapper> stores = storeService.findStoreBySname(pageBean.getPname());
            model.addAttribute("stores", stores);
            //回显查询条件
            Product product = new Product();
            product.setPname(pageBean.getPname());
            model.addAttribute("products", product);
            model.addAttribute("by", by);
            //查询该店铺的推荐商品
            List<ProductWapper> newProductWappers = storeService.findNewProductBySid(1);
            model.addAttribute("newProductWappers", newProductWappers);
            this.categoryAndHotPro(model);
            return "storeList";
        } else {
            //查询商品
            //根据商品名称模糊查询商品列表
            if (pageBean.getPageNow() == null) {
                pageBean.setPageNow(1);
            }
            //如果按一级类目查询，则查出当前类目下三个热门商品
            if (pageBean.getCid() != null) {
                model.addAttribute("page", "c");
                //当前类目下的3个最新品
                List<Product> newProducts = productService.findNewProductsByCid(pageBean.getCid());
                model.addAttribute("newProducts", newProducts);
            }

            //如果按二级类目查询，则查出当前类目下三个热门商品
            if (pageBean.getPname() != null) {
                try {
                    pageBean.setPname(new String(pageBean.getPname().getBytes("iso-8859-1"), "UTF-8"));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                model.addAttribute("page", "p");
                //当前二级类目下的3个最新品
                List<Product> newProducts = productService.findNewProductsByCsid(1);
                model.addAttribute("newProducts", newProducts);
            }

            //如果按二级类目查询，则查出当前类目下三个热门商品
            if (pageBean.getCsid() != null) {
                model.addAttribute("page", "cs");
                //当前二级类目下的3个最新品
                List<Product> newProducts = productService.findNewProductsByCsid(pageBean.getCsid());
                model.addAttribute("newProducts", newProducts);
            }

            PageBeanForProduct<ProductWapper> products = productService.fingProuctsByCaOrPn(pageBean);
            model.addAttribute("products", products);

            this.categoryAndHotPro(model);
        }
        return "productList";
    }

    ;


    //商品详情
    @RequestMapping("/showProduct")
    public String showProduct(Model model, Integer pid) {
        //根据商品id查询商品信息
        ProductWapper product = productService.findProductByPid(pid);
        model.addAttribute("product", product);

        //查询一类类目扩展类集合和热门商品(类目联动与搜索栏使用)
        categoryAndHotPro(model);
        System.out.println(product.getStore().getStoreName());

        return "product";
    }

    ;

    //收藏商品
    @RequestMapping("/collectProduct")
    public void collectProduct(HttpSession session, HttpServletResponse response, Integer pid) throws IOException {
        //响应客户端
        PrintWriter out = response.getWriter();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            //未登录，跳转至登录页
            out.print("no");
            return;
        }
        Collectproduct collectproduct = new Collectproduct();
        collectproduct.setPid(pid);
        collectproduct.setUid(user.getUid());
        //查看当前用户是否已经搜藏过该商品
        Collectproduct productIsExist = productService.checkProductIsExist(collectproduct);
        if (productIsExist != null) {
            //以收藏过该商品
            out.print("exist");
            return;
        }
        //调用service 方法执行收藏商品
        productService.collectProduct(collectproduct);
        out.print("ok");
    }

    //取消收藏
    @RequestMapping("/cancelCollection")
    public String cancelCollection(HttpSession session, HttpServletResponse response, Integer pid) throws IOException {
        //响应客户端
        PrintWriter out = response.getWriter();
        User user = (User) session.getAttribute("user");
        Collectproduct collectproduct = new Collectproduct();
        collectproduct.setPid(pid);
        collectproduct.setUid(user.getUid());
        //调用service 执行取消收藏
        productService.cancelCollection(collectproduct);
        return "redirect:myCollectProduct.do";
    }

    //加入购物车
    @RequestMapping("/addCartItem")
    public void addCart(HttpSession session, HttpServletResponse response, Integer count, Integer pid) throws IOException {
        //封装CartItem
        CartItem cartItem = new CartItem();
        Product pro = productService.findProductByPid(pid);
        cartItem.setProduct(pro);
        cartItem.setCount(count);
        //将购物车存入session
        Cart cart = null;
        if (session.getAttribute("cart") == null) {
            //第一次加入购物车
            cart = new Cart();
            cart.addCartItem(cartItem, pro.getStoreId());
            session.setAttribute("cart", cart);
        } else {
            //已经加入过购物车了
            cart = (Cart) session.getAttribute("cart");
            cart.addCartItem(cartItem, pro.getStoreId());
        }
        //响应客户端
        PrintWriter out = response.getWriter();
        out.print("ok");
    }

    ;

    //查看购物车
    @RequestMapping("/showCartItem")
    public String addCart(Model model) {
        //查询所有店铺信息
        List<Store> allStores = storeService.findAllStores();
        model.addAttribute("allStores", allStores);
        this.categoryAndHotPro(model);
        return "cart";
    }

    //删除购物项购物车
    @RequestMapping("/deleteItem")
    public void addCart(HttpServletRequest request, HttpServletResponse response, Model model, Integer pid, Integer storeId) throws IOException {
        //从session中获取cart
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        //执行删除
        Integer size = cart.removeItem(pid, storeId);
        //响应客户端
        PrintWriter out = response.getWriter();
        out.print(size + "-" + cart.getCartItemMap().size());
    }


    //清空购物车
    @RequestMapping("/clearCart")
    public String clearCart(HttpServletRequest request) {
        //从session中获取cart
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        cart.clearCatr();
        return "redirect:showCartItem.do";
    }


    //我收藏的商品
    @RequestMapping("myCollectProduct")
    public String myCollectProduct(HttpServletRequest request, Model model, Integer pageNow) {
        if (pageNow == null) {
            pageNow = 1;
        }
        //从session中获取cart
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            //未登录，跳转至登录页
            return "redirect:/user/login.do";
        }
        User user = (User) session.getAttribute("user");
        //pageBean
        PageBeanForProduct<ProductWapper> productWappers = productService.findProductByUid(user.getUid(), pageNow);
        model.addAttribute("products", productWappers);
        //查询一类类目扩展类集合和热门商品(类目联动与搜索栏使用)
        categoryAndHotPro(model);
        return "collectProduct";
    }


    private void categoryAndHotPro(Model model) {
        //查询一类类目扩展类集合
        List<CategoryWapper> categoryWappers = categoryService.findAllCategoryWappers();
        model.addAttribute("categoryWappers", categoryWappers);

        //查询8个热门商品,搜索框用
        List<Product> hotProducts = productService.findHotProducts();
        model.addAttribute("hotProducts", hotProducts);
    }

    ;
}