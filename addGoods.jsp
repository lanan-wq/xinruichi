<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>新增商品</title>
<style type="text/css">
	.myColor {
		color: red;
	}
</style>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<form:form 
	cssClass="form-horizontal" modelAttribute="goods"
	 action="goods/add" method="post" 
	 enctype="multipart/form-data">
		<div class="form-group">
			<label class="col-sm-4 control-label">商品名</label>
			<div class="col-sm-4">
				<form:input path="gname" 
				cssClass="form-control" 
				placeholder="商品名" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">商品原价</label>
			<div class="col-sm-4">
				<form:input path="goprice" 
				cssClass="form-control" 
				placeholder="商品原价"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">商品折扣价</label>
			<div class="col-sm-4">
				<form:input path="grprice" 
				cssClass="form-control" 
				placeholder="商品折扣价"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">商品库存</label>
			<div class="col-sm-4">
				<form:input path="gstore" 
					cssClass="form-control" 
					placeholder="商品库存"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">商品图片</label>
			<div class="col-sm-4">
				<input class="form-control" 
				type="file" 
				name="gpictureForm">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">商品类型</label>
			<div class="col-sm-4">
				<form:select path="goodstype_id" cssClass="form-control">
					<form:options items="${allTypes }" 
					itemLabel="typename" 
					itemValue="id"/>
				</form:select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">是否广告</label>
			<div class="col-sm-4">
				<label class="radio-inline">
					<form:radiobutton path="isshow" value="1"/> 是
    			</label>
				<label class="radio-inline">
					<form:radiobutton path="isshow" value="0"/> 否
				</label>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-5 col-sm-6">
				<button type="submit" class="btn btn-success">新增</button>
				<button type="reset" class="btn btn-primary">重置</button>
			</div>
		</div>
	</form:form>
</body>
</html>