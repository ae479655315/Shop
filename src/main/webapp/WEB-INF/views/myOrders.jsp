<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/7 0007
  Time: 下午 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>购买记录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>

<body>
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
            <li class="per-li2"><a href="${pageContext.request.contextPath}/user/personMessage.do">消息中心<span>></span></a></li>
            <li class="per-li2"><a href="${pageContext.request.contextPath}/user/personalDataPage.do">个人资料<span>></span></a></li>
            <li class="current-li per-li1"><a href="${pageContext.request.contextPath}/order/myOrders.do">我的订单<span>></span></a></li>
            <li class="per-li4"><a href="#"  style="color: red">我的预约<span>></span></a></li>
            <li class="per-li5"><a href="${pageContext.request.contextPath}/product/showCartItem.do">购物车<span>></span></a></li>
            <li class="per-li7"><a href="${pageContext.request.contextPath}/product/myCollectProduct.do">商品收藏<span>></span></a></li>
            <li class="per-li7"><a href="${pageContext.request.contextPath}/store/myCollectStore.do">店铺收藏<span>></span></a></li>
            <li class="per-li8"><a href="#"  style="color: red">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#"  style="color: red">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#"  style="color: red">会员积分<span>></span></a></li>
        </ul>
    </div>
    <div class="purchase-records f-r">
        <div class="pr-tit">
            <P class="pr-p1">宝贝</P>
            <P class="pr-p2">单价(元)</P>
            <P class="pr-p3">数量</P>
            <P class="pr-p4">实付款(元)</P>
            <P class="pr-p5">&nbsp;</P>
            <P class="pr-p6">交易状态</P>
        </div>

        <c:forEach items="${orders}" var="order">
            <div class="pr-info">
                <div class="pr-tit2">
                    <input type="checkbox" value="" name="hobby"></input>
                    <p class="pr-p1"><fmt:formatDate value="${order.ordertime}" pattern="yyyy-MM-dd" /></p>
                    <p class="pr-p2">订单号：${order.oid}</p>
                    <p class="pr-a1"><a href="">&nbsp;</a></p>
                    <p class="pr-a3">&nbsp;</p>
                    <p class="pr-a2"><c:choose>
                        <c:when test="${order.state == 1}">
                            未付款
                        </c:when>
                        <c:when test="${order.state == 2}">
                            待发货
                        </c:when>
                        <c:when test="${order.state == 3}">
                            已发货
                        </c:when>
                        <c:when test="${order.state == 4}">
                            已签收
                        </c:when>
                    </c:choose></p>
                </div>

                <c:forEach items="${order.orderites}" var="orderitemWapper">
                <div class="pr-con">
                    <div class="pr-con-tu f-l">
                        <a href="#"><img src="${pageContext.request.contextPath}/images/${orderitemWapper.product.image}" width="80px" height="80px" /></a>
                    </div>
                    <a class="pr-con-bt f-l" href="#">${orderitemWapper.product.pname}</a>
                    <div class="pr-con-sz1 f-l">
                        <span>${orderitemWapper.product.market_price}</span>
                        <p>${orderitemWapper.product.shop_price}</p>
                    </div>
                    <p class="pr-con-sl f-l">${orderitemWapper.count}</p>
                    <div class="pr-con-yf f-l">
                        <p>${orderitemWapper.subtotal}</p>
                        <span>(含运费：0.00 )</span>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                </c:forEach>

                <div class="pr-tit2">
                    <div class="gopay">
                        <c:if test="${order.state == 1}"><a href="${pageContext.request.contextPath}/order/goPay.do?orderID=${order.oid}"><button>去付款</button></a></c:if>
                        <c:if test="${order.state != 1}"><a href="">&nbsp;</a></c:if>
                    </div>
                    <div class="selectOrder">
                        <a href="${pageContext.request.contextPath}/order/orderDetails.do?orderID=${order.oid}"><button>查看订单</button></a>
                    </div>
                    <div class="deleteOrder"><button>删除订单</button>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
    <div style="clear:both;"></div>
</div>


<!--底部一块-->
<%@include file="bottom.jsp" %>

</body>
</html>
