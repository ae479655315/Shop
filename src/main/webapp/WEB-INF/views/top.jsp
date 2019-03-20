<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/11 0011
  Time: 上午 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--header-->
<div class="zl-header">
    <div class="zl-hd w1200">
        <p class="hd-p1 f-l">
            Hi!您好，
            <c:if test="${empty user}">
                欢迎来到爱尚微购， 请<a href="${pageContext.request.contextPath}/user/login.do">【登录】</a> <a
                    href="${pageContext.request.contextPath}/user/register.do">【免费注册】</a>
            </c:if>
            <c:if test="${!empty user}">
                ${user.username}
                <a href="${pageContext.request.contextPath}/user/quitLogin.do">【退出登录】</a>
            </c:if>

        </p>
        <p class="hd-p2 f-r">
            <a href="${pageContext.request.contextPath}/user/personMessage.do">个人中心</a><span>|</span>
            <a href="${pageContext.request.contextPath}/index.do">返回首页</a><span>|</span>
            <a href="${pageContext.request.contextPath}/product/showCartItem.do">我的购物车</a><span>|</span>
            <a href="${pageContext.request.contextPath}/order/myOrders.do">我的订单</a><span>|</span>
            <a href="/marketCMS/login" target="_blank">卖家入口</a><span>|</span>
            <a href="/market/login" target="_blank">管理员入口</a>
        </p>
        <div style="clear:both;"></div>
    </div>
</div>

<!--logo search weweima-->
<div class="logo-search w1200">
    <div class="logo-box f-l">
        <div class="logo f-l">
            <a href=" ${pageContext.request.contextPath}/index.do" title="爱尚logo"><img
                    src="${pageContext.request.contextPath}/images/images/zl2-01.gif"/></a>
        </div>
        <div style="clear:both;"></div>
    </div>

    <div class="erweima f-r">
        <a href="JavaScript:;"><img src=" ${pageContext.request.contextPath}/images/images/asjy.png"/></a>
    </div>
    <div class="search f-r">
        <form action="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do" method="get">
            <div>
                <select style="width: 100px; padding: 2px 0;" name="by">
                <option value="1">商品</option>
                <option value="2" <c:if test="${!empty by}">selected="selected"</c:if>>店铺</option>

            </select>
            </div>

            <div class="search-info">
                <input type="text" name="pname" placeholder="请输入搜索名称" class="search-info-input"
                       <c:if test="${products.pname != null}"> value=${products.pname}</c:if>>
                <input type="submit" value="搜索"
                       style="text-align: center;float:left; height:36px; width:78px; font-size:16px; color:#fff; border:0; background:none; cursor:pointer;">
                <div style="clear:both;"></div>
            </div>
        </form>
        <ul class="search-ul">
            <c:forEach items="${hotProducts}" var="hot_p">
                <li><a href="${pageContext.request.contextPath}/product/showProduct.do?pid=${hot_p.pid}"
                       target="_blank">${hot_p.pname}</a></li>
            </c:forEach>
            <div style="clear:both;"></div>
        </ul>
    </div>
    <div style="clear:both;"></div>
</div>