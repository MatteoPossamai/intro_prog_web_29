<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
    <script>
        fetch("visits", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'body='+ encodeURIComponent("Home")
        })
    </script>
    <link href="stylesheets/index.css" rel="stylesheet" type="text/css">
<div class="content">
<br class="title">
<div class="text-image">
    <img src="./images/img5.jpg" class="image" alt="template_image">
    <div style="margin-top: 90px">
        <h1 id="title"></h1>
        <p id="description" class="text">
        </p>

    </div>
</div>

<div class="cta">
    <img src="./images/img6.jpg" class="logo" alt="template_image">
    <div class="button-container">
        <button id="download" class="button index-button">Vuoi saperne di piu?</button>
    </div>
</div>
</div>

    <script>



        document.getElementById('download').addEventListener('click', function() {
            let fileUrl = "./images/TUM4World.pdf";

            let link = document.createElement('a');
            link.href = fileUrl;
            link.download = 'filename.pdf';

            link.dispatchEvent(new MouseEvent('click'));
        });


        /*
               * Script per prendere il content da content.json
        * */

        let filePath = './content.json';
        let request = new XMLHttpRequest();
        request.open('GET',filePath,true);


        request.onreadystatechange = function () {
            let titleElement = document.getElementById("title");
            let descriptionElement = document.getElementById("description");

            if (request.readyState === 4 && request.status === 200){

                let jsonData = JSON.parse(request.responseText).indexContent;
                let title = jsonData.title;
                let description = jsonData.description;

                titleElement.innerHTML = title;
                descriptionElement.innerHTML = description;
            }
        }
        request.send();

    </script>
</t:base>
