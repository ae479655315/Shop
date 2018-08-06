<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10 0010
  Time: 上午 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>爱尚首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/zhonglingxm2.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>

<body id="top">

<%@include file="top.jsp"%>

<!--nav-->
<div class="nav-box">
    <div class="nav-kuai w1200">
        <div class="nav-kuaijie f-l">
            <a href="JavaScript:;" class="kj-tit1">商品分类快捷</a>
            <div class="kuaijie-box">
                <c:forEach items="${categoryWappers}" var="c" begin="1" end="6" step="1">
                    <div class="kuaijie-info">
                        <dl class="kj-dl1">
                            <dt><img src=" ${pageContext.request.contextPath}/images/zl2-07.gif" /><a href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?cid=${c.cid}">${c.cname}</a></dt>
                            <dd>
                                <c:forEach items="${c.categorysecondWappers}" var="cs" begin="0" end="2" step="1" varStatus="vs">
                                    <a href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?csid=${cs.csid}">${cs.csname}</a><c:if test="${!vs.last}"><span>|</span></c:if>
                                </c:forEach>
                            </dd>
                        </dl>
                        <div class="kuaijie-con">
                            <dl class="kj-dl2" style="display:inline-block">
                                <dt><a href="搜索列表(有品牌).html">洗浴用品/身体护理</a></dt>
                                <dd>
                                    <c:forEach items="${c.categorysecondWappers}" var="cs">
                                        <a href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?csid=${cs.csid}">${cs.csname}</a><span>|</span>
                                    </c:forEach>
                                </dd>
                            </dl>
                            <div style="clear:both;"></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%--  一级类目导航  --%>
        <ul class="nav-font f-l">
            <c:forEach items="${categoryWappers}" var="c" varStatus="vs">
                <c:if test="${!vs.last}">
                    <li><a href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?cid=${c.cid}">${c.cname}</a></li>
                </c:if>
                <c:if test="${vs.last}">
                    <li><a href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?cid=${c.cid}">${c.cname}</a><span><img src=" ${pageContext.request.contextPath}/images/zl2-05.gif" /></span></li>
                </c:if>
            </c:forEach>
            <div style="clear:both;"></div>
        </ul>
        <div style="clear:both;"></div>
    </div>
</div>

<!--banner-->
<div class="banner">
    <ul class="ban-ul1">
        <li><a href="JavaScript:;"><img src=" ${pageContext.request.contextPath}/images/banner.png"  width="1400" height="430" /></a></li>
        <li><a href="JavaScript:;"><img src=" ${pageContext.request.contextPath}/images/banner2.jpg" width="1400" height="430" /></a></li>
        <li><a href="JavaScript:;"><img src=" ${pageContext.request.contextPath}/images/banner3.jpg" width="1400" height="430" /></a></li>
        <li><a href="JavaScript:;"><img src=" ${pageContext.request.contextPath}/images/banner4.jpg" width="1400" height="430" /></a></li>
    </ul>
    <div class="ban-box w1200">
        <ol class="ban-ol1">
            <li class="current"></li>
            <li></li>
            <li></li>
            <li></li>
            <div style="clear:both;"></div>
        </ol>
    </div>
</div>

<!--热门推荐-->
<div class="zl-tuijian w1200">
    <div class="tuijian-left f-l">
        <img src=" ${pageContext.request.contextPath}/images/zl2-14.png" />
    </div>
    <ul class="tuijian-right f-l">
        <li>
            <div class="li-box li-box1">
                <a href="JavaScript:;" class="li-a1">锦尚世家</a>
                <a href="JavaScript:;" class="li-a2">锦绣花苑　传承世家</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box2">
                <a href="JavaScript:;" class="li-a1">速8快捷酒店</a>
                <a href="JavaScript:;" class="li-a2">最大的经济型酒店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box3">
                <a href="JavaScript:;" class="li-a1">老诚一锅羊蝎子火锅</a>
                <a href="JavaScript:;" class="li-a2">最养生的火锅</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box4">
                <a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                <a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box5">
                <a href="JavaScript:;" class="li-a1">速8快捷酒店</a>
                <a href="JavaScript:;" class="li-a2">最大的经济型酒店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box6">
                <a href="JavaScript:;" class="li-a1">老诚一锅羊蝎子火锅</a>
                <a href="JavaScript:;" class="li-a2">最养生的火锅</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box7">
                <a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                <a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <li>
            <div class="li-box li-box8">
                <a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                <a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                <a href="JavaScript:;" class="li-a3">more</a>
            </div>
        </li>
        <div style="clear:both;"></div>
    </ul>
    <div style="clear:both;"></div>
