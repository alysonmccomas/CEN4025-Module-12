<%--
  Created by IntelliJ IDEA.
  User: alyso
  Date: 6/19/2022
  Time: 9:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="toDoListPackage.ToDoList"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add a To-Do</title>
    <link rel="stylesheet" href="main.css">
</head>
<body>
<div id="divHead" class="header">
    <h1>My To-Do List</h1>
</div>

<div id="divContent" class="content">
    <h2> Add a To-Do Item</h2>
</div>


<div id="addNewForm" class="methods" >
    <form action="addResult.jsp" method="post" id="addForm">
    <table>
        <tbody>
            <input type="text" name="tdAdd" placeholder="New To-Do Item..."/>
        </tbody>
    </table>
    </form>
    <button type="submit" form="addForm" value="Submit">Add</button>
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
