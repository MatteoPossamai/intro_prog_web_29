<%@tag description="Template page to wrap everything else" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Tum4World</title>
    <link href='https://fonts.googleapis.com/css?family=Lexend' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="${pageContext.request.contextPath}/index.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/global.css" />
</head>
    <body>
        <jsp:include page="header.jsp"/>

            <jsp:doBody />

        <jsp:include page="phrase.jsp" />
        <jsp:include page="footer.jsp"/>
    </body>
</html>
