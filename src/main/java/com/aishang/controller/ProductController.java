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
    public String showProuctsByCaOrPn(Model model, String pname, Integer pageNow, Integer csid, Integer cid) {

        //根据商品名称模糊查询商品列表
        if (pageNow == null) {
            pageNow = 1;
        }

        //如果按一级类目查询，则查出当前类目下三个热门商品
        if (cid != null) {
            model.addAttribute("page", "c");
            //当前类目下的3个最新品
            List<Product> newProducts = productService.findNewProductsByCid(cid);
            model.addAttribute("newProducts", newProducts);
        }

        //如果按二级类目查询，则查出当前类目下三个热门商品
        if (pname != null) {
            try {
                pname = new String(pname.getBytes("iso-8859-1"), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            model.addAttribute("page", "p");
            //当前二级类目下的3个最新品
            List<Product> newProducts = productService.findNewProductsByCsid(1);
            model.addAttribute("newProducts", newProducts);
        }

        //如果按二级类目查询，则查出当前类目下三个热门商品
        if (csid != null) {
            model.addAttribute("page", "cs");
            //当前二级类目下的3个最新品
            List<Product> newProducts = productService.findNewProductsByCsid(csid);
            model.addAttribute("newProducts", newProducts);
        }
        PageBeanForProduct<Product> products = productService.fingProuctsByCaOrPn(cid, csid, pname, pageNow);
        model.addAttribute("products", products);

        this.categoryAndHotPro(model);

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

    //加入购物车
    @RequestMapping("/addCartItem")
    public void addCart(HttpServletRequest request, HttpServletResponse response, Integer count, Integer pid) throws IOException {
        //封装CartItem
        CartItem cartItem = new CartItem();
        Product pro = productService.findProductByPid(pid);
        System.out.println("product:" + pro.getShop_price());
        cartItem.setProduct(pro);
        cartItem.setCount(count);
        System.out.println("cartItem:" + cartItem.getSubTotal());
        //将购物车存入session
        HttpSession session = request.getSession();
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
        System.out.println("cart:" + cart.getTotal());
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
        out.print(size+"-"+cart.getCartItemMap().size());
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