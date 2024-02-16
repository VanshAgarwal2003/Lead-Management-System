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

<title>All Leads</title>
<link rel="stylesheet" href="css files/dashboard.css">
<link rel="stylesheet" href="css files/myleads.css">


</head>
<body>
     <div class="leftPanel">
        <div class="logo">
            <h1>LMS</h1>
        </div>
        <div class="elements">
            <li><ion-icon name="timer-outline" class="alignment"></ion-icon><a href="admin.jsp">Dashboard</a></li>

            <li><ion-icon name="trending-up-outline" class="alignment"></ion-icon><a href="adminAllLeads.jsp">All Leads</a></li>

            <li><ion-icon name="bar-chart-outline" class="alignment"></ion-icon><a href="allUsers.jsp">All Users</a></li>

            <li><ion-icon name="person-outline" class="alignment"></ion-icon><a href="adminProfile.jsp">Profile</a></li>

            <li><ion-icon name="help-circle-outline" class="alignment"></ion-icon><a href="adminHelp.jsp">Help</a></li>

            <li><ion-icon name="log-out-outline" class="alignment"></ion-icon><a href="logout">Logout</a></li>
        </div>
    </div>
    
    <section class="maincontent">
        <div class="topPanel">
            <h2>All Leads</h2>
            <div>
                 <%
                String fname=null;
                String lname=null;
                String username=null;
                String email="";
                try
                {
                    Connection conn=database.newConn();
                    email=session.getAttribute("umail").toString();
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

        <div class="bottomPanel">
            <div class="heading">
                <h3>Leads</h3>
            </div>
        </div>
    </section>
    
       
    
      <div class="myLeadsSection">
          <div class="pagination">
            <table cellspacing="2" border=0  width="100%" >
		        <tr>
		            <th>Name</th>
		            <th>Email</th>
		            <th>Source</th>
		            <th>Date</th>
		            <th>Owner</th>
		            <th>Action</th>
		         </tr>
		        <%
		         int start=0,dataCount=3,total=0;
		         int i=0,pageNumber=0,pageNo=0;
		        try
                {
		            pageNumber=request.getParameter("pageNumber")==null?0:Integer.parseInt(request.getParameter("pageNumber"));
		            pageNo=pageNumber;
		        	start=pageNumber*dataCount;
		        	
                    Connection conn=database.newConn();
                    PreparedStatement ps = conn.prepareStatement("select * from dashboard limit ? offset ?;");
                    ps.setInt(1, dataCount);
                    ps.setInt(2, start);
                    
                    
                    ResultSet rs=ps.executeQuery();
                    while(rs.next()){ %>
                         <tr>
				            <td><%= rs.getString("name") %></td>
				            <td><%= rs.getString("mail") %></td>
				            <td><%= rs.getString("source") %></td>
				            <td><%= rs.getString("date") %></td>
				            <td><%= rs.getString("current_owner") %></td>
				            <td><a href="adminLeadUpdating.jsp?id=<%= rs.getInt("id")%>"><button class="updateLead">Update</button></a></td>
                         </tr>
                    <%}
                    
                    PreparedStatement ps1=conn.prepareStatement("select count(*) from dashboard;");
                    
                    ResultSet rs1=ps1.executeQuery();
                    if(rs1.next())
                    {
                    	total=rs1.getInt(1);
                    	
                    }
                   
                    
                    conn.close();
                  } 
 	            catch(Exception e)
 	            {
 	                e.printStackTrace();
 	            }
		        %>
		        
		        <% int totalPages = (total + dataCount - 1) / dataCount; %>
				<% for(i=0; i<totalPages; i++) { %>
				    <a href="?pageNumber=<%= i %>"></a> 
				<% } %>

			      
		        <input type="hidden" value=<%= request.getAttribute("leadUpdateDone")%> id="dialogBox"/>
            </table>
          </div>
   
          <a href="adminAllLeads.jsp?pageNumber=<%= pageNo-1%>"><div class="prevButton <%= (start==0)?"disable":"" %>">Prev</div></a>
          <a href="adminAllLeads.jsp?pageNumber=<%= pageNo+1%>"><div class="nextButton <%= (dataCount+start>total)?"disable":"" %>">Next</div></a>
       </div>
       
       
     <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <script>
	    let alert=document.getElementById("dialogBox").value;
	    if(alert=="true")
	    {
	    Swal.fire({
	    	  title: "Done!",
	    	  text: "Lead Updated!",
	    	  icon: "success"
	    	});
	    }
    </script>
    
    
</body>
</html>