<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tum4World</title>
    <link href="stylesheets/global.css" rel="stylesheet" type="text/css">
    <link href="stylesheets/contact.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lexend' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>

</head>
<body>
    <jsp:include page="header.jsp"/>

    <h1 class="title">Contatti</h1>

    <div class="text-container">
    <p class="text">Ci puoi venire a trovare in Via Sommarive 29000, Trento, Italia. Se hai bisogno di ulteriori informazioni puoi chiamarci al numero 0461 827188 oppure compila il form sottostante e ti risponderemo via email.</p>
    </div>
    <form class="contact-form">
        <div class="row">
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

    <jsp:include page="phrase.jsp" />
    <jsp:include page="footer.jsp"/>
</body>
</html>
