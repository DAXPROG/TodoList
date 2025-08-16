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
import java.util.List;

@WebServlet("/todos")
public class TodoServlet extends HttpServlet {

    private final TodoDao todoDao = new TodoDao();

           @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String statusFilter = request.getParameter("status");

        List<Todo> todos = null;

        try {
            todos = todoDao.getAllTodos(statusFilter);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("todos", todos);
        request.getRequestDispatcher("todo-list.jsp").forward(request,response);

//               PrintWriter pw = response.getWriter();
//        pw.println(todos);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        LocalDate from = LocalDate.parse(request.getParameter("from"));
        LocalDate to = LocalDate.parse(request.getParameter("to"));

        List<Todo> todos = null;

        try {
                todos = todoDao.getTodoByDate(title,from,to);

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("todos", todos);
        request.getRequestDispatcher("todo-list.jsp").forward(request,response);

//               PrintWriter pw = response.getWriter();
//        pw.println(todos);

    }
}
