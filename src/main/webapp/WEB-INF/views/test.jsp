<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/11 0011
  Time: 上午 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${categories}" var="c">
    <p>一级类目：${c.cname}.</p>
    <c:forEach items="${categoryseconds[c.cid]}" var="cs">
        ${cs.csname}
    </c:forEach>
</c:forEach>










<%--<c:forEach items="${categoryseconds}" var="entry">
    <c:if test="${entry.key == cid}">
        <c:forEach items="${entry.value}" var="cs">
        ${cs.csid}
        ${cs.csname}
        </c:forEach>
    </c:if>
</c:forEach>--%>

</body>
</html>
