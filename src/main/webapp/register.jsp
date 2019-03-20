<%--
  Created by IntelliJ IDEA.
  User: a479655315
  Date: 2019/3/20
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script>
        function changeCode() {
            $("#code").attr("src","${pageContext.request.contextPath}/yzm/yzmdemo.do?a="+Math.round(Math.random()*100))
        }
        
        
    </script>
    
</head>
<body>
<form action="${pageContext.request.contextPath}/user/goRegister.do" method="post">
    <input type="text" name="code">
    <img id="code" src="${pageContext.request.contextPath}/yzm/yzmdemo.do" width="200" height="40" onclick="changeCode()">
    <input type="submit" value="注册">
</form>
</body>
</html>
