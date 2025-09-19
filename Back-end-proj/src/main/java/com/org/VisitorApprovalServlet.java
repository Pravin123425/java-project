package com.org;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/approveVisitor")
public class VisitorApprovalServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String decision = request.getParameter("decision");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/backendproject", "root", "root");

            PreparedStatement ps = con.prepareStatement("UPDATE visitor SET approval_status = ? WHERE id = ?");
            ps.setString(1, decision);
            ps.setInt(2, Integer.parseInt(id));

            int result = ps.executeUpdate();
            response.getWriter().println("Visitor has been " + decision);
        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
