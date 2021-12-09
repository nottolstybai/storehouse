<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.example.storehouse.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (!Database.isEnable)Database.Init(10, 10, 10);
    if (request.getParameter("add-button")!=null){
        String fullName = request.getParameter("full-name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        System.out.println(role);
        Admin.addClient(fullName, address, email, phone, role);
        System.out.println(Database.clientList.get(Database.clientList.size()-1).getRole());
    }
    if (request.getParameter("delete-button") != null){
        for(int i = Database.clientList.size() - 1; i >= 0; i--){
            if (request.getParameter("checkbox"+Database.clientList.get(i).getId()) != null){
                System.out.println(request.getParameter("checkbox"+Database.clientList.get(i).getId()));
                Admin.removeClient(Database.clientList.get(i).getId());
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
            <li><a href="order.jsp">Заказы</a></li>
            <li><a href="clients.jsp">Клиенты</a></li>
        </ul>
    </nav>
    <a class="cta" href="#"><button>Contact</button></a>
</header>
<main>
    <div class="main-area">
        <div class="content-area">
            <form action="" method="post">
                <div class="client-table">
                    <table class="product-table">
                        <thead>
                        <tr>
                            <th></th>
                            <th>ID</th>
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
                                if(client.getRole().equals("Потребитель")) {continue;}
                        %>
                        <tr>
                            <td><input type="checkbox" name=<%="checkbox"+client.getId()%> value="<%=client.getId()%>"></td>
                            <td><%=client.getId()%></td>
                            <td><%=client.getName()%></td>
                            <td><%=client.getAddress()%></td>
                            <td><%=client.getPhone()%></td>
                            <td><%=client.getEmail()%></td>
                            <td><%=client.getRole()%></td>
                        </tr>
                        <%  }%>
                        </tbody>
                    </table>
                </div>
                <div class="client-table">
                    <table class="product-table">
                        <thead>
                        <tr>
                            <th></th>
                            <th>ID</th>
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
                                if(client.getRole().equals("Поставщик")) {continue;}
                        %>
                        <tr>
                            <td><input type="checkbox" name=<%="checkbox"+client.getId()%> value="<%=client.getId()%>"></td>
                            <td><%=client.getId()%></td>
                            <td><%=client.getName()%></td>
                            <td><%=client.getAddress()%></td>
                            <td><%=client.getPhone()%></td>
                            <td><%=client.getEmail()%></td>
                            <td><%=client.getRole()%></td>
                        </tr>
                        <%  }%>
                        </tbody>
                    </table>
                    <input type="submit" name="delete-button" class="input-background">
                </div>
            </form>
            <div class="add-area">
                <form class="add-form" action="" method="post">
                    Имя: <input  class="input-background" name="full-name"><br/>
                    Адрес: <input  class="input-background" name="address"><br/>
                    Телефон: <input required class="input-background" type="text" name="phone"><br/>
                    Почта: <input required class="input-background" type="text" name="email"><br/>
                    Роль:
                    <select required class="input-background" name="role" id="">
                        <option value=""></option>
                        <option value="<%=Role.provider()%>"><%=Role.provider()%></option>
                        <option value="<%=Role.consumer()%>"><%=Role.consumer()%></option>
                    </select>
                    <input class="input-background" type="submit" name="add-button" value="Добавить">
                </form>
            </div>
        </div>
    </div>
</main>
</body>
</html>