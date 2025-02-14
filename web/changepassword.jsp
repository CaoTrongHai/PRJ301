<%-- 
    Document   : changepassword
    Created on : Feb 28, 2024, 2:58:28 PM
    Author     : FPTSHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
         body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

      
        form {
            max-width: 400px;
            margin: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Đổi mật khẩu</h1>
    <h3 style="color: red">${requestScope.ms}</h3>
    <form action="change">
        <label for="opass">Old password:</label>
        <input type="password" name="opass" id="opass" required>
        <input type="hidden" name="user" value="${sessionScope.account.username}";
        <label for="pass">New password:</label>
        <input type="password" name="npass" id="npass" required>

        <label for="rpass">Confirm password:</label>
        <input type="password" name="rpass" id="rpass" required>

        <input type="submit" value="Change password">
    </form>
    </body>
</html>