</div>

<!--1F  最新商品-->
<div class="zl-info w1200">
    <div class="zl-title1" style="border-color:#FF9A02;">
        <h3 class="title1-h3 f-l">1F  最新商品</h3>
        <div style="clear:both;"></div>
    </div>
    <div class="zl-con">
        <div class="zl-con-left f-l" style="background:#FBEAD0;">
            <div class="zl-tu">
                <img src=" ${pageContext.request.contextPath}/images/zl2-33.gif" class="zl-img" />
            </div>
            <p class="zl-lp" style="color:#FF9901;">
                瞅哪呢</br>
                新的，搁这呢
            </p>
            <ul class="zl-lhover" style=" background:#FF9A02;">
                <c:forEach items="${newProducts}"  var="new_p" >
                    <li><a href="${pageContext.request.contextPath}/product/showProduct.do?pid=${new_p.pid}" target="_blank">${new_p.pname}</a></li>
                </c:forEach>
                <div style="clear:both;"></div>
            </ul>
        </div>
        <div class="zl-con-right f-l">
            <ul class="zl-rul1 lihover">
                <c:forEach items="${newProducts}"  var="new_p" >
                <li>
                    <div class="sy-tu1">
                        <a href="${pageContext.request.contextPath}/product/showProduct.do?pid=${new_p.pid}" target="_blank"><img src=" ${pageContext.request.contextPath}/${new_p.image}" /></a>
                    </div>
                    <div class="sy-tit1">
                        <a href="${pageContext.request.contextPath}/product/showProduct.do?pid=${new_p.pid}" target="_blank">${new_p.pname}</a>
                    </div>
                    <div class="sy-tit2">
                        <p>${new_p.pdesc}</p>
                        <p>原价：${new_p.market_price}</p>
                        <p>现价：${new_p.shop_price}</p>
                    </div>
                </li>
                </c:forEach>
                <div style="clear:both;"></div>
            </ul>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<!--2F  热门商品-->
<div class="zl-info w1200">
    <div class="zl-title1" style="border-color:#5B8050;">
        <h3 class="title1-h3 f-l">2F  热门商品</h3>
        <div style="clear:both;"></div>
    </div>
    <div class="zl-con">
        <div class="zl-con-left f-l" style="background:#F0F6F2;">
            <div class="zl-tu">
                <img src="${pageContext.request.contextPath}/images/zl2-40.gif" class="zl-img" />
            </div>
            <p class="zl-lp" style="color:#5B7F4F;">
                别寻么了</br>
                火的都冒烟了
            </p>
            <ul class="zl-lhover" style=" background:#5B8050;">
                <c:forEach items="${hotProducts}" var="hot_p">
                <li><a href="${pageContext.request.contextPath}/product/showProduct.do?pid=${hot_p.pid}"  target="_blank">${hot_p.pname}</a></li>
                </c:forEach>
                <div style="clear:both;"></div>
            </ul>
        </div>
        <div class="zl-con-right f-l">
            <ul class="zl-rul1 lihover">
                <c:forEach items="${hotProducts}" var="hot_p">
                <li>
                    <div class="sy-tu1">
                        <a href="${pageContext.request.contextPath}/product/showProduct.do?pid=${hot_p.pid}"  target="_blank"><img src="${pageContext.request.contextPath}/${hot_p.image}" /></a>
                    </div>
                    <div class="sy-tit1">
                        <a href="${pageContext.request.contextPath}/product/showProduct.do?pid=${hot_p.pid}" target="_blank">${hot_p.pname}</a>
                    </div>
                    <div class="sy-tit2">
                        <p>${hot_p.pdesc}</p>
                        <p>原价：${hot_p.market_price}</p>
                        <p>现价：${hot_p.shop_price}</p>
                    </div>
                </li>
                </c:forEach>
                <div style="clear:both;"></div>
            </ul>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>
<%@include file="bottom.jsp"%>
</body>
</html>
