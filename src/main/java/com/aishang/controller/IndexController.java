package com.aishang.controller;

import com.aishang.model.*;
import com.aishang.service.ICategoryService;
import com.aishang.service.IProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/home")
public class IndexController {

    @Resource
    private ICategoryService categoryService;
    @Resource
    private IProductService productService;

    @RequestMapping("/index")
    public String index2(Model model) {
        //查询一类类目扩展类集合
        List<CategoryWapper> categoryWappers = categoryService.findAllCategoryWappers();
        //查询8个热门商品
        List<Product> hotProducts = productService.findHotProducts();
        //查询8个最新商品
        List<Product> newProducts = productService.findNewProducts();

        model.addAttribute("categoryWappers",categoryWappers);
        model.addAttribute("hotProducts",hotProducts);
        model.addAttribute("newProducts",newProducts);
        return "index";
    }

    ;

}