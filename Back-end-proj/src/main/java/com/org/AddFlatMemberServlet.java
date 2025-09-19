package com.org;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/addFlatMemberServlet")
public class AddFlatMemberServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String flat = request.getParameter("flat");
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/backendproject", "root", "root");

            String query = "INSERT INTO flatmember (flat, name, mobile) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, flat);
            ps.setString(2, name);
            ps.setString(3, mobile);

            int result = ps.executeUpdate();
            if (result > 0) {
                out.println("<h3>Flat member added successfully.</h3>");
            } else {
                out.println("<h3>Failed to add flat member.</h3>");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(out);
        }

        out.println("<br><a href='AdminDashboard.jsp'>Back to Dashboard</a>");
    }
}
