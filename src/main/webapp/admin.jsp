<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Attendance Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            display: flex;
            min-height: 100vh;
            margin: 0;
            flex-direction: column;
        }
        .sidebar {
            background-color: #343a40;
            padding: 20px;
            min-width: 200px;
            height: 100%;
            position: fixed;
        }
        .sidebar a {
            color: #ffffff;
            text-decoration: none;
            display: block;
            margin: 10px 0;
        }
        .sidebar a:hover {
            background-color: #495057;
            padding-left: 10px;
            transition: all 0.3s;
        }
        .content {
            margin-left: 220px; /* Space for sidebar */
            padding: 20px;
            flex: 1;
        }
        .dashboard-container {
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #0000001a;
            margin-bottom: 20px;
        }
        .footer {
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
            padding: 20px;
            position: relative;
            bottom: 0;
            width: 100%;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #0000001a;
            margin-bottom: 20px;
        }
        .card .card-body {
            display: flex;
            align-items: center;
        }
        .card i {
            font-size: 2rem;
            margin-right: 15px;
            color: #495057;
        }
        .chart-container {
            width: 100%;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h4 class="text-white">Admin Dashboard</h4>
        <a href="manageUsers.jsp"><i class="fas fa-users"></i> Manage Users</a>
        <a href="recordAttendance.jsp"><i class="fas fa-calendar-check"></i> View Attendance Records</a>
        <a href="#"><i class="fas fa-chart-line"></i> Attendance Analysis</a>
        <a href="#"><i class="fas fa-cogs"></i> Settings</a>
        <a href="generateRepot.js"><i class="fas fa-cogs"></i>GENERATE REPORT</a>
    </div>

    <div class="content">
        <h3 class="text-center">Welcome, Admin</h3>

        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <i class="fas fa-users"></i>
                        <div>
                            <h5>120</h5>
                            <p>Registered Users</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <i class="fas fa-calendar-check"></i>
                        <div>
                            <h5>95%</h5>
                            <p>Attendance Rate</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <i class="fas fa-chart-line"></i>
                        <div>
                            <h5>30%</h5>
                            <p>Absenteeism Rate</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="dashboard-container">
            <h4 class="text-center">Attendance Analysis</h4>
            <div class="chart-container">
                <canvas id="attendanceChart"></canvas>
            </div>
        </div>
    </div>

    <div class="footer">
        &copy; 2024 Attendance Management System
    </div>

    <script>
        const ctx = document.getElementById('attendanceChart').getContext('2d');
        const attendanceChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June'],
                datasets: [{
                    label: 'Attendance Rate (%)',
                    data: [90, 85, 80, 95, 92, 88],
                    backgroundColor: '#007bff'
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>
