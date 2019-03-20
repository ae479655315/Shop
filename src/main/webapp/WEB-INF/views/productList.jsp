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
<!DOCTYPE html>
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
            window.open("${pageContext.request.contextPath}/order/buyNow.do?pid=" + pid + "&count=" + count, "_self");
        }
    </script>


</head>

<body>
<c:if test="${products.csid == null}">
    <c:set var="parameter" value="&cid=${products.cid}"/>
</c:if>

<c:if test="${products.csid != null}">
    <c:set var="parameter" value="&csid=${products.csid}"/>
</c:if>

<c:if test="${products.pname != null}">
    <c:set var="parameter" value="&pname=${products.pname}"/>
</c:if>


<%@include file="top.jsp" %>

<!--nav-->
<%@include file="nav.jsp" %>

<div class="screening-results w1200">
    <p class="tiao">找到共 ${products.rowCount} 条</p>
</div>
<!--品牌-->
<!--品牌热销-->
<c:if test="${empty products.pname}">
    <div class="brand-sales">
        <dl style="border-bottom:none;">
            <dt>${categoryWappers[products.cid - 1].cname}</dt>
            <dd>
                <c:forEach items="${categoryWappers[products.cid - 1].categorysecondWappers}" var="cs">
                    <a href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?csid=${cs.csid}"
                       <c:if test="${products.csid == cs.csid}">style="color: #63A51D" </c:if>>${cs.csname}</a>
                </c:forEach>
            </dd>
            <div style="clear:both;"></div>
        </dl>
    </div>
</c:if>
<!--内容↓↑-->
<div class="shop-page-con w1200">


    <div class="shop-pg-left f-l" style="width:215px">
        <div class="shop-left-buttom" style="margin-top:0;">
            <div class="sp-tit1">
                <h3>商品推荐</h3>
            </div>
            <ul class="shop-left-ul">
                <c:forEach items="${newProducts}" var="p" varStatus="vs">
                    <li
                            <c:if test="${vs.last}">style="border-bottom:0;"</c:if> >
                        <div class="li-top">
                            <a href="${pageContext.request.contextPath}/product/showProduct.do?pid=${p.pid}"
                               class="li-top-tu" target="_blank"><img
                                    src="${pageContext.request.contextPath}/images/${p.image}" width="210" height="120"/></a>
                            <p class="jiage"><span class="sp1">￥${p.shop_price}</span><span
                                    class="sp2">￥${p.market_price}</span></p>
                        </div>
                        <p class="miaoshu">${p.pname}</p>
                        <div class="li-md">
                            <div class="md-l f-l">
                                <p id="p-${p.pid}" class="md-l-l f-l" ap="">1</p>
                                <div class="md-l-r f-l">
                                    <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                    <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                            <div class="md-r f-l">
                                <button class="md-l-btn1" onclick="buyNow('p-${p.pid}')">立即购买</button>
                                <button class="md-l-btn2" onclick="addCart('p-${p.pid}')">加入购物车</button>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                        <p class="pingjia">88888评价</p>
                        <p class="weike">爱尚微购自营</p>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>


    <div class="shop-pg-right f-r">
        <div class="shop-right-cmp" style="margin-top:0;">
            <ul class="shop-cmp-l f-l">
                <li <c:if test='${products.sort == ""}'>class="current"</c:if>><a
                        href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?sort=${parameter}">综合
                    ↓</a></li>
                <li <c:if test='${products.sort == "salesVolume"}'>class="current"</c:if>><a
                        href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?sort=salesVolume${parameter}">销量
                    ↓</a></li>
                <li <c:if test='${products.sort == "pdate"}'>class="current"</c:if>><a
                        href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?sort=pdate${parameter}">新品
                    ↓</a></li>
                <div style="clear:both;"></div>
            </ul>
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
                        <a href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?pageNow=${products.pageNow-1}${parameter}&sort=${products.sort}"
                           class="about left-r f-l"><</a>
                    </c:if>
                    <ul class="left-m f-l">
                        <c:if test="${products.pageCount > 5}">
                            <%-- 前5页不变化 --%>
                            <c:if test="${products.pageNow < 5}">
                                <c:forEach begin="1" end="5" var="i">
                                    <li class=${products.pageNow == i?"current":""}><a
                                            href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?pageNow=${i}${parameter}&sort=${products.sort}">${i}</a>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <%-- 中间浮动 --%>
                            <c:if test="${products.pageNow >= 5 && products.pageNow <= products.pageCount - 6}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?pageNow=1${parameter}&sort=${products.sort}">1</a>
                                </li>
                                <li><a href="#">...</a></li>
                                <c:forEach begin="${products.pageNow-1}" end="${products.pageNow+2}" var="i">
                                    <li class=${products.pageNow == i?"current":""}><a
                                            href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?pageNow=${i}${parameter}&sort=${products.sort}">${i}</a>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <%-- 后6页不变化  --%>
                            <c:if test="${products.pageNow >= products.pageCount-5}">
                                <c:forEach begin="${products.pageCount-5}" end="${products.pageCount}" var="i">
                                    <li class=${products.pageNow == i?"current":""}><a
                                            href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?pageNow=${i}${parameter}&sort=${products.sort}">${i}</a>
                                    </li>
                                </c:forEach>
                            </c:if>

                            <c:if test="${products.pageNow < products.pageCount-5}">
                                <li><a href="#">...</a></li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?pageNow=${products.pageCount}${parameter}&sort=${products.sort}">${products.pageCount}</a>
                                </li>
                            </c:if>
                            <div style="clear:both;"></div>
                        </c:if>
                        <c:if test="${products.pageCount <= 5}">
                            <c:forEach begin="0" end="${products.pageCount}" var="i">
                                <li class=${products.pageNow == i?"current":""}><a
                                        href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?pageNow=${i}${parameter}&sort=${products.sort}">${i}</a>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                    <c:if test="${products.pageNow != products.pageCount && products.pageCount>1}">
                        <a href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?pageNow=${products.pageNow+1}${parameter}&sort=${products.sort}"
                           class="about left-l f-l">></a>
                    </c:if>
                    <div style="clear:both;"></div>
                </div>
                <div class="pag-right f-l">
                    <form action="/shop/product/showProuctsByCaOrPn.do" method="get">
                        <input type="hidden" name="cid" value="${products.cid}">
                        <input type="hidden" name="pname" value="${products.pname}">
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