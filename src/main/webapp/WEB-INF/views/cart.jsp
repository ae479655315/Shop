<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/29 0029
  Time: 下午 4:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/zhongling2.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript">
        function delCartItem(pid,storeId){
            var statu = confirm("确认删除?");
            if(!statu){
                return;
            }
            var p = $("#item"+pid);
            $.ajax({
                url: '${pageContext.request.contextPath}/product/deleteItem.do',
                data: {
                    pid: pid,
                    storeId: storeId
                },
                dataType: 'text',
                success: function (data) {
                    var datas = data.split("-");  //数据为当前店铺下订单项数量-购物车下店铺数
                    alert("删除成功！");
                    var item = $("#item"+pid);
                    item.remove();


                    //移除店铺头信息
                    if(datas[0] == 0){
                        //当前店铺无订单项了，移除店铺头信息
                        var store = $("#cart"+storeId);
                        store.remove();
                    }
                    if(datas[1]==0){
                        $("#content").attr("style","display:none");
                        $("#msg").attr("style","display:block");
                    }

                    //修改总金额
                    getTotal();
                }
            });
        }

        function getTotal(){

            var subTotals = document.getElementsByName("subTotal");
            var money = 0;
            for(var i=0;i<subTotals.length;i++){
                var total = subTotals[i].innerHTML;
                //获取¥ 右侧金额
                tol =  total.split(" ");
                money = money + parseInt(tol[1]);
            }
            document.getElementById("sub").innerHTML = money;
        }

        function changeTotal() {
            alert("ok");
        }
    </script>



</head>

<body style="position:relative;">
<!--header-->
<%@include file="top.jsp" %>

<!--nav-->
<%@include file="nav.jsp" %>


    <div class="zl2-cgjr w1200" id="msg" style=${empty cart.cartItemMap?"display:block":"display:none"}>
        <div class="zl2-cgjrl f-l">
            <h3>您还未选购商品，请先加入购物车！</h3>
            <p>商品数量有限，请您尽快下单并付款！</p>
        </div>
        <div style="clear:both;"></div>
    </div>


<c:if test="${!empty cart.cartItemMap}">
    <!--内容开始-->
    <div class="cart-content w1200" id="content">
        <div class="cart-con-tit">
            <p class="p1">
                <input type="checkbox" value="" name="hobby"></input>
                <span>全选</span>
            </p>
            <p class="p2">商品信息</p>
            <p class="p4">数量</p>
            <p class="p5">单价（元）</p>
            <p class="p6">金额（元）</p>
            <p class="p7">操作</p>
        </div>

            <%-- 遍历购物车 --%>
        <c:forEach items="${cart.cartItemMap}" var="entry">

            <div class="cart-con-info" id="cart${entry.key}">
                <div class="info-top">
                    <input type="checkbox" value="" name="hobby"></input>

                    <c:forEach items="${allStores}" var="stores">
                        <c:if test="${stores.storeId == entry.key}">
                            <span>${stores.storeName}</span>
                        </c:if>
                    </c:forEach>
                </div>
                    <%-- 当前店铺下的购物项  --%>
                <c:forEach items="${entry.value}" var="cartItem">
                    <div class="info-mid" id="item${cartItem.product.pid}">
                        <input type="checkbox" value="" name="hobby" class="mid-ipt f-l"></input>
                        <div class="mid-tu f-l">
                            <a href="#"><img src="${pageContext.request.contextPath}/${cartItem.product.image}"
                                             width="80"
                                             height="80"/></a>
                        </div>
                        <div class="mid-font f-l">
                            <a href="#" name="pname">${cartItem.product.pname}</a>
                            <span>包邮</span>
                        </div>

                        <div class="mid-sl f-l">
                            <a href="JavaScript:;" class="sl-left">-</a>
                            <input id="count${cartItem.product.pid}" type="text" value="${cartItem.count}" onchange="changeTotal()"/>
                            <a href="JavaScript:;" class="sl-right">+</a>
                        </div>
                        <p  class="mid-dj f-l">¥ ${cartItem.product.shop_price}</p>
                        <p name="subTotal" class="mid-je f-l">¥ ${cartItem.subTotal}</p>
                        <div class="mid-chaozuo f-l">
                                <%--<a href="#">移入收藏夹</a>--%>
                            <span style="cursor: pointer" onclick="delCartItem(${cartItem.product.pid},${cartItem.product.storeId})" id="${cartItem.product.pid}">删除</span>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                </c:forEach>
                    <%-- 当前店铺下的购物项结束 --%>
            </div>
        </c:forEach>

        <div class="cart-con-footer">
            <div class="quanxuan f-l">
                <a href="${pageContext.request.contextPath}/product/clearCart.do">清空购物车</a>
                <a href="#">加入收藏夹</a>
                <p></p>
            </div>
            <div class="jiesuan f-r">
                <div class="jshj f-l">
                    <p>合计（不含运费）</p>
                    <p class="jshj-p2" id="sub">
                        ￥：${cart.total}
                    </p>
                </div>
                <a href="${pageContext.request.contextPath}/order/showCartItem.do" class="js-a1 f-l">结算</a>
                <div style="clear:both;"></div>
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
</c:if>
<!--底部一块-->
<%@include file="bottom.jsp" %>
</body>
</html>

