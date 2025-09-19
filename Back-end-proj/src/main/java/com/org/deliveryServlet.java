package com.org;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDateTime;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/deliveryservlet")
public class deliveryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("input1");
        String mobile = request.getParameter("input2");
        String flat = request.getParameter("input3");
        String purpose = request.getParameter("input4");
        Timestamp currentTimestamp = Timestamp.valueOf(LocalDateTime.now());

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/backendproject", "root", "root");

            String sql = "INSERT INTO visitor (fullname, mobile, flat, purpose, date_time, approval_status) VALUES (?, ?, ?, ?, ?, 'pending')";
            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, name);
            ps.setString(2, mobile);
            ps.setString(3, flat);
            ps.setString(4, purpose);
            ps.setTimestamp(5, currentTimestamp);

            int result = ps.executeUpdate();

            if (result > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                int visitorId = -1;
                if (rs.next()) visitorId = rs.getInt(1);

                rs.close(); ps.close(); conn.close();

                response.sendRedirect("visitorStatus.jsp?id=" + visitorId);
            } else {
                response.getWriter().println("<h3>Failed to save entry.</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
