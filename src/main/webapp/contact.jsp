<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
    <link rel="stylesheet" type="text/css" href="stylesheets/contact.css" />

    <h1 class="title">Contatti</h1>
    <div class="text-container">
    <p class="text">Ci puoi venire a trovare in Via Sommarive 29000, Trento, Italia. Se hai bisogno di ulteriori informazioni puoi chiamarci al numero 0461 827188 oppure compila il form sottostante e ti risponderemo via email.</p>
    </div>
    <form action="EmailHandler" class="contact-form"  method="post">
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
            <input type="email" id="from" name="from">
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
            <textarea id="content" name="content" rows="5"></textarea>
        </label>
        <div class="row" style="justify-content: center">
        <input class="button" type="reset">
        <input class="button" type="submit" value="Invia" >
        </div>

    </form>
</t:base>
