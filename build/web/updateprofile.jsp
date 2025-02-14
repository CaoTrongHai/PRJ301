<%-- 
    Document   : updateprofile
    Created on : Mar 5, 2024, 11:17:24 PM
    Author     : FPTSHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        form {
            max-width: 400px;
            margin: 0 auto;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
    <body>
        <h1>Cập nhật thông tin</h1>
        <form action="updateprofile">
            Tên:<input type="text" name="name"/><br/>
            Số điện thoai:<input type="text" name="phone"/><br/>
            Địa chỉ :<input type="text" name="address"/><br/>
            <input type="submit" value="Cập nhật"/>
        </form>
        <h2 style="color: greenyellow">${requestScope.message}</h2>
    </body>
</html>
