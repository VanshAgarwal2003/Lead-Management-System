package in.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminLead")
public class adminDashboard extends HttpServlet 
{
	int id=0;
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
	{
		String name = req.getParameter("name");
		String mail = req.getParameter("mail");
		String contact = req.getParameter("contact");
		String address = req.getParameter("address");
		String date = req.getParameter("date");
		String source = req.getParameter("source");
		String time = req.getParameter("time");
		String owner_mail = req.getParameter("owner-mail");
		String current_owner = req.getParameter("current-owner");
		String status = req.getParameter("status");
		String priority = req.getParameter("priority");
		
		 if(id==0)
		 {
			 id++;
		 }
		 else
		 {
		  id=database.fetch_to_check_ofAdmin();
          id++;
		 }
      
       Connection conn=database.newConn();
       PreparedStatement ps;
	   try 
	   {
		ps = conn.prepareStatement("insert into adminlead values(?,?,?,?,?,?,?,?,?,?,?,?);");
		ps.setInt(1, id);
		ps.setString(2, name);
		ps.setString(3, mail);
		ps.setString(4, contact);
		ps.setString(5, address);
		ps.setString(6, source);
		ps.setString(7, owner_mail);
		ps.setString(8, current_owner);
		ps.setString(9, status);
		ps.setString(10, priority);
		ps.setString(11, time);
		ps.setString(12, date);
		
		ps.executeUpdate();
		conn.close();
	   }
	   catch (SQLException e) 
	   {
		 e.printStackTrace();
	   }

       req.setAttribute("dashboard_update","true");
       RequestDispatcher rd=req.getRequestDispatcher("/admin.jsp");
       
       try 
       {
		rd.forward(req, resp);
	   }
       catch (ServletException e) 
       {
		  e.printStackTrace();
	   } 
       catch (IOException e) 
       {
		e.printStackTrace();
	   }
	}
}
