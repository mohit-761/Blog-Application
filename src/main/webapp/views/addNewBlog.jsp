<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Welcome to mohit's blog application</title>
    <link rel="stylesheet" href="/styles/style.css" />
    <link rel="stylesheet" href="/styles/responsive.css" />
    <link rel="stylesheet" href="/styles/animation.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,100..900;1,9..144,100..900&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,100..900;1,9..144,100..900&family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet"/>
  </head>
  <body>
    <section class="header">
      <div class="nav">
        <img src="/images/blog-logo.png" alt="logo" />
        <ul>
          <li><a href="/">Home</a></li>
          <li><a class="active" href="#">Update Blog</a><li>
          <li><a href="/userdetails/${content.author_id}">Go Back</a></li>
        </ul>
      </div>
    </section><!--header-->
    <section class="main">
        <div class="discription userhome-discription">
            <div class="heading-and-paragraph">
             
              <h1 class="heading">Welcome, <section class="user-name">${content.author}</section></h1>
              <h2 class="subheading">Add New Blog Post Here</h2>
           
            </div> <!--heading-and-paragraph-->
            <div class="image-and-quote">
              <p class="quote">
                "Life is what happens to you<br/>
                 while you're busy making other plans."<br/>
                - Allen Saunders
              </p>
              <img class="image" src="/images/userhome.jpeg" alt="poster of website" />
            </div><!--image-and-quote-->
          </div><!--discription--> 
          
          <form class="user-content-form" action="/saveNewBlog/${userid}" method="post">
          	<table class="user-update-whole-content" cellspacing="20px" cellpadding="20px">
          		<tr>
          			<td><label for="title">Title:</label></td>
          			<td><input type="text" value="${content.title}" name="title" autocomplete="off" required/></td>
          		</tr>
          		<tr>
          			<td><label for="content">Content:</label></td>
          			<td><textarea type="text" name="content" rows="7" cols="40" autocomplete="off" required>${content.content}</textarea></td>
          		</tr>
          		<tr>
          			<td><label for="author">Author Name:</label></td>
          			<td><input type="text" name="author" value="${content.author}" autocomplete="off" required/></td>
          		</tr>
          		<tr>
          			<td><label for="modify_date">Date:</label></td>
          			<td><input type="date" name="modify_date" value="${content.modify_date}" autocomplete="off" required/></td>
          		</tr>
          		<tr>
         			<td></td>
         			<td></td>
          			<td><button class="save-update" type="submit">Save Changes</button></td>
          		</tr>
          	<table>
          </form>
        </section><!--main-->
  </body>
</html>
