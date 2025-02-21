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
<title>购物车页面</title>
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/js/jquery-3.6.0.min.js"></script>
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
<script type="text/javascript">
	function deleteCart(obj){
		if(window.confirm("确认删除吗？")){
			//获取路径
			var pathName=window.document.location.pathname;
			//截取，得到项目名称
			var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
			window.location.href = projectName + "/cart/deleteCart?cid=" +  obj;
		}
	}
	function clearCart(){
		if(window.confirm("确认清空吗？")){
			//获取路径
			var pathName=window.document.location.pathname;
			//截取，得到项目名称
			var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
			window.location.href = projectName + "/cart/clearCart";
		}
	}
</script>
</head>
<body>
<!-- 加载header.jsp -->
 <jsp:include page="head.jsp"></jsp:include> 
<div class="container">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">购物车列表</h3>
		</div>
		<div class="panel-body">
			<div class="table table-responsive">
				<table class="table table-bordered table-hover">
					<tbody class="text-center">
						<tr>
							<th>商品图片</th>
							<th>商品名称</th>
							<th>单价（元）</th>
							<th>数量</th>
							<th>小计</th>
							<th>操作</th>
						</tr>
						<c:if test="${cartlist.size() > 0 }">
							<c:forEach var="cart" items="${cartlist }">
							<tr>
								<td>
									<a href="index/goodsDetail?id=${cart.gid}"> 
									<img src="static/images/${cart.gpicture}"
										style="height: 50px; width: 50px; display: block;">
									</a>
								</td>
								<td>
									<a href="index/goodsDetail?id=${cart.gid}"> ${cart.gname }</a>
								</td>
								<td>${cart.grprice}</td>
								<td>${cart.shoppingnum}</td>
								<td>${cart.smallsum}</td>
								<td>
									<a href="javascript:deleteCart(${cart.cid})" >删除</a>
								</td>
							</tr>
							</c:forEach>
							<tr>
								<td colspan="6">
								<font style="color: #a60401; font-size: 13px; font-weight: bold; letter-spacing: 0px;">
									购物金额总计(不含运费) ￥&nbsp;<span>${total}</span>元
								</font>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<a href="javascript:clearCart()" >清空购物车</a>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<a href="cart/selectCart?act=toCount" >去结算</a>
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