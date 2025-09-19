<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Visitor Entries</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-4">All Visitor Entries</h2>

    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/backendproject", "root", "root");

            String query = "SELECT * FROM visitor ORDER BY date_time DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
    %>
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Mobile</th>
                        <th>Flat</th>
                        <th>Purpose</th>
                        <th>Date & Time</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    boolean hasData = false;
                    while (rs.next()) {
                        hasData = true;
                %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("fullname") %></td>
                        <td><%= rs.getString("mobile") %></td>
                        <td><%= rs.getString("flat") %></td>
                        <td><%= rs.getString("purpose") %></td>
                        <td><%= rs.getTimestamp("date_time") %></td>
                        <td><%= rs.getString("approval_status") %></td>
                    </tr>
                <%
                    }
                    if (!hasData) {
                %>
                    <tr>
                        <td colspan="7" class="text-center">No visitor entries found.</td>
                    </tr>
                <%
                    }
                    rs.close();
                    ps.close();
                    con.close();
                %>
                </tbody>
            </table>
    <%
        } catch (Exception e) {
            out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
            
        }
    %>

    <a href="AdminDashboard.jsp" class="btn btn-secondary mt-4">Back to Dashboard</a>
</div>
</body>
</html>
