<%-- 
    Document   : order.jsp
    Created on : Mar 5, 2024, 7:38:14 AM
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
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #333;
        }

        p {
            color: #666;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        img {
            max-width: 100%;
            height: auto;
            margin-top: 10px;
        }

    </style>
    <body>
        <h1>Xin chào,${requestScope.customer.name}!!! </h1>
        <p>SĐT : ${requestScope.customer.phone} </p>
        <p>Địa chỉ nhà :${requestScope.customer.address}</p>
        <p>${requestScope.ca.nameProduct}</p>
        <img src="${requestScope.ca.image}"/>
        <p>Số lượng :${requestScope.ca.quantity}</p>
        <p>Tổng tiền : ${requestScope.ca.price*requestScope.ca.quantity}</p>
        <form action="ordersuccess">
            <input type="hidden" name="nameproduct" value="${requestScope.ca.nameProduct}"/>
            <input type="hidden" name="quantity" value="${requestScope.ca.quantity}"/>
            <input type="hidden" name="shoppingcartid" value="${requestScope.ca.shoppingCartId}"/>
            <input type="hidden" name="price" value="${requestScope.ca.price * requestScope.ca.quantity}" />
            <label>
                <input type="radio" name="orderType" id="delivery" value="Giao Hàng Tận Nơi"/>
                Giao Hàng Tận Nơi
            </label>

            <label>
                <input type="radio" name="orderType" id="pickup" value="Nhận tại Cửa Hàng"/>
                Nhận tại Cửa Hàng
            </label>
            <br/>
            <input type="submit" value="Đặt hàng"/>
        </form>
            <h2>${requestScope.ms}</h2>



    </body>

</html>
