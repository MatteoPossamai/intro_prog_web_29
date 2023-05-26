<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:base>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/login.css" type="text/css"/>

    <main>
        <section class="text-image" id="1">
            <img src="images/placeholder.jpeg" alt="placeholder" height="30px" width="30px" class="image-holder">
        </section>
        <div class="container">
            <!-- Add the error from the request of the servlet -->
            <c:if test="${not empty error}">
                <div class="error">
                    <p>${error}</p>
                </div>
            </c:if>
            <form id="form" class="form" method="post" action="login">
                <div class="form-control">
                    <label for="username">Username</label>
                    <input type="text" placeholder="Username" id="username" name="username" />
                    <i class="fas fa-check-circle"></i>
                    <i class="fas fa-exclamation-circle"></i>
                </div>
                <div class="form-control">
                    <label for="password">Password</label>
                    <input type="password" placeholder="Password" id="password" name="password">
                </div>
                <button class="button" type="submit">Submit</button>
            Non sei dei nostri? Puoi registrarti <a class="link" href="register.jsp">qui</a></p>
            </form>
        </div>
    </main>

</t:base>

