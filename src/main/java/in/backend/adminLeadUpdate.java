package in.backend;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminEditLead")
public class adminLeadUpdate extends HttpServlet
{
    protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException
    {
    	 String name=req.getParameter("name");
    	 String mail=req.getParameter("mail");
    	 String contact=req.getParameter("contact");
    	 String address=req.getParameter("address");
    	 String date=req.getParameter("date");
    	 String source=req.getParameter("source");
    	 String time=req.getParameter("time");
    	 String owner_mail=req.getParameter("owner-mail");
    	 String current_owner=req.getParameter("current-owner");
    	 String status=req.getParameter("status");
         String priority=req.getParameter("priority");
         
         int id=Integer.parseInt(req.getParameter("idval"));
         
         database.updateLeads(name,mail,contact,address,date,time,source,owner_mail,current_owner,status,priority,id);
         
         req.setAttribute("leadUpdateDone","true");
         RequestDispatcher rd=req.getRequestDispatcher("/adminAllLeads.jsp");
         rd.forward(req, resp);
    }
}
