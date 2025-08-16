package com.dao;


import com.model.Todo;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class TodoDao {
//Just create a new task
    public void addTodo(Todo todo) throws SQLException,ClassNotFoundException{
      String sql = "INSERT INTO todo(title, date) VALUES (?,?) ";
      Connection conn = database.getConnection();
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, todo.getTitle());
        pst.setString(2, todo.getDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        pst.executeUpdate();
    }
//Here we get all the todos
    public List<Todo> getAllTodos(String statusFilter) throws SQLException, ClassNotFoundException {
      List<Todo> todos = new ArrayList<>();
      String sql = "SELECT * FROM todo";
      if(statusFilter != null && !statusFilter.isEmpty()) {
          sql += " WHERE status = ?";
      }
          Connection conn = database.getConnection();
          PreparedStatement pst = conn.prepareStatement(sql);
          if(statusFilter != null && !statusFilter.isEmpty()){
              pst.setString(1, statusFilter);
      }

        ResultSet rs = pst.executeQuery();
          while(rs.next()){
              Todo todo = new Todo();

              todo.setId(rs.getInt("id"));
             todo.setTitle(rs.getString("Title"));
             todo.setStatus(rs.getString("status"));
             todo.setDate(rs.getDate("date").toLocalDate());

             todos.add(todo);



          }
        return todos;
    }

//    Get the todos base on date
    public List<Todo> getTodoByDate(String title, LocalDate from, LocalDate to) throws
SQLException,ClassNotFoundException{
        List<Todo> todos = new ArrayList<>();
       String sql = "SELECT * FROM todo WHERE title=? AND (date>=? AND date<=?)";

       Connection conn = database.getConnection();
       PreparedStatement pst = conn.prepareStatement(sql);
       pst.setString(1, title);
       pst.setDate(2, Date.valueOf(from));
       pst.setDate(3, Date.valueOf(to));


       ResultSet rs = pst.executeQuery();
       while(rs.next()){
           Todo todo = new Todo();
           todo.setId(rs.getInt("id"));
           todo.setTitle(rs.getString("Title"));
           todo.setStatus(rs.getString("status"));
           todo.setDate(rs.getDate("date").toLocalDate());

           todos.add(todo);

       }
       return todos;
    }


//    Delete the
    public void deleteTodo(int task) throws SQLException,ClassNotFoundException{
            String sql = "DELETE FROM `todo` WHERE id=?";
            Connection conn = database.getConnection();
            PreparedStatement pst = conn.prepareStatement(sql);

            pst.setString(1, String.valueOf(task));
            pst.executeUpdate();

    }

//
}
