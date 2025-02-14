<%-- 
    Document   : admin
    Created on : Feb 26, 2024, 11:16:10 PM
    Author     : FPTSHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            text-align: center;
        }

        h1, h2, h3 {
            color: #333;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        a:hover {
            color: #1d5f90;
            transition: color 0.3s ease;
        }

        /* Responsive design */
        @media screen and (max-width: 600px) {
            table {
                font-size: 12px;
            }
        }

    </style>

    <body>
        <h1>Chào mừng bạn đến với trang admin</h1>
        <a href="logoutadmin">Log out</a>
        <h2>Bảng categories</h2>
        <h3><a href="addcategories.jsp">Add new categories</a></h3>
        <table border="1px">
            <tr>
                <th>ID</th>
                <th>Name</th> 
                <th>Describe</th>
                <th>Delete</th>
                <th>Update</th>
            </tr>
            <c:forEach items="${listCategories}" var="i">
                <tr>
                    <td>${i.id}</td>
                    <td>${i.name}</td>
                    <td>${i.describe}</td>
                    <td><a href="deletecategory?id=${i.id}">Delete</a></td>
                    <td><a href="updatecategory?id=${i.id}">Update</a></td>
                </tr>
            </c:forEach>

        </table>
        <h2>Bảng product</h2>
        <h3><a href="addproduct.jsp">Add new product</a></h3>
        <table border="1px">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>ReleaseDate</th>
                <th>Describe</th>
                <th>Image</th>
                <th>CategoriesID</th>
                <th>Delete</th>

            </tr>
            <c:forEach items="${requestScope.listProduct}" var="i">
                <tr>
                    <td>${i.id}</td>
                    <td>${i.name}</td>
                    <td>${i.quantity}</td>
                    <td>${i.price}</td>
                    <td>${i.releaseDate}</td>
                    <td>${i.describe}</td>
                    <td>${i.image}</td>
                    <td>${i.category.id}</td>
                    <td><a href="deleteproductadmin?id=${i.id}">Delete</a></td> 


                </tr>
            </c:forEach>
        </table>
        <h2>Bảng Customer</h2>
        <table border="1px">
            <tr>
                <th>CustomerID</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Address</th>
            </tr>
            <c:forEach items="${requestScope.listCustomer}" var="i">
                <tr>
                    <td>${i.customerId}</td>
                    <td>${i.name}</td>
                    <td>${i.phone}</td>
                    <td>${i.address}</td>
                </tr>
            </c:forEach>
        </table>
        <h2>Bảng ShoppingCart</h2>
        <table border="1px">
            <tr>
                <th>ShoppingCartID</th>
                <th>CustomerID</th>
                <th>ProductID</th>
                <th>Quantity</th>
            </tr>
            <c:forEach items="${requestScope.listShopping}" var="i">
                <tr>
                    <td>${i.shoppingCartId}</td>
                    <td>${i.customerId}</td>
                    <td>${i.productId}</td>
                    <td>${i.quantity}</td>
                </tr>
            </c:forEach>
        </table>
        <h2>Bảng Order</h2>
        <table border="1px">
            <tr>
                <th>OrderID</th>
                <th>CustomerID</th>
                <th>ShoppingCartID</th>
                <th>OrderDate</th>
                <th>TotalPrice</th>
                <th>DeliveryMethod</th>
            </tr>
            <c:forEach items="${requestScope.listOrders}" var="order">
                <tr>
                    <td>${order.orderID}</td>
                    <td>${order.CustomerId}</td>
                    <td>${order.shoppingCart}</td>
                    <td>${order.orderDate}</td>
                    <td>${order.totalPrice}</td>
                    <td>${order.deliveryMethod}</td>
                </tr>
            </c:forEach>
        </table>







    </body>
</html>
