package com.org;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registraionservlet")
public class registraionservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String name = request.getParameter("input1");
        String mobile = request.getParameter("input2");
        String email = request.getParameter("input3");
        String password = request.getParameter("input4");
        String conpassword = request.getParameter("input5");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/backendproject", "root", "root");

            String sql = "INSERT INTO users (fullname, mobile, email, password, conpassword) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, mobile);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, conpassword);

            ps.executeUpdate();
            con.close();

            response.sendRedirect("UserLogin.html");
//            response.getWriter().println("Registration successful!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
