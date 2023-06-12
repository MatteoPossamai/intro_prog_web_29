<%@ page contentType="text/html;charset=UTF-8" %>
	<jsp:useBean id="activity1" scope="request" class="com.projects.intro_prog_web_29.Activity"></jsp:useBean>
	<jsp:useBean id="activity2" scope="request" class="com.projects.intro_prog_web_29.Activity"></jsp:useBean>
	<jsp:useBean id="activity3" scope="request" class="com.projects.intro_prog_web_29.Activity"></jsp:useBean>
	<html>

	<head>
		<link rel="icon" href="favicon.ico" type="image/x-icon">
		<link href='https://fonts.googleapis.com/css?family=Lexend' rel='stylesheet'>
		<link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
		<link href="stylesheets/simpatizzante.css" rel="stylesheet" type="text/css">
		<link href="stylesheets/global.css" rel="stylesheet" type="text/css">
		<title>Tum4World</title>
	</head>
	<script type="text/javascript" src="${pageContext.request.contextPath}/index.js"></script>

	<jsp:include page="header.jsp"></jsp:include>

	<script>
		fetch("visits", {
			method: 'POST',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			body: 'body=' + encodeURIComponent("Simpatizzante")
		})
	</script>

	<body>
		<main class="content">

			<div>
				<h1 class="title">Benvenuto/a Simpatizzante!</h1>
				<div style="display: flex; gap: 100px">
					<button class="button" onclick="show('popup-profilo')">Visualizza i tuoi dati</button>
					<a href="simpatizzante?action=delete"><button class="button" id="elimina-iscrizione"
							value="Cancella la mia iscrizione">Cancella la mia iscrizione</button></a>
				</div>
			</div>
			<div>
				<h2>Scegli a quali attività vuoi iscriverti!</h2>

				<form class="simpatizzante-form" method="get">
					<table class="simpatizzante-table">
						<tr>
							<td>
								<img src="<%=activity1.getImageSource()%>" class="image-choice" onclick="checkCheckbox('attivita1')">
								<br>
								<input type="checkbox" id="attivita1" name='<%=activity1.getTitle()%>'
									value="<%=activity1.getTitle()%>">
								<label class="simpatizzante-label" for="attivita1">
									<%=activity1.getTitle()%>
								</label>
							</td>
							<td>
								<img src="<%=activity2.getImageSource()%>" class="image-choice" onclick="checkCheckbox('attivita2')">
								<br>
								<input type="checkbox" id="attivita2" name="<%=activity2.getTitle()%>"
									value="<%=activity2.getTitle()%>">
								<label class="simpatizzante-label" for="attivita2">
									<%=activity2.getTitle()%>
								</label>
							</td>
							<td>
								<img src="<%=activity3.getImageSource()%>" class="image-choice" onclick="checkCheckbox('attivita3')">
								<br>
								<input type="checkbox" id="attivita3" name="<%=activity3.getTitle()%>"
									value="<%=activity3.getTitle()%>"><label class="simpatizzante-label" for="attivita3">
									<%=activity3.getTitle()%>
								</label>
							</td>
						</tr>
					</table>
					<button class="button" type="submit" value="Iscriviti" class="simpatizzante-button">Conferma</button>
				</form>
			</div>
		</main>

		<div id="popup-profilo" class="simpatizzante-popup-profilo">
			<div class="simpatizzante-popup-content">
				<span class="close" onclick="hide('popup-profilo')">&times;</span>
				<p>Informazioni del profilo</p>
				<div class="dati-utente">
					<li> Nome: ${user_nome}</li>
					<li> Cognome: ${user_cognome}</li>
					<li> Username: ${user_username}</li>
					<li> Password: ${user_password}</li>
					<li> Email: ${user_email}</li>
					<li> Data di nascita: ${user_data_nascita}</li>
					<li> Telefono: ${user_telefono}</li>
				</div>
			</div>
		</div>
	</body>
	<jsp:include page="phrase.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	<script>
		function checkCheckbox(checkboxId) {
			document.getElementById(checkboxId).checked = document.getElementById(checkboxId).checked === false;
		}
		function show(element) {
			document.getElementById(element).style.display = "block";

		}
		function hide(element) {
			document.getElementById(element).style.display = "none";
		}
	</script>

	</html>