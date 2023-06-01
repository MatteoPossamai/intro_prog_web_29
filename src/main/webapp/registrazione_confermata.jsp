<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<link rel="stylesheet" href="stylesheets/login.css">
<link rel="stylesheet" href="stylesheets/global.css">
<t:base>
    <script>
        fetch("visits", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'body='+ encodeURIComponent("registrazione-confermata")
        })
    </script>
    <main>
        <section class="text-image" id="1">
            <p>Registrazione confermata</p>
        </section>
    </main>

</t:base>

