<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/7 0007
  Time: 上午 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>支付界面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>

<body style="position:relative;">

<!--header-->
<%@include file="top.jsp" %>

<!--nav-->
<%@include file="nav.jsp" %>

<!--内容开始-->
<div class="payment-interface w1200">
    <div class="pay-info">
        <div class="info-tit">
            <h3>选择银行</h3>
        </div>
        <ul class="pay-yh">
            <li>
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/images/jiangheng.gif" />
                <div style="clear:both;"></div>
            </li>
            <li>
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/images/bank01.jpg" width="183px" height="40px" />
                <div style="clear:both;"></div>
            </li>
            <li>
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/images/bank02.jpg" width="183px" height="40px"  />
                <div style="clear:both;"></div>
            </li>
            <li style="border-right:0; width:298px;">
                <input type="checkbox" value="" name="hobby"></input>
                <img  src="${pageContext.request.contextPath}/images/images/bank03.jpg" width="183px" height="40px"  />
                <div style="clear:both;"></div>
            </li>
            <li>
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/images/bank04.jpg" width="183px" height="40px"  />
                <div style="clear:both;"></div>
            </li>
            <li>
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/images/bank05.jpg" width="183px" height="40px"  />
                <div style="clear:both;"></div>
            </li>
            <li>
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/images/bank06.jpg" width="183px" height="40px"  />
                <div style="clear:both;"></div>
            </li>
            <li style="border-right:0; width:298px;">
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/images/bank07.jpg" width="183px" height="40px"  />
                <div style="clear:both;"></div>
            </li>
            <div style="clear:both;"></div>
        </ul>
    </div>
    <div class="pay-info">
        <div class="info-tit">
            <h3>输入卡号</h3>
        </div>
        <div class="pay-kahao">
            <input type="text" placeholder="请输入银行卡号或支付宝账号"/>
            <p>输入正确</p>
        </div>
    </div>
    <div class="pay-info">
        <div class="info-tit">
            <h3>输入密码</h3>
        </div>
        <div class="pay-mima">
            <p class="mima-p1">你在安全的环境中，请放心使用！</p>
            <div class="mima-ipt">
                <p>支付宝或银行卡密码：</p>
                <input type="text" style="border-left:1px solid #E5E5E5;" /><input type="text" /><input type="text" /><input type="text" /><input type="text" /><input type="text" />
                <span>请输入6位数字支付密码</span>
            </div>
            <button class="mima-btn"><a href="${pageContext.request.contextPath}/order/pay.do?oids=${oids}" style="color: #FBFBFB">立即支付</a></button>
        </div>
    </div>
</div>

<!--底部一块-->
<%@include file="bottom.jsp" %>
</body>
</html>

