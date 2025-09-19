<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Flat Member</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Delete Flat Member</h2>
    <form action="deleteFlatMemberServlet" method="get">
        <div class="form-group">
            <label for="flat">Flat Number</label>
            <input type="text" class="form-control" id="flat" name="flat" required>
        </div>
        <button type="submit" class="btn btn-danger">Delete Member</button>
        <a href="AdminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </form>
</div>
</body>
</html>
