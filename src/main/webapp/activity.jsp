<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="activity" scope="request"
             class="com.projects.intro_prog_web_29.Activity"></jsp:useBean>

<html>
<head>
    <link href='https://fonts.googleapis.com/css?family=Lexend' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
    <link href="stylesheets/activity.css" rel="stylesheet" type="text/css">
    <link href="stylesheets/global.css" rel="stylesheet" type="text/css">
    <title>Tum4World</title>
</head>

<jsp:include page="header.jsp"></jsp:include>
<body>

<script>
    fetch("visits", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'body='+ encodeURIComponent(<%=activity.getTitle()%>)
    })
</script>
     <h1 class="title"><%=activity.getTitle()%></h1>
     <div class="content">

        <div class="text-image">
            <img src="./images/placeholder.jpeg" class="image">
            <p class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        </div>
     </div>
</body>
<jsp:include page="footer.jsp"></jsp:include>

</html>
