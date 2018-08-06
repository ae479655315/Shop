<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10 0010
  Time: 下午 4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
            var msg = $("#msg");
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
                        if( jsons == ""){
                            msg.attr("class","dui");
                            msg.html("<font color='#006400'>可以使用</font>");
                            $("#bt").removeAttr("disabled");//将按钮可用
                        }
                        for (var i = 0; i < jsons.length; i++) {
                            if(jsons[i].username != null && jsons[i].username != ""){
                                msg.attr("class","cuo");
                                msg.html("<font color='red'>用户名已存在</font>");
                                $("#bt").attr({"disabled":"disabled"});
                            }
                        }
                    }
                });
            });
        });
    </script>

</head>

<body>

<%@include file="top.jsp" %>
<!--内容开始-->
<form action="${pageContext.request.contextPath}/user/doRegister.do" method="post">
    <div class="password-con registered">
        <div class="psw">
            <p class="psw-p1">用户名</p>
            <input type="text" placeholder="请输入用户名" id="username" name="username"/>
            <span id="msg"></span>
        </div>
        <div class="psw">
            <p class="psw-p1">输入密码</p>
            <input type="text" placeholder="请输入密码" id="password" name="password"/>
            <span id="msg2"></span>
        </div>
        <div class="psw">
            <p class="psw-p1">确认密码</p>
            <input type="text" id="repassword" placeholder="请再次确认密码"/>
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
            <input type="text" placeholder="请输入验证码"/>
            <span id="msg8"></span>
        </div>
        <div class="yanzhentu">
            <div class="yz-tu f-l">
                <img src="${pageContext.request.contextPath}/images/psw-yanzhengtu.gif"/>
            </div>
            <p class="f-l">看不清？<a href="#">换张图</a></p>
            <div style="clear:both;"></div>
        </div>
        <div class="agreement">
            <input type="checkbox" name="hobby"></input>
            <p>我有阅读并同意<span>《宅客微购网站服务协议》</span></p>
        </div>
        <input type="submit" id="bt" value="立即注册" class="psw-btn" onclick="return check()">

        <p class="sign-in">已有账号？请<a href="${pageContext.request.contextPath}/user/login.do">登录</a></p>
    </div>
</form>
<!--底部一块-->
<div class="footer-box">
    <ul class="footer-info1 w1200">
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src=" ${pageContext.request.contextPath}/images/zl2-86.gif"/></a>
            </div>
            <h3><a href="JavaScript:;">号码保障</a></h3>
            <P>所有会员，手机短信验证</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src=" ${pageContext.request.contextPath}/images/zl2-87.gif"/></a>
            </div>
            <h3><a href="JavaScript:;">6*12小时客服</a></h3>
            <P>有任何问题随时免费资讯</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src=" ${pageContext.request.contextPath}/images/zl2-88.gif"/></a>
            </div>
            <h3><a href="JavaScript:;">专业专攻</a></h3>
            <P>我们只专注于建筑行业的信息服务</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src=" ${pageContext.request.contextPath}/images/zl2-89.gif"/></a>
            </div>
            <h3><a href="JavaScript:;">注册有礼</a></h3>
            <P>随时随地注册有大礼包</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src=" ${pageContext.request.contextPath}/images/zl2-90.gif"/></a>
            </div>
            <h3><a href="JavaScript:;">值得信赖</a></h3>
            <P>专业的产品，专业的团队</P>
        </li>
        <div style="clear:both;"></div>
    </ul>
    <div class="footer-info2 w1200">
        <div class="ft-if2-left f-l">
            <dl>
                <dt><a href="6-1服务协议.html">新手上路</a></dt>
                <dd>
                    <a href="6-1服务协议.html">购物流程</a>
                    <a href="6-1服务协议.html">在线支付</a>
                    <a href="6-1服务协议.html">投诉与建议</a>
                </dd>
            </dl>
            <dl>
                <dt><a href="6-1服务协议.html">配送方式</a></dt>
                <dd>
                    <a href="6-1服务协议.html">货到付款区域</a>
                    <a href="6-1服务协议.html">配送费标准</a>
                </dd>
            </dl>
            <dl>
                <dt><a href="6-1服务协议.html">购物指南</a></dt>
                <dd>
                    <a href="6-1服务协议.html">订购流程</a>
                    <a href="6-1服务协议.html">购物常见问题</a>
                </dd>
            </dl>
            <dl>
                <dt><a href="6-1服务协议.html">售后服务</a></dt>
                <dd>
                    <a href="6-1服务协议.html">售后服务保障</a>
                    <a href="6-1服务协议.html">退换货政策总则</a>
                    <a href="6-1服务协议.html">自营商品退换细则</a>
                </dd>
            </dl>
            <div style="clear:both;"></div>
        </div>
        <div class="ft-if2-right f-r">
            <h3>400-2298-223</h3>
            <p>周一至周日 9:00-24:00</p>
            <p>（仅收市话费）</p>
        </div>
        <div style="clear:both;"></div>
    </div>
    <div class="footer-info3 w1200">
        <p>
            <a href="#">免责条款</a><span>|</span>
            <a href="#">隐私保护</a><span>|</span>
            <a href="#">咨询热点</a><span>|</span>
            <a href="#">联系我们</a><span>|</span>
            <a href="#">公司简介</a>
        </p>
        <p>
            <a href="#">沪ICP备13044278号</a><span>|</span>
            <a href="#">合字B1.B2-20130004</a><span>|</span>
            <a href="#">营业执照</a><span>|</span>
            <a href="#">互联网药品信息服务资格证</a><span>|</span>
            <a href="#">互联网药品交易服务资格证</a>
        </p>
        <div class="ft-if3-tu1">
            <a href="#"><img src=" ${pageContext.request.contextPath}/images/zl2-91.gif"/></a>
            <a href="#"><img src=" ${pageContext.request.contextPath}/images/zl2-92.gif"/></a>
            <a href="#"><img src=" ${pageContext.request.contextPath}/images/zl2-93.gif"/></a>
        </div>
    </div>
</div>

</body>
</html>
