<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<title>Login</title>
<link rel="stylesheet" href="stylesheets/login.css">
<link rel="stylesheet" href="stylesheets/global.css"
<t:base>
    <main>
        <section class="text-image" id="1">
            <img src="images/placeholder.jpeg" alt="placeholder" height="30px" width="30px" class="image-holder">
        </section>

        <section class="login-form" id="2">
            <p class="usermail">Username o email</p>
            <input type="text" class="userbar">
            <p class="password">Password</p>
            <input type="password" class="passbar">
            <input type="submit" value="Login" class="button">
            <p class="lasttext">Non sei dei nostri? Puoi registrarti <a href="register.jsp">qui</a></p>
        </section>
    </main>

</t:base>

