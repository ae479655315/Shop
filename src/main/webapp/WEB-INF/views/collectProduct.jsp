<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/17 0017
  Time: 下午 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>搜索列表页(搜索商家)</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript">
        function cancelCollection(pid) {
           var flag = window.confirm("确定取消收藏该商品么？");
           if(flag){
               window.open("${pageContext.request.contextPath}/product/cancelCollection.do?pid="+pid,"_self");
           }
        }
    </script>


</head>

<body>
<%@include file="top.jsp" %>

<!--nav-->
<%@include file="nav.jsp" %>

<!--内容开始-->
<!--筛选结果-->
<div class="screening-results w1200">
    <p class="tiao">找到共 ${products.rowCount} 条</p>
</div>
<!--内容↓↑-->
<div class="shop-page-con w1200">


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
            <li class="current-li per-li1"><a href="${pageContext.request.contextPath}/product/myCollectProduct.do">商品收藏<span>></span></a></li>
            <li class="per-li7"><a href="${pageContext.request.contextPath}/store/myCollectStore.do">店铺收藏<span>></span></a></li>
            <li class="per-li8"><a href="#"  style="color: red">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#"  style="color: red">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#"  style="color: red">会员积分<span>></span></a></li>
        </ul>
    </div>


    <div class="shop-pg-right f-r">
        <div class="shop-right-cmp" style="margin-top:0;">
            <div class="shop-cmp-m f-l">
                <span>收藏商品</span>
            </div>
            <div class="shop-cmp-r f-l">
            </div>
            <div style="clear:both;"></div>
        </div>
        <div class="shop-right-con">
            <c:if test="${empty products.list}">
                <font color="#228b22">未找到该商品,请查询其他商品....</font>
            </c:if>
            <ul class="shop-ul-tu shop-ul-tu1">

                <c:forEach items="${products.list}" var="p" varStatus="vs">
                    <li <c:if test="${vs.count == 4 || vs.count == 8 || vs.count == 12}">style="margin-right:0;"</c:if>>
                        <div class="li-top">
                            <a href="${pageContext.request.contextPath}/product/showProduct.do?pid=${p.pid}"
                               class="li-top-tu" target="_blank"><img
                                    src="${pageContext.request.contextPath}/images/${p.image}" width="238" height="152"
                                    valign="top"/></a>
                            <p class="jiage"><span class="sp1">￥${p.shop_price}</span><span
                                    class="sp2">￥${p.market_price}</span></p>
                        </div>
                        <p class="miaoshu">${p.pname}</p>
                        <p class="miaoshu">销量：${p.ps.salesVolume}&nbsp;&nbsp;&nbsp;&nbsp;库存：${p.ps.count}</p>
                        <div class="li-md">
                            <div class="md-l f-l">
                                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <div style="clear:both;"></div>
                            </div>
                            <div class="md-r f-l">
                                <button class="md-l-btn1"><a href="${pageContext.request.contextPath}/product/showProduct.do?pid=${p.pid}" target="_blank" style="color: #FBFBFB">查看商品</a></button>
                                <button class="md-l-btn2" onclick="cancelCollection(${p.pid})">取消收藏</button>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                    </li>
                </c:forEach>

                <div style="clear:both;"></div>
            </ul>

            <!--分页-->

            <div class="paging">
                <%-- 总页数小于5 --%>
                <c:if test="${products.pageCount < 5}">
                    <div class="pag-left f-l">
                        <ul class="left-m f-l">
                            <c:forEach begin="1" end="${products.pageCount}" var="i">
                                <li class=${products.pageNow == i?"current":""}><a
                                        href="${pageContext.request.contextPath}/product/myCollectProduct.do?pageNow=${i}">${i}</a>
                                </li>
                            </c:forEach>
                            <div style="clear:both;"></div>
                        </ul>
                        <div style="clear:both;"></div>
                    </div>
                </c:if>
                <%-- 总页数大于5 --%>
                <c:if test="${products.pageCount > 5}">
                    <div class="pag-left f-l">
                        <c:if test="${products.pageNow != 1 && products.pageCount>1}">
                            <a href="${pageContext.request.contextPath}/product/myCollectProduct.do?pageNow=${products.pageNow-1}"
                               class="about left-r f-l"><</a>
                        </c:if>
                        <ul class="left-m f-l">
                            <c:if test="${products.pageCount > 5}">
                                <%-- 前5页不变化 --%>
                                <c:if test="${products.pageNow < 5}">
                                    <c:forEach begin="1" end="5" var="i">
                                        <li class=${products.pageNow == i?"current":""}><a
                                                href="${pageContext.request.contextPath}/product/myCollectProduct.do?pageNow=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                                <%-- 中间浮动 --%>
                                <c:if test="${products.pageNow >= 5 && products.pageNow <= products.pageCount - 6}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/product/myCollectProduct.do?pageNow=1${parameter}">1</a>
                                    </li>
                                    <li><a href="#">...</a></li>
                                    <c:forEach begin="${products.pageNow-1}" end="${products.pageNow+2}" var="i">
                                        <li class=${products.pageNow == i?"current":""}><a
                                                href="${pageContext.request.contextPath}/product/myCollectProduct.do?pageNow=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                                <%-- 后6页不变化  --%>
                                <c:if test="${products.pageNow >= products.pageCount-5}">
                                    <c:forEach begin="${products.pageCount-5}" end="${products.pageCount}" var="i">
                                        <li class=${products.pageNow == i?"current":""}><a
                                                href="${pageContext.request.contextPath}/product/myCollectProduct.do?pageNow=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                </c:if>

                                <c:if test="${products.pageNow < products.pageCount-5}">
                                    <li><a href="#">...</a></li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/product/myCollectProduct.do?pageNow=${products.pageCount}">${products.pageCount}</a>
                                    </li>
                                </c:if>
                                <div style="clear:both;"></div>
                            </c:if>
                            <c:if test="${products.pageCount <= 5}">
                                <c:forEach begin="0" end="${products.pageCount}" var="i">
                                    <li class=${products.pageNow == i?"current":""}><a
                                            href="${pageContext.request.contextPath}/product/myCollectProduct.do?pageNow=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </ul>
                        <c:if test="${products.pageNow != products.pageCount && products.pageCount>1}">
                            <a href="${pageContext.request.contextPath}/product/myCollectProduct.do?pageNow=${products.pageNow+1}"
                               class="about left-l f-l">></a>
                        </c:if>
                        <div style="clear:both;"></div>
                    </div>
                </c:if>


                <div class="pag-right f-l">
                    <form action="/Shop/product/myCollectProduct.do" method="get">
                        <div class="jump-page f-l">
                            到第<input type="text" name="pageNow" value="${products.pageNow}"/>页
                        </div>
                        <input type="submit" value="确定"
                               style="border:none; width:53px; height:35px; background:#63A61D; color:#fff; font-size:14px; cursor:pointer;">
                        <div style="clear:both;"></div>
                    </form>
                </div>
                <div style="clear:both;"></div>
            </div>

        </div>
    </div>
    <div style="clear:both;"></div>
</div>

<!--底部一块-->
<%@include file="bottom.jsp" %>
</body>
</html>
