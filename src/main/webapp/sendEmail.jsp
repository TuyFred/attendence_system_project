<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Email</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body { 
            background-color: #f8f9fa;
        }
        .email-form {
            max-width: 600px;
            margin: 50px auto;
            background: #ffffff;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .email-form h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
        }
        .form-group i {
            margin-right: 10px;
        }
        .btn-submit {
            width: 100%;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="email-form">
            <h2><i class="fas fa-envelope"></i> Send Email</h2>
            <form action="SendEmailServlet" method="post">
                <div class="form-group">
                    <label for="to"><i class="fas fa-user"></i> To:</label>
                    <input type="email" class="form-control" id="to" name="to" placeholder="Enter recipient's email" required>
                </div>

                <div class="form-group">
                    <label for="subject"><i class="fas fa-edit"></i> Subject:</label>
                    <input type="text" class="form-control" id="subject" name="subject" placeholder="Enter email subject" required>
                </div>

                <div class="form-group">
                    <label for="body"><i class="fas fa-comment-dots"></i> Message:</label>
                    <textarea class="form-control" id="body" name="body" rows="5" placeholder="Write your message" required></textarea>
                </div>

                <button type="submit" class="btn btn-primary btn-submit">
                    <i class="fas fa-paper-plane"></i> Send Email
                </button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


