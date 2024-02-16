package in.backend;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class userRegister extends HttpServlet 
{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException 
	{
		// Getting Parameters
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String pass = req.getParameter("pass");
		String email = req.getParameter("mail");

		if (fname != null && lname != null && pass != null && email != null) 
		{
			if (database.validateUser(email) == true) 
			{
				req.setAttribute("mail-box", "true");
				RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
				rd.forward(req, resp);
			} 
			else 
			{
				if (database.validateUserPass(pass) == true) 
				{
					req.setAttribute("pass-box", "true");
					RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
					rd.forward(req, resp);
				} 
				else 
				{
					int result = database.insert(fname, lname, email, pass);
					if (result > 0) 
					{
						req.setAttribute("status", "success");

						RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
						rd.forward(req, resp);

					}
				}
			}

		}
	}
}
