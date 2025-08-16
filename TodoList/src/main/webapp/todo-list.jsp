<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Todo" %>
<%
    // Get the todos list from request attribute
    List<Todo> todos = (List<Todo>) request.getAttribute("todos");
%>
<html>
<head>
    <title>Todo List</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 8px; text-align: left; border-bottom: 1px solid #ddd; }
        tr:hover { background-color: #f5f5f5; }
        .filter { margin-bottom: 20px; }
        .container{
          width: 60%;
          margin-left: auto;
          margin-right: auto;
          text-align: center;
          box-shadow: 0px 0px 30px black;
          border-radius: 5px;
          padding: 10px 30px;
          margin-top:30px;
        }
        input,select{
          padding: 10px;
          border-radius: 6px;
          border: none;
          background-color: lightblue;
        }
        button{
        padding: 10px;
        border-radius: 6px;
        border: none;
        background-color: green;
        color: white;
        cursor: pointer;
        transition: ease 0.1s;
        }
        button:active{
          background-color: tomato;
        }
        .add{
           background-color: aqua;
           padding: 0px 30px;
           margin: 10px;
           border-radius: 10px;
           text-decoration: none;
           color: darkblue;
           font-size: 40px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Todo List</h1>

    <div class="filter">
        <form action="todos" method="get">
            <label for="status">Filter by Status:</label>
            <select name="status" id="status">
                <option value="">All</option>
                <option value="pending">Pending</option>
                <option value="in-progress">In Progress</option>
                <option value="completed">Completed</option>
            </select>
            <button type="submit">Filter</button>
        </form>
        <form action="todos" method="post">
        <input type="text" name="title" placeholder="Todo Name" required>
                From:<input type="date" name="from" required>
                To:<input type="date" name="to" required>

                    <button type="submit">Search</button>
        </form>
    </div>

    <table>
            <tr>
                <th>Title</th>
                <th>Status</th>
                <th>Created At</th>
                <th>Actions</th>
            </tr>
 <%
            if (todos != null) {
                for (Todo todo : todos) {
            %>
                <tr>
                    <td><%= todo.getTitle() %></td>
                    <td><%= todo.getStatus() %></td>
                    <td><%= todo.getDate() %></td>
                    <td>
                        <a href="delete-todo?id=<%= todo.getId() %>"
                           onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
                    </td>
                </tr>
            <%
                }
            }
            %>
    </table>

    <br>
    <br>
    <a href="add-todo.jsp" class="add">+</a>
    <br>
    <br>
    </div>
</body>
</html>