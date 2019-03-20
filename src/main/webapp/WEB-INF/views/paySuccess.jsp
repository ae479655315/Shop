<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/7 0007
  Time: 下午 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>支付成功</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css"/>
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
<div class="payment w1200">
    <div class="payment-hd">
        <h3 class="success">支付成功</h3>
    </div>
    <div class="payment-bd">

        <c:forEach items="${ordersWappers}" var="order">
            <p></p>
            <c:forEach items="${order.orderites}" var="itemWappers">
                <%-- 当前店铺下的订单项 --%>
                <dl class="dl-hd">
                    <dt><a href="#"><img src="${pageContext.request.contextPath}/images/${itemWappers.product.image}"
                                         width="123px" height="122px"/></a></dt>
                    <dd>
                        <h3><a href="#">${itemWappers.product.pname}</a></h3>

                    </dd>
                    <div style="clear:both;"></div>
                </dl>
                <hr/>
            </c:forEach>

            <ul class="ul-bd">
                <li><span>促销</span>
                    <p><i>包邮</i>商品满1件，全国包邮</p></li>
                <li><span>价格</span>
                    <p><i>¥${order.total}</i></p></li>
                <li><span>收货信息</span>
                    <p>${order.addr}， ${order.name}，${order.phone}</p></li>
                <li><span>成交时间</span>
                    <p><fmt:formatDate value="${order.ordertime}" pattern="yyyy-MM-dd"/></p></li>
                <li><span>订单号</span>
                    <p>${order.oid}</p></li>
            </ul>
        </c:forEach>
    </div>


    <div class="payment-ft">
        <button class="btn2"><a href="${pageContext.request.contextPath}/order/myOrders.do"
                                style="color: #FBFBFB;">我的订单</a></button>
    </div>
</div>

<!--底部一块-->
<%@include file="bottom.jsp" %>
</body>
</html>
