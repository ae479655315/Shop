<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/17 0017
  Time: 下午 4:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="nav-box">
    <div class="nav-kuai w1200">
        <div class="nav-kuaijie yjp-hover1 f-l">
            <a href="JavaScript:;" class="kj-tit1">商品分类快捷</a>
            <div class="kuaijie-box yjp-show1" style="display:none;">


                <c:forEach items="${categoryWappers}" var="c" begin="0" end="5" step="1">
                    <div class="kuaijie-info">
                        <dl class="kj-dl1">
                            <dt><img src="${pageContext.request.contextPath}/images/images/zl2-07.gif"/><a
                                    href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?cid=${c.cid}">${c.cname}</a></dt>
                            <dd>
                                <c:forEach items="${c.categorysecondWappers}" var="cs" begin="0" end="2" step="1"
                                           varStatus="vs">
                                    <a href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?csid=${cs.csid}">${cs.csname}</a><c:if
                                        test="${!vs.last}"><span>|</span></c:if>
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
                    <li>
                        <a href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?cid=${c.cid}">${c.cname}</a>
                    </li>
                </c:if>
                <c:if test="${vs.last}">
                    <li>
                        <a href="${pageContext.request.contextPath}/product/showProuctsByCaOrPn.do?cid=${c.cid}">${c.cname}</a><span><img
                            src=" ${pageContext.request.contextPath}/images/images/zl2-05.gif"/></span></li>
                </c:if>
            </c:forEach>
            <div style="clear:both;"></div>
        </ul>
        <div style="clear:both;"></div>
    </div>
</div>