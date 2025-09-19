package com.org;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/deleteFlatMemberServlet")
public class DeleteFlatMemberServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String flat = request.getParameter("flat");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/backendproject", "root", "root");

            String query = "DELETE FROM flatmember WHERE flat = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, flat);

            int rowsDeleted = ps.executeUpdate();

            if (rowsDeleted > 0) {
                out.println("<h3>Flat member from flat " + flat + " deleted successfully.</h3>");
            } else {
                out.println("<h3>No member found with flat number: " + flat + "</h3>");
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
