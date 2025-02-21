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
<title>Insert title here</title>
<script type="text/javascript">
	function confirmDelete(id) {
		if (window.confirm("你确定真的要删除吗？")) {
			$.ajax({
				url : "type/delete",
				//请求类型
				type : "delete",
				//data表示发送的数据
				data : JSON.stringify({
					"id" : id
				}),
				//定义发送请求的数据格式为JSON字符串
				contentType : "application/json;charset=utf-8",
				//定义回调响应的数据格式为JSON字符串，该属性可以省略
				dataType : "json",
				success : function(data) {//data返回的数据
					alert(data.msg);
					if (data.msg.indexOf("成功") >= 0) {
						var url = location.pathname.substring(0,
								location.pathname.lastIndexOf("/"));
						//绝对路径
						window.location.href = url + "/select";
					}
				},
				error : function() {
					alert("请求失败");
				}
			});
		}
	}
</script>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">商品类型</h3>
			</div>
			<div class="panel-body">
				<div class="table table-responsive">
					<table class="table table-bordered table-hover">
						<tbody class="text-center">
							<tr>
								<th>类型ID</th>
								<th>类型名称</th>
								<th>修改</th>
								<th>删除</th>
							</tr>
							<c:if test="${totalPage != 0 }">
								<c:forEach var="type" items="${allTypes }">
									<tr>
										<td>${type.id }</td>
										<td>${type.typename }</td>
										<td><a href="type/updateSelect?id=${type.id }">修改</a></td>
										<td><a href="javascript:confirmDelete(${type.id })">删除</a>
										</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="4" align="right">
										<ul class="pagination">
											<li><a><span>第${currentPage}页</span></a></li>
											<li><a><span>共${totalPage}页</span></a></li>
											<li><c:if test="${currentPage != 1}">
													<a href="type/select?currentPage=${currentPage - 1}">上一页</a>
												</c:if> <c:if test="${currentPage != totalPage}">
													<a href="type/select?currentPage=${currentPage + 1}">下一页</a>
												</c:if></li>
										</ul>
									</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>