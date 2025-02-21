<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
// 获取传递过来的车辆 ID
String id = request.getParameter("id");
// 假设这里从数据库或其他数据源获取车辆信息
// 这里简单模拟，实际应用中需要根据 ID 查询数据库
// 示例：Goods goods = goodsService.getGoodsById(Integer.parseInt(id));
// 这里假设已经获取到了车辆信息
// 示例：Goods goods = ...;
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>预约试驾 - ${goods.gname }</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
    }
   .container {
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-top: 50px;
    }
   .car-info {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }
   .car-info img {
        width: 300px;
        height: auto;
        margin-right: 20px;
    }
   .form-group {
        margin-bottom: 15px;
    }
   .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }
   .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }
    /* 页脚样式 */
   .footer {
        background-color: #333;
        color: white;
        padding: 40px 0;
        text-align: center;
        margin-top: 50px;
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
    <!-- 加载header.jsp -->
    <jsp:include page="head.jsp"/> 
    <div class="container">
        <div class="car-info">
            <!-- 显示车辆图片 -->
            <img src="static/images/${goods.gpicture }" alt="${goods.gname }">
            <div>
                <!-- 显示车辆名称 -->
                <h2>${goods.gname }</h2>
                <!-- 显示车辆折扣价 -->
                <p>折扣价：<span style="color: red;">&yen; ${goods.grprice }</span></p>
                <!-- 显示车辆原价 -->
                <p>原价：<span style="text-decoration: line-through;">&yen; ${goods.goprice }</span></p>
            </div>
        </div>
        <h3>预约试驾</h3>
        <form action="submitTestDrive.jsp" method="post">
            <!-- 隐藏字段，传递车辆 ID -->
            <input type="hidden" name="carId" value="${goods.id}">
            <div class="form-group">
                <label for="name">姓名：</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="phone">电话：</label>
                <input type="tel" class="form-control" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="date">预约日期：</label>
                <input type="date" class="form-control" id="date" name="date" required>
            </div>
            <button type="submit" class="btn btn-primary">提交预约</button>
        </form>
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