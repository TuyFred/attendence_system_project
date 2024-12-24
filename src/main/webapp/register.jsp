<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Attendance Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .register-container {
            margin-top: 100px;
            max-width: 400px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #0000001a;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .footer {
            margin-top: 100px;
            padding: 20px;
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="register-container mx-auto">
            <h3 class="text-center">Register</h3>
            <form action="Register-process.jsp" method="post">
                <input type="text" name="username" class="form-control" placeholder="Username" required>
                <input type="password" name="password" class="form-control" placeholder="Password" required>
                <button type="submit" class="btn btn-success w-100"><i class="fas fa-user-plus"></i> Register</button>
            </form>
            <p class="text-center mt-3"><a href="login.jsp">Already have an account? Login</a></p>
        </div>
    </div>
    <div class="footer">
        &copy; 2024 Attendance Management System
    </div>
</body>
</html>
