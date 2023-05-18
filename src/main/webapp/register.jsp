<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>SignIn</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/register.css" type="text/css"/>


<t:base>
<main>
    <section class="text-image" id="1">
        <img src="images/placeholder.jpeg" alt="placeholder" height="30px" width="30px" class="image-holder-register">
    </section>
<div class="container">
    <form id="form" class="form" method="post" action="signin">
        <div class="form-control">
            <label for="username">Username</label>
            <input type="text" placeholder="Username" id="username" name="username" />
            <i class="fas fa-check-circle"></i>
            <i class="fas fa-exclamation-circle"></i>
            <small>Error message</small>
        </div>
        <div class="form-control">
            <label for="username">Email</label>
            <input type="email" placeholder="prova@test.qualcosa" id="email" name="email" />
            <i class="fas fa-check-circle"></i>
            <i class="fas fa-exclamation-circle"></i>
            <small>Error message</small>
        </div>
        <div class="form-control">
            <label for="username">Password</label>
            <input type="password" placeholder="Password" id="password" name="password"/>
            <i class="fas fa-check-circle"></i>
            <i class="fas fa-exclamation-circle"></i>
            <small>Error message</small>
        </div>
        <div class="form-control">
            <label for="username">Data di nascita</label>
            <input type="month" id="date" name="data_nascita"/>
            <i class="fas fa-check-circle"></i>
            <i class="fas fa-exclamation-circle"></i>
            <small>Error message</small>
        </div>
        <div class="form-control">
            <label for="username">Telefono</label>
            <input type="tel" id="telefono" name="telefono"/>
            <i class="fas fa-check-circle"></i>
            <i class="fas fa-exclamation-circle"></i>
            <small>Error message</small>
        </div>
        <div class="form-control">
            <label for="username">Password check</label>
            <input type="password" placeholder="Password two" id="password2" name="password_check"/>
            <i class="fas fa-check-circle"></i>
            <i class="fas fa-exclamation-circle"></i>
            <small>Error message</small>
        </div>
        <button class="button" type="submit">Submit</button>
        <button class="button" onclick="reset()">Reset</button>
    </form>
</div>
</main>
</t:base>
<script>
    const form = document.getElementById('form');
    const username = document.getElementById('username');
    const email = document.getElementById('email');
    const password = document.getElementById('password');
    const password2 = document.getElementById('password2');
    const  passwordPattern = /^(?=.*\d)(?=.*[$!?])(?=.*[Mm])(?=.*[Ii])(?=.*[Vv])(?=.*[Dd])(?=.*[A-Z])[A-Za-z\d$!?]{8,8}$/;

    form.addEventListener('submit', e => {
        e.preventDefault();

        checkInputs();
    });

    function checkInputs() {
        // trim to remove the whitespaces
        const usernameValue = username.value.trim();
        const emailValue = email.value.trim();
        const passwordValue = password.value.trim();
        const password2Value = password2.value.trim();

        if(usernameValue === '') {
            setErrorFor(username, 'Username cannot be blank');
        } else {
            setSuccessFor(username);
        }

        if(emailValue === '') {
            setErrorFor(email, 'Email cannot be blank');
        } else if (!isEmail(emailValue)) {
            setErrorFor(email, 'Not a valid email');
        } else {
            setSuccessFor(email);
        }

        if(passwordValue === '') {
            setErrorFor(password, 'Password cannot be blank');
        } else {
            setSuccessFor(password);
        }
        if(!passwordPattern.test(passwordValue)) {
            setErrorFor(password, '8 caratteri, [($,?,!),0-9,m,i,d,v]')
        }

        if(password2Value === '') {
            setErrorFor(password2, 'Password2 cannot be blank');
        } else if(passwordValue !== password2Value) {
            setErrorFor(password2, 'Passwords does not match');
        } else{
            setSuccessFor(password2);
        }
    }

    function setErrorFor(input, message) {
        const formControl = input.parentElement;
        const small = formControl.querySelector('small');
        formControl.className = 'form-control error';
        small.innerText = message;
    }

    function setSuccessFor(input) {
        const formControl = input.parentElement;
        formControl.className = 'form-control success';
    }

    function isEmail(email) {
        return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
    }

    function reset(){
        document.getElementById('form').reset();
    }


</script>

