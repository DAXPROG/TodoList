package com.model;

import java.time.LocalDate;

public class Todo {
     private int id;
     private String title;
     private String status;
     private LocalDate date;

    public Todo() {   }

    public Todo(String title, LocalDate date) {
        this.title = title;
        this.date = date;
    }

//    public Todo(String title, String status) {
//    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
}
