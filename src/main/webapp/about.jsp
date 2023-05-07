<%--
  Created by IntelliJ IDEA.
  User: ivan
  Date: 06/05/23
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi siamo</title>
    <link href="stylesheets/global.css" rel="stylesheet" type="text/css">
    <link href="stylesheets/chi-siamo.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lexend' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
</head>
<jsp:include page="header.jsp"/>
<body>

    <div class="title">
    <h1>Chi siamo</h1>
    </div>

    <div class="chi-siamo">
    <div class="text-image">
        <img src="./images/placeholder.jpeg" class="image">
        <p class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    </div>

        <div class="text-image">
            <p class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <img src="./images/placeholder.jpeg" class="image">
        </div>

    </div>

    <jsp:include page="phrase.jsp" />
    <jsp:include page="footer.jsp"/>

</body>
</html>
