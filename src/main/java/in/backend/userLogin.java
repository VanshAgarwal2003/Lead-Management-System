package in.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class userLogin extends HttpServlet
{
    protected void doPost(HttpServletRequest req,HttpServletResponse resp)
    {
    	String mail=req.getParameter("mail");
    	String pass=req.getParameter("pass");
    	String isadmin=req.getParameter("isadmin");
    	
    	String username = "";
		String umail = "";
		
    	try 
    	{
    		Connection conn=database.newConn();
		 	PreparedStatement ps = conn.prepareStatement("select fname,lname,mail,isadmin from register where mail=? and password=?;");
			ps.setString(1, mail);
			ps.setString(2, pass);
			
			
			ResultSet rs = ps.executeQuery();

			while(rs.next()) 
			{
				username = rs.getString("fname") + " " + rs.getString("lname");
				username = username.toUpperCase();
				umail = rs.getString("mail");
				isadmin=rs.getString("isadmin");
			}
			conn.close();
		}
    	catch (SQLException e) 
    	{
			e.printStackTrace();
		}
    	
    	if(isadmin.equals("false")) 
    	{
    		HttpSession session = req.getSession();
			session.setAttribute("uname", username);
			session.setAttribute("umail", umail);
			
			RequestDispatcher rd=req.getRequestDispatcher("/dashboard.jsp");
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
    	else if(isadmin.equals("true"))
    	{
    		HttpSession session = req.getSession();
			session.setAttribute("uname", username);
			session.setAttribute("umail", umail);
			
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
    	else
	 	{
	 		req.setAttribute("display","true");
	 		RequestDispatcher rd=req.getRequestDispatcher("/index.jsp");
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
}
