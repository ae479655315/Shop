package com.aishang.controller;

import com.aishang.model.*;
import com.aishang.service.ICategoryService;
import com.aishang.service.IOrdersService;
import com.aishang.service.IProductService;
import com.aishang.service.IStoreService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource
    private IProductService productService;

    @Resource
    private IOrdersService ordersService;

    @Resource
    private ICategoryService categoryService;

    @Resource
    private IStoreService storeService;

    //确认订单，修改信息
    @RequestMapping("/showCartItem")
    public String showCartItem(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            //未登录，跳转至登录页
            return "redirect:/user/login.do";
        } else {
            //已登录，发送订单项信息
            User user = (User) session.getAttribute("user");
            //查询所有店铺信息
            List<Store> allStores = storeService.findAllStores();
            model.addAttribute("allStores", allStores);

            categoryAndHotPro(model);
            return "confirmOrder";
        }
    }

    //立即购买
    @RequestMapping("/buyNow")
    public String buyNow(HttpServletRequest request, Model model, Integer pid, Integer count) throws IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            //未登录，跳转至登录页
            return "redirect:/user/login.do";
        } else {
            System.out.println("pid...." + pid);
            System.out.println("count...." + count);
            //已登录，发送订单项信息
            User user = (User) session.getAttribute("user");
            //查询所有店铺信息

            //封装CartItem
            CartItem cartItem = new CartItem();
            Product pro = productService.findProductByPid(pid);
            cartItem.setProduct(pro);
            cartItem.setCount(count);
            Cart cart = new Cart();
            cart.addCartItem(cartItem, pro.getStoreId());
            model.addAttribute("cart",cart);

            List<Store> allStores = storeService.findAllStores();
            model.addAttribute("allStores", allStores);
            categoryAndHotPro(model);
            return "confirmOrder";
        }
    }


    //订单列表中，去付款
    @RequestMapping("/goPay")
    public String creatOrder(Integer orderID, Model model) {
        model.addAttribute("oids", orderID+",");
        return "pay";
    }


    //确认订单，修改信息
    @RequestMapping("/creatOrder")
    public String creatOrder(HttpServletRequest request, Orders formOrder, Model model,Integer pid,Integer count) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");
        //移除session中若干信息
        session.removeAttribute("cart");
        if(cart == null){
            cart = new Cart();
            CartItem cartItem = new CartItem();
            Product pro = productService.findProductByPid(pid);
            cartItem.setProduct(pro);
            cartItem.setCount(count);
            cart.addCartItem(cartItem, pro.getStoreId());
        }
        //记录多个oid
        List<Integer> oids = ordersService.creatOrdersAndItems(cart,formOrder,user.getUid());
        String str="";
        for (Integer oid : oids) {
            str = str + oid+",";
        }
        categoryAndHotPro(model);
        model.addAttribute("oids", str);
        return "pay";
    }


    //确认支付
    @RequestMapping("/pay")
    public String pay(String oids, Model model) {
        oids = oids.substring(0,oids.length()-1);
        System.out.println(oids+".............................");
        String[] oidArray = oids.split(",");
        List<OrdersWapper> ordersWappers = new ArrayList<>();
        for (String s : oidArray) {
            //查询订单信息
            OrdersWapper order = ordersService.findOrderByOid(Integer.parseInt(s));
            order.setState(2);
            //执行修改
            ordersService.changeState(order);
            ordersWappers.add(order);
        }
        //将信息加入model中
        model.addAttribute("ordersWappers", ordersWappers);
        categoryAndHotPro(model);
        return "paySuccess";
    }

    ;

    //确认收货
    @RequestMapping("/confirmSignIn")
    public String confirmSignIn(Integer orderID, Model model) {
        //查询订单信息
        OrdersWapper order = ordersService.findOrderByOid(orderID);
        order.setState(4);
        //执行修改
        ordersService.changeState(order);
        //将信息加入model中

        return "redirect:/order/myOrders.do";
    }

    ;

    //我的订单
    @RequestMapping("/myOrders")
    public String myOrders(HttpServletRequest request, Model model) throws IOException {

        //从session中获取当前用户信息
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            //未登录
            return "redirect:/user/login.do";
        } else {
            List<OrdersWapper> orders = ordersService.findOrdersByUid(user.getUid());
            System.out.println(orders.size());
            for (OrdersWapper order : orders) {
                System.out.println(order);
            }

            model.addAttribute("orders", orders);
            categoryAndHotPro(model);
            return "myOrders";
        }
    }

    ;

    //订单详情&确认收货
    @RequestMapping("/orderDetails")
    public String orderDetails(Integer orderID, Model model) {
        //查询订单信息
        OrdersWapper order = ordersService.findOrderByOid(orderID);
        model.addAttribute("order", order);
        categoryAndHotPro(model);
        return "orderDetails";

    }

    ;

    private void categoryAndHotPro(Model model) {
        //查询一类类目扩展类集合
        List<CategoryWapper> categoryWappers = categoryService.findAllCategoryWappers();
        model.addAttribute("categoryWappers", categoryWappers);

        //查询8个热门商品,搜索框用
        List<Product> hotProducts = productService.findHotProducts();
        model.addAttribute("hotProducts", hotProducts);
    }

}