 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>汽车首页</title>
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/js/jquery-3.6.0.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <style type="text/css">
        /* 导航栏样式 */
       .navbar {
            background-color: white;
            border: none;
            padding: 10px 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

       .navbar-brand {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            padding: 15px 15px;
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

       .navbar-nav {
            display: flex;
            align-items: center;
        }

       .navbar-left {
            margin-left: 30px;
        }

       .navbar-right {
            margin-right: 30px;
        }

       .navbar-nav > li > a {
            color: #333;
            font-weight: 500;
            transition: color 0.3s ease;
            border-radius: 20px;
            padding: 8px 15px;
            margin: 0 5px;
        }

       .navbar-nav > li > a:hover {
            color: #007bff;
            background-color: rgba(0, 123, 255, 0.1);
        }

       .dropdown-menu {
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

       .dropdown-menu > li > a {
            padding: 10px 20px;
            border-radius: 8px;
        }

       .dropdown-menu > li > a:hover {
            background-color: rgba(0, 123, 255, 0.1);
        }

        /* 轮播图样式 */
       .carousel {
            height: 600px;
            margin-top: 70px;
        }

       .carousel .item {
            height: 600px;
            background-color: #000;
        }

       .carousel img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            /* 取消透明度 */
            opacity: 1; 
        }

       .carousel-caption {
            top: 50%;
            transform: translateY(-50%);
            bottom: auto;
        }

       .carousel-caption h3 {
            font-size: 48px;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

       .carousel-caption p {
            font-size: 24px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        /* 车型展示区样式 */
       .model-section {
            padding: 80px 0;
            text-align: center;
        }

       .model-section h2 {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 40px;
        }

       .model-card {
            margin-bottom: 30px;
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

       .model-card:hover {
            transform: translateY(-10px);
        }

       .model-card img {
            width: 100%;
            height: auto;
        }

       .model-card h4 {
            font-size: 24px;
            font-weight: 600;
            margin-top: 20px;
        }

       .model-card p {
            font-size: 16px;
            color: #6c757d;
        }

       .model-card a {
            display: inline-block;
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

       .model-card a:hover {
            background-color: #0056b3;
        }

        /* 品牌故事板块样式 */
       .brand-story {
            padding: 80px 0;
            background-color: #e9ecef;
            text-align: center;
        }

       .brand-story h2 {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 40px;
        }

       .brand-story p {
            font-size: 18px;
            line-height: 1.8;
            max-width: 800px;
            margin: 0 auto;
        }

        /* 页脚样式 */
       .footer {
            background-color: #333;
            color: white;
            padding: 40px 0;
            text-align: center;
        }

       .footer h4 {
            margin-bottom: 20px;
        }

       .footer ul {
            list-style-type: none;
            padding: 0;
        }

       .footer ul li {
            margin-bottom: 10px;
        }

       .footer ul li a {
            color: white;
            text-decoration: none;
        }

       .footer ul li a:hover {
            text-decoration: underline;
        }

       .footer .copyright {
            margin-top: 20px;
            font-size: 14px;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <!-- 导航栏 -->
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse"
                    aria-expanded="false">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">星睿驰</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-left">
                    <li><a href="#">首页</a></li>
                    <li><a href="#">全系车型</a></li>
                    <li><a href="#">预约试驾</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                            aria-expanded="false">登录/注册 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="user/toLogin">登录</a></li>
                            <li><a href="user/toRegister">注册</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                            aria-expanded="false">我的 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="cart/userInfo">修改密码</a></li>
                            <li><a href="cart/selectCart">我的购物车</a></li>
                            <li><a href="cart/myFocus">我的收藏</a></li>
                            <li><a href="cart/myOrder">我的订单</a></li>
                        </ul>
                    </li>
                    <li><a href="#">关于我们</a></li>
                    <li><a href="admin/toLogin">后台</a></li>
                </ul>
            </div>
        </div>

<%--         <!-- 轮播广告 -->
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
		<div class="navbar navbar-default " role="navigation">
			<ul class="nav navbar-nav" style="padding-left: 50px;">
				<li><a href=""></a></li>
				<c:forEach var="type" items="${allTypes}">
					<li><a href="index?id=${type.id }"><span>${type.typename}</span></a></li>
				</c:forEach>
			</ul>
			<form action="index/search" class="navbar-form navbar-right"
				style="padding-right: 50px;">
				<div class="form-group">
					<input type="text" class="form-control" name="mykey" placeholder="请输入关键词" />
				</div>
				<button type="submit" class="btn btn-default">搜索</button>
			</form>
		</div>
        <!-- 后续页面内容可以继续添加 -->
    </div> --%>



</body>

</html>