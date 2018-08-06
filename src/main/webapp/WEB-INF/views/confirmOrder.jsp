
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>确认订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>

<body style="position:relative;">

<%@include file="top.jsp" %>

<!--nav-->
<%@include file="nav.jsp" %>

<!--内容开始-->
<div class="payment-interface w1200">
    <div class="pay-info">
        <div class="info-tit">
            <h3>选择收货地址</h3>
        </div>
        <ul class="pay-dz">
            <li class="current">
                <h3><span class="sp1">${user.name}</span>(收)</h3>
                <p><span class="sp1">${user.addr}</span><span class="sp2"><br/>电话${user.phone}</span></p>
                <a href="JavaScript:;" xiugai="">修改</a>
            </li>
            <li>
                <h3><span class="sp1">长寿</span><span class="sp2">长寿湖</span>（<span class="sp3">赵珍珍2</span> 收）</h3>
                <p><span class="sp1">长寿长寿南坪福红路19号乙单元8-8</span><span class="sp2">18888888888</span></p>
                <a href="JavaScript:;" xiugai="">修改</a>
            </li>
            <li>
                <h3><span class="sp1">李家沱</span><span class="sp2">土桥</span>（<span class="sp3">赵珍2</span> 收）</h3>
                <p><span class="sp1">李家沱土桥南坪福红路19号华盛顿乙单元8-8</span><span class="sp2">19999999999</span></p>
                <a href="JavaScript:;" xiugai="">修改</a>
            </li>
            <div style="clear:both;"></div>
        </ul>
        <P class="pay-xgdz">修改地址和使用新地址样式一样。</P>
        <button class="pay-xdz-btn">使用新地址</button>
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
                <a href="#"><img src="${pageContext.request.contextPath}/${cartItem.product.image}" width="80px" height="80px" /></a>
            </div>
            <div class="mid-font f-l" style="margin-right:40px;">
                <a href="#">${cartItem.product.pname}</a>
            </div>
            <div class="mid-sl f-l" style="margin:10px 54px 0px 0px;">
                <a href="JavaScript:;" class="sl-left">-</a>
                <input type="text" value="${cartItem.count}" />
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
            <button class="btn">提交订单</button>
        </div>
    </div>





</div>

<!--底部一块-->
<%@include file="bottom.jsp" %>


<!--确认订单（新增地址）-->
<div class="confirmation-tanchuang" xgdz1="">
    <div class="tanchuang-bg"></div>
    <div class="tanchuang-con">
        <div class="tc-title">
            <h3>新增地址</h3>
            <a href="JavaScript:;" dz-guan=""><img src="${pageContext.request.contextPath}/images/close-select-city.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        <ul class="tc-con2">
            <li class="tc-li1">
                <p class="l-p">所在地区<span>*</span></p>
                <div class="xl-dz">
                    <div class="dz-left f-l">
                        <p>新疆</p>
                        <ul>
                            <li class="current"><a href="#">新疆</a></li>
                            <li><a href="#">甘肃</a></li>
                            <li><a href="#">宁夏</a></li>
                            <li><a href="#">青海</a></li>
                            <li><a href="#">重庆</a></li>
                            <li><a href="#">长寿</a></li>
                        </ul>
                    </div>
                    <div class="dz-right f-l">
                        <p>乌鲁木齐</p>
                        <ul>
                            <li class="current"><a href="#">乌鲁木齐</a></li>
                            <li><a href="#">昌吉</a></li>
                            <li><a href="#">巴音</a></li>
                            <li><a href="#">郭楞</a></li>
                            <li><a href="#">伊犁</a></li>
                            <li><a href="#">阿克苏</a></li>
                            <li><a href="#">喀什</a></li>
                            <li><a href="#">哈密</a></li>
                            <li><a href="#">克拉玛依</a></li>
                            <li><a href="#">博尔塔拉</a></li>
                            <li><a href="#">吐鲁番</a></li>
                            <li><a href="#">和田</a></li>
                            <li><a href="#">石河子</a></li>
                            <li><a href="#">克孜勒苏</a></li>
                            <li><a href="#">阿拉尔</a></li>
                            <li><a href="#">五家渠</a></li>
                            <li><a href="#">图木舒克</a></li>
                            <li><a href="#">库尔勒</a></li>
                            <div style="clear:both;"></div>
                        </ul>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">详细地址<span>*</span></p>
                <textarea class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">邮政编码<span></span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">收货人姓名<span>*</span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">联系电话<span>*</span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
        </ul>
        <button class="btn-pst2">保存</button>
    </div>
</div>

<!--修改地址-->
<div class="confirmation-tanchuang" xgdz2="">
    <div class="tanchuang-bg"></div>
    <div class="tanchuang-con">
        <div class="tc-title">
            <h3>新增地址</h3>
            <a href="JavaScript:;" dz-guan=""><img src="${pageContext.request.contextPath}/images/close-select-city.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        <ul class="tc-con2">
            <li class="tc-li1">
                <p class="l-p">所在地区<span>*</span></p>
                <div class="xl-dz">
                    <div class="dz-left f-l">
                        <p>北京</p>
                        <ul>
                            <li class="current"><a href="#">新疆</a></li>
                            <li><a href="#">甘肃</a></li>
                            <li><a href="#">宁夏</a></li>
                            <li><a href="#">青海</a></li>
                            <li><a href="#">重庆</a></li>
                            <li><a href="#">长寿</a></li>
                        </ul>
                    </div>
                    <div class="dz-right f-l">
                        <p>天安门</p>
                        <ul>
                            <li class="current"><a href="#">乌鲁木齐</a></li>
                            <li><a href="#">昌吉</a></li>
                            <li><a href="#">巴音</a></li>
                            <li><a href="#">郭楞</a></li>
                            <li><a href="#">伊犁</a></li>
                            <li><a href="#">阿克苏</a></li>
                            <li><a href="#">喀什</a></li>
                            <li><a href="#">哈密</a></li>
                            <li><a href="#">克拉玛依</a></li>
                            <li><a href="#">博尔塔拉</a></li>
                            <li><a href="#">吐鲁番</a></li>
                            <li><a href="#">和田</a></li>
                            <li><a href="#">石河子</a></li>
                            <li><a href="#">克孜勒苏</a></li>
                            <li><a href="#">阿拉尔</a></li>
                            <li><a href="#">五家渠</a></li>
                            <li><a href="#">图木舒克</a></li>
                            <li><a href="#">库尔勒</a></li>
                            <div style="clear:both;"></div>
                        </ul>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">详细地址<span>*</span></p>
                <textarea class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">邮政编码<span></span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">收货人姓名<span>*</span></p>
                <input type="text" class="shxm" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">联系电话<span>*</span></p>
                <input type="text" class="lxdh" />
                <div style="clear:both;"></div>
            </li>
        </ul>
        <button class="btn-pst2">保存</button>
    </div>
</div>
</body>
</html>

