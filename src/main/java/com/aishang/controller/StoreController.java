package com.aishang.controller;

import com.aishang.model.*;
import com.aishang.service.ICategoryService;
import com.aishang.service.IProductService;
import com.aishang.service.IStoreService;
import com.aishang.util.PageBeanForProduct;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/store")
public class StoreController {
    @Resource
    private IStoreService storeService;
    @Resource
    private IProductService productService;
    @Resource
    private ICategoryService categoryService;


    //收藏的店铺列表
    @RequestMapping("/myCollectStore")
    public String myCollectStore(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<StoreWapper> myCollectStore = storeService.findMyCollectStore(user.getUid());
        model.addAttribute("myCollectStore", myCollectStore);
        categoryAndHotPro(model);
        return "collectStore";
    };

    //查看店铺详情
    @RequestMapping("/showStore")
    public String showStore(Integer sid, Model model, HttpSession session, Integer pageNow) {
        if (pageNow == null) {
            pageNow = 1;
        }
        //查询该店铺的全部商品
        PageBeanForProduct<ProductWapper> products = storeService.findProductBySid(sid, pageNow);
        model.addAttribute("products", products);
        //查询该店铺的推荐商品
        List<ProductWapper> newProductWappers = storeService.findNewProductBySid(sid);
        model.addAttribute("newProductWappers", newProductWappers);
        //查询当前用户是否收藏了该店铺
        boolean flag = false;
        User user = (User)session.getAttribute("user");
        if(user != null){
            Collectstore collectstore = new Collectstore();
            collectstore.setUid(user.getUid());
            collectstore.setStoreId(sid);
            //查看当前用户是否已经搜藏过该店铺
            Collectstore storeIsExist = storeService.checkProductIsExist(collectstore);
            if (storeIsExist != null) {
                //已经收藏过商铺
                flag = true;
            }
        }
        System.out.println("........................................"+flag);
        model.addAttribute("flag",flag);
        categoryAndHotPro(model);
        return "storeDetails";
    };

    //收藏该店铺
    @RequestMapping("/collectStore")
    public void collectStore(Model model, HttpSession session, HttpServletResponse response, Integer sid) throws IOException {
        //响应客户端
        PrintWriter out = response.getWriter();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            //未登录，跳转至登录页
            out.print("no");
            return;
        }
        Collectstore collectstore = new Collectstore();
        collectstore.setUid(user.getUid());
        collectstore.setStoreId(sid);
        //查看当前用户是否已经搜藏过该店铺
        Collectstore storeIsExist = storeService.checkProductIsExist(collectstore);
        if (storeIsExist != null) {
            //已经收藏过商铺
            out.print("exist");
            return;
        }
        //调用service 方法执行收藏店铺
        storeService.collectStore(collectstore);
        out.print("ok");
    };

    //取消收藏
    @RequestMapping("/cancelCollection")
    public String cancelCollection(HttpSession session, HttpServletResponse response, Integer sid) throws IOException {
        User user = (User) session.getAttribute("user");
        Collectstore collectstore = new Collectstore();
        collectstore.setUid(user.getUid());
        collectstore.setStoreId(sid);
        //调用service 执行取消收藏
        storeService.cancelCollection(collectstore);
        return "redirect:showStore.do?sid="+sid;
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