<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>SPMS BY JAVA41</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="${rootPath}/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="${rootPath}/css/style.css" />
		<link rel="stylesheet" type="text/css" href="${rootPath}/css/animate-custom.css" />
    </head>
    <body>
        <div class="container">
            <!-- Codrops top bar -->
            <div class="codrops-top">
                <a href="">
                    <strong>Java 41's First Project </strong>Symple Project Manager System
                </a>
               
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
            <header>
                <h1>Java 41's<span>&nbsp;&nbsp;&nbsp;&nbsp;  First Project</span></h1>
				<nav class="codrops-demos">
					<span><strong>Symple Project Manager System</strong></span>
					
				</nav>
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                             <form  action="${rootPath}/member/signin" autocomplete="on" method="post"> 
                                <h1> Sign up </h1> 
                               
                                <p> 
                                    <label for="emailsignup" class="youmail" data-icon="e" > Your email</label>
                                    <input id="emailsignup" name="email" required="required" type="email" placeholder="mysupermail@mail.com"/> 
                                </p>
                                 <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Your username</label>
                                    <input id="usernamesignup" name="name" required="required" type="text" placeholder="mysuperusername690" />
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
                                    <input id="passwordsignup" name="password" required="required" type="password" placeholder="password"/>
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your password </label>
                                    <input id="passwordsignup_confirm" name="password2" required="required" type="password" placeholder="paaword"/>
                                </p>
                                 <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Your Phone</label>
                                    <input id="usernamesignup" name="tel" required="required" type="text" placeholder="010-1234-5678" />
                                </p>
                            
                                <p class="signin button"> 
									<input type="submit" value="Sign up"/> 
								</p>
								
                                <p class="change_link">  
									Already a member ?
									<a href="../auth/login" class="to_register"> Go and log in </a>
								</p>
                            </form>
                            
                        </div>
				
              
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>