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
    <title>修改密码页面</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css" />
    <script src="static/js/common.js"></script>
    <script src="static/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        function checkBpwd() {
            if ($("#bpwd").val()!= $("#rebpwd").val()) {
                alert("两次密码不一致！");
                return false;
            }
            document.myform.submit();
        }
    </script>
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
       .auth-container h3 {
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

       .button-group.btn {
            width: 100%;
            margin-bottom: 15px;
        }

       .button-group.btn:last-child {
            margin-bottom: 0;
        }
    </style>
</head>

<body>
    <div class="auth-container">
        <div>
            <h3>修改密码</h3>
        </div>
        <br><br>
        <form action="cart/updatePWD" name="myform" method="post" class="form-horizontal" role="form">
            <div class="form-group">
                <label>用户id</label>
                <input type="email" class="form-control" name="bemail" id="bemail" disabled="disabled"
                    value="${buser.bemail}" placeholder="用户id" />
                <input type="hidden" name="id" value="${buser.id}" />
            </div>
            <div class="form-group">
                <label>新密码</label>
                <input type="password" class="form-control" name="bpwd" id="bpwd" placeholder="请输入您的新密码" />
            </div>
            <div class="form-group">
                <label>确认新密码</label>
                <input type="password" class="form-control" name="rebpwd" id="rebpwd" placeholder="请再次输入您的新密码" />
            </div>
            <div class="form-group button-group">
                <button type="button" onclick="checkBpwd()" class="btn btn-success">修改</button>
                <button type="reset" class="btn btn-primary">重置</button>
            </div>
        </form>
    </div>
</body>

</html>