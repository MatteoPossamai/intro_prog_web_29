<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
    <script>
        fetch("visits", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'body='+ encodeURIComponent("Contatti")
        })
    </script>
    <script>
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
    <form action="EmailHandler" class="contact-form" method="post" id="contact-form">
        <label>
            Nome
            <input type="text" name="nome" id="nome">
        </label>

        <label>
            Cognome
            <input type="text" name="cognome" id="cognome">
        </label>
        </div>
        <div class="row">

            <label>
                Email
                <input type="email" id="from" id="email" name="from">
            </label>

            <label>
                Motivazione
                <select id="subject" name="subject">
                    <option value="Informazioni">Informazioni</option>
                    <option value="Reclami">Reclami</option>
                    <option value="Altro">Altro</option>
                </select>
            </label>
        </div>
        <label>
            Messaggio
            <textarea id="content" name="content" rows="5" id="messaggio"></textarea>
        </label>
        <div class="row" style="justify-content: center">
            <input class="button" type="reset">
            <input class="button" type="submit" value="Invia">
        </div>
    </form>


</t:base>
<script>
    const form = document.getElementById('contact-form');
    const email = document.getElementById('email');
    const nome = document.getElementById('nome');
    const cognome = document.getElementById('cognome');
    const messaggio = document.getElementById('messaggio');
    form.addEventListener('submit', e => {
        e.preventDefault();

        // If all the check succeed, send the form
        if (checkInputs()) {
            form.submit();
        }

    });

    function checkInputs() {
        let res = true;
        // trim to remove the whitespaces
        const nomeValue = nome.value.trim();
        const cognomeValue = cognome.value.trim();
        const emailValue = email.value.trim();
        const messaggioValue = messaggio.value.trim();
        if (nomeValue === '') {
            res = false;
            alert("Nome vuoto");
        } else if (cognomeValue === '') {
            res = false;
            alert("Cognome vuoto");
        } else if (emailValue === '') {
            res = false;
            alert("Email vuota");
        } else if (!isEmail(emailValue)) {
            res = false;
            alert("Email non valida");
        }
        else if(messaggioValue === '')
        {
            res = false;
            alert("Messaggio vuoto");
        }
        return res;
    }
    function isEmail(email) {
        return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
    }
</script>

