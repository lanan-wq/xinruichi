<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>主页</title>
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/js/jquery-3.6.0.min.js"></script>
    <!-- 原有的样式代码 -->
    <style type="text/css">
        /* 导航栏样式 */
       .navbar {
            background-color: white;
            border: none;
            padding: 10px 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        /* 其他样式代码保持不变 */
    </style>
<script type="text/javascript">
    function focus(gid){
        $.ajax(
                {
                    url : "index/focus",
                    //请求类型
                    type : "post",
                    contentType : "application/json",
                    //data表示发送的数据
                    data : JSON.stringify({
                        id : gid
                    }),
                    //成功响应的结果
                    success : function(obj){//obj响应数据
                        if(obj == "no"){
                            alert("您已收藏该商品！");
                        }else if(obj == "ok"){
                            alert("成功收藏该商品");
                        }else{
                            alert("您没有登录，请登录！");
                        }
                    },
                    error : function() {
                        alert("处理异常！");
                    }
                }	
            );
    }
</script>
</head>
<body>
    <!-- 加载header.jsp -->
    <jsp:include page="head.jsp"/> 
 <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-top: 70px;">
            <!-- 滚动广告图片 -->
            <div class="carousel-inner" role="listbox">
                <c:forEach var="advise" varStatus="status" items="${adviseGoods }">
                    <c:if test="${status.index == 0 }">
                        <div class="item active">
                            <a href="index/goodsDetail?id=${advise.id }">
                                <img src="static/images/${advise.gpicture }" alt="${status.count }">
                            </a>
                            <div class="carousel-caption">
                                <span>${advise.gname }</span>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${status.index != 0 }">
                        <div class="item">
                            <a href="index/goodsDetail?id=${advise.id }">
                                <img src="static/images/${advise.gpicture }" alt="${status.count }">
                            </a>
                            <div class="carousel-caption">
                                <span>${advise.gname }</span>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <br><br><br>
        <div class="navbar navbar-default " role="navigation">
            <ul class="nav navbar-nav" style="padding-left: 50px;">
            <li><a name=“cara”>全系车型</a></li>
                <li><a href=""></a></li>
                <c:forEach var="type" items="${allTypes}">
                    <li><a href="index?id=${type.id }"><span>${type.typename}</span></a></li>
                </c:forEach>
            </ul>
        </div>
    <div class="container">
        <div class="row">
            <c:forEach var="lasted" items="${lastedGoods }">
                <div class="col-xs-6 col-md-2">
                    <a href="index/goodsDetail?id=${lasted.id }" class="thumbnail"> 
                        <img  src="static/images/${lasted.gpicture }" style="height: 170px; width: 100%; display: block;">
                    </a>
                    <div class="caption" style="text-align: center;">
                        <div>
                            <span>${lasted.gname }</span>
                        </div>
                        <a href="javascript:focus(${lasted.id })" class="btn btn-primary" >加入收藏</a>
                        <!-- 修改预约试驾按钮的 href 属性 -->
                        <a href="testdrive.jsp?id=${lasted.id }" class="btn btn-info">预约试驾</a>
                        <a href="index/goodsDetail?id=${lasted.id }" class="thumbnail">车辆信息</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
        <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h4>星睿驰</h4>
                    <p>探索前沿科技，畅享智能出行。</p>
                </div>
                <div class="col-md-4">
                            <div class="copyright">
                &copy; 2025 星睿驰. 保留所有权利.
            </div>
                </div>
                <div class="col-md-4">
                    <h4>联系我们</h4>
                    <p>电话: +123456789</p>
                    <p>邮箱: info@xingruichi.com</p>
                </div>
            </div>

        </div>
    </footer>
</body>
</html>