<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Welcome to mohit's blog application</title>
    <link rel="stylesheet" type="text/css" href="./styles/style.css" />
    <link rel="stylesheet" type="text/css" href="./styles/responsive.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,100..900;1,9..144,100..900&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,100..900;1,9..144,100..900&family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet"/>
  </head>
  <body>
    <section class="header">
      <div class="nav">
        <img src="./images/blog-logo.png" alt="logo" />
        <ul>
          <li><a class="active" href="/">Home</a></li>
          <li><a href="/registrationform">SignUp</a></li>
          <li><a href="/loginform">Login</a></li>
        </ul>
      </div>
    </section>
    <!--header-->
    <section class="main">
      <div class="discription">
        <div class="heading-and-paragraph">
          <h1 class="heading">Unleash Your Passions:</h1>
          <h2 class="subheading">Share Your Stories!</h2>
          <p class="paragraph-discription">
            This blog is a space for curious minds and passionate hearts to
            share their experiences! Whether you're a seasoned traveler, a
            lifelong learner, or a culinary whiz, we want to hear from you.
          </p>
        </div> <!--heading-and-paragraph-->
        <div class="image-and-quote">
          <p class="quote">
            "Life is what happens to you<br/>
             while you're busy making other plans."<br/>
            - Allen Saunders
          </p>
          <img class="image" src="./images/globe-image.jpeg" alt="poster of website" />
        </div><!--image-and-quote-->
      </div><!--discription--> 

      <div class="content-container">
         	  		<c:forEach var="details" items="${contents}">  
         	  		  <div class="whole-content">
           				<div class="title">
             					<h2><c:out value="${details.title}"/></h2>
          				</div><!--title-->
          				 <div class="content">
            					<p class="content-paragraph">
               					   <c:out value="${details.content}"/>
            					</p>
          				</div><!--content-->
          				 <div class="author-and-date">
					            <h3 class="author-name">
									<c:out value="${details.author}"/>
					            </h3>
					            <h3 class="date"><c:out value="${details.modify_date}"/></h3>
          				</div><!--author-and-date-->
          			  </div><!--whole-content-->
    	  	  		</c:forEach> 
 	    </div><!--content-container--> 
    </section><!--main-->
    <section class="footer"></section>
    <!--footer-->
  </body>
</html>
