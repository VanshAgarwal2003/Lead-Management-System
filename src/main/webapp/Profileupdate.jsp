<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="in.backend.database"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>
<link rel="stylesheet" href="css files/profile.css">
</head>
<body>

	<input type="hidden" id="alertProfileUpdate"
		value="<%=request.getAttribute("status")%>">

	<div class="leftPanel">
		<div class="logo">
			<h1>LMS</h1>
		</div>
		<div class="elements">
			<li><ion-icon name="timer-outline" class="alignment"></ion-icon><a
				href="dashboard.jsp">Dashboard</a></li>

			<li><ion-icon name="trending-up-outline" class="alignment"></ion-icon><a
				href="myLeads.jsp">My Leads</a></li>

			<li><ion-icon name="bar-chart-outline" class="alignment"></ion-icon><a
				href="currentLeads.jsp">Current Leads</a></li>

			<li><ion-icon name="person-outline" class="alignment"></ion-icon><a
				href="profile.jsp">Profile</a></li>

			<li><ion-icon name="help-circle-outline" class="alignment"></ion-icon><a
				href="userHelp.jsp">Help</a></li>

			<li><ion-icon name="log-out-outline" class="alignment"></ion-icon><a
				href="logout">Logout</a></li>
		</div>
	</div>

	<section class="maincontent">
		<div class="topPanel">
			<h2>Update Profile</h2>
			<div>
				<%
				String fname = null;
				String lname = null;
				String username = null;
				try {
					Connection conn = database.newConn();
					String email = session.getAttribute("umail").toString();
					PreparedStatement ps = conn.prepareStatement("select fname,lname from register where mail=?");
					ps.setString(1, email);

					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
						username = rs.getString(1) + " " + rs.getString(2);
					}
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
				<h3>
					<%
					out.print(username);
					%>
				</h3>
			</div>
		</div>

		<div class="divison">
			<div class="alignment2">
				Total Leads
				<ion-icon name="clipboard-outline"></ion-icon>
			</div>
			<div class="alignment2">
				New Leads
				<ion-icon name="trending-up-outline"></ion-icon>
			</div>
			<div class="alignment2">
				Social Media
				<ion-icon name="earth-outline"></ion-icon>
			</div>
			<div class="alignment2">
				Enrolled
				<ion-icon name="receipt-outline"></ion-icon>
			</div>
		</div>
	</section>


	<div class="profileInput">
		<h1>Update Profile</h1>
		<div class="profileSection-Input">

			<form action="updateProfile" method="post" autocomplete="off">
				<label for="ufname">First Name</label> <input type="text"
					placeholder="First name" name="fname" id="ufname" required>
				<hr>
				<label for="ulname">Last Name</label> <input type="text"
					placeholder="Last name" name="lname" id="ulname" required>
				<hr>
				<label for="umail">Email</label> <input type="text"
					placeholder="Email" name="mail" id="umail" required>
				<hr>
				<button class="btnprofileInput">Update</button>
			</form>
		</div>
	</div>

	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script type="text/javascript">
		let alert = document.getElementById("alertProfileUpdate").value;
		if (alert === "true") {
			Swal.fire('Done!', 'Profile Updated Succesfully!', 'success')
		}
	</script>
</body>
</html>