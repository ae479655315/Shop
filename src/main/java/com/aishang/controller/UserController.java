package com.aishang.controller;

import com.aishang.model.Product;
import com.aishang.model.User;
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
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;
    @Resource
    private IProductService productService;

    @RequestMapping("showUser.do")
    public void selectUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text;html;charset=utf-8");
        long userId = Long.parseLong(request.getParameter("id"));
        User user = this.userService.selectUser(userId);
        ObjectMapper mapper = new ObjectMapper();
        response.getWriter().write(mapper.writeValueAsString(user));
        response.getWriter().close();
    }

    //注册页
    @RequestMapping("/register")
    public String register(Model model) {
        //查询8个热门商品
        List<Product> hotProducts = productService.findHotProducts();
        model.addAttribute("hotProducts",hotProducts);
        return "register";
    }

    ;

    //注册
    @RequestMapping("/doRegister")
    public String doRegister(Model model, User user) {
        userService.addUser(user);
        model.addAttribute("username", user.getUsername());
        return "login";
    }

    ;


    //登录页面
    @RequestMapping("/login")
    public String doLogin(Model model) {
        return "login";
    }

    ;

    //登录
    @RequestMapping("/doLogin")
    public String doLogin(User user,HttpServletRequest request) {
        //验证输入是否正确
        User u = userService.findUser(user);
        if (u == null) {
           return "login";
        }
        HttpSession session = request.getSession();
        session.setAttribute("user",u);
        return "redirect:/home/index.do";
    };

    //注册
    @RequestMapping("/checkUsername")
    @ResponseBody
    public List<User> checkUsername(String username) {

        List<User> userList = new ArrayList<User>();
        User user = new User();
        user.setUsername(username);

        User user2 = userService.findUser(user);
        //对象加入集合
        userList.add(user2);
        return userList;
    }

    ;
}