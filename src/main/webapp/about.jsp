<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>

    <link href="stylesheets/chi-siamo.css" rel="stylesheet" type="text/css">
    <h1 id="title" class="title"></h1>
    <div class="content">
    <div class="text-image">
        <img src="./images/placeholder.jpeg" class="image">
        <p class="text" id="text-0">
        </p>
    </div>

        <div class="text-image">
            <p id="text-1" class="text">

            </p>
            <img src="./images/placeholder.jpeg" class="image">
        </div>

        <div class="text-image">
            <img src="./images/placeholder.jpeg" class="image">
            <p id="text-2"  class="text">
            </p>
        </div>

        <div class="text-image">
            <p id="text-3" class="text">
            </p>
            <img src="./images/placeholder.jpeg" class="image">
        </div>

    </div>



    <script>
        let filePath = './content.json'
        let request = new XMLHttpRequest();
        request.open('GET',filePath,true);

        request.onreadystatechange = function (){
            let titleElement = document.getElementById("title");
            let textElements = [];

            if (request.readyState === 4 && request.status === 200){
                let jsonData = JSON.parse(request.responseText).aboutUsContent;
                let title = jsonData.title;
                titleElement.innerHTML = title;

                let textData = jsonData.textContent;
                for (var i = 0; i<4; i++) {
                    textElements[i] = document.getElementById("text-" + i);
                    textElements[i].name;
                    textElements[i].innerHTML = textData[i];
                }

            }
        };
        request.send();

    </script>
</t:base>
