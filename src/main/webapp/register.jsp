<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<title>Sign in</title>
<link rel="stylesheet" href="stylesheets/login.css">
<link rel="stylesheet" href="stylesheets/global.css"



<t:base>
    <main>
        <section class="text-image" id="1">
            <img src="images/placeholder.jpeg" alt="placeholder" class="image-holder">
        </section>

        <section class="login-form" id="2">
            <p class="usermail">Username o email</p>
            <input type="text" class="userbar">
            <p class="password">Password</p>
            <input type="password" class="passbar">
            <input type="submit" value="Sign in" class="button">
            <p class="lasttext">hai già un account? <a href="login.jsp">Accedi</a></p>
        </section>

    </main>

</t:base>

