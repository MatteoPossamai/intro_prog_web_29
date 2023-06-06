<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
    <script>
        fetch("visits", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'body='+ encodeURIComponent("contact")
        })
    </script>
    <script>
        let filePath = './content.json';
        let request = new XMLHttpRequest();
        request.open('GET',filePath,true);


        request.onreadystatechange = function () {

            let titleElement = document.getElementById("title");
            let descriptionElement = document.getElementById("description");

            if (request.readyState === 4 && request.status === 200){
                let jsonData = JSON.parse(request.responseText).contactsContent;
                let title = jsonData.title;
                let description = jsonData.description;

                titleElement.innerHTML = title;
                descriptionElement.innerHTML = description;
            }
        }
        request.send();



    </script>
    <link rel="stylesheet" type="text/css" href="stylesheets/contact.css" />

    <h1 id="title" class="title"></h1>
    <div class="text-container">
    <p id="description" class="text"></p>
    </div>
    <form class="contact-form"  method="post">
        <label>
            Nome
            <input type="text" name="nome">
        </label>

        <label>
            Cognome
            <input type="text" name="cognome">
        </label>
        </div>
        <div class="row">

        <label>
            Email
            <input type="email" name="email">
        </label>

        <label>
            Motivazione
            <select>
                <option value="1">Informazioni</option>
                <option value="2">Reclami</option>
                <option value="3">Altro</option>
            </select>
        </label>
        </div>
        <label>
            Messaggio
            <textarea rows="5"></textarea>
        </label>
        <div class="row" style="justify-content: center">
        <input class="button" type="reset">
        <input class="button" type="submit" value="Invia" >
        </div>

    </form>


</t:base>
