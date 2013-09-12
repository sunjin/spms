<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="email" type="java.lang.String" scope="request"></jsp:useBean>
<jsp:useBean id="isSaveId" type="java.lang.Boolean" scope="request" ></jsp:useBean> 
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
                            <form  action="login" method="post"> 
                                <h1>SPMS</h1> 
                                <p> 
                                    <label for="username" class="email" data-icon="u" > Your email  </label>
                                    <input id="username" name="email" required="required" 
                                    <%= (!email.equals("")) ? ("value='" + email + "'") : "" %> type="text" placeholder="mymail@mail.com"/>
                                </p>
                                <p> 
                                    <label for="password" class="password" data-icon="p"> Your password </label>
                                    <input id="password" name="password" required="required" type="password" placeholder="password" /> 
                                </p>
                                <p class="keeplogin"> 
                                	<input type="checkbox" name="saveId"
									<%= isSaveId ? "checked" : ""%>
									>
									<!--  <input type="checkbox" name="saveId" id="loginkeeping" value="loginkeeping" /> -->
									<label for="loginkeeping">Keep me logged in</label>
								</p>
                                <p class="login button"> 
                                    <input type="submit" value="Login" /> 
								</p>
                                <p class="change_link">
									Not a member yet ?
									<a href="../member/signin" class="to_register">Join us</a>
								</p>
                            </form>
                        </div>
				<!--  아래는 뭔소린지 모르겟다 -->
              
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>