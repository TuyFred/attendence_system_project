<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .update-form-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f8f9fa;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .update-form h4 {
            text-align: center;
            margin-bottom: 20px;
            color: #495057;
        }
        .update-form .form-control {
            margin-bottom: 15px;
        }
        .update-form button {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .update-form button i {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <div class="container update-form-container">
        <h4>Update User</h4>
        <form action="manageUsers.jsp" method="POST" class="update-form">
            <div class="mb-3">
                <input type="hidden" id="updateUserId" name="user_id" value="<%= request.getParameter("user_id") %>">
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                    <input type="text" id="updateUsername" name="username" class="form-control" placeholder="Username" value="<%= request.getParameter("username") %>" required>
                </div>
            </div>
            <div class="mb-3">
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                    <input type="email" id="updateEmail" name="email" class="form-control" placeholder="Email" value="<%= request.getParameter("email") %>" required>
                </div>
            </div>
            <button type="submit" name="updateUser" class="btn btn-primary w-100"><i class="fas fa-save"></i> Save Changes</button>
        </form>
    </div>

    <!-- Bootstrap JS for any additional functionality -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
