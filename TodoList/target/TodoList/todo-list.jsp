<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

            <c:forEach var="todo" items="${todos}">
                <tr>
                    <td>${todo.title}</td>

                    <td>
                        <a href="update-todo?id=${todo.id}">Edit</a>
                        <a href="delete-todo?id=${todo.id}"
                           onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>

    </table>

    <br/>
    <a href="add-todo">Add New Todo</a>
</body>
</html>