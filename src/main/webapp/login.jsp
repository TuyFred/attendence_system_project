<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Attendance Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            height: 100vh;
            justify-content: center; /* Center vertically */
        }
        .login-container {
            margin: auto;
            max-width: 400px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #0000001a;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .footer {
            padding: 10px;
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
            margin-top: auto; /* Push footer to the bottom */
        }
        .social-icons a {
            color: #ffffff;
            margin: 0 10px;
            font-size: 1.2rem;
        }
        .input-group-text {
            background-color: #f8f9fa; /* Match input background */
            border: 1px solid #ced4da; /* Ensure border is consistent */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container mx-auto">
            <h3 class="text-center mb-4">Login</h3>
            <form action="Login-process.jsp" method="post">
                <div class="input-group mb-3">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                    <input type="text" name="username" class="form-control" placeholder="Username" required>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    <input type="password" name="password" class="form-control" placeholder="Password" required>
                </div>
                <button type="submit" class="btn btn-primary w-100 mb-2">
                    <i class="fas fa-sign-in-alt"></i> Login
                </button>
            </form>
            <p class="text-center mt-3">
                <a href="register.jsp">Don't have an account? Register</a>
            </p>
            <a href="index.jsp" class="btn btn-secondary w-100">
                <i class="fas fa-home"></i> Back to Home
            </a>
        </div>
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
</body>
</html>
