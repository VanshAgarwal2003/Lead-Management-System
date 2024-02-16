<%@page import="in.backend.database"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="Expires" content="0">

<title>Dashboard</title>
<link rel="stylesheet" href="css files/dashboard.css">

</head>

<body>
    <%
     response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    if(session.getAttribute("email")==" ")
    {
    	response.sendRedirect("index.jsp");
    }
    %>
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
			<h2>Dashboard</h2>
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
				<h3>Add New Lead</h3>
			</div>
			<div class="information">
				<form action="dashboard" method="post" class="mainForm"
					autocomplete="off">
					<div class="leftForm">
						<label for="uname">Name</label> <input type="text" name="name"
							id="uname" placeholder="Enter the name" required><br>
						<label for="umail">E-mail</label> <input
							<%String email = "";
try {
	Connection conn = database.newConn();
	email = session.getAttribute("umail").toString();

} catch (Exception e) {
	e.printStackTrace();
}%>
							type="email" name="mail" id="umail" value=<%=email%> readonly><br>
						<label for="unumber">Contact</label> <input type="tel"
							name="contact" id="unumber"
							placeholder="Enter the contact number" required><br>
						<label for="uaddress">Address</label> <input type="text"
							name="address" id="uaddress" placeholder="Enter the address"
							required><br> <label for="udate">Date</label> <input
							type="date" name="date" id="udate" placeholder="Enter the date"
							required><br> <label for="usource">Source</label> <input
							type="text" name="source" id="usource"
							placeholder="Enter the source" required><br>
					</div>
					<div class="rightForm">
						<label for="utime">Time</label> <input type="time" name="time"
							id="utime" placeholder="Enter the time" required><br>
						<label for="owner-umail">Owner Mail</label> <input
							<%try {
	Connection conn = database.newConn();
	email = session.getAttribute("umail").toString();

} catch (Exception e) {
	e.printStackTrace();
}%>
							type="email" name="owner-mail" id="owner-umail"
							value="<%=email%>" readonly><br> <label
							for="current-owner">Current Owner</label> <select
							name="current-owner" id="current-owner">
							<option value="Select current owner">Select current
								owner</option>
							<%
							List<String> ls = new ArrayList<String>();
							try {
								Connection conn = database.newConn();
								PreparedStatement ps = conn.prepareStatement("select mail from register;");

								ResultSet rs = ps.executeQuery();

								while (rs.next()) {
									String val = rs.getString(1);
									ls.add(val);
								}
								for (String i : ls) {
							%>
							<option><%=i%></option>
							<%
							}
							} catch (Exception e) {
							e.printStackTrace();
							}
							%>
						</select><br> <label for="status">Status</label> <select name="status"
							id="status">
							<option value="Enter status">Enter status</option>
							<option value="New">New</option>
							<option value="Progress">Progress</option>
							<option value="Finished">Finished</option>
						</select><br> <label for="priority">Priority</label> <select
							name="priority" id="priority">
							<option value="Enter Priority">Enter Priority</option>
							<option value="Low">Low</option>
							<option value="Medium">Medium</option>
							<option value="High">High</option>
						</select><br> 
						<input type="submit" class="btn" value="Add Lead">
						<input type="hidden" id="dashboardUpdate"
							value="<%=request.getAttribute("dashboard_update")%>" />
					</div>
				</form>
			</div>
		</div>
	</section>
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
		let alert = document.getElementById("dashboardUpdate").value;
		if (alert == "true") {
			Swal.fire({
				title : "Done!",
				text : "Lead Added Successfully!",
				icon : "success"
			});
		}
	</script>
</body>

</html>