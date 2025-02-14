<%-- 
    Document   : addcategories
    Created on : Mar 10, 2024, 3:12:35 PM
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
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Optional: Add styles for better responsiveness on smaller screens */
        @media screen and (max-width: 600px) {
            form {
                width: 80%;
            }
        }

    </style>
    <body>
        <h1>Add categories</h1>
        <form action="addcategory">
            Id:<input type="text" name="id"/><br/>
            name:<input type="text" name="name"/><br/>
            describe:<input type="text" name="describe"/><br/>
            <input type="submit" value="ADD"/>
        </form>
    </body>
</html>
