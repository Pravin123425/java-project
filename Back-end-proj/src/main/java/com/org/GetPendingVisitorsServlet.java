package com.org;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/getPendingVisitors")
public class GetPendingVisitorsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String flat = request.getParameter("flat");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/backendproject", "root", "root");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM visitor WHERE flat = ? AND approval_status = 'pending'");
            ps.setString(1, flat);

            ResultSet rs = ps.executeQuery();
            StringBuilder json = new StringBuilder("[");

            while (rs.next()) {
                json.append(String.format(
                    "{\"id\":%d,\"fullname\":\"%s\",\"purpose\":\"%s\"},",
                    rs.getInt("id"), rs.getString("fullname"), rs.getString("purpose")));
            }

            if (json.charAt(json.length() - 1) == ',') {
                json.deleteCharAt(json.length() - 1);
            }
            json.append("]");

            out.print(json.toString());
        } catch (Exception e) {
            e.printStackTrace();
            out.print("[]");
        }
    }
}
