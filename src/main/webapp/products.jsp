<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.example.storehouse.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (!Database.isEnable)Database.Init(10, 10, 10);
    if (request.getParameter("add-button")!=null){
        String name = request.getParameter("productName");
        String type = request.getParameter("productType");
        int price = Integer.parseInt(request.getParameter("productPrice"));
        String date = request.getParameter("expireDate");
        int quantity = Integer.parseInt(request.getParameter("productQuantity"));
        int location = Integer.parseInt(request.getParameter("productLocation"));
        Admin.addProduct(name, type, price, date, quantity, location);
    }
    if (request.getParameter("delete-button") != null){
        for(int i = Database.productList.size() - 1; i >= 0; i--){
            if (request.getParameter("checkbox"+Database.productList.get(i).getId()) != null){
                System.out.println(request.getParameter("checkbox"+Database.productList.get(i).getId()));
                Admin.removeProduct(Integer.parseInt(request.getParameter("checkbox" + Database.productList.get(i).getId())));
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
                            <td><input type="checkbox" name=<%="checkbox"+product.getId()%> value="<%=product.getId()%>"></td>
                            <td><%=product.getId()%></td>
                            <td><%=product.getName()%></td>
                            <td><%=product.getType()%></td>
                            <td><%=product.getPrice()%></td>
                            <td><%=product.getExpireDate()%></td>
                            <td><%=product.getQuantity()%></td>
                            <td><%=product.getLocation()%></td>
                        </tr>
                        <%  }%>
                        </tbody>
                    </table>
                    <input class="input-background" type="submit" name="delete-button" value="Удалить">
                </form>
            </div>
            <div class="add-area">
                <form class="add-form" action="" method="post">
                    Название товара: <input  class="input-background" name="productName"><br/>
                    Тип товара: <select style="width: 233px" required class="input-background" name="productType" id="">
                    <option value=""></option>
                    <option value="">Электроника</option>
                    <option value="">Бытовая техника</option>
                    <option value="">Еда</option>
                    <option value="">Химия</option>
                    <option value="">Лекарства</option>
                </select><br/>
                    Цена: <input style="width: 275px" required class="input-background" type="text" name="productPrice"><br/>
                    Срок годности: <input  style="width: 206px" required class="input-background" type="date" name="expireDate"><br/>
                    Количество: <input style="width: 226px" required class="input-background" type="text" name="productQuantity"><br/>
                    Ячейка: <input style="width: 260px" required class="input-background" type="text" name="productLocation"><br/>
                    <input class="input-background" type="submit" name="add-button" value="Добавить">
                </form>
            </div>
        </div>
    </div>
</main>
</body>
</html>