package com.servlet;

import com.dao.TodoDao;
import com.model.Todo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;


@WebServlet("/add-todo")
public class AddTodoServlet extends HttpServlet {
    private final TodoDao todoDao = new TodoDao();

//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
////        request.getRequestDispatcher("/views/add-todo.jsp").forward(request, response);
//    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String title = request.getParameter("title");
        LocalDate date = LocalDate.parse(request.getParameter("date"));

        Todo newTodo = new Todo(title,date);
        try {
            todoDao.addTodo(newTodo);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("todos");
    }
}
