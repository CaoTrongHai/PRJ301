<%-- 
    Document   : addproduct
    Created on : Mar 8, 2024, 7:47:45 AM
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
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #333;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

    </style>
    <body>
        <h2>Add Product</h2>

        <form action="addproduct" method="post">

            <label for="id">ID:</label>
            <input type="text" id="id" name="id" required><br>


            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>


            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required><br>


            <label for="price">Price:</label>
            <input type="text" id="price" name="price" required><br>


            <label for="releaseDate">Release Date:</label>
            <input type="date" id="releaseDate" name="releaseDate" required><br>


            <label for="describe">Description:</label>
            <textarea id="describe" name="describe"></textarea><br>


            <label for="image">Image URL:</label>
            <input type="text" id="image" name="image"><br>


            <label for="category">CategoryID:</label>
            <input type="text" id="category" name="categoryid" required><br>

            <input type="submit" value="Add Product">
        </form>

    </body>
</html>
