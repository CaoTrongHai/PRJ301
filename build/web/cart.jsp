<%-- 
    Document   : cart
    Created on : Feb 29, 2024, 11:24:25 PM
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
        /* Định dạng khung chứa sản phẩm trong giỏ hàng */
        .cart-item {
            display: flex;
            border: 1px solid #e4e4e4;
            padding: 10px;
            margin-bottom: 15px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        /* Định dạng hình ảnh sản phẩm */
        .product-image img {
            max-width: 80px;
            max-height: 80px;
            margin-right: 15px;
            border-radius: 5px;
        }

        /* Định dạng thông tin sản phẩm */
        .product-info {
            flex: 1;
        }

        /* Định dạng tên sản phẩm */
        .product-name {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        /* Định dạng mô tả sản phẩm */
        .product-description {
            color: #777;
            margin-bottom: 10px;
        }

        /* Định dạng số lượng sản phẩm */
        .product-quantity {
            font-weight: bold;
            color: #555;
            margin-bottom: 5px;
        }

        /* Định dạng giá tiền */
        .product-price {
            color: #e44d26;
            font-weight: bold;
            font-size: 16px;
        }

        /* Định dạng link xóa sản phẩm */
        .delete-link {
            color: #e44d26;
            text-decoration: none;
            font-weight: bold;
            margin-top: 5px;
            display: inline-block;
        }

        /* Định dạng hình ảnh xóa sản phẩm */
        .delete-link img {
            width: 16px;
            height: 16px;
            margin-left: 5px;
            vertical-align: middle;
        }

        /* Định dạng tiêu đề giỏ hàng */
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        a {
            text-decoration: none;
        }
        a {
            display: inline-block;
            text-decoration: none;
            margin: 5px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            position: relative;
            overflow: hidden;
            transition: background-color 0.3s, transform 0.3s;
        }

        a img {
            margin-right: 5px;
            vertical-align: middle;
        }

        /* Hiệu ứng hover */
        a:hover {
            background-color: #4caf50; /* Màu nền khi hover */
            color: #fff; /* Màu chữ khi hover */
            transform: scale(1.1); /* Phóng to khi hover */
        }

        /* Hiệu ứng cho nút Xóa Sản Phẩm */
        a.delete-btn:hover {
            background-color: #ff6666; /* Màu nền đỏ khi hover */
        }

        /* Hiệu ứng cho nút Hoàn tất đặt hàng */
        a.order-btn:hover {
            background-color: #3498db; /* Màu nền xanh khi hover */
        }
    </style>
    <h2 style="color: blue">Giỏ hàng của bạn</h2>

    <c:choose>
        <c:when test="${not empty requestScope.cart}">
            <c:forEach items="${requestScope.cart}" var="item">
                <div class="cart-item">
                    <div class="product-image">
                        <img src="${item.image}" alt="Product Image">
                    </div>
                    <div class="product-info">
                        <p class="product-name">${item.nameProduct}</p>
                        <p class="product-description">${item.describe}</p>
                        <p class="product-quantity">Số lượng: ${item.quantity}</p>
                        <p>Giá tiền: ${item.price * item.quantity}</p>
                        <a href="deletecart?shoppingcartid=${item.shoppingCartId}" class="delete-btn">Xóa Sản Phẩm<img style="width: 20px" src="xoa.png"/></a><br/>
                        <a href="order?shoppingcartid=${item.shoppingCartId}" class="order-btn">Hoàn tất đặt hàng<img style="width: 40px" src="order.jpg"/></a>

                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>Giỏ hàng của bạn đang trống</p>
        </c:otherwise>
    </c:choose>
</html>
