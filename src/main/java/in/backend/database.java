package in.backend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class database {
	private static Connection conn;
	private static final String url = "jdbc:postgresql://localhost:5433/lms_db";
	private static final String user = "postgres";
	private static final String pass = "2003";

	static void getConn() throws ClassNotFoundException {
		Class.forName("org.postgresql.Driver");

		try {
			conn = DriverManager.getConnection(url, user, pass);
//        if(conn!=null)
//        {
//        	System.out.println("Connection successful");
//        }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection newConn() {
		Connection conn = null;
		try {
			String url = "jdbc:postgresql://localhost:5433/lms_db";
			String user = "postgres";
			String pass = "2003";
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			System.out.println(e);
		}
		return conn;
	}

	static int insert(String fname, String lname, String mail, String pass) {
		int result = 0;
		try {
			getConn();
			PreparedStatement ps = conn.prepareStatement("insert into register values(?,?,?,?);");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, mail);
			ps.setString(4, pass);

			result = ps.executeUpdate();
			conn.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	static boolean select(String mail, String pass, HttpServletRequest req) throws SQLException {
		Boolean bool = false;
		String username = "";
		String umail = "";
		try {
			getConn();
			PreparedStatement ps = conn.prepareStatement("select fname,lname,mail,isadmin from register where mail=? and password=?;");
			ps.setString(1, mail);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				username = rs.getString("fname") + " " + rs.getString("lname");
				username = username.toUpperCase();
				umail = rs.getString("mail");

				HttpSession session = req.getSession();
				session.setAttribute("uname", username);
				session.setAttribute("umail", umail);
				bool = true;
			}
			conn.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return bool;
	}

	static boolean validateUser(String mail) {
		Boolean bool = false;
		try {
			getConn();
			PreparedStatement ps = conn.prepareStatement("select * from register where mail=?;");
			ps.setString(1, mail);

			ResultSet rs = ps.executeQuery();
			if (rs.next() == true) {
				bool = true;
			}
			conn.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bool;
	}

	static boolean validateUserPass(String pass) {
		Boolean bool = false;
		try {
			getConn();
			PreparedStatement ps = conn.prepareStatement("select * from register where password=?;");
			ps.setString(1, pass);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				bool = true;
			}
			conn.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bool;
	}

	static void insert_dashboardContent(String name, String mail, String contact, String address, String date,
			String time, String source, String owner_mail, String current_owner, String status, String priority,
			int id) {
		try {
			getConn();
			PreparedStatement ps = conn.prepareStatement("insert into dashboard values(?,?,?,?,?,?,?,?,?,?,?,?);");
			ps.setString(1, name);
			ps.setString(2, mail);
			ps.setString(3, contact);
			ps.setString(4, address);
			ps.setString(5, source);
			ps.setString(6, owner_mail);
			ps.setString(7, current_owner);
			ps.setString(8, status);
			ps.setString(9, priority);
			ps.setString(10, time);
			ps.setString(11, date);
			ps.setInt(12, id);

			ps.executeUpdate();
			conn.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	static int updateProfiledbs(String fname, String lname, String mail, HttpServletRequest req) {
		int val = 0;
		HttpSession session = req.getSession();
		String umail = session.getAttribute("umail").toString();
		try {
			getConn();
			PreparedStatement ps = conn.prepareStatement("update register set fname=?,lname=?,mail=? where mail=?;");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, mail);
			ps.setString(4, umail);

			val = ps.executeUpdate();

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return val;
	}

	static int fetch_to_check_ofUsers() {
		int val=0;
		try 
		{
			getConn();
			PreparedStatement ps = conn.prepareStatement("SELECT id FROM dashboard ORDER BY id DESC LIMIT 1;");
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				val=rs.getInt(1);
			}
			conn.close();

		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return val;
	}
	
	static void updateLeads(String name,String mail,String contact,String address,String date,String time,String source,String owner_mail,String current_owner,String status,String priority,int id)
	{
		try {
			getConn();
			PreparedStatement ps = conn.prepareStatement("update dashboard set name=?,mail=?,contact=?,address=?,source=?,owner_mail=?,current_owner=?,status=?,priority=?,time=?,date=? where id=?;");
			ps.setString(1, name);
			ps.setString(2, mail);
			ps.setString(3, contact);
			ps.setString(4, address);
			ps.setString(5, source);
			ps.setString(6, owner_mail);
			ps.setString(7, current_owner);
			ps.setString(8, status);
			ps.setString(9, priority);
			ps.setString(10, time);
			ps.setString(11, date);
			ps.setInt(12, id);

			ps.executeUpdate();
			conn.close();

		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	static int fetch_to_check_ofAdmin() {
		int val=0;
		try 
		{
			getConn();
			PreparedStatement ps = conn.prepareStatement("SELECT id FROM adminlead ORDER BY id DESC LIMIT 1;");
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				val=rs.getInt(1);
			}
			conn.close();

		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return val;
	}
	
}
