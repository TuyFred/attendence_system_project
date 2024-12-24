<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            background-color: #007bff; /* Blue color */
        }
        .navbar-brand, .navbar .nav-link {
            color: #ffffff;
        }
        .navbar .nav-link:hover {
            color: #d0e1ff; /* Light blue on hover */
        }
        .carousel-item {
            height: 75vh;
            min-height: 250px;
            background-size: cover;
            background-position: center;
        }
        .carousel-caption {
            bottom: 100px;
            background: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
            padding: 15px;
            border-radius: 5px;
        }
        .carousel-caption h1 {
            font-size: 2rem;
            font-weight: bold;
            color: #ffffff; /* White text */
        }
        .carousel-caption p {
            font-size: 1rem;
            color: #f8f9fa; /* Light text */
        }
        .mirrored-text {
            font-size: 1.5rem;
            color: rgba(255, 255, 255, 0.8);
            text-shadow: 0px -1px 10px rgba(0, 0, 0, 0.5);
            transform: scaleY(-1);
            margin-top: 20px;
        }
        .container {
            flex: 1;
            margin-top: 10px;
        }
        .footer {
            padding: 10px;
            background-color: #343a40; /* Dark gray */
            color: #ffffff;
            text-align: center;
            width: 100%;
            margin-top: auto;
        }
        .footer .social-icons a {
            color: #007bff; /* Blue icons */
            margin: 0 5px;
            font-size: 1rem;
        }
        .footer .social-icons a:hover {
            color: #0056b3; /* Darker blue on hover */
        }
        /* Ensure the carousel images are responsive */
        .carousel-item img {
            width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">Attendance System</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" style="background-image: url('3.jpg');">
                <div class="carousel-caption d-none d-md-block">
                    <h1>Welcome to Attendance Management</h1>
                    <p>Manage and track your attendance efficiently.</p>
                    <a href="login.jsp" class="btn btn-primary btn-sm"><i class="fas fa-sign-in-alt"></i> Get Started</a>
                    <div class="mirrored-text">Welcome to Attendance Management</div>
                </div>
            </div>
            <div class="carousel-item" style="background-image: url('2.jpg');">
                <div class="carousel-caption d-none d-md-block">
                    <h1>Reliable Attendance Solutions</h1>
                    <p>Streamlined for convenience and accuracy.</p>
                    <a href="login.jsp" class="btn btn-primary btn-sm"><i class="fas fa-sign-in-alt"></i> Get Started</a>
                    <div class="mirrored-text">Reliable Attendance Solutions</div>
                </div>
            </div>
            <div class="carousel-item" style="background-image: url('3.jpg');">
                <div class="carousel-caption d-none d-md-block">
                    <h1>Track and Analyze Attendance</h1>
                    <p>Stay on top of attendance records with ease.</p>
                    <a href="login.jsp" class="btn btn-primary btn-sm"><i class="fas fa-sign-in-alt"></i> Get Started</a>
                    <div class="mirrored-text">Track and Analyze Attendance</div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <div class="footer">
        &copy; 2024 Attendance Management System
        <div class="social-icons">
            <a href="https://www.youtube.com" target="_blank"><i class="fab fa-youtube"></i></a>
            <a href="https://www.linkedin.com" target="_blank"><i class="fab fa-linkedin"></i></a>
            <a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
            <a href="https://www.twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
