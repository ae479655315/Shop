<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10 0010
  Time: 下午 4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css"/>
    <script type="text/javascript" src=" ${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>
    <script type="text/javascript">
        $(function () {
            var username = $("#username");
            var msg = $("#msg1");
            username.blur(function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/checkUsername.do",   //请求路径，读取user.js文件
                    dataType: "json",//数据格式
                    data: {
                        username: username.val()
                    },
                    type: "GET",//请求方式
                    success: function (data) {//成功处理函数
                        var jsons = data;
                        if (jsons == "") {
                            msg.attr("class", "dui");
                            msg.html("<font color='#006400'>可以使用</font>");
                            $("#sb").removeAttr("disabled");//将按钮可用
                            return;
                        }
                        for (var i = 0; i < jsons.length; i++) {
                            if (jsons[i].username != null && jsons[i].username != "") {
                                msg.attr("class", "cuo");
                                msg.html("<font color='red'>用户名已存在</font>");
                                $("#sb").attr({"disabled": "disabled"});
                            }
                        }
                    }
                });
            });
        });
    </script>
    <script type="text/javascript">
        //点击切换验证码
        function changeVerifyCode() {
            $("#yzmImg").attr("src", "${pageContext.request.contextPath}/yzm/yzm.do?" + Math.floor(Math.random() * 100));
        }

    </script>

</head>

<body>

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
            <a href="${pageContext.request.contextPath}/home/index.do">返回首页</a><span>|</span>
            <a href="${pageContext.request.contextPath}/product/showCartItem.do">我的购物车</a><span>|</span>
            <a href="${pageContext.request.contextPath}/order/myOrders.do">我的订单</a>
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
    <div style="clear:both;"></div>
</div>
<!--内容开始-->
<form action="${pageContext.request.contextPath}/user/doRegister.do" method="post" onsubmit="return check()">
    <div class="password-con registered">
        <div class="psw">
            <p class="psw-p1">用户名</p>
            <input type="text" placeholder="请输入用户名" id="username" name="username"/>
            <span id="msg1"></span>
        </div>
        <div class="psw">
            <p class="psw-p1">输入密码</p>
            <input type="password" placeholder="请输入密码" id="password" name="password"/>
            <span id="msg2"></span>
        </div>
        <div class="psw">
            <p class="psw-p1">确认密码</p>
            <input type="password" id="repassword" placeholder="请再次确认密码"/>
            <span id="msg3"></span>
        </div>
        <div class="psw psw1">
            <p class="psw-p1">真实姓名</p>
            <input type="text" id="name" placeholder="请输入真实姓名" name="name"/>
            <span id="msg4"></span>
        </div>
        <div class="psw psw1">
            <p class="psw-p1">手机号</p>
            <input type="text" id="phone" placeholder="请输入手机" name="phone"/>
            <span id="msg5"></span>
        </div>
        <div class="psw psw1">
            <p class="psw-p1">邮箱</p>
            <input type="text" id="email" placeholder="请输入邮箱" name="email"/>
            <span id="msg6"></span>
        </div>
        <div class="psw psw1">
            <p class="psw-p1">居住地</p>
            <input type="text" id="addr" placeholder="请输入地址(*省*市*区*街)" name="addr"/>
            <span id="msg7"></span>
        </div>
        <div class="psw psw3">
            <p class="psw-p1">验证码</p>
            <input type="text" id="yzm" placeholder="请输入验证码" name="yzm"/>
            <span id="msg8"></span>
        </div>
        <div class="yanzhentu">
            <div class="yz-tu f-l">
                <img src="${pageContext.request.contextPath}/yzm/yzm.do" onclick="changeVerifyCode()" id="yzmImg"
                     width="163px" height="64px"/>
                </p>
                <div style="clear:both;"></div>
            </div>
            <br><br><br>
            <div class="agreement">
                <input type="checkbox" name="hobby"></input>
                <p>我有阅读并同意<span>《宅客微购网站服务协议》</span></p>
            </div>
            <input type="submit" id="sb" value="立即注册" class="psw-btn">
        </div>
    </div>
</form>
<!--底部一块-->
<%@include file="bottom.jsp" %>

</body>
</html>
