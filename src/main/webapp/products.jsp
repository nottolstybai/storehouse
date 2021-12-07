<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.example.storehouse.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Database.Init(10, 10);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products</title>
    <link rel="stylesheet" href="style/style.css">
</head>
<body>
<header>
    <img class="logo" src="images/temp.png" alt="logo pic">
    <nav>
        <ul class="nav-links">
            <li><a href="index.jsp">Главная</a></li>
            <li><a href="products.jsp">Товары</a></li>
            <li><a href="#">Заказы</a></li>
            <li><a href="clients.jsp">Клиенты</a></li>
        </ul>
    </nav>
    <a class="cta" href="#"><button>Contact</button></a>
</header>
<main>
    <div class="main-area">
        <div class="text-area">
        </div>
        <div class="products-table">
            <table>
                <thead>
                    <tr>
                        <th>Названиие товара</th>
                        <th>Тип товара</th>
                        <th>Цена</th>
                        <th>Срок годности</th>
                        <th>Количество</th>
                        <th>Позиция</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for(Products product: Database.productList) {%>
                    <tr>
                        <th><%=product.getName()%></th>
                        <th><%=product.getType()%></th>
                        <th><%=product.getPrice()%></th>
                        <th><%=product.getExpireDate()%></th>
                        <th><%=product.getQuantity()%></th>
                        <th><%=product.getLocation()%></th>
                    </tr>
                <%  }%>
                </tbody>
            </table>
        </div>
    </div>
</main>
</body>
</html>