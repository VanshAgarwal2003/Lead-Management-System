
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Autour+One&family=Poppins:wght@400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css files/style.css">

<script type="text/javascript">
        // Disable the back button
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };
</script>
</head>
<body>
	
	<input type="hidden" id="Display"
		value="<%=request.getAttribute("display")%>">

	<section>
		<div class="container">
			<div class="form-section">
				<h2>Login</h2>
				<form action="login" method="post" autocomplete="off">

					<div class="inputbox">
						<ion-icon name="mail-outline"></ion-icon>
						<input type="email" name="mail" id="u-mail" required> <label
							for="u-mail">E-mail</label>
					</div>

					<div class="inputbox">
						<ion-icon name="lock-closed-outline"></ion-icon>
						<input type="password" name="pass" id="u-pass" required> <label
							for="u-pass">Password</label>
					</div>

					<div class="btn2">
						<input type="submit" value="Submit">
					</div>
					<div class="myRegister">
						<h4>New User?</h4>
						<a href="register.jsp"> Register Here</a>
					</div>
				</form>

			</div>
			<div class="userlogin">
				<img src="myImages/loginuser-img.png" alt="">
			</div>
		</div>
	</section>
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
		let display = document.getElementById("Display").value;
		if (display === "true") {
			Swal.fire({
				icon : 'error',
				title : 'Sorry...',
				text : 'Incorrect username and password!'
			})
		}
	</script>
</body>
</html>
