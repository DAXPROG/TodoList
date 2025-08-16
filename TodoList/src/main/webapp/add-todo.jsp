
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
<style>
 .container{
          width: 50%;
          margin-left: auto;
          margin-right: auto;
          text-align: center;
          box-shadow: 0px 0px 30px brown;
          border-radius: 10px;
          padding: 10px 20px;
          margin-top: 20px;
 }
 input{
      padding: 10px;
      border-radius: 6px;
      border: none;
      background-color: lightblue;
      margin-bottom: 10px;
 }
 button{
    padding: 10px 30px;
          border-radius: 6px;
          border: none;
          background-color: green;
          color: white;
          margin-bottom: 10px;
          cursor: pointer;
          transition: ease 0.1s;
 }
  button:active{
           background-color: tomato;
         }
 span{
     font-size: 20px;
 }
</style>
</head>
 <body>
 <div class="container">

   <h1>Add new Todo</h1>
   <form action="add-todo" method="post">
      <input type="text" name="title" placeholder="Enter To do name" required><br>
      <span>Todo Date</span>
      <br>
      <input type="date" name="date" required>
      <br>
      <button>Add</button>
   </form>
 </body>
</html>