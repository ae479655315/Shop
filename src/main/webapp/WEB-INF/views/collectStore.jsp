<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/15 0015
  Time: 上午 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>收藏的店铺</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css"/>
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
            <li class="per-li3"><a href="${pageContext.request.contextPath}/order/myOrders.do">我的订单<span>></span></a></li>
            <li class="per-li4"><a href="#"  style="color: red">我的预约<span>></span></a></li>
            <li class="per-li5"><a href="${pageContext.request.contextPath}/product/showCartItem.do">购物车<span>></span></a></li>
            <li class="per-li7"><a href="${pageContext.request.contextPath}/product/myCollectProduct.do">商品收藏<span>></span></a></li>
            <li class="current-li per-li1"><a href="${pageContext.request.contextPath}/store/myCollectStore.do">店铺收藏<span>></span></a></li>
            <li class="per-li8"><a href="#"  style="color: red">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#"  style="color: red">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#"  style="color: red">会员积分<span>></span></a></li>
        </ul>
    </div>
    <div class="shop f-r">
        <div class="shop-con">
            <div class="shop-c-tit">
                <h3>店铺收藏</h3>
            </div>

            <c:forEach items="${myCollectStore}" var="store">
                <div class="shop-info">
                    <dl class="s-info-left f-l">
                        <dt><a href="${pageContext.request.contextPath}/store/showStore.do?sid=${store.storeId}" target="_blank"><img src="${pageContext.request.contextPath}/images/${store.storeImg}" width="93px"
                                             height="66px"/></a></dt>
                        <dd>
                            <h3><a href="${pageContext.request.contextPath}/store/showStore.do?sid=${store.storeId}"  target="_blank">${store.storeName}</a></h3>
                            <p><img src="${pageContext.request.contextPath}/images/images/songshu2-dt-h3.gif"/></p>
                            <p>卖家： ${store.storeName}</p>
                            <p>商品描述<span>4.61↑</span></p>
                            <p>服务态度<span>4.61↑</span></p>
                            <p>物流速度<span>4.61↑</span></p>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>


                    <div class="s-info-right f-r">
                        <div class="s-r-ul f-l" shuxingsw1="one">
                            <ul class="s-r-ul2">
                                <c:forEach items="${store.productWapperList}" var="product" begin="1" end="3" varStatus="vs">
                                    <li <c:if test="${vs.last}">style="margin-right:0;"</c:if>>
                                        <div class="tu">
                                            <a href="${pageContext.request.contextPath}/store/showStore.do?sid=${store.storeId}"><img src="${pageContext.request.contextPath}/images/${product.image}"
                                                             width="148px" height="148px"/></a>
                                        </div>
                                        <h3><a href="#">${product.pname}</a></h3>
                                        <p>¥ ${product.shop_price}<span>¥ ${product.market_price}</span></p>
                                    </li>

                                </c:forEach>
                                <div style="clear:both;"></div>
                            </ul>


                        </div>
                        <a class="s-r-gd f-l" href="${pageContext.request.contextPath}/store/showStore.do?sid=${store.storeId}"  target="_blank">更多 >></a>
                        <div style="clear:both;"></div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
            </c:forEach>


        </div>

    </div>
    <div style="clear:both;"></div>
</div>

<!--底部一块-->
<%@include file="bottom.jsp" %>
</body>
</html>