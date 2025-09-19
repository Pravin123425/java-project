<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Flat Member</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Add New Flat Member</h2>
    <form action="addFlatMemberServlet" method="get">
        <div class="form-group">
            <label for="flat">Flat Number</label>
            <input type="text" class="form-control" id="flat" name="flat" required>
        </div>
        <div class="form-group">
            <label for="name">Member Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="mobile">Mobile Number</label>
            <input type="text" class="form-control" id="mobile" name="mobile" required>
        </div>
        <button type="submit" class="btn btn-success">Add Member</button>
        <a href="AdminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </form>
</div>
</body>
</html>
