<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.example.storehouse.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (!Database.isEnable) Database.Init(10, 10, 10);
    boolean isBigger = false;
    if (request.getParameter("add-button1") != null) {
        String productName = request.getParameter("product-name");
        String clientName = request.getParameter("client-name");
        String date = request.getParameter("date");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String direction = "Выдача";
        Products product = Database.getProductByName(productName);
        Client client = Database.getClientByName(clientName);
        if (product != null && client != null) {
            int quantityDifference = product.getQuantity() - quantity;
            if (quantityDifference >= 0) {
                if (quantityDifference == 0) {
                    Admin.removeProduct(product.getId());
                }
                Admin.addOrder(date, product, quantity, direction, client);
                product.setQuantity(quantityDifference);
            }
            else {
                isBigger = true;
            }
        }
    }
    if (request.getParameter("delete-button1") != null) {
        for (int i = Database.clientList.size() - 1; i >= 0; i--) {
            if (request.getParameter("checkbox" + Database.orderList.get(i).getId()) != null) {
                System.out.println(request.getParameter("checkbox" + Database.orderList.get(i).getId()));
                Admin.removeOrder(Database.orderList.get(i).getId());
            }
        }
    }

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products</title>
    <link rel='stylesheet' type='text/css' href='style/style.css' />
</head>
<body>
<%if (isBigger){%>
<%="<script>alert(\"Превышено количество запрашиваемого товара\")</script>"%>
<%}%>
<header>
    <img class="logo" src="images/temp.png" alt="logo pic">
    <nav>
        <ul class="nav-links">
            <li><a href="index.jsp">Главная</a></li>
            <li><a href="products.jsp">Товары</a></li>
            <li><a href="order.jsp">Заказы</a></li>
            <li><a href="clients.jsp">Клиенты</a></li>
        </ul>
    </nav>
    <a class="cta" href="#"><button>Contact</button></a>
</header>
<main>
    <div class="main-area" style="padding-left: 10%">
        <div class="flex-box">
            <div class="table-form">
                <form action="" method="post">
                    <table class="product-table">
                        <thead>
                        <tr>
                            <th></th>
                            <th>ID</th>
                            <th>Названиие товара</th>
                            <th>Имя</th>
                            <th>Дата</th>
                            <th>Количество</th>
                            <th>Тип заказа</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (Order order : Database.orderList) {
                                if (order.getDirection().equals("Поставка")) continue;
                        %>
                        <tr>
                            <td><input type="checkbox" name=<%="checkbox" + order.getId()%> value="<%=order.getId()%>"></td>
                            <td><%=order.getId()%></td>
                            <td><%=order.getProduct().getName()%></td>
                            <td><%=order.getClient().getName()%></td>
                            <td><%=order.getDateTime()%></td>
                            <td><%=order.getQuantity()%></td>
                            <td><%=order.getDirection()%></td>
                        </tr>
                        <%  }%>
                        </tbody>
                    </table>
                    <input class="input-background" type="submit" name="delete-button1" value="Удалить">
                </form>
            </div>
            <div class="add-area">
                <form class="add-form" action="" method="post">
                    Название товара:
                    <select required name="product-name" class="input-background">
                        <option value=""></option>
                        <%
                            for (Products product : Database.productList) {
                        %>
                        <option value="<%=product.getName()%>"><%=product.getName()%></option>
                        <%}%>
                    </select><br/>
                    Имя заказчика:
                    <select required name="client-name" class="input-background">
                        <option value=""></option>
                        <%
                            for (Client client : Database.clientList) {
                                if (client.getRole().equals("Поставщик")) continue;
                        %>
                        <option value="<%=client.getName()%>"><%=client.getName()%></option>
                        <%}%>
                    </select><br/>
                    Дата заказа: <input style="width: 275px" required class="input-background" type="date" name="date"><br/>
                    Количество: <input  style="width: 206px" required class="input-background" type="text" name="quantity"><br/>
                    <input class="input-background" type="submit" name="add-button1" value="Добавить">
                </form>
            </div>
        </div>

    </div>
</main>
</body>
</html>