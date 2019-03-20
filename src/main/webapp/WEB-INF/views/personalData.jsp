<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/14 0014
  Time: 下午 4:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人资料</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>
    <script type="text/javascript">
        $(function () {
            var username = $("#username");
            var msg = $("#msg1");
            username.blur(function () {
                if(username.val() == "${user.username}"){
                    return;
                }
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/checkUsername.do",   //请求路径，读取user.js文件
                    dataType: "json",//数据格式
                    data: {
                        username: username.val()
                    },
                    type: "GET",//请求方式
                    success: function (data) {//成功处理函数
                        var jsons = data;
                        if( jsons == ""){
                            msg.attr("class","dui");
                            msg.html("<font color='#006400'>可以使用</font>");
                            $("#sb").removeAttr("disabled");//将按钮可用
                            return;
                        }
                        for (var i = 0; i < jsons.length; i++) {
                            if(jsons[i].username != null && jsons[i].username != ""){
                                msg.attr("class","cuo");
                                msg.html("<font color='red'>用户名已存在</font>");
                                $("#sb").attr({"disabled":"disabled"});
                            }
                        }
                    }
                });
            });
        });
    </script>


</head>

<body style="position:relative;">

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
            <li class="current-li per-li1"><a href="${pageContext.request.contextPath}/user/personalDataPage.do">个人资料<span>></span></a></li>
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
    
    <form action="${pageContext.request.contextPath}/user/updateUser.do" method="post">
    <div class="personal-r f-r">
        <div class="personal-right">
            <div class="personal-r-tit">
                <h3>个人资料</h3>
            </div>
            <div class="data-con">
                <input type="hidden" value="${user.uid}" name="uid" />
                <div class="dt1">
                    <p class="dt-p f-l">用户名：</p>
                    <input type="text" value="${user.username}" id="username" name="username" />
                    <span id="msg1"></span>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">密码：</p>
                    <input type="password" value="${user.password}" id="password" name="password"/>
                    <span id="msg2"></span>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">确认密码：</p>
                    <input type="password" id="repassword" />
                    <span id="msg3"></span>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">姓名：</p>
                    <input type="text" value="${user.name}" id="name" name="name" />
                    <span id="msg4"></span>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">邮箱：</p>
                    <input type="text" value="${user.email}" id="email" name="email" />
                    <span id="msg6"></span>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1 dt3">
                    <p class="dt-p f-l">手机号：</p>
                    <input type="text" value="${user.phone}" id="phone"  name="phone"/>
                    <button>获取短信验证码</button>
                    <span id="msg5"></span>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">验证码：</p>
                    <input type="text" />
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">地址：</p>
                    <input type="text" value="${user.addr}" id="addr" name="addr" />
                    <span id="msg7"></span>
                    <div style="clear:both;"></div>
                </div>
                <input type="submit" id="sb" value="保存" class="btn-pst">
            </div>
        </div>
    </div>
    </form>
    
    
    <div style="clear:both;"></div>
</div>
<!--底部一块-->
<%@include file="bottom.jsp" %>
</body>
</html>