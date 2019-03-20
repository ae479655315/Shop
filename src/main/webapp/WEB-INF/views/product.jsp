<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/19 0019
  Time: 下午 4:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品详情</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript">
        $(function () {
            var add = $("#add");
            var buy = $("#buy");
            var collect = $("#collect");
            var collectStore = $("#collectStore");
            //加入购物车
            add.click(function () {
                var count = $("#count").val();
                $.ajax({
                    url: '${pageContext.request.contextPath}/product/addCartItem.do',
                    data: {
                        pid: ${product.pid},
                        count: count
                    },
                    dataType: 'text',
                    success: function (data) {
                        if (data == "ok") {
                            alert("添加成功！")
                        }
                    }
                });
            });

            //立即购买
            buy.click(function () {
                var pid =  ${product.pid}
                var count = $("#count").val();
                window.open("${pageContext.request.contextPath}/order/buyNow.do?pid="+pid+"&count="+count,"_self");
            });

            //收藏商品
            collect.click(function () {
                $.ajax({
                    url: '${pageContext.request.contextPath}/product/collectProduct.do',
                    data: {
                        pid: ${product.pid}
                    },
                    dataType: 'text',
                    success: function (data) {
                        if (data == "ok") {
                            alert("收藏成功！")
                        }else if(data == "exist"){
                            alert("您已收藏过该商品！")
                        }else if(data == "no"){
                            alert("请先登录！")
                        }
                    }
                });

            })

            //收藏店铺
            collectStore.click(function () {
                $.ajax({
                    url: '${pageContext.request.contextPath}/store/collectStore.do',
                    data: {
                        sid: ${product.store.storeId}
                    },
                    dataType: 'text',
                    success: function (data) {
                        if (data == "ok") {
                            alert("收藏成功！")
                        }else if(data == "exist"){
                            alert("您已收藏过该店铺！")
                        }else if(data == "no"){
                            alert("请先登录！")
                        }
                    }
                });

            })

        });
    </script>
</head>

<body style="position:relative;">
<!--header-->
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
            <a href=" ${pageContext.request.contextPath}/home/index.do" title="爱尚logo"><img
                    src="${pageContext.request.contextPath}/images/images/zl2-01.gif"/></a>
        </div>
        <div style="clear:both;"></div>
    </div>
    <div style="clear:both;"></div>
</div>

<!--nav-->
<%--<%@include file="nav.jsp" %>--%>

