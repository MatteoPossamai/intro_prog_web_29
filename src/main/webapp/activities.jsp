<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="activity1" scope="request"
             class="com.projects.intro_prog_web_29.Activity"></jsp:useBean>

<jsp:useBean id="activity2" scope="request"
             class="com.projects.intro_prog_web_29.Activity"></jsp:useBean>

<jsp:useBean id="activity3" scope="request"
             class="com.projects.intro_prog_web_29.Activity"></jsp:useBean>

<html>
<head>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href='https://fonts.googleapis.com/css?family=Lexend' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
    <link href="stylesheets/activities.css" rel="stylesheet" type="text/css">
    <link href="stylesheets/global.css" rel="stylesheet" type="text/css">
    <title>Tum4World</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/index.js"></script>

    <jsp:include page="header.jsp"></jsp:include>

<body>

<script>
    fetch("visits", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'body='+ encodeURIComponent("Attivita")
    })
</script>
    <h1 class="title">Attivita'</h1>
    <div class="content">
    <main>
        <p id="description" class="description"> La nostra associazione da molti anni porta avanti vari progetti di utilita' varia ecc ecc </p>
        <div class="activities-container">
        <section class="activity" id="1">
            <a href="getActivity?activityID=1">
                <img src="<%=activity1.getImageSource()%>" alt="Mensa"  style="max-width:250px">
            </a>
            <h2><%=activity1.getTitle()%></h2>
            <p class="text"><%=activity1.getPreview()%></p>
        </section>

            <section class="activity" id="2">
                <a href="getActivity?activityID=2">
                    <img src="<%=activity2.getImageSource()%>" alt="Edilizia" style="max-width:250px">
                </a>
                <h2><%=activity2.getTitle()%></h2>
                <p class="text"><%=activity2.getPreview()%></p>
            </section>

            <section class="activity" id="3">
                <a href="getActivity?activityID=3">
                    <img src="<%=activity3.getImageSource()%>" alt="Corsi di formazione" style="max-width:250px">
                </a>
                <h2><%=activity3.getTitle()%></h2>
                <p class="text"><%=activity3.getPreview()%></p>
            </section>
        </div>
    </main>
    </div>
</body>
<jsp:include page="phrase.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>

<script>
    let filePath = './content.json';
    let request = new XMLHttpRequest();
    request.open('GET',filePath,true);


    request.onreadystatechange = function () {

        let titleElement = document.getElementById("title");
        let descriptionElement = document.getElementById("description");

        if (request.readyState === 4 && request.status === 200){
            let jsonData = JSON.parse(request.responseText).activitiesContent;
            let title = jsonData.title;
            let description = jsonData.description;

            titleElement.innerHTML = title;
            descriptionElement.innerHTML = description;
        }
    }
    request.send();



</script>

</html>
