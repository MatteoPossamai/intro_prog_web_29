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
            <div class="cookie-consent-banner__header">THIS WEBSITE USES COOKIES</div>
            <div class="cookie-consent-banner__description">We use cookies to personalise content and ads,
                to provide social media features and to analyse our traffic. We also share information about
                your use of our site with our social media, advertising and analytics partners who may combine
                it with other information that you’ve provided to them or that they’ve collected from your use of
                their services. You consent to our cookies if you continue to use our website.
            </div>
        </div>

        <div class="cookie-consent-banner__actions">
            <button id="cookie-btn-accept" class="cookie-consent-banner__cta">
                OK
            </button>

            <button id="cookie-btn-decline" class="cookie-consent-banner__cta cookie-consent-banner__cta--secondary">
                Decline
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
