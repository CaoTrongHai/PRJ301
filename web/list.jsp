<%-- 
    Document   : list
    Created on : Feb 24, 2024, 7:55:31 AM
    Author     : FPTSHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            form {
                margin-top: 20px;
            }

            form select,
            form input {
                margin-bottom: 10px;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            form input[type="submit"] {
                background-color: #4caf50;
                color: white;
                cursor: pointer;
                padding: 10px;
                border: none;
                border-radius: 3px;
            }

            form input[type="submit"]:hover {
                background-color: #45a049;
            }

            body {
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                margin: 0;
            }


            #wrapper{
                margin-left: 10%;
                margin-right: 10%;
                font-family: arial;
                flex : 1;



            }
            .phone h3 {
                text-align: left;
                color: blue;
            }
            .phone ul{
                list-style: none;
            }
            .phone li{
                width: 25%;
                text-align:center;
                float: left;
                margin: 25px;
                border: 2px solid chocolate;
                border-radius: 20px;
            }
            .phone li img{
                width: 100px;
                height: 120px;
            }
            .phone li a{
                text-decoration: none;
            }
            .phone li:hover {
                background:bisque;
            }
            .phone p{
                margin : 5px;
                color: blue;
                font-size: 12px;
            }
            .old{
                text-decoration: line-through;
                color: red;
            }
            .image-container img {
                display: none; /* Ẩn tất cả hình ảnh */
                width: 100%; /* Thiết lập chiều rộng tùy ý */
                height: 450px
            }
            header{
                display: flex;
                justify-content: space-around;
                background: #e5294e;
            }
            .logo img{
                width: 300px;
                height: 150px;
            }
            .user-actions a {

                color: #fff;
                text-decoration: none;
                display: flex;
                align-items: center;
                margin-top: 5px;

            }
            .user-actions {
                margin-top: 50px;
            }
            .user-actions img {
                margin-right: 0.5em;
                height: 20px;
            }
            .search-bar {
                margin-top: 50px;
                display: flex;

            }
            .search input{
                width: 350px;
                height: 25px;
            }
            <%--
            css Phần footer
            --%>
            footer {
                display: flex;
                justify-content: space-around;
                background: #e5294e;
            }
            footer h3 {
                color: white
            }
            footer li a{
                text-decoration: none;
                list-style: none;
            }
            .footer-bottom {
                background: #e5294e;
                text-align: center;

            }
            .footer-social a {
                text-decoration: none;
                display: block;
                margin-bottom: 5px;
            }

        </style>
        <script>
            window.onload = function () {
                let currentImageIndex = 0;
                const images = document.querySelectorAll('.image-container img');
                const totalImages = images.length;

                // Hàm để chuyển đổi hình ảnh
                function changeImage() {
                    images[currentImageIndex].style.display = 'none'; // Ẩn hình ảnh hiện tại
                    currentImageIndex = (currentImageIndex + 1) % totalImages; // Tính toán chỉ số hình ảnh tiếp theo
                    images[currentImageIndex].style.display = 'block'; // Hiển thị hình ảnh tiếp theo
                }

                // Đặt hình ảnh để chuyển đổi mỗi 3 giây
                setInterval(changeImage, 3000);

                // Khởi tạo hiển thị cho hình ảnh đầu tiên
                if (totalImages > 0) {
                    images[0].style.display = 'block';
                }
            };
        </script>

    </head>
    <body>
        <header>
            <div class="logo">
                <a href="list"><img src="logo.png" alt="Logo"></a>
            </div>
            <div class="search-bar">
                <form action="search" method="get">
                    <div class="search">
                        <input type="text" name="search" placeholder="Hôm nay bạn cần tìm gì... ?">
                    </div>

                    <input style="height: 30px" type="submit" value="Search"/>
                </form>
            </div>
            <div class="user-actions">
                <c:choose>
                    <c:when test="${empty sessionScope.account}">
                        <!-- Chưa đăng nhập -->
                        <a href="login.jsp">Đăng nhập</a>
                        <a href="register.jsp">Đăng ký</a>
                    </c:when>
                    <c:otherwise>
                        <!-- Đã đăng nhập -->
                        <p>Hello ${sessionScope.account.username}</p>
                        <a href="profile">Xem thông tin tài khoản</a>
                        <a href="cart">Giỏ hàng<img src="cart.png"/></a>
                        <a href="changepassword.jsp">Đổi mật khẩu</a>
                        <a href="logout">Đăng xuất</a>
                    </c:otherwise>
                </c:choose>  

                <%--<h3>Hello ${sessionScope.account.username}!</h3>
                <a href="login.jsp"> Đăng nhập</a>
                <a href="#"> Đăng ký</a>
                <a href="#"><img src="cart.png" alt="Giỏ hàng"> Giỏ hàng</a>
                --%>
            </div>
        </header>
        <div class="image-container">
            <img src="banner.png" alt="Image 1" class="image" id="image1">
            <img src="banner2.png" alt="Image 2" class="image" id="image2">
            <img src="banner3.jpg" alt="Image 3" class="image" id="image3">
        </div>
        <div class="phone">
            <c:if test="${not empty requestScope.listProductByName}">
                <h3>Sản phẩm bạn đang tìm kiếm</h3>
                <ul>
                    <c:forEach items="${requestScope.listProductByName}" var="p">
                        <li>
                            <a href="productdetails?id=${p.id}">
                                <img src="${p.image}" alt="alt"/>
                                <p>${p.name}</p>
                                <p>Giá Gốc: <span class="old">${(p.price)}</span></p>
                                <p>Giảm Còn: ${(p.price/2)}</p>
                            </a>
                        </li>
                    </c:forEach>

                </ul>
            </c:if>

        </div>
        <div id="wrapper">
            <form id="f1" action="list">
                Loại Điện Thoại:
                <select name="key">
                    <option value="0">ALL</option>
                    <c:forEach items="${requestScope.categories}" var="c">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select><br/>
                <input type="text" name="key2" placeholder="nhập tên smartphone"/><br/>
                Từ giá :<input type="number" name="fromprice"/>
                Đến giá :<input type="number" name="toprice"/><br/>

                <input type="submit" value="SEARCH"/>


            </form>
            <div class="phone">
                <h3>CÁC DÒNG ĐIỆN THOẠI</h3>
                <ul>
                    <c:forEach items="${requestScope.products}" var="p">
                        <li>
                            <a href="productdetails?id=${p.id}">
                                <img src="${p.image}" alt="alt"/>
                                <p>${p.name}</p>
                                <p>Giá Gốc: <span class="old">${(p.price)}</span></p>
                                <p>Giảm Còn: ${(p.price/2)}</p>
                            </a>
                        </li>
                    </c:forEach>

                </ul>
            </div>
        </div> 

        <footer>
            <div class="footer-contact">
                <h3>Liên Hệ</h3>
                <p>Email: tronghaipdp@gmail.com</p>
                <p>Điện thoại: (097) 765-2003</p>               
            </div>
            <div class="footer-policies">
                <h3>Chính Sách</h3>
                <ul>
                    <li><a href="#">Chính Sách Bảo Mật</li>
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

