<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>确认订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>
<%@include file="top.jsp" %>

<!--nav-->
<%@include file="nav.jsp" %>

<!--内容开始-->
<form action="creatOrder.do" method="post">
    <div class="payment-interface w1200">
        <div class="pay-info">
            <div class="info-tit">
                <h3>填写收货地址</h3>
            </div>

            <table cellpadding="10px" cellspacing="15px">
                <tr height: 20px;>
                    <td class="orderleft">收件人:</td>
                    <td><input type="text" name="name" value="${user.name}" class="orderright"/></td>
                </tr>
                <tr>
                    <td class="orderleft">电话:</td>
                    <td><input type="text" name="phone" size="50" value="${user.phone}" class="orderright"/></td>
                </tr>
                <tr>
                    <td class="orderleft">地址:</td>
                    <td><input type="text" name="addr" size="50" value="${user.addr}" class="orderright"/></td>
                </tr>

            </table>

        </div>
        <div class="pay-info">
            <div class="info-tit" style="border-bottom:0;">
                <h3>订单信息</h3>
            </div>
        </div>
        <div class="cart-con-info">


            <c:forEach items="${cart.cartItemMap}" var="entry">
                <!--店铺头-->
                <div class="cart-con-tit" style="margin:20px 0 5px;">
                    <p class="p1" style="width:490px;">
                        <input type="checkbox" value="" name="hobby"></input>
                        <c:forEach items="${allStores}" var="stores">
                            <c:if test="${stores.storeId == entry.key}">
                                <span>${stores.storeName}</span>
                            </c:if>
                        </c:forEach>
                    </p>
                    <p class="p4" style="width:205px;">数量</p>
                    <p class="p5">单价（元）</p>
                    <p class="p6" style="width:173px;">金额（元）</p>
                </div>
                <%-- 店铺头结束 --%>

                <%-- 当前店铺下的订单项 --%>
                <c:forEach items="${entry.value}" var="cartItem">
                    <div class="info-mid">
                        <div class="mid-tu f-l">
                            <a href="#"><img src="${pageContext.request.contextPath}/images/${cartItem.product.image}"
                                             width="80px"
                                             height="80px"/></a>
                        </div>
                        <div class="mid-font f-l" style="margin-right:40px;">
                            <a href="#">${cartItem.product.pname}</a>
                        </div>
                        <div class="mid-sl f-l" style="margin:10px 54px 0px 0px;">
                            <a href="JavaScript:;" class="sl-left">-</a>
                            <input type="text" name="count" value="${cartItem.count}"/>
                            <input type="hidden" name="pid" value="${cartItem.product.pid}"/>

                            <a href="JavaScript:;" class="sl-right">+</a>
                        </div>
                        <p class="mid-dj f-l" style="margin-left: 80px">¥ ${cartItem.product.shop_price}</p>
                        <p class="mid-je f-l" style="margin:10px 120px 0px 0px;">¥ ${cartItem.subTotal}</p>
                        <div style="clear:both;"></div>
                    </div>
                    <!--订单项结束-->
                </c:forEach>
            </c:forEach>

            <div class="info-heji">
                <p class="f-r">店铺合计(含运费)：<span>¥${cart.total}</span></p>
            </div>
            <div class="info-tijiao">
                <p class="p1">实付款：<span>¥${cart.total}</span></p>
                <input type="submit" value="提交订单" class="btn"/>
            </div>
        </div>


        <!--底部一块-->
        <%@include file="bottom.jsp" %>
    </div>
</form>
</body>
</html>

