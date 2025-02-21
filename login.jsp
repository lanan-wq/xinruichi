<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>管理员登录页面</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
    <style>
        /* 设置页面整体样式 */
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('static/images/denglu.jpeg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            position: relative;
        }


        /* 统一登录和注册容器样式 */
       .auth-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            width: 400px;
            margin: 15% auto;
            padding: 40px;
            text-align: center;
        }

        /* 登录/注册标题样式 */
       .auth-container h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 30px;
        }

        /* 表单组样式 */
       .form-group {
            margin-bottom: 20px;
        }

        /* 表单标签样式 */
       .form-group label {
            display: block;
            font-size: 14px;
            color: #666;
            text-align: left;
            margin-bottom: 5px;
        }

        /* 表单输入框样式 */
       .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }

        /* 输入框聚焦时的样式 */
       .form-group input:focus {
            border-color: #007bff;
            outline: none;
        }

        /* 按钮通用样式 */
       .btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        /* 登录/注册按钮样式 */
       .btn-success {
            background-color: #007bff;
            color: #fff;
            margin-bottom: 10px;
        }

        /* 登录/注册按钮悬停样式 */
       .btn-success:hover {
            background-color: #0056b3;
        }

        /* 重置按钮样式 */
       .btn-primary {
            background-color: #f8f9fa;
            color: #333;
            border: 1px solid #ddd;
        }

        /* 重置按钮悬停样式 */
       .btn-primary:hover {
            background-color: #e2e6ea;
        }

        /* 错误信息样式 */
       .error-message {
            font-size: 24px;
            color: red;
            text-align: center;
            margin-top: 20px;
        }

        /* 按钮所在表单组样式，用于上下排列按钮 */
       .button-group {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

       .button-group .btn {
            width: 100%;
            margin-bottom: 15px;
        }

       .button-group .btn:last-child {
            margin-bottom: 0;
        }
    </style>
</head>

<body>
    <div class="auth-container">
        <div>
            <h2>管理员登录</h2>
        </div>
        <form class="form-horizontal" action="admin/login" method="post">
            <div class="form-group">
                <label>管理员id</label>
                <input class="form-control" type="text" name="aname" id="formGroupInputLarge"
                    placeholder="用户名">
            </div>
            <div class="form-group">
                <label>密码</label>
                <input class="form-control" type="password" name="apwd"
                    id="formGroupInputSmall" placeholder="密码">
            </div>
            <div class="form-group button-group">
                <button type="submit" class="btn btn-success">登录</button>
                <button type="reset" class="btn btn-primary">重置</button>
            </div>
            <div class="form-group">
                <div class="error-message">
                    <span>${errorMessage }</span>
                </div>
            </div>
        </form>
    </div>
</body>

</html>