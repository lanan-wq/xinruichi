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
    <title>注册页面</title>
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/js/jquery-3.6.0.min.js"></script>
    <script src="static/js/common.js"></script>
    <script type="text/javascript">
        function checkEmail() {
            if (checkNull($("#bemail").val(), "请输入用户id！")) {
                $.ajax({
                    type: "post",
                    url: "user/isUse",
                    data: JSON.stringify({ "bemail": $("#bemail").val() }),
                    contentType: "application/json;charset=utf-8",
                    success: function (obj) {
                        if (obj == "no") {
                            $("#isExit").html("<span style='color: red; font-size: 18px;'>×</span>");
                            alert("用户已存在，请修改！");
                        } else {
                            $("#isExit").html("<span style='color: green; font-size: 18px;'>√</span>");
                            alert("用户可用");
                        }
                    },
                    error: function () {
                        alert("处理异常！");
                    }
                });
            }
        }

        function checkBpwd() {
            if ($("#bpwd").val() != $("#rebpwd").val()) {
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
            /* 请替换为你实际的高清背景图片路径 */
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
        <h3>用户注册</h3>
        <form action="user/register" name="myform" method="post" class="form-horizontal">
            <div class="form-group">
                <label>用户id</label>
                <input type="email" name="bemail" id="bemail" class="form-control" placeholder="请输入您的用户id"
                    onblur="checkEmail()">
                <span id="isExit"></span>
            </div>
            <div class="form-group">
                <label>密码</label>
                <input type="password" class="form-control" name="bpwd" id="bpwd" placeholder="请输入您的密码">
            </div>
            <div class="form-group">
                <label>确认密码</label>
                <input type="password" class="form-control" name="rebpwd" id="rebpwd" placeholder="请输入您的密码">
            </div>
            <div class="form-group button-group">
                <button type="button" onclick="checkBpwd()" class="btn btn-success">注册</button>
                <button type="reset" class="btn btn-primary">重置</button>
            </div>
        </form>
    </div>
</body>

</html>