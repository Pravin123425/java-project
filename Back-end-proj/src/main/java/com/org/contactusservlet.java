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


@WebServlet("/contactusservlet")
public class contactusservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public contactusservlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Name=request.getParameter("input1");
		String Email=request.getParameter("input2");
		String Message=request.getParameter("input3");
		
		PrintWriter out=response.getWriter();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/backendproject","root","root");
				PreparedStatement ps=con.prepareStatement("insert into contactus(Name,Email,Message) values(?,?,?)");
				ps.setString(1, Name);
				ps.setString(2, Email);
				ps.setString(3, Message);
				ps.execute();
				
				
				
				ps.close();
				con.close();
				out.println(" We will Contact You Soon!");
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
