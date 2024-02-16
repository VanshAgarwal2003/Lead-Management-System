<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="in.backend.database"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Lead</title>
<link rel="stylesheet" href="css files/dashboard.css">
</head>
<body>

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
			<h2>Update Lead</h2>
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
					
					conn.close();
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
				<h3>Edit Lead</h3>
			</div>
			<div class="information">

				<form action="adminEditLead" method="post" class="mainForm"
					autocomplete="off">
					<div class="leftForm">
					
					    <%
					    int id=0;
						 	try{						 		
					             id = Integer.parseInt(request.getParameter("id"));
						 	}
					       catch(Exception e)
					       {
					    	   
					       }
					        
							String name="",email="";
							String contact="";
							String address="";
							String source="",owner_mail="",current_owner="",status="",priority="",time="",date="";
									
							
							try {
								Connection conn = database.newConn();
								PreparedStatement ps = conn.prepareStatement("select * from dashboard where id=?");
								ps.setInt(1, id);
							
								ResultSet rs = ps.executeQuery();
								while (rs.next()) 
								{
									name=rs.getString("name");
									email=rs.getString("mail");
								    contact=rs.getString("contact");
								    address=rs.getString("address");
								    source=rs.getString("source");
								    owner_mail=rs.getString("owner_mail");
								    current_owner=rs.getString("current_owner");
								    priority=rs.getString("priority");
								    time=rs.getString("time");
								    date=rs.getString("date");
								    status=rs.getString("status");
								}
								
								conn.close();
							} catch (Exception e) {
								e.printStackTrace();
							}
							%>
						<input type="hidden" name="idval" value=<%= id%>>
						<label for="uname">Name</label> 
						<input type="text" name="name"id="uname" value=<%= name%> required><br>
						<label for="umail">E-mail</label> 
						<input	type="email" name="mail" id="umail" value=<%= email%> readonly><br>
						<label for="unumber">Contact</label> 
						<input type="tel" name="contact" id="unumber" value=<%= contact%> required><br>
						<label for="uaddress">Address</label> <input type="text"
							name="address" id="uaddress" value=<%= address%>
							required><br> <label for="udate">Date</label> 
							<input type="date" name="date" id="udate" value=<%= date%>
							required><br> 
							<label for="usource">Source</label> 
							<input type="text" name="source" id="usource"
							value=<%= source%> required><br>
					</div>
					<div class="rightForm">
						<label for="utime">Time</label> <input type="time" name="time"
							id="utime" value=<%= time%> required><br>
						<label for="owner-umail">Owner Mail</label> <input
							<%try {
								Connection conn = database.newConn();
								email = session.getAttribute("umail").toString();
							
							} catch (Exception e) {
								e.printStackTrace();
							}
							%>
							type="email" name="owner-mail" id="owner-umail"
							value="<%=email%>" readonly><br> <label
							for="current-owner">Current Owner</label> <select
							name="current-owner" id="current-owner">
							<option value=<%= current_owner%>><%= current_owner%></option>
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
							<option value=<%= status%>><%= status%></option>
							<option value="New">New</option>
							<option value="Progress">Progress</option>
							<option value="Finished">Finished</option>
						</select><br> <label for="priority">Priority</label> <select
							name="priority" id="priority">
							<option value=<%= priority%>><%= priority%></option>
							<option value="Low">Low</option>
							<option value="Medium">Medium</option>
							<option value="High">High</option>
						</select><br> 
						<input type="submit" class="btn" value="Update Lead">
					</div>
				</form>
			</div>
		</div>
	</section>


</body>
</html>