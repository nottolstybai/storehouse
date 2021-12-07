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
        <div class="client-table">
            <table>
                <thead>
                <tr>
                    <th>Имя</th>
                    <th>Адресс</th>
                    <th>Телефон</th>
                    <th>Почта</th>
                    <th>Роль</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for(Client client: Database.clientList) {
                        if(client.getRole().equals("Provider")) {continue;}
                %>
                <tr>
                    <th><%=client.getName()%></th>
                    <th><%=client.getAddress()%></th>
                    <th><%=client.getPhone()%></th>
                    <th><%=client.getEmail()%></th>
                    <th><%=client.getRole()%></th>
                </tr>
                <%  }%>
                </tbody>
            </table>
        </div>
        <div class="client-table">
            <table>
                <thead>
                <tr>
                    <th>Имя</th>
                    <th>Адресс</th>
                    <th>Телефон</th>
                    <th>Почта</th>
                    <th>Роль</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for(Client client: Database.clientList) {
                        if(client.getRole().equals("Consumer")) {continue;}
                %>
                <tr>
                    <th><%=client.getName()%></th>
                    <th><%=client.getAddress()%></th>
                    <th><%=client.getPhone()%></th>
                    <th><%=client.getEmail()%></th>
                    <th><%=client.getRole()%></th>
                </tr>
                <%  }%>
                </tbody>
            </table>
        </div>
    </div>
</main>
</body>
</html>