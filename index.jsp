<%--
  Created by IntelliJ IDEA.
  User: alyso
  Date: 6/20/2022
  Time: 12:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="toDoListPackage.ToDoList"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My To-Do List</title>
    <link rel="stylesheet" href="main.css">
</head>
<body>
<div id="divHead" class="header">
    <h1>My To-Do List</h1>
</div>

<div id="divContent" class="content">
    <h2> What Would You Like To-Do?</h2>
    <form>
        <table>
            <tbody>
            <select name="whatNow" id="ddSelect" class="dropDown">
                <option value=""></option>
                <option value="1">Add an Item</option>
                <option value="2">Delete an Item</option>
                <option value="3">View List</option>
            </select>
            </tbody>
        </table>
    </form>
    <button type="button" onclick="getGoin()" id="btnId">Submit</button>
</div>

<div class="footer">
    <p>Did you forget something?</p>
</div>

</body>
<script>
    function getGoin(){
        var e = document.getElementById("ddSelect");
        var ddVal = e.value;
        if (ddVal == 1){
            window.location.href="AddToDo.jsp";
        } else if (ddVal == 2) {
            window.location.href="DeleteToDo.jsp";
        } else if (ddVal == 3) {
            window.location.href="ViewToDo.jsp";
        } else {
            alert("ERROR! You must select an option from the drop down menu.");
        }
    }
</script>
</html>