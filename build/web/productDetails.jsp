<%-- 
    Document   : productDetails
    Created on : Feb 27, 2024, 8:51:57 AM
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
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
            color: #333;
        }

        h3 {
            color: #007BFF;
            margin-bottom: 20px;
        }

        .product-details {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            overflow: hidden;
        }

        .product-image {
            flex: 1;
            max-width: 50%;
            padding: 20px;
            box-sizing: border-box;
        }

        .product-image img {
            max-width: 100%;
            height: auto;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 5px;
            background-color: #fff;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }

        .product-info {
            flex: 1;
            padding: 20px;
            box-sizing: border-box;
        }

        p {
            margin: 10px 0;
        }

        form {
            display: flex;
            align-items: center;
            margin-top: 20px;
        }

        button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        a {
            color: #007BFF;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }

        a:hover {
            text-decoration: underline;
        }

        footer {
            display: flex;
            justify-content: space-around;
            background: #e5294e;
            padding: 20px 0;
            color: white;
            flex-wrap: wrap;
        }

        footer h3 {
            margin-bottom: 10px;
        }

        footer ul {
            padding: 0;
            margin: 0;
            list-style: none;
        }

        footer li a {
            text-decoration: none;
            color: white;
            display: block;
            margin-bottom: 5px;
        }

        .footer-social a {
            text-decoration: none;
            display: inline-block;
            margin-right: 10px;
            color: white;
        }

        .footer-bottom {
            background: #e5294e;
            text-align: center;
            padding: 10px 0;
            color: white;
        }
        .question {
            cursor: pointer;
            font-size: 18px;
            color: #333;
            margin: 0;
            padding: 10px;
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        /* Khi hover vào câu hỏi */
        .question:hover {
            background-color: #e0e0e0;
        }

        /* Thiết lập phần câu trả lời */
        .answer {
            display: none;
            font-size: 16px;
            margin: 0;
            padding: 10px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        /* Thiết lập hiển thị câu trả lời khi được mở ra */
        .answer.active {
            display: block;
        }
        .advertisement img {
            width: 15px;
        }
    </style>
</head>
<body>
    <c:set var="product" value="${requestScope.product}" />
    <h3>Chi tiết sản phẩm</h3>
    <div class="product-details">
        <div class="product-image">
            <p><img src="${product.image}" alt="${product.name}" /></p>
        </div>
        <div class="product-info">
            <p class="product-name">Tên Sản Phẩm: ${product.name}</p>
            <p>Số Lượng: ${product.quantity}</p>
            <p>Giá: ${product.price}</p>
            <p>Ngày Phát Hành: ${product.releaseDate}</p>
            <p>Miêu Tả: ${product.describe}</p>
            <form action="addtocast" method="post">
                <input type="hidden" name="productID" value="${product.id}" />
                Số lượng : <input type="number" name="quantity" min="1" max ="${product.quantity}"required=""/><br/><br/>
                <button type="submit">Thêm vào giỏ hàng</button>
            </form>
            <c:if test="${not empty requestScope.error}">
                <h2 style="color: red">${requestScope.error}</h2>
                <a href="login.jsp">Đăng nhập tại đây</a>
            </c:if>
            <c:if test="${not empty requestScope.ms}">
                <h2 style="color: green">${requestScope.ms}</h2>

            </c:if>
        </div>

    </div>
    <div class="advertisement">
        <h5><img src="tick.png" />Hàng chính hãng</h5>
        <h5><img src="tick.png"/>Bảo hành trong vòng 12 tháng</h5>
        <h5><img src="tick.png"/>Giao hàng miễn phí trong 90 phút</h5>
        <h5><img src="tick.png"/>Hỗ trợ cài đặt miễn phí</h5>
    </div>           
    <h4>Câu Hỏi Thường Gặp</h4>
    <div class="faq-section">
        <div class="faq">
            <p class="question" onclick="toggleAnswer(1)">1. Làm thế nào để đặt hàng?</p>
            <p class="answer" id="answer1" style="display: none">Để đặt hàng, bạn chỉ cần chọn sản phẩm, nhập số lượng, và nhấn vào nút "Thêm vào giỏ hàng". Sau đó, bạn có thể tiến hành thanh toán.</p>
        </div>

        <div class="faq">
            <p class="question" onclick="toggleAnswer(2)">2. Tôi có thể thay đổi số lượng sản phẩm trong giỏ hàng không?</p>
            <p class="answer" id="answer2" style="display: none">Có, bạn có thể thay đổi số lượng sản phẩm trong giỏ hàng trước khi hoàn thành thanh toán.</p>
        </div>
        <div class="faq">
            <p class="question" onclick="toggleAnswer(3)">3. Làm thế nào để theo dõi đơn hàng của tôi?</p>
            <p class="answer" id="answer3" style="display: none"> Sau khi đặt hàng thành công, bạn có thể theo dõi đơn hàng của mình trong mục "Giỏ hàng"</p>
        </div>

        <script>
            function toggleAnswer(faqNumber) {
                var answerId = "answer" + faqNumber;
                var answerElement = document.getElementById(answerId);

                if (answerElement.style.display === "none") {
                    answerElement.style.display = "block";
                } else {
                    answerElement.style.display = "none";
                }
            }
        </script>

        <footer>
            <div class="footer-contact">
                <h3>Liên Hệ</h3>
                <p>Email: tronghaipdp@gmail.com</p>
                <p>Điện thoại: (097) 765-2003</p>
            </div>
            <div class="footer-policies">
                <h3>Chính Sách</h3>
                <ul>
                    <li><a href="#">Chính Sách Bảo Mật</a></li>
                    <li><a href="#">Điều Khoản và Điều Kiện</a></li>
                </ul>
            </div>
            <div class="footer-social">
                <h3>Kết nối với chúng tôi</h3>
                <a href="https://www.facebook.com/CaoTrongHai1201/" >Facebook</a>
                <a href="https://www.instagram.com/" >Instagram</a>
                <a href="https://chat.zalo.me/" >Zalo</a>
            </div>
        </footer>
        <div class="footer-bottom">
            <p>&copy; 2024 Your Online Store | Designed by Cao Trong Hai</p>
        </div>

</body>
</html>
