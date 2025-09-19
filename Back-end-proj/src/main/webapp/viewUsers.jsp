<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Flat Members (Users)</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-4">Registered Flat Members</h2>

    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Mobile</th>
                <th>Email</th>
                
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/backendproject", "root", "root");

                String query = "SELECT * FROM users";
                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                boolean hasData = false;
                while (rs.next()) {
                    hasData = true;
        %>
                    <tr>
                        <td><%= rs.getInt("userid") %></td>
                        <td><%= rs.getString("fullname") %></td>
                        <td><%= rs.getString("mobile") %></td>
                        <td><%= rs.getString("email") %></td>
                        
                    </tr>
        <%
                }
                if (!hasData) {
        %>
                <tr><td colspan="5">No flat members found.</td></tr>
        <%
                }

                rs.close();
                ps.close();
                con.close();

            } catch (Exception e) {
                out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
               
            }
        %>
        </tbody>
    </table>

    <a href="AdminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
</div>
</body>
</html>
