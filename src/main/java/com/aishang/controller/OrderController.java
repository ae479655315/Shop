package com.aishang.controller;

import com.aishang.model.*;
import com.aishang.service.ICategoryService;
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
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource
    private IProductService productService;

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


    private void categoryAndHotPro(Model model) {
        //查询一类类目扩展类集合
        List<CategoryWapper> categoryWappers = categoryService.findAllCategoryWappers();
        model.addAttribute("categoryWappers", categoryWappers);

        //查询8个热门商品,搜索框用
        List<Product> hotProducts = productService.findHotProducts();
        model.addAttribute("hotProducts", hotProducts);
    }

}