package in.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminUpdate")
public class adminprofileupdate extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String mail = req.getParameter("mail");

		int val = 0;
		HttpSession session = req.getSession();
		String umail = session.getAttribute("umail").toString();
		try {
			Connection conn=database.newConn();
			PreparedStatement ps = conn.prepareStatement("update register set fname=?,lname=?,mail=? where mail=?;");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, mail);
			ps.setString(4, umail);

			val = ps.executeUpdate();

			conn.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		if (val > 0) {
			req.setAttribute("status", "true");
			RequestDispatcher rd = req.getRequestDispatcher("adminProfileUpdate.jsp");
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