<!--内容开始-->
<div class="details w1200">
    <div class="deta-info1">
        <div class="dt-if1-l f-l">
            <div class="dt-if1-datu">
                <%-- 商品大图 --%>
                <ul qie-da="">
                    <li><a href="#"><img src="${pageContext.request.contextPath}/images/${product.image}" width="359" height="351" /></a></li>
                    <div style="clear:both;"></div>
                </ul>
            </div>
            <div class="dt-if1-qietu">
                <a class="dt-qie-left f-l" href="JavaScript:;"></a>
                <div class="dt-qie-con f-l">
                    <ul qie-xiao="">
                        <li class="current"><a href="#"><img src="${pageContext.request.contextPath}/images/${product.image}" width="60px" height="60px" /></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/images/${product.image}"  width="60px" height="60px"/></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/images/${product.image}"  width="60px" height="60px"/></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/images/${product.image}"  width="60px" height="60px"/></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/images/${product.image}"  width="60px" height="60px"/></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/images/${product.image}"  width="60px" height="60px"/></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/images/${product.image}"  width="60px" height="60px"/></a></li>
                        <div style="clear:both;"></div>
                    </ul>
                </div>
                <a class="dt-qie-right f-r" href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/images/dt-if1-qietu-right.gif" /></a>
            </div>
            <div class="dt-if1-fx">
                <span>商品编码:${product.pid}</span>
                <p>分享到：<a href="#"><img src="${pageContext.request.contextPath}/images/images/dt-xl.gif" /></a><a href="#"><img src="${pageContext.request.contextPath}/images/images/dt-kj.gif" /></a><a href="#"><img src="${pageContext.request.contextPath}/images/images/dt-wx.gif" /></a></p>
            </div>
        </div>

        <div class="dt-if1-m f-l">
            <div class="dt-ifm-hd">
                <h3><a href="#">${product.pname}</a></h3>
                <p>${product.pdesc}</p>
            </div>
            <div class="dt-ifm-gojia">
                <dl>
                    <dt>微购价</dt>
                    <dd>
                        <p class="p1">
                            <span class="sp1">¥${product.shop_price}</span><span class="sp2">${product.market_price}</span>
                        </p>
                        <p class="p2">
                            <span class="sp1"><img src="${pageContext.request.contextPath}/images/images/dt-ifm-sp1-img.gif" />5分</span><span class="sp2">上架日期：<fmt:formatDate value="${product.pdate}" pattern="yyyy-MM-dd"/></span>
                        </p>
                        <p class="p2">
                            <span class="sp1">销量：${product.ps.salesVolume}</span><span class="sp1">库存:${product.ps.count}</span>
                        </p>

                    </dd>
                    <div style="clear:both;"></div>
                </dl>
            </div>
            <dl class="dt-ifm-spot">
                <dt>活动</dt>
                <dd>
                    <P><span>包邮</span>本店满50.00元免运费</P>
                    <P><span>满赠</span>本店满500.00元赠300.00元礼品（随机赠送）</P>
                </dd>
                <div style="clear:both;"></div>
            </dl>
            <dl class="dt-ifm-box3">
                <dt>数量</dt>
                <dd>
                    <a class="box3-left" href="JavaScript:;">-</a>
                    <input id="count" type="text" value="1">
                    <a class="box3-right" href="JavaScript:;">+</a>
                </dd>
                <div style="clear:both;"></div>
            </dl>
            <div class="dt-ifm-box4">
                <button class="btn1" id="buy">立即购买</button>
                <button class="btn2" id="add">加入购物车</button>
                <button class="btn3" id="collect">收藏</button>
            </div>
        </div>

        <div class="dt-if1-r f-r">
            <div class="dt-ifr-hd">
                <div class="dt-ifr-tit">
                    <h3>${product.store.storeName}</h3>
                </div>
                <ul class="dt-ifr-ul1">
                    <li>
                        <p class="p1">4.61 ↑</p>
                        <p class="p2">商品评分</p>
                    </li>
                    <li>
                        <p class="p1">4.61 ↑</p>
                        <p class="p2">商品评分</p>
                    </li>
                    <li>
                        <p class="p1">4.61 ↑</p>
                        <p class="p2">商品评分</p>
                    </li>
                    <div style="clear:both;"></div>
                </ul>
                <div class="dt-ifr-tel">
                    <p>${product.store.storeDesc}</p>
                </div>
                <button class="dt-r-btn1"><a href="${pageContext.request.contextPath}/store/showStore.do?sid=${product.store.storeId}" style="color: #FBFBFB    ">进入店铺</a></button>
                <button class="dt-r-btn2" id="collectStore">收藏店铺</button>
            </div>
            <div class="dt-ifr-fd">
                <div class="dt-ifr-tit">
                    <h3>同类推荐</h3>
                </div>
                <dl>
                    <dt><a href="#"><img src="${pageContext.request.contextPath}/images/images/dt-ifr-fd-dt-tu.gif" /></a></dt>
                    <dd>
                        <a href="#">【观音桥】罗兰钢管舞舞蹈体验</a>
                        <p>¥9.90</p>
                    </dd>
                    <div style="clear:both;"></div>
                </dl>
                <dl>
                    <dt><a href="#"><img src="${pageContext.request.contextPath}/images/images/dt-ifr-fd-dt-tu.gif" /></a></dt>
                    <dd>
                        <a href="#">【观音桥】罗兰钢管舞舞蹈体验</a>
                        <p>¥9.90</p>
                    </dd>
                    <div style="clear:both;"></div>
                </dl>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>

    <div class="deta-info2">
        <div class="dt-if2-l f-l">
            <div class="if2-l-box1">
                <div class="if2-tit">
                    <h3>浏览记录</h3>
                </div>
                <ul>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/images/if2-l-box1-tu1.gif" /></a>
                        <a class="if2-li-tit" href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/images/if2-l-box1-tu1.gif" /></a>
                        <a class="if2-li-tit" href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li style="border-bottom:0;">
                        <a href="#"><img src="${pageContext.request.contextPath}/images/images/if2-l-box1-tu1.gif" /></a>
                        <a class="if2-li-tit" href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                </ul>
            </div>
            <div class="if2-l-box1" style="margin-top:18px;">
                <div class="if2-tit">
                    <h3>看了又看</h3>
                </div>
                <ul>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/images/if2-l-box1-tu1.gif" /></a>
                        <a class="if2-li-tit" href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/images/if2-l-box1-tu1.gif" /></a>
                        <a class="if2-li-tit" href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li style="border-bottom:0;">
                        <a href="#"><img src="${pageContext.request.contextPath}/images/images/if2-l-box1-tu1.gif" /></a>
                        <a class="if2-li-tit" href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="dt-if2-r f-r">
            <ul class="if2-tit2">
                <li class="current" com-det="dt1"><a href="JavaScript:;">产品信息</a></li>
                <li com-det="dt2"><a href="JavaScript:;">商品评论</a></li>
                <li com-det="dt3"><a href="JavaScript:;">商家信息</a></li>
                <div style="clear:both;"></div>
            </ul>
            <div style="border:1px solid #DBDBDB;" com-det-show="dt1">
                <div class="if2-tu1">
                    <img src="${pageContext.request.contextPath}/images/${product.image}" width="937" height="800" />
                   <%-- <img src="${pageContext.request.contextPath}/${product.image}" style="margin-top:47px;" />--%>
                    <div style="clear:both;"></div>
                </div>
                <%--<div class="if2-tu2">
                    <img src="${pageContext.request.contextPath}/images/images/if2-tu3.gif" />
                    <div style="clear:both;"></div>
                </div>
                <div class="if2-tu3">
                    <img src="${pageContext.request.contextPath}/images/images/if2-tu4.gif" />
                </div>
                <ul class="if2-tu4">
                    <li><img src="${pageContext.request.contextPath}/images/images/if2-tu5.gif" /></li>
                    <li><img src="${pageContext.request.contextPath}/images/images/if2-tu6.gif" /></li>
                    <li><img src="${pageContext.request.contextPath}/images/images/if2-tu7.gif" /></li>
                    <div style="clear:both;"></div>
                </ul>--%>
            </div>
            <div style="display:none;" com-det-show="dt2">
                <dl class="if2-r-box2">
                    <dt>
                        <p class="box2-p1">好评率</p>
                        <p class="box2-p2">96.5%</p>
                        <p class="box2-p3">共539人评论</p>
                    </dt>
                    <dd>
                        <P>买过的人觉得</P>
                        <ul>
                            <li><a href="#">香脆可口(198)</a></li>
                            <li><a href="#">口感不错(160)</a></li>
                            <li><a href="#">分量足(84)</a></li>
                            <li><a href="#">味道不错(47)</a></li>
                            <li><a href="#">价格便宜(34)</a></li>
                            <li><a href="#">包装不错(30)</a></li>
                            <li><a href="#">吃货必备(26)</a></li>
                            <li><a href="#">送货快(14)</a></li>
                            <li><a href="#">孩子喜欢(4)</a></li>
                            <div style="clear:both;"></div>
                        </ul>
                    </dd>
                    <div style="clear:both;"></div>
                </dl>
                <div class="if2-r-box3">
                    <ul>
                        <li class="current-li"><a href="#">全部（539）</a></li>
                        <li><a href="#">好评（536）</a></li>
                        <li><a href="#">中评（2）</a></li>
                        <li><a href="#">差评（1）</a></li>
                        <li><a href="#">图片（1）</a></li>
                        <li><a href="#">追加评论（1）</a></li>
                        <div style="clear:both;"></div>
                    </ul>
                    <dl>
                        <dt>
                            <a href="#"><img src="${pageContext.request.contextPath}/images/images/box3-dt-tu.gif" /></a>
                        </dt>
                        <dd>
                            <a href="#">胡**</a>
                            <p class="b3-p1">赞赞赞赞赞赞赞赞赞赞赞赞赞！！！！！！！！！</p>
                            <p class="b3-p2">2015-12-12    16:57:22  </p>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>
                    <dl>
                        <dt>
                            <a href="#"><img src="${pageContext.request.contextPath}/images/images/box3-dt-tu.gif" /></a>
                        </dt>
                        <dd>
                            <a href="#">胡**</a>
                            <p class="b3-p1">赞赞赞赞赞赞赞赞赞赞赞赞赞！！！！！！！！！</p>
                            <p class="b3-p2"><span></span><span></span>2015-12-12    16:57:22</p>
                            <div style="clear:both;"></div>
                            <div class="b3-zuijia">
                                <p class="zj-p1">追加评论：</p>
                                <p class="zj-p2">赞赞赞赞赞赞赞赞赞赞赞赞赞！！！！！！！！！</p>
                                <p class="zj-p3">2015-12-12    16:57:22</p>
                            </div>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>

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
            </div>
            <div class="if2-r-box4" style="display:none;" com-det-show="dt3">
                <div class="b4-tit">
                    <h3>店铺所有商品</h3>
                </div>
                <div class="b4-con1">
                    <a href="#">饼干糕点</a>
                    <a href="#">坚果果仁</a>
                    <a href="#">海味肉食</a>
                    <a href="#">糖果巧克力</a>
                    <a href="#">豆干炒货</a>
                    <a href="#">休闲膨化</a>
                    <a href="#">饮品冲调</a>
                    <a href="#">蜜饯果脯</a>
                    <a href="#">方便速食</a>
                    <a href="#">饼干糕点</a>
                    <a href="#">坚果果仁</a>
                    <a href="#">海味肉食</a>
                    <a href="#">糖果巧克力</a>
                    <a href="#">豆干炒货</a>
                    <a href="#">休闲膨化</a>
                    <a href="#">饮品冲调</a>
                    <a href="#">蜜饯果脯</a>
                    <a href="#">方便速食</a>
                </div>
                <div class="b4-tit">
                    <h3>店铺热销商品</h3>
                </div>
                <ul>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/images/if2-l-box1-tu1.gif" /></a>
                        <a href="#">乐事Lay's 无限薯片（翡翠黄瓜味）104g/罐</a>
                        <p>¥6.90</p>
                    </li>
                    <div style="clear:both;"></div>
                </ul>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>

<!--底部一块-->
<%@include file="bottom.jsp" %>
</body>
</html>

