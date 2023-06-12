<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cookie</title>
</head>
<link rel="stylesheet" href="stylesheets/banner.css">
<body>
<div id="cookies" class="cookie-consent-banner">
    <div class="cookie-consent-banner__inner">
        <div class="cookie-consent-banner__copy">
            <div class="cookie-consent-banner__header">QUESTO SITO USA I COOKIES</div>
            <div class="cookie-consent-banner__description">
                Utilizziamo i cookies per personalizzare il contenuto e per analizzare il nostro traffico.
                Non condivideremo i tuoi dati se non per utilizzo di statistica.

            </div>
        </div>

        <div class="cookie-consent-banner__actions">
            <button id="cookie-btn-accept" class="cookie-consent-banner__cta">
                OK
            </button>

            <button id="cookie-btn-decline" class="cookie-consent-banner__cta cookie-consent-banner__cta--secondary">
                Rifiuta
            </button>

        </div>
    </div>
</div>
<script src="cookie.js"></script>
</body>
</html>

<script>
    <%
     Cookie cookie[] = request.getCookies();
     if(cookie != null)
         {
            request.getServletContext().setAttribute("cookiesEnabled", true);
         }
     else
     {
         request.getServletContext().setAttribute("cookiesEnabled", false);
     }

    %>
</script>
