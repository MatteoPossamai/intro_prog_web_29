<%--
  Created by IntelliJ IDEA.
  User: ivan
  Date: 06/05/23
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Invio confermato</title>
    <link href="stylesheets/global.css" rel="stylesheet" type="text/css">
    <link href="stylesheets/invio-confermato.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lexend' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
</head>
<body class="invio-confermato">
<jsp:include page="header.jsp"/>



<div class="text-image">
    <img src="./images/placeholder.jpeg" class="image">
    <div class="text">
        <h1>Grazie per il tuo messaggio, ti risponderemo
            a breve</h1>
    </div>
</div>
<jsp:include page="phrase.jsp" />
<jsp:include page="footer.jsp"/>

</body>
</html>
