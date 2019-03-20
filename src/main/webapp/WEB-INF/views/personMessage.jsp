<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/15 0015
  Time: 上午 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人消息</title>
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
            <li class="current-li per-li1"><a href="${pageContext.request.contextPath}/user/personMessage.do">消息中心<span>></span></a></li>
            <li class="per-li2"><a href="${pageContext.request.contextPath}/user/personalDataPage.do">个人资料<span>></span></a></li>
            <li class="per-li3"><a href="${pageContext.request.contextPath}/order/myOrders.do">我的订单<span>></span></a></li>
            <li class="per-li4"><a href="#"  style="color: red">我的预约<span>></span></a></li>
            <li class="per-li5"><a href="${pageContext.request.contextPath}/product/showCartItem.do">购物车<span>></span></a></li>
            <li class="per-li7"><a href="${pageContext.request.contextPath}/product/myCollectProduct.do">商品收藏<span>></span></a></li>
            <li class="per-li7"><a href="${pageContext.request.contextPath}/store/myCollectStore.do">店铺收藏<span>></span></a></li>
            <li class="per-li8"><a href="#"  style="color: red">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#"  style="color: red">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#"  style="color: red">会员积分<span>></span></a></li>
        </ul>
    </div>
    <div class="personal-r f-r">
        <div class="personal-right">
            <div class="personal-r-tit">
                <h3>消息中心</h3>
            </div>
            <div class="theme">
                <p class="th-p1 f-l">
                    <input type="checkbox" value="" name="hobby"></input>
                    <span>选择</span>
                </p>
                <p class="th-p2 f-l">
                    <img src="${pageContext.request.contextPath}/images/images/th-wenjian-tu.gif" />
                </p>
                <p class="th-p3 f-l">主题</p>
                <p class="th-p4 f-l">时间</p>
            </div>
            <div class="per-info">
                <p class="p-top">今天（2封）</p>
                <ul>
                    <li>
                        <input type="checkbox" value="" name="hobby"></input>
                        <p class="p-tu f-l"><img src="${pageContext.request.contextPath}/images/images/th-wenjian-tu.gif" /></p>
                        <a href="#" class="p-font f-l">亲爱的客户，欢迎注册外贸下单网站.....</a>
                        <p class="p-time f-l">2008年8月8日</p>
                        <div style="clear:both;"></div>
                    </li>
                    <li>
                        <input type="checkbox" value="" name="hobby"></input>
                        <p class="p-tu f-l"><img src="${pageContext.request.contextPath}/images/images/th-wenjian-tu2.gif" /></p>
                        <a href="#" class="p-font p-font1 f-l">亲爱的客户，欢迎注册外贸下单网站.....</a>
                        <p class="p-time f-l">2008年8月8日</p>
                        <div style="clear:both;"></div>
                    </li>
                </ul>
            </div>
            <div class="per-info">
                <p class="p-top">上周（2封）</p>
                <ul>
                    <li>
                        <input type="checkbox" value="" name="hobby"></input>
                        <p class="p-tu f-l"><img src="${pageContext.request.contextPath}/images/images/th-wenjian-tu.gif" /></p>
                        <a href="#" class="p-font f-l">亲爱的客户，欢迎注册外贸下单网站.....</a>
                        <p class="p-time f-l">2008年8月8日</p>
                        <div style="clear:both;"></div>
                    </li>
                    <li>
                        <input type="checkbox" value="" name="hobby"></input>
                        <p class="p-tu f-l"><img src="${pageContext.request.contextPath}/images/images/th-wenjian-tu2.gif" /></p>
                        <a href="#" class="p-font p-font1 f-l">亲爱的客户，欢迎注册外贸下单网站.....</a>
                        <p class="p-time f-l">2008年8月8日</p>
                        <div style="clear:both;"></div>
                    </li>
                </ul>
            </div>
            <div class="per-info">
                <p class="p-top">更早（7封）</p>
                <ul>
                    <li>
                        <input type="checkbox" value="" name="hobby"></input>
                        <p class="p-tu f-l"><img src="${pageContext.request.contextPath}/images/images/th-wenjian-tu.gif" /></p>
                        <a href="#" class="p-font f-l">亲爱的客户，欢迎注册外贸下单网站.....</a>
                        <p class="p-time f-l">2008年8月8日</p>
                        <div style="clear:both;"></div>
                    </li>
                    <li>
                        <input type="checkbox" value="" name="hobby"></input>
                        <p class="p-tu f-l"><img src="${pageContext.request.contextPath}/images/images/th-wenjian-tu.gif" /></p>
                        <a href="#" class="p-font f-l">亲爱的客户，欢迎注册外贸下单网站.....</a>
                        <p class="p-time f-l">2008年8月8日</p>
                        <div style="clear:both;"></div>
                    </li>
                    <li>
                        <input type="checkbox" value="" name="hobby"></input>
                        <p class="p-tu f-l"><img src="${pageContext.request.contextPath}/images/images/th-wenjian-tu.gif" /></p>
                        <a href="#" class="p-font f-l">亲爱的客户，欢迎注册外贸下单网站.....</a>
                        <p class="p-time f-l">2008年8月8日</p>
                        <div style="clear:both;"></div>
                    </li>
                    <li>
                        <input type="checkbox" value="" name="hobby"></input>
                        <p class="p-tu f-l"><img src="${pageContext.request.contextPath}/images/images/th-wenjian-tu.gif" /></p>
                        <a href="#" class="p-font f-l">亲爱的客户，欢迎注册外贸下单网站.....</a>
                        <p class="p-time f-l">2008年8月8日</p>
                        <div style="clear:both;"></div>
                    </li>
                    <li>
                        <input type="checkbox" value="" name="hobby"></input>
                        <p class="p-tu f-l"><img src="${pageContext.request.contextPath}/images/images/th-wenjian-tu2.gif" /></p>
                        <a href="#" class="p-font p-font1 f-l">亲爱的客户，欢迎注册外贸下单网站.....</a>
                        <p class="p-time f-l">2008年8月8日</p>
                        <div style="clear:both;"></div>
                    </li>
                    <li>
                        <input type="checkbox" value="" name="hobby"></input>
                        <p class="p-tu f-l"><img src="${pageContext.request.contextPath}/images/images/th-wenjian-tu2.gif" /></p>
                        <a href="#" class="p-font p-font1 f-l">亲爱的客户，欢迎注册外贸下单网站.....</a>
                        <p class="p-time f-l">2008年8月8日</p>
                        <div style="clear:both;"></div>
                    </li>
                    <li>
                        <input type="checkbox" value="" name="hobby"></input>
                        <p class="p-tu f-l"><img src="${pageContext.request.contextPath}/images/images/th-wenjian-tu2.gif" /></p>
                        <a href="#" class="p-font p-font1 f-l">亲爱的客户，欢迎注册外贸下单网站.....</a>
                        <p class="p-time f-l">2008年8月8日</p>
                        <div style="clear:both;"></div>
                    </li>
                </ul>
            </div>
            <button class="per-del">删除选项</button>
        </div>

        <!--分页-->
        <div class="paging">
            <div class="pag-left f-l">
                <a href="#" class="about left-r f-l"><</a>
                <ul class="left-m f-l">
                    <li><a href="#">1</a></li>
                    <li class="current"><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">...</a></li>
                    <li><a href="#">100</a></li>
                    <div style="clear:both;"></div>
                </ul>
                <a href="#" class="about left-l f-l">></a>
                <div style="clear:both;"></div>
            </div>
            <div class="pag-right f-l">
                <div class="jump-page f-l">
                    到第<input type="text" />页
                </div>
                <button class="f-l">确定</button>
                <div style="clear:both;"></div>
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>

<!--底部一块-->
<%@include file="bottom.jsp" %>
</body>
</html>
