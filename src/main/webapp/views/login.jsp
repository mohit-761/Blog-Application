<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <title>Login Page For Blog Application</title>
        <link rel="stylesheet" href="./styles/style.css"/>
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
                  <li><a href="/registrationform">SignUp</a></li>
                  <li><a class="active" href="/loginform">Login</a></li>
                </ul>
              </div>
        </section><!--header-->
        <section class="main">
            <div class="discription">
                <div class="image-and-quote">
                  <p class="quote">
                    "The only person you are destined to become is
                     the person you decide to be."<br/> - Ralph Waldo Emerson
                  </p>
                  <img class="image" src="./images/login-image.jpeg" alt="man writing the blog image" />
                </div><!--image-and-quote-->
                <div class="heading-and-paragraph form-container">
                    <form action="/login" method="post">
                        <section>
                            <label for="email">Enter Your Email</label>
                            <input type="email" name="email" autocomplete="off" required/>
                        </section>
                        <section>
                            <label for="password">Enter Your Password</label>
                            <input type="password" name="password" required/>
                        </section>
                            <button type="submit">Login</button>
                      </form>
                       <c:if test="${not empty error}">
                    <p class="error">${error}</p>
                    </c:if> 
                </div> <!--heading-and-paragraph-->
              </div><!--discription--> 
        </section><!--main-->
    </body>
</html>