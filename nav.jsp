<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<script src="static/js/jquery-3.6.0.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div>
			<h2 align="center">管理主界面</h2>
		</div>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">商品管理 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="goods/toAdd">新增商品</a></li>
								<li><a href="goods/select?currentPage=1">查询商品</a></li>
							</ul>
						</li>
					</ul>
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">类型管理 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="type/toAdd">新增类型</a></li>
								<li><a href="type/select?currentPage=1">查询类型</a></li>
							</ul>
						</li>
					</ul>
					<ul class="nav navbar-nav">
						<li><a href="admin/selectOrder?currentPage=1">查询订单</a></li>
					</ul>
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">销量统计 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="admin/selectOrderByMonth">按月统计</a></li>
								<li><a href="admin/selectOrderByType">按类型统计</a></li>
							</ul>
						</li>
					</ul>
					<ul class="nav navbar-nav">
						<li><a href="admin/logout">安全退出</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>
</body>
</html>