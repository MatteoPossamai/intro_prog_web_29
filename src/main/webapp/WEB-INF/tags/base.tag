<%@tag description="Template page to wrap everything else" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Tum4World</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/index.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index.css" />
</head>
    <body>
        <jsp:include page="header.jsp"/>

        <div id="body">
            <jsp:doBody />
        </div>

        <jsp:include page="phrase.jsp" />
        <jsp:include page="footer.jsp"/>
    </body>
</html>
