<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    int visitorId = Integer.parseInt(request.getParameter("id"));
    String status = "pending";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/backendproject", "root", "root");
        PreparedStatement ps = con.prepareStatement("SELECT approval_status FROM visitor WHERE id = ?");
        ps.setInt(1, visitorId);
        
        
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            status = rs.getString("approval_status");
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="5">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
      <style>
    body, html {
      height: 100%;
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
    }

  /* Custom Navbar Color */
    .navbar-custom {
     background-color: #005792; /* A deep modern blue */
    }

    .navbar-custom .navbar-brand,
    .navbar-custom .nav-link {
      color: #fff !important;
    }

     .navbar-custom .nav-link:hover {
     color: #ffd700 !important; /* gold on hover */
     }

    .hero-section {
      background-image: url('https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1470&q=80');
      background-size: cover;
      background-position: center;
      min-height: 100vh;
      padding-top: 80px;
      padding-bottom: 60px;
      backdrop-filter: brightness(0.9);
    }

    .card {
      backdrop-filter: blur(10px);
      background: rgba(255, 255, 255, 0.8);
    }

    .category-card {
      transition: transform 0.3s;
      cursor: pointer;
    }

    .category-card:hover {
      transform: scale(1.05);
    }

    .category-img {
      height: 80px;
      object-fit: contain;
    }
  </style>
    <title>Visitor Approval Status</title>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-custom fixed-top">
  <div class="container">
    <a class="navbar-brand" href="#">Visitor Entry System</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link active" href="Index.html" class="btn btn-primary">Log Out</a>
        </li>
      </ul>
    </div>
  </div>
</nav>



  <!-- Hero Background Section -->
  <div class="hero-section d-flex flex-column justify-content-center align-items-center text-white">
    <div class="container text-center">
      <h1 class="fw-bold mb-5">Select Visitor Type</h1>
      <div class="row g-4 justify-content-center">

        <!-- Delivery -->
        <div class="col-md-3">
          <a href="form.html">
            <div class="card text-center p-3 category-card shadow">
              <img src="https://cdn-icons-png.flaticon.com/512/2331/2331943.png" alt="Delivery" class="category-img mx-auto">
              <h5 class="mt-3">Delivery</h5>
            </div>
          </a>
        </div>

        <!-- Guest -->
        <div class="col-md-3">
          <a href="form.html">
            <div class="card text-center p-3 category-card shadow">
              <img src="https://cdn-icons-png.flaticon.com/512/219/219970.png" alt="Guest" class="category-img mx-auto">
              <h5 class="mt-3">Guest</h5>
            </div>
          </a>
        </div>

        <!-- Housekeeping -->
        <div class="col-md-3">
          <a href="form.html">
            <div class="card text-center p-3 category-card shadow">
              <img src="https://cdn-icons-png.flaticon.com/512/2784/2784445.png" alt="Housekeeping" class="category-img mx-auto">
              <h5 class="mt-3">Housekeeping</h5>
            </div>
          </a>
        </div>

        <!-- Housewife -->
        <div class="col-md-3">
          <a href="form.html">
            <div class="card text-center p-3 category-card shadow">
              <img src="https://cdn-icons-png.flaticon.com/512/3011/3011270.png" alt="Housewife" class="category-img mx-auto">
              <h5 class="mt-3">Housewife</h5>
            </div>
          </a>
        </div>

        <!-- Others -->
        <div class="col-md-3">
          <a href="form.html">
            <div class="card text-center p-3 category-card shadow">
              <img src="https://cdn-icons-png.flaticon.com/512/1077/1077063.png" alt="Others" class="category-img mx-auto">
              <h5 class="mt-3">Others</h5>
            </div>
          </a>
        </div>

      </div>
    </div>
  </div>
  
   <div class="container">
    <div class="card shadow">
      <div class="card-header bg-primary text-white">
        <h4 class="mb-0">Visitor Approval Status</h4>
      </div>
      <div class="card-body">
        <table class="table table-bordered align-middle text-center">
          <tr>
            <td><p class="fw-bold">Visitor ID:</p></td>
            <td><%= visitorId %></td>
          </tr>
          <tr>
            <td><p class="fw-bold">Status:</p></td>
            <td>
              <span class="badge 
                <%= "pending".equalsIgnoreCase(status) ? "bg-warning text-dark" :
                     "approved".equalsIgnoreCase(status) ? "bg-success" : 
                     "bg-danger" %>">
                <%= status.toUpperCase() %>
              </span>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <%
                if ("pending".equalsIgnoreCase(status)) {
              %>
                <p class="text-warning">Please wait while the flat member approves or rejects your request...</p>
              <%
                } else {
              %>
                <p>Your request has been <strong><%= status.toUpperCase() %></strong>.</p>
              <%
                }
              %>
            </td>
          </tr>
        </table>
      </div>
    </div>
  </div>

    
    

  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
