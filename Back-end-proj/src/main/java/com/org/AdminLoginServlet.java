package com.org;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminLoginServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String Username=request.getParameter("input1");
	String Password=request.getParameter("input2");
	
	   try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		 try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/backendproject", "root", "root");
			PreparedStatement ps=con.prepareStatement("select * from Admin where username=? and password=?");
			ps.setString(1, Username);
			ps.setString(2, Password);
			ps.executeQuery();
			PrintWriter out=response.getWriter();
//			out.println("Admin "+Username+"loged in");
			response.sendRedirect("AdminDashboard.jsp");
			
			ps.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      

	}

}
