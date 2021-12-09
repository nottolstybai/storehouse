<%@ page import="com.example.storehouse.*" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.example.storehouse.Database" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (!Database.isEnable)Database.Init(10, 10, 10);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Main</title>
        <link rel='stylesheet' type='text/css' href='style/style.css' />
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
                    <span>
                        Добро пожаловать в приложение главной управляющей компании в г.Обнинск.
                        Приложение создано для курса "Иформационные web-технологии" в рамках лабораторной работы № 1
                        На этом сайте вы найдете информацию об услугах, предоставляемых компанией, контактные данные и другую полезную информацию.
                        Так же на сайте доступна база данных, с помощью которой можно добавить, просмотреть и найти нужную квитанцию.
                        Приятного пользования!
                    </span>
                </div>
            </div>
        </main>
    </body>
</html>