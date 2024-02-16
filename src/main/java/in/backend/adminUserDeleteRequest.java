package in.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/leadDelete")
public class adminUserDeleteRequest extends HttpServlet
{
  protected void doPost(HttpServletRequest req,HttpServletResponse resp)
  {
	  int id=Integer.parseInt(req.getParameter("idval"));
	  Connection conn=database.newConn();
	  try 
	  {
		 PreparedStatement ps=conn.prepareStatement("delete from dashboard where id=?");
		 ps.setInt(1, id);
		 
		 ps.executeUpdate();
	
		 resp.sendRedirect("allUsers.jsp");
	  } 
	  catch (SQLException e) 
	  {
		e.printStackTrace();
	  } 
	  catch (IOException e) 
	  {
		e.printStackTrace();
	  }
	 
  }
}
