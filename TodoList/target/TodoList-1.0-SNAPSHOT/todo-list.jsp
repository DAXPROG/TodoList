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
    </style>
</head>
<body>
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
    </div>

    <table>
            <tr>
                <th>Title</th>
                <th>Description</th>
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
                    <td><%= todo.getDescription() %></td>
                    <td><%= todo.getStatus() %></td>
                    <td><%= todo.getCreatedAt() %></td>
                    <td>
                        <a href="update-todo?id=<%= todo.getId() %>">Edit</a>
                        <a href="delete-todo?id=<%= todo.getId() %>"
                           onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
                    </td>
                </tr>
            <%
                }
            }
            %>
    </table>

    <br/>
    <a href="add-todo">Add New Todo</a>
</body>
</html>