package in.backend;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateProfile")
public class userProfileupdate  extends HttpServlet
{
     protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException
     {
    	 String fname=req.getParameter("fname");
    	 String lname=req.getParameter("lname");
    	 String mail=req.getParameter("mail");
    	 
    	 int val=database.updateProfiledbs(fname,lname,mail,req);
    	 if(val>0)
    	 {
    		 req.setAttribute("status","true");
    		 RequestDispatcher rd=req.getRequestDispatcher("/Profileupdate.jsp");
    		 rd.forward(req, resp);
    	 }
    	 
     }
}
