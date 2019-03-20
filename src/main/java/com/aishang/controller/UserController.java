package com.aishang.controller;

import com.aishang.model.CategoryWapper;
import com.aishang.model.Product;
import com.aishang.model.User;
import com.aishang.service.ICategoryService;
import com.aishang.service.IProductService;
import com.aishang.service.IUserService;
import com.fasterxml.jackson.databind.ObjectMapper;
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
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;
    @Resource
    private IProductService productService;
    @Resource
    private ICategoryService categoryService;

    @RequestMapping("goRegister.do")
    public void goRegister(HttpServletRequest request,String code){
        HttpSession session = request.getSession();
        String computCode = (String)session.getAttribute("code");
        System.out.println("系统产生的验证码为:"+computCode);
        System.out.println("用户输入的产生的验证码为:"+code);
    }

    @RequestMapping("showUser.do")
    public void selectUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text;html;charset=utf-8");
        Integer userId = Integer.parseInt(request.getParameter("id"));
        User user = this.userService.selectUser(userId);
        ObjectMapper mapper = new ObjectMapper();
        response.getWriter().write(mapper.writeValueAsString(user));
        response.getWriter().close();
    }

    //注册页
    @RequestMapping("/tt")
    public String tt(Model model,HttpServletRequest request,HttpServletResponse response) {
        try {
            PrintWriter out =  response.getWriter();
            out.print("ok");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    //注册页
    @RequestMapping("/register")
    public String register(Model model) {
        //查询8个热门商品
        List<Product> hotProducts = productService.findHotProducts();
        model.addAttribute("hotProducts", hotProducts);
        return "register";
    }

    //注册
    @RequestMapping("/doRegister")
    public String doRegister(Model model, User user, String yzm, HttpSession session) {
        String lastYZM = (String) session.getAttribute("yzm");
        System.out.println("系统验证码为：" + lastYZM);
        System.out.println("用户输入验证码为:" + yzm);
        if (!lastYZM.equals(yzm)) {
            return "redirect:/user/register.do";
        }

        userService.addUser(user);
        model.addAttribute("username", user.getUsername());
        return "login";
    }

    //登录页面
    @RequestMapping("/login")
    public String doLogin(Model model) {
        return "login";
    }

    //登录
    @RequestMapping("/doLogin")
    public String doLogin(User user, HttpServletRequest request) {
        //验证输入是否正确
        User u = userService.findUser(user);
        if (u == null) {
            return "login";
        }
        HttpSession session = request.getSession();
        session.setAttribute("user", u);
        return "redirect:/index.do";
    }

    //退出登录
    @RequestMapping("/quitLogin")
    public String quitLogin(HttpSession session) {
        session.invalidate();
        return "redirect:/index.do";
    }

    //注册验证用户名
    @RequestMapping("/checkUsername")
    @ResponseBody
    public List<User> checkUsername(String username) {
        List<User> userList = userService.checkUsername(username);
        return userList;
    }

    //个人资料
    @RequestMapping("/personalDataPage")
    public String personalData(HttpServletRequest request, Model model) {
        categoryAndHotPro(model);
        return "personalData";
    }

    //个人资料修改
    @RequestMapping("/updateUser")
    public String updateUser(Model model, User user, HttpSession session) {
        //修改数据库中信息
        userService.updateUser(user);
        //重新加入session中
        session.setAttribute("user", user);
        return "redirect:/user/personalDataPage.do";
    }

    //消息中心
    @RequestMapping("/personMessage")
    public String personMessage(Model model, HttpSession session) {
        if (session.getAttribute("user") == null) {
            //未登录，跳转至登录页
            return "redirect:/user/login.do";
        }
        categoryAndHotPro(model);
        return "personMessage";
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