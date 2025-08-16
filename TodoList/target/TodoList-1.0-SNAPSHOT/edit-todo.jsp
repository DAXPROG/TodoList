<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Todo</title>
</head>
<body>
    <h1>Edit Todo</h1>

    <form action="update-todo" method="post">
        <input type="hidden" name="id" value="${todo.id}">
        <div>
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="${todo.title}" required>
        </div>
        <div>
            <label for="description">Description:</label>
            <textarea id="description" name="description">${todo.description}</textarea>
        </div>
        <div>
            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="pending" ${todo.status == 'pending' ? 'selected' : ''}>Pending</option>
                <option value="in-progress" ${todo.status == 'in-progress' ? 'selected' : ''}>In Progress</option>
                <option value="completed" ${todo.status == 'completed' ? 'selected' : ''}>Completed</option>
            </select>
        </div>
        <button type="submit">Update Todo</button>
    </form>

    <br/>
    <a href="todos">Back to List</a>
</body>
</html>