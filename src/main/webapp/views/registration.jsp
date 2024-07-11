<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>User Registration Form For This Blog Application</title>
        <link rel="stylesheet" href="./styles/style.css" />
        <link rel="stylesheet" href="./styles/responsive.css" />
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
                  <li><a href="/">Home</a></li>
                  <li><a class="active" href="/registrationform">SignUp</a></li>
                  <li><a href="/loginform">Login</a></li>
                </ul>
            </div>
        </section><!--header-->
        <section class="main">
          <div class="discription">
              <div class="image-and-quote">
                <img class="image" src="./images/registration.jpeg" alt="man writing the blog image" />
              </div><!--image-and-quote-->
              <div class="heading-and-paragraph form-container">
                  <form action="/new" method="post" onsubmit="return false">
                    <section>
                      <label for="name">Enter Your Name</label>
                      <input type="text" name="name" autocomplete="off" required/>
                    </section>
                      <section>
                          <label for="email">Enter Your Email</label>
                          <input type="email" name="email" autocomplete="off" required/>
                      </section>
                      <section>
                        <label for="address">Enter Your Address</label>
                        <input type="text" name="address" autocomplete="off" required/>
                      </section>
                      <section>
                          <label for="password">Enter Your Password</label>
                          <input class="password" type="password" name="password" required/>
                      </section>
                      <section>
                        <label for="cpassword">Confirm Your Password</label>
                        <input class="confirm" type="text" name="cpassword" autocomplete="off" required/>
                    </section>
                          <button type="submit">Login</button>
                    </form>
                    <c:if test="${not empty error}">
                    <p class="error">${error}</p>
                    </c:if> 
                    <p class="error"></p>  
              </div> <!--heading-and-paragraph-->
            </div><!--discription--> 
      </section><!--main-->
      <script>
      document.querySelector("button").addEventListener("click",checkPassword);
        function checkPassword(){
            let password = document.querySelector(".password").value;
            let cpass = document.querySelector(".confirm").value;
            if(password !== cpass){
                document.querySelector("form").setAttribute("onsubmit","return false");
                document.querySelector(".error").innerHTML = "Password And Confirm Password Does Not Match";
            }else{
              document.querySelector("form").removeAttribute("onsubmit");
            }
        }
      </script>
    </body>
</html>