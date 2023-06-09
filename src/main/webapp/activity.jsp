<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="activity" scope="request"
             class="com.projects.intro_prog_web_29.Activity"></jsp:useBean>

<html>
<head>
    <link rel="icon" href="favicon.ico" type="image/x-icon">

    <link href='https://fonts.googleapis.com/css?family=Lexend' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
    <link href="stylesheets/activity.css" rel="stylesheet" type="text/css">
    <link href="stylesheets/global.css" rel="stylesheet" type="text/css">
    <title>Tum4World</title>
</head>

<jsp:include page="header.jsp"></jsp:include>
<body>
     <h1 class="title"><%=activity.getTitle()%></h1>
     <div class="content">

        <div class="text-image">
            <img src="./images/placeholder.jpeg" class="image">
            <p class="text"><%=activity.getDescription()%></p>
        </div>
     </div>
</body>
<jsp:include page="footer.jsp"></jsp:include>

</html>
