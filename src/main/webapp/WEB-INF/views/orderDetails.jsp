<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/14 0014
  Time: 下午 2:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的订单(确认收货)</title>
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
<div class="personal w1200">
    <div class="personal-left f-l">
        <div class="personal-l-tit">
            <h3>个人中心</h3>
        </div>
        <ul>
            <li class="current-li per-li1"><a href="${pageContext.request.contextPath}/user/personMessage.do">消息中心<span>></span></a></li>
            <li class="per-li2"><a href="${pageContext.request.contextPath}/user/personalDataPage.do">个人资料<span>></span></a></li>
            <li class="per-li3"><a href="${pageContext.request.contextPath}/order/myOrders.do">我的订单<span>></span></a></li>
            <li class="per-li4"><a href="#"  style="color: red">我的预约<span>></span></a></li>
            <li class="per-li5"><a href="${pageContext.request.contextPath}/product/showCartItem.do">购物车<span>></span></a></li>
            <li class="per-li7"><a href="#">商品收藏<span>></span></a></li>
            <li class="per-li7"><a href="${pageContext.request.contextPath}/store/myCollectStore.do">店铺收藏<span>></span></a></li>
            <li class="per-li8"><a href="#"  style="color: red">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#"  style="color: red">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#"  style="color: red">会员积分<span>></span></a></li>
        </ul>
    </div>
    <div class="f-r">
        <div class="confirmation">
            <div class="in-tit">
                <h3>商品信息</h3>
            </div>

            <c:forEach items="${order.orderites}" var="itemWappers">
            <div class="commodity" style="border-bottom:0;">
                <div class="matong f-l">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/${itemWappers.product.image}" width="160px" height="160px" /></a>
                </div>
                <div class="com-con f-l">
                    <h3>${itemWappers.product.pname}</h3>
                    <dl>
                        <dt>简介</dt>
                        <dd>${itemWappers.product.pdesc}</dd>
                        <div style="clear:both;"></div>
                    </dl>
                    <dl>
                        <dt>数量</dt>
                        <dd>${itemWappers.count}</dd>
                        <div style="clear:both;"></div>
                    </dl>
                    <dl>
                        <dt>促销</dt>
                        <dd><span class="sp1">包邮</span>&nbsp;&nbsp;&nbsp;&nbsp;指定商品满1件，全场包邮</dd>
                        <div style="clear:both;"></div>
                    </dl>
                    <dl>
                        <dt>价格</dt>
                        <dd><span class="sp2">¥${itemWappers.subtotal}</span></dd>
                        <div style="clear:both;"></div>
                    </dl>
                </div>
                <div style="clear:both;"></div>
            </div>
            </c:forEach>


        </div>
        <div class="confirmation">
            <div class="in-tit">
                <h3>订单信息</h3>
            </div>
            <div class="odr-cf">
                <p>总金额：${order.total}</p>
                <p>收货信息： ${order.addr}， ${order.name}， ${order.phone}</p>
                <p>成交时间：<fmt:formatDate value="${order.ordertime}" pattern="yyyy-MM-dd" /></p>
                <p>订单号：${order.oid}</p>
            </div>
        </div>

        <c:if test="${order.state != 4}">
        <div class="confirmation">
            <div class="in-tit">
                <h3>确认收货</h3>
            </div>
            <div class="odr-sh">
                <P class="reminder">温馨提示：请收到货后，再确认收货！否则您可能钱货两空！</P>
                <div class="zfb">
                    <P class="zfmm">支付宝支付密码：</P>
                    <input type="text" /><input type="text" /><input type="text" /><input type="text" /><input type="text" /><input type="text" style="border-right:1px solid #E5E5E5;"/>
                    <p class="shuzi">请输入6位数字支付密码</p>
                    <button class="zfb-btn"><a href="${pageContext.request.contextPath}/order/confirmSignIn.do?orderID=${order.oid}" style="color: #FBFBFB">确认收货</a></button>
                </div>
            </div>
        </div>
        </c:if>

    </div>
    <div style="clear:both;"></div>
</div>

<!--底部一块-->
<%@include file="bottom.jsp" %>
</body>
</html>
