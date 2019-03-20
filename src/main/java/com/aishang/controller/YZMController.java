package com.aishang.controller;


import cn.dsna.util.images.ValidateCode;
import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;


@Controller
@RequestMapping("/yzm")
public class YZMController {

    @Autowired
    private Producer producer;

    @RequestMapping("yzmdemo")
    public void yzmdemo(HttpServletResponse response,HttpServletRequest request) throws IOException {
        ValidateCode vc = new ValidateCode(200,40,6,10);
        String code = vc.getCode();
        //将验证码保存至session中
        HttpSession session = request.getSession();
        session.setAttribute("code",code);
        vc.write(response.getOutputStream());
    }

    @RequestMapping("/yzm")
    public void yzm(HttpServletRequest request, HttpServletResponse response,

                    HttpSession session) throws IOException {

        String lastYZM = (String) session.getAttribute("yzm");

        System.out.println("*******************上一次的验证码是" + lastYZM + "**********************");

       // 设置浏览器不要对数据进行缓存

        response.setDateHeader("Expires", 0);

       // Set standard HTTP/1.1 no-cache headers.

        response.setHeader("Cache-Control",

                "no-store, no-cache, must-revalidate");

        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).

        response.addHeader("Cache-Control", "post-check=0, pre-check=0");

        // Set standard HTTP/1.0 no-cache header.

        response.setHeader("Pragma", "no-cache");

        // return a jpeg

        response.setContentType("image/jpeg");

        String yzm = producer.createText();

        System.out.println("*******************本次的验证码是" + yzm + "**********************");

        session.setAttribute("yzm", yzm);

        BufferedImage image = producer.createImage(yzm);

        OutputStream out = response.getOutputStream();

        ImageIO.write(image, "jpg", out);

        try {

            out.flush();

        } finally {

            out.close();

        }

    }



    @RequestMapping("/getThisyzm")
    public void getThisyzm(HttpServletRequest request, HttpServletResponse response,

                    HttpSession session,String windowYzm) throws IOException {

        System.out.println(".......................................................");
        String lastYZM = (String) session.getAttribute("yzm");
        PrintWriter out = response.getWriter();
        if(windowYzm.equals(lastYZM)){
            out.print("ok");
        }else{
            out.print("no");
        }



    }
}