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
    <link rel="stylesheet" type="text/css" href="stylesheets/contact.css" />
    <h1 class="title">Contatti</h1>
    <div class="text-container">
        <p class="text">Ci puoi venire a trovare in Via Sommarive 29000, Trento, Italia. Se hai bisogno di ulteriori
            informazioni puoi chiamarci al numero 0461 827188 oppure compila il form sottostante e ti risponderemo via
            email.</p>
    </div>
    <form class="contact-form" method="post" id="contact-form">
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
                <input type="email" id="email" name="email">
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
            <input class="button" type="submit" value="Invia">
        </div>
    </form>
</t:base>
<script>
    const form = document.getElementById('contact-form');
    const email = document.getElementById('email');
    form.addEventListener('submit', e => {
        e.preventDefault();

        // If all the check succeed, send the form
        if (checkEmail()) {
            form.submit();
        }

    });

    function checkEmail() {
        if(isEmail(email))
        {
            return true;
        }
        else
        {
            alert("Format email sbagliato");
            return false;
        }
    }
    function isEmail(email) {
        return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
    }
</script>

