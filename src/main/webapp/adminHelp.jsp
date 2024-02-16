<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="in.backend.database"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control"
	content="no-store, no-cache, must-revalidate, max-age=0">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">

<title>Help Desk</title>
<link rel="stylesheet" href="css files/help.css">
</head>
<body>
    <input type="hidden" id="Submit" value="<%= request.getAttribute("formSubmit")%>">
    
	<div class="leftPanel">
		<div class="logo">
			<h1>LMS</h1>
		</div>
		<div class="elements">
			<li><ion-icon name="timer-outline" class="alignment"></ion-icon><a
				href="admin.jsp">Dashboard</a></li>

			<li><ion-icon name="trending-up-outline" class="alignment"></ion-icon><a
				href="adminAllLeads.jsp">All Leads</a></li>

			<li><ion-icon name="bar-chart-outline" class="alignment"></ion-icon><a
				href="allUsers.jsp">All Users</a></li>

			<li><ion-icon name="person-outline" class="alignment"></ion-icon><a
				href="adminProfile.jsp">Profile</a></li>

			<li><ion-icon name="help-circle-outline" class="alignment"></ion-icon><a
				href="adminHelp.jsp">Help</a></li>

			<li><ion-icon name="log-out-outline" class="alignment"></ion-icon><a
				href="logout">Logout</a></li>
		</div>
	</div>

	<section class="maincontent">
		<div class="topPanel">
			<h2>HelpDesk</h2>
			<div>
				<%
				String fname = null;
				String lname = null;
				try {
					Connection conn = database.newConn();
					String email = session.getAttribute("umail").toString();
					PreparedStatement ps = conn.prepareStatement("select fname,lname from register where mail=?");
					ps.setString(1, email);

					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
						fname = rs.getString(1);
						lname = rs.getString(2);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
				<h3>
					<%
					out.print(fname + " " + lname);
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

		<div class="bottomPanel">
			<div class="heading">
				<h3>HelpDesk</h3>
			</div>
			<form action="adminHelp" method="post" class="getInTouch"
				autocomplete="off">
				<div>
					<label>Name</label><br> <input type="text" name="name"
						placeholder="Your name" required /><br>
					<br> <label>Email</label><br> <input type="email"
						name="email" placeholder="Your email" required /><br>
					<br> <label>Mobile</label><br> <input type="tel"
						name="mobile" placeholder="Your mobile" maxlength="10" required /><br>
					<br> <label>Comment</label><br>
					<textarea name="comments" rows="5" cols="35"
						placeholder="Comment here.... "></textarea>
					<br>
					<br>
					
					<input type="submit" class="btn" value="Send">
				</div>
			</form>
		</div>
	</section>
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<script>
	 let alert=document.getElementById("Submit").value;
     if(alert==="true")
     {
   	 Swal.fire(
   			  'Done!',
   			  'Form Submitted Succesfully!',
   			  'success'
   			)
     }

	</script>
</body>
</html>