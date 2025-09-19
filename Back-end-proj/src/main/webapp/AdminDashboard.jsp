<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center mb-4">Admin Dashboard</h2>
        <div class="row">
            <!-- Flat Member Section -->
            <div class="col-md-4">
                <div class="card mb-3 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Flat Members</h5>
                        <a href="viewFlatMembers.jsp" class="btn btn-primary btn-block">View Flat Members</a>
                        <a href="addFlatMember.jsp" class="btn btn-success btn-block">Add Flat Member</a>
                        <a href="deleteFlatMember.jsp" class="btn btn-danger btn-block">Delete Flat Member</a>
                    </div>
                </div>
            </div>

            <!-- User Info Section -->
            <div class="col-md-4">
                <div class="card mb-3 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Users</h5>
                        <a href="viewUsers.jsp" class="btn btn-info btn-block">View All Users</a>
                    </div>
                </div>
            </div>

            <!-- Visitors Section -->
            <div class="col-md-4">
                <div class="card mb-3 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Visitor Entries</h5>
                        <a href="viewVisitors.jsp?type=delivery" class="btn btn-outline-dark btn-block">Delivery Entries</a>
                        <a href="viewVisitors.jsp?type=guest" class="btn btn-outline-dark btn-block">Guest Entries</a>
                        <a href="viewVisitors.jsp?type=housewife" class="btn btn-outline-dark btn-block">House Help Entries</a>
                        <a href="viewVisitors.jsp?type=others" class="btn btn-outline-dark btn-block">Other Entries</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
