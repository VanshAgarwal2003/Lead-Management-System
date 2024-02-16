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

@WebServlet("/adminHelp")
public class adminHelpDesk extends HttpServlet 
{
	int id = 0;
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
	{
		
		Connection conn = database.newConn();
		String name = req.getParameter("name");
		String mail = req.getParameter("email");
		String mobile = req.getParameter("mobile");
		String comment = req.getParameter("comments");

		try {
			PreparedStatement ps = conn.prepareStatement("insert into helpdesk values(?,?,?,?);");
			ps.setString(1, name);
			ps.setString(2, mail);
			ps.setString(3, mobile);
			ps.setString(4, comment);

			int val = ps.executeUpdate();
			if (val > 0) {
				req.setAttribute("formSubmit", "true");
				RequestDispatcher rd = req.getRequestDispatcher("/adminHelp.jsp");
				try {
					rd.forward(req, resp);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
