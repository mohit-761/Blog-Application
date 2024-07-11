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
          <li><a class="active" href="#">User Home</a><li>
          <li><a href="/loginform">Logout</a></li>
        </ul>
      </div>
    </section><!--header-->
    <section class="main">
        <div class="discription userhome-discription">
            <div class="heading-and-paragraph">
             
              <h1 class="heading">Welcome, <section class="user-name">${user.name}</section></h1>
              <h2 class="subheading">Start Sharing Your Stories!</h2>
           
           <p class="paragraph-discription">
                <a class="newBlog" href="/newBlog/${user.id}">Add New Blog</a>
              </p>
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
    
          <div class="content-container">
           <form class="userhome-form" action="" method="post">
                <table class="userHomeTable">
                  <tr>
                    <td><label for="name">Name:</label></td>
                    <td>
                        <input class="userdata readData" type="text" value="${user.name}" readonly />
                        <input class="userdata hiddenData" name="name" type="text" value="${user.name}" autocomplete="off" required hidden/>
                    </td>
                    <td><label for="email">Email:</label></td>
                    <td>
                        <input class="userdata readData" type="text" value="${user.email}" readonly />
                        <input class="userdata hiddenData" name="email" type="text" value="${user.email}" autocomplete="off" required hidden/>
                    </td>
                    <td><label for="address">Address:</label></td>
                    <td>
                        <input class="userdata readData" type="text" value="${user.address}" readonly />
                        <input class="userdata hiddenData" name="address" type="text" value="${user.address}" autocomplete="off" required hidden/>
                    </td>
                    <td><label for="password">Password</label></td>
                    <td>
                        <input class="userdata readData" type="text" value="${user.password}" readonly />
                        <input class="userdata hiddenData" name="password" type="text" value="${user.password}" autocomplete="off" required hidden/>
                    </td>
                    <td><button class="update" onclick="handleClick()">Update</button></td>
                  </tr>
                </table>
            </form>
            
            <c:forEach var="content" items="${contents}">  
         	  		  <div class="user-whole-content whole-content">
           				<div class="title">
             					<h2><c:out value="${content.title}"/></h2>
          				</div><!--title-->
          				 <div class="content">
            					<p class="content-paragraph">
               					   <c:out value="${content.content}"/>
            					</p>
          				</div><!--content-->
          				 <div class="author-and-date">
					            <h3 class="author-name">
									<c:out value="${content.author}"/>
					            </h3>
					            <h3 class="date"><c:out value="${content.modify_date}"/></h3>
					            <a href="/update/<c:out value="${content.id}" />"><button>update</button></a>
					            <a href="/delete/<c:out value="${content.id}" />"><button class="delete">Delete</button></a>
          				</div><!--author-and-date-->
          			  </div><!--whole-content-->
    	  	  		</c:forEach>   
          </div><!--content-container-->
        </section><!--main-->
    </section><!--main-->
    <script>
    	function handleClick(){ 
        if(document.querySelector(".readData").hasAttribute("hidden")){
            document.querySelector("form").removeAttribute("onsubmit");
            document.querySelector("form").setAttribute("action","/update/${user.id}");
        } else{
            document.querySelector("form").setAttribute("onsubmit","return false");
            const data = document.querySelectorAll(".readData");
            const hiddenData = document.querySelectorAll(".hiddenData");
            for(var i = 0; i<data.length; i++){
            data[i].setAttribute("hidden","true");
            hiddenData[i].classList.add("editUserData");
            hiddenData[i].removeAttribute("hidden");
         } <!--for loop-->
       }   
    }
    </script>
  </body>
</html>
