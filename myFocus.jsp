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
<title>我的收藏</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function deleteCollect(obj){
	if(window.confirm("确认取消吗？")){
		//获取路径
		var pathName=window.document.location.pathname;
		//截取，得到项目名称
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		window.location.href = projectName + "/cart/deleteCollect?id=" +  obj;
	}
}
</script>
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
	<!-- 加载header.jsp -->
<jsp:include page="head.jsp"></jsp:include> 
	<div class="container">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">收藏列表</h3>
		</div>
		<div class="panel-body">
			<div class="table table-responsive">
				<table class="table table-bordered table-hover">
					<tbody class="text-center">
						<tr>
							<th>商品编号</th>
							<th>商品图片</th>
							<th>商品名称</th>
							<th>原价</th>
							<th>现价</th>
							<th>操作</th>
						</tr>
						<c:forEach var="focus" items="${myFocus}">
						<tr>
							<td>${focus.id}</td>
							<td>
								<a href="index/goodsDetail?id=${focus.id}"> 
								<img src="static/images/${focus.gpicture}"
									style="height: 50px; width: 50px; display: block;">
								</a>
							</td>
							<td>${focus.gname}</td>
							<td>${focus.goprice}</td>
							<td>${focus.grprice}</td>
							<%-- <td>${focus.grprice}</td> --%>
							<td><a href="javascript:deleteCollect(${focus.id})" >取消收藏</a></td>
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