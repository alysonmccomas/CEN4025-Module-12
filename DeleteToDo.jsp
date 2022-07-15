<%--
  Created by IntelliJ IDEA.
  User: alyso
  Date: 6/19/2022
  Time: 9:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="toDoListPackage.ToDoList"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete a To Do Item</title>
    <link rel="stylesheet" href="main.css">
</head>
<body>
<div id="divHead" class="header">
    <h1>My To-Do List</h1>
</div>

<div id="divContent" class="content">
    <h2>Delete a To-Do Item</h2>
</div>

<% ArrayList toDoItems = new ArrayList<>();
    try {
        ResultSet results = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/to_do_list",
                "root", "password");
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT DISTINCT item FROM to_do WHERE item IS NOT NULL");
        while (resultSet.next()) {
            toDoItems.add(resultSet.getString(1));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }%>

<div id="addNew" class="methods">
    <form action="delResult.jsp" method="post" id="delForm">
        <table>
            <tbody>
            <select name="delItem" id="ddDelete" class="dropDown">
                <option value="">Select an Item...</option>
                <% for (int i = 0; i < toDoItems.size(); ++i){ %>
                <option value="<%=i%>" ><%=toDoItems.get(i)%></option>
                <%}%>
            </select>
            </tbody>
        </table>
        <button class="button button1" type="button" onclick="delNew()" id="delBtn">Delete</button>
    </form>
</div>

<div class="footer">
    <p>Did you forget something?</p>
    <button class="button button2" type="button" onclick="goHome()" id="homeBtn">Go Home</button>
</div>

</body>

<script>
    function delNew(){
        window.location.href="delResult.jsp";
    }
    function goHome() {
        window.location.href = "index.jsp";
    }
</script>

</html>