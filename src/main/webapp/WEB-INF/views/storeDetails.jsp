<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/22 0022
  Time: 上午 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商家店铺页面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript">
        function addCart(pid) {
            <!-- pid--商品id -->
            <!-- 获取商品数量 -->
            var count = $("#" + pid).html();
            ;
            var a = pid.indexOf("-");
            if (a == -1) {
                //商品列表中加入的购物车
            } else {
                //商品推荐中加入的购物车,pid = p-pid值，所以需要切割
                var str = pid.split("-");
                pid = str[1];
            }
            $.ajax({
                url: '${pageContext.request.contextPath}/product/addCartItem.do',
                data: {
                    pid: parseInt(pid),
                    count: count
                },
                dataType: 'text',
                success: function (data) {
                    if (data == "ok") {
                        alert("添加成功！")
                    }
                }
            });
        }
        function buyNow(pid) {

            <!-- pid--商品id -->
            <!-- 获取商品数量 -->
            var count = $("#" + pid).html();;
            var a = pid.indexOf("-");
            if (a == -1) {
                //商品列表中加入的购物车
            } else {
                //商品推荐中加入的购物车,pid = p-pid值，所以需要切割
                var str = pid.split("-");
                pid = str[1];
            }
            window.open("${pageContext.request.contextPath}/order/buyNow.do?pid="+pid+"&count="+count,"_self");
        }

        function collectStore() {
            //收藏店铺
                $.ajax({
                    url: '${pageContext.request.contextPath}/store/collectStore.do',
                    data: {
                        sid: ${products.shortId}
                    },
                    dataType: 'text',
                    success: function (data) {
                        if (data == "ok") {
                            alert("收藏成功！")
                        }else if(data == "exist"){
                            alert("您已收藏过该店铺！")
                        }else if(data == "no"){
                            alert("请先登录！")
                        }
                    }
                });
        }
    </script>


</head>

<body>

<!--header-->
<div class="logo-search w1200">
    <div class="logo-box f-l">
        <div class="logo f-l">
            <a href=" ${pageContext.request.contextPath}/index.do" title="爱尚logo"><img
                    src="${pageContext.request.contextPath}/images/images/zl2-01.gif"/></a>
        </div>
        <div style="clear:both;"></div>
    </div>
    <div style="clear:both;"></div>
</div>

<!--nav-->
<%@include file="nav.jsp" %>

<!--banner 图-->
<div class="style-banner" style="overflow:hidden;">
    <a href="#"><img src="${pageContext.request.contextPath}/images/images/banner-tu.jpg"/></a>
</div>

<!--内容开始↓↑-->
<div class="shop-page-con w1200">


    <div class="shop-pg-left f-l">
        <div class="shop-left-buttom">
            <div class="sp-tit1">
                <h3>商品推荐</h3>
            </div>

            <c:forEach items="${newProductWappers}" var="newp" varStatus="vs">
            <dl class="sp-lb-info2"  <c:if test="${vs.last}"> style="border-bottom:none;"</c:if>>
                <dt><a href="${pageContext.request.contextPath}/product/showProduct.do?pid=${newp.pid}"><img src="${pageContext.request.contextPath}/images/${newp.image}" width="116px" height="117px"/></a></dt>
                <dd>
                    <a href="#">${newp.pname}</a>
                    <p>¥${newp.shop_price}&nbsp;&nbsp;&nbsp;&nbsp;销量：${newp.ps.salesVolume}</p>
                </dd>
            </dl>
            </c:forEach>
        </div>
    </div>




    <div class="shop-pg-right f-r">
        <div class="shop-right-cmp" style="margin-top:20px;">
            <ul class="shop-cmp-l f-l" id="myUl">
                <li>${products.storeName}</li>
                <c:if test="${flag == true}"><li id="li1"><a href="${pageContext.request.contextPath}/store/cancelCollection.do?sid=${products.shortId}">取消收藏</a></li></c:if>
                <c:if test="${flag == false}"><li id="li2"><span onclick="collectStore()" style="cursor:pointer;">收藏店铺</span></li></c:if>
               <div style="clear:both;"></div>
            </ul>
            <div style="clear:both;"></div>
        </div>
        <div class="shop-right-con">
            <ul class="shop-ul-tu">

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
                                <p id="${p.pid}" class="md-l-l f-l" ap="">1</p>
                                <div class="md-l-r f-l">
                                    <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                    <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                            <div class="md-r f-l">
                                <button class="md-l-btn1" onclick="buyNow('${p.pid}')">立即购买</button>
                                <button class="md-l-btn2" onclick="addCart('${p.pid}')">加入购物车</button>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                    </li>
                </c:forEach>


                <div style="clear:both;"></div>
            </ul>

            <!--分页-->

            <div class="paging">
                <div class="pag-left f-l">
                    <c:if test="${products.pageNow != 1 && products.pageCount>1}">
                        <a href="${pageContext.request.contextPath}/store/showStore.do?sid=${products.shortId}&pageNow=${products.pageNow-1}"
                           class="about left-r f-l"><</a>
                    </c:if>
                    <ul class="left-m f-l">
                        <c:if test="${products.pageCount > 5}">
                            <%-- 前5页不变化 --%>
                            <c:if test="${products.pageNow < 5}">
                                <c:forEach begin="1" end="5" var="i">
                                    <li class=${products.pageNow == i?"current":""}><a
                                            href="${pageContext.request.contextPath}/store/showStore.do?sid=${products.shortId}&pageNow=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <%-- 中间浮动 --%>
                            <c:if test="${products.pageNow >= 5 && products.pageNow <= products.pageCount - 6}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/store/showStore.do?sid=${products.shortId}&pageNow=1">1</a>
                                </li>
                                <li><a href="#">...</a></li>
                                <c:forEach begin="${products.pageNow-1}" end="${products.pageNow+2}" var="i">
                                    <li class=${products.pageNow == i?"current":""}><a
                                            href="${pageContext.request.contextPath}/store/showStore.do?sid=${products.shortId}&pageNow=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <%-- 后6页不变化  --%>
                            <c:if test="${products.pageNow >= products.pageCount-5}">
                                <c:forEach begin="${products.pageCount-5}" end="${products.pageCount}" var="i">
                                    <li class=${products.pageNow == i?"current":""}><a
                                            href="${pageContext.request.contextPath}/store/showStore.do?sid=${products.shortId}&pageNow=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                            </c:if>

                            <c:if test="${products.pageNow < products.pageCount-5}">
                                <li><a href="#">...</a></li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/store/showStore.do?sid=${products.shortId}&pageNow=${products.pageCount}">${products.pageCount}</a>
                                </li>
                            </c:if>
                            <div style="clear:both;"></div>
                        </c:if>
                        <c:if test="${products.pageCount <= 5}">
                            <c:forEach begin="0" end="${products.pageCount}" var="i">
                                <li class=${products.pageNow == i?"current":""}><a
                                        href="${pageContext.request.contextPath}/store/showStore.do?sid=${products.shortId}&pageNow=${i}">${i}</a>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                    <c:if test="${products.pageNow != products.pageCount && products.pageCount>1}">
                        <a href="${pageContext.request.contextPath}/store/showStore.do?sid=${products.shortId}&pageNow=${products.pageNow+1}"
                           class="about left-l f-l">></a>
                    </c:if>
                    <div style="clear:both;"></div>
                </div>
                <div class="pag-right f-l">
                    <form action="/Shop/store/showStore.do" method="get">
                        <input type="hidden" name="sid" value="${products.shortId}">
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
