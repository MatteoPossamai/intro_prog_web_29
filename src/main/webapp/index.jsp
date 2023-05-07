<%--
  Created by IntelliJ IDEA.
  User: ivan
  Date: 06/05/23
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Homepage</title>
    <link href="stylesheets/global.css" rel="stylesheet" type="text/css">
    <link href="stylesheets/index.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lexend' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>

</head>
<body>
<jsp:include page="header.jsp"/>

<div class="text-image">
    <img src="./images/placeholder.jpeg" class="image">
    <div>
        <h1>La nostra missione</h1>
        <p class="text"> enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

    </div>
</div>

<div class="cta">
    <img src="./images/placeholder.jpeg" class="logo">
    <div class="button-container">
        <button class="button cta-button">Vuoi saperne di piu?</button>
    </div>
</div>

<jsp:include page="phrase.jsp" />
<jsp:include page="footer.jsp"/>

</body>
</html>
