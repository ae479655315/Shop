<%--
  Created by IntelliJ IDEA.
  User: a479655315
  Date: 2019/3/19
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src=" ${pageContext.request.contextPath}/js/jquery.js"></script>
    <script>
        function changeCode() {
            //alert("ok")
            $("#yzm").attr("src","${pageContext.request.contextPath}/yzm/yzmdemo.do?" + Math.round(Math.random() * 100))
        }


    </script>
</head>
<body>
<form>
    <input type="text" name="username"><br/>
    <input type="text" name="password"><br/>
    <input type="text" name="email"><br/>
    <img id="yzm" src="${pageContext.request.contextPath}/yzm/yzmdemo.do"  width="163px" height="64px" onclick="changeCode()">
</form>
</body>
</html>
