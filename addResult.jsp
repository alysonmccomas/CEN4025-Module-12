<%--
  Created by IntelliJ IDEA.
  User: alyso
  Date: 6/20/2022
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="toDoListPackage.ToDoList"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add a To-Do Results</title>
    <link rel="stylesheet" href="main.css">
</head>
<body>
<div id="divHead" class="header">
    <h1>My To-Do List</h1>
</div>

<div id="divContent" class="content">
    <h2> Add a To-Do Item</h2>
</div>

<div id="addNewRes" class="methods">
    <table>
      <tbody>
      <tr><h3>Item Added</h3></tr>
      </tbody>
    </table>
    <%ToDoList addInstance = new ToDoList();
    if(request.getParameter("tdAdd") != null) {
        String addItem = request.getParameter("tdAdd");
        addInstance.addToDo(addItem);
    }%>
</div>

<div class="footer">
    <p>Did you forget something?</p>
    <button class="button button2" type="button" onclick="goHome()" id="homeBtn">Go Home</button>
</div>

</body>

<script>
    function goHome(){
        window.location.href="index.jsp";
    }
</script>

</html>