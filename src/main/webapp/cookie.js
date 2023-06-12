setCookie = (cName, cValue, expDay) => {
    console.log("Inserisco un cookie");
    let date = new Date();
    date.setTime(date.getTime() + (expDay * 24 * 60 * 60 * 1000));
    const expires = "expires=" + date.toUTCString();
    document.cookie = cName + '=' + cValue + '; ' + expires + "; path=/";

}
getCookie = (cName) => {
    const name =  cName + '=';
    const cDecoded = decodeURIComponent(document.cookie);
    const cArr =  cDecoded.split("; ");
    let value;
    cArr.forEach(val => {
        if(val.indexOf(name) === 0) value = val.substring(name.length);
    })

    return value;
}

deleteCookies = () => {
    console.log ("Cancello tutti i cookie a cui posso accedere")
    const cookies = document.cookie.split(";");
    for (let i = 0; i < cookies.length; i++) {
        const cookie = cookies[i];
        const eqPos = cookie.indexOf("=");
        const name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
    }
    setCookie("cookie", false, 1);
}

// Cliccando il bottone 'accetta' dal cookie banner, creo un cookie di nome "cookie"
if(navigator.cookieEnabled) { //Se i cookie sono abilitati
    document.querySelector("#cookie-btn-accept").addEventListener("click", () => {
        document.querySelector("#cookies").style.display = "none";
        setCookie("cookie", true, 1);
    })

    document.querySelector("#cookie-btn-decline").addEventListener("click", () => {
        document.querySelector("#cookies").style.display = 'none';
        deleteCookies();
    })

// Se trovo un cookie di nome 'cookie', nascondo il banner
    cookieMessage = () => {
        if (!getCookie("cookie")) {
            document.querySelector("#cookies").style.display = "block";
        }
    }

    window.addEventListener("load", cookieMessage);
}
