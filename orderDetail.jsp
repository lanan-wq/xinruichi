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
<title>Insert title here</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f4f4f4; /* 可根据需要调整背景颜色 */
        }

       .container {
            width: 90%; /* 可根据需要调整容器宽度 */
            max-width: 1200px; /* 可根据需要调整最大宽度 */
            margin: 20px 0; /* 上下留一些间距 */
        }
    </style>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="container">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">订单详情</h3>
		</div>
		<div class="panel-body">
			<div class="table table-responsive">
				<table class="table table-bordered table-hover">
					<tbody class="text-center">
						<tr>
							<th>商品编号</th>
							<th>商品图片</th>
							<th>商品名称</th>
							<th>商品购买价</th>
							<th>购买数量</th>
						</tr>
						<c:forEach var="od" items="${orderDetail }">
						<tr>
							<td>${od.id}</td>
							<td>
								<a href="index/goodsDetail?id=${od.id}"> 
								<img src="static/images/${od.gpicture}"
									style="height: 50px; width: 50px; display: block;">
								</a>
							</td>
							<td>${od.gname}</td>
							<td>${od.grprice}</td>
							<td>${od.shoppingnum}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
		   
</div>
</body>
</html>