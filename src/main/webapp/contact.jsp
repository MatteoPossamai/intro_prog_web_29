<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
    <h1>Contatti</h1>

    <p>Ci puoi venire a trovare in Via Sommarive 29000, Trento, Italia. Se hai bisogno di ulteriori informazioni puoi chiamarci al numero 0461 827188 oppure compila il form sottostante e ti risponderemo via email.</p>

    <form method="post">
        <label>
            Nome
            <input type="text" name="nome">
        </label>

        <label>
            Cognome
            <input type="text" name="cognome">
        </label>

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

        <label>
            Messaggio
            <textarea></textarea>
        </label>

        <input type="submit" value="Invia">
    </form>
</t:base>
