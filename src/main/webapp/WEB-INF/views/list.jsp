<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/9 0009
  Time: 下午 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>测试</title>
</head>
<body>
<c:forEach var="s" items="${myList}">
    <p>${s}</p>
</c:forEach>
</body>
</html>
