<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "in.backend.database" %>
<%@page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate, max-age=0">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">

<title>Profile</title>
 <link rel="stylesheet" href="css files/profile.css">

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
            <li><ion-icon name="timer-outline" class="alignment"></ion-icon><a href="dashboard.jsp">Dashboard</a></li>

            <li><ion-icon name="trending-up-outline" class="alignment"></ion-icon><a href="myLeads.jsp">My Leads</a></li>

            <li><ion-icon name="bar-chart-outline" class="alignment"></ion-icon><a href="currentLeads.jsp">Current Leads</a></li>

            <li><ion-icon name="person-outline" class="alignment"></ion-icon><a href="profile.jsp">Profile</a></li>

            <li><ion-icon name="help-circle-outline" class="alignment"></ion-icon><a href="userHelp.jsp">Help</a></li>

            <li><ion-icon name="log-out-outline" class="alignment"></ion-icon><a href="logout">Logout</a></li>
        </div>
    </div>
    
     <section class="maincontent">
        <div class="topPanel">
            <h2>My Profile</h2>
            <div>
             <%
                String fname=null;
                String lname=null;
                String username=null;
                try
                {
                    Connection conn=database.newConn();
                    String email=session.getAttribute("umail").toString();
                    PreparedStatement ps=conn.prepareStatement("select fname,lname from register where mail=?");
                    ps.setString(1, email);
                    
                    ResultSet rs=ps.executeQuery();
                    while(rs.next())
                    {
                       username=rs.getString(1)+" "+rs.getString(2);         
                    }
                    conn.close();
                  } 
 	            catch(Exception e)
 	            {
 	                e.printStackTrace();
 	            }
                %>
                <h3><% out.print(username);%></h3>
           </div>
           </div>

        <div class="divison">
            <div class="alignment2">Total Leads<ion-icon name="clipboard-outline"></ion-icon></div>
            <div class="alignment2">New Leads<ion-icon name="trending-up-outline"></ion-icon></div>
            <div class="alignment2">Social Media<ion-icon name="earth-outline"></ion-icon></div>
            <div class="alignment2">Enrolled<ion-icon name="receipt-outline"></ion-icon></div>
        </div>
       </section>
       
       <div class="profile">
           <h1>My Profile</h1>
           <div class="profileSection">
           
              <%
              String fname1=null;
              String lname1=null;
              String mail=null;
               try
               {
                   Connection conn=database.newConn();
                   String email=session.getAttribute("umail").toString();
                   PreparedStatement ps=conn.prepareStatement("select fname,lname,mail from register where mail=?");
                   ps.setString(1, email);
                   
                   ResultSet rs=ps.executeQuery();
                   while(rs.next())
                   {
                	   fname1=rs.getString(1);
                	   lname1=rs.getString(2);
                	   mail=rs.getString(3);
                   }
                   conn.close();
                 } 
	            catch(Exception e)
	            {
	                e.printStackTrace();
	            }
                %>
                
	              <h1>First Name:<span id="displayProfile"><% out.print(fname1); %></span></h1><hr>
	              <h1>Last Name:<span id="displayProfile"><% out.print(lname1); %></span></h1><hr>
	              <h1>Email id:<span id="displayProfile"><% out.print(mail); %></span></h1><hr>
           </div>
           <a class="btnProfile-a" href="Profileupdate.jsp"><button class="btnprofile">Update Profile</button></a>
       </div>
    
     <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>