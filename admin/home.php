<?php


require_once("../include/initialize.php");
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "Internship";

$database = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($database->connect_error) {
    die("Connection failed: " . $database->connect_error);
}

// Function to execute SQL queries
function executeSQL($sql) {
    global $database;
    $result = $database->query($sql);
    return $result;
}

// Query for Hired Students Section
// Query for Hired, Pending, and In-Progress Students Section
$sqlHiringStatus = "SELECT COMPANYID, 
                            SUM(CASE WHEN remarks = 'approved' THEN 1 ELSE 0 END) AS hired,
                            SUM(CASE WHEN remarks = 'pending' THEN 1 ELSE 0 END) AS pending,
                            SUM(CASE WHEN remarks = 'In Progress' THEN 1 ELSE 0 END) AS in_progress
                    FROM tbljobregistration
                    WHERE remarks IN ('approved', 'pending', 'In Progress')
                    GROUP BY COMPANYID";
$resultHiringStatus = executeSQL($sqlHiringStatus);

// Initialize an array to store company data
$companyData = array();

if ($resultHiringStatus) {
    while ($rowHiringStatus = $resultHiringStatus->fetch_assoc()) {
        $companyID = $rowHiringStatus['COMPANYID'];
        $hired = $rowHiringStatus['hired'];
        $pending = $rowHiringStatus['pending'];
        $inProgress = $rowHiringStatus['in_progress'];

        // Store the data in the companyData array
        $companyData[$companyID] = [
            'hired' => $hired,
            'pending' => $pending,
            'in_progress' => $inProgress,
        ];
    }
}

// Execute SQL queries for data retrieval
$sqlNewApplicants = "SELECT COUNT(*) AS total FROM tblapplicants";
$sqlVerifiedUsers = "SELECT COUNT(*) AS total FROM tblapplicants WHERE EMAIL_VERIFIED = 1";
$sqlUserRegistrations = "SELECT COUNT(*) AS total FROM tblusers WHERE ROLE = 'Staff'";
$sqlTotalApplications = "SELECT COUNT(*) AS total FROM tbljobregistration";

$resultNewApplicants = executeSQL($sqlNewApplicants);
$resultVerifiedUsers = executeSQL($sqlVerifiedUsers);
$resultUserRegistrations = executeSQL($sqlUserRegistrations);
$resultTotalApplications = executeSQL($sqlTotalApplications);

// Initialize variables for data retrieval
$newApplicants = 0;
$verifiedUsers = 0;
$userRegistrations = 0;
$totalApplications = 0;

// Fetch data from query results
if ($resultNewApplicants) {
    $rowNewApplicants = $resultNewApplicants->fetch_assoc();
    $newApplicants = $rowNewApplicants['total'];
}

if ($resultVerifiedUsers) {
    $rowVerifiedUsers = $resultVerifiedUsers->fetch_assoc();
    $verifiedUsers = $rowVerifiedUsers['total'];
}

if ($resultUserRegistrations) {
    $rowUserRegistrations = $resultUserRegistrations->fetch_assoc();
    $userRegistrations = $rowUserRegistrations['total'];
}

if ($resultTotalApplications) {
    $rowTotalApplications = $resultTotalApplications->fetch_assoc();
    $totalApplications = $rowTotalApplications['total'];
}

// Query for Company Section
$sqlCompany = "SELECT COUNT(*) AS total FROM tblcompany";
$resultCompany = executeSQL($sqlCompany);

$totalCompanies = 0;

if ($resultCompany) {
    $rowCompany = $resultCompany->fetch_assoc();
    $totalCompanies = $rowCompany['total'];
}

// Query for Internships Section
$sqlInternships = "SELECT COUNT(*) AS total FROM tbljob";
$resultInternships = executeSQL($sqlInternships);

$totalInternships = 0;

if ($resultInternships) {
    $rowInternships = $resultInternships->fetch_assoc();
    $totalInternships = $rowInternships['total'];
}

// Query for Hired Students Section
$sqlHiredStudents = "SELECT COUNT(*) AS total FROM tbljobregistration WHERE remarks = 'approved'";
$resultHiredStudents = executeSQL($sqlHiredStudents);

$totalHiredStudents = 0;

if ($resultHiredStudents) {
    $rowHiredStudents = $resultHiredStudents->fetch_assoc();
    $totalHiredStudents = $rowHiredStudents['total'];
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <!-- Include necessary CSS and JavaScript libraries for charts, if needed -->

    <!-- Include Chart.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
</head>

<body>
    <section class="content-header">
        <h1>
            Dashboard
            <small>Control panel</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
    </section>

    <section class="content">
        <!-- Small boxes (Stat box) -->
        <div class="row">
            <!-- New Applicants -->
            <div class="col-lg-3 col-xs-6">
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <h3><?php echo $newApplicants; ?></h3>
                        <p>New Applicants</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <!-- Total Applications -->
            <div class="col-lg-3 col-xs-6">
                <div class="small-box bg-green">
                    <div class="inner">
                        <h3><?php echo $totalApplications; ?></h3>
                        <p>Total Applications</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <!-- User Registrations -->
            <div class="col-lg-3 col-xs-6">
                <div class="small-box bg-yellow">
                    <div class="inner">
                        <h3><?php echo $userRegistrations; ?></h3>
                        <p>User Registrations</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <!-- Verified Users -->
            <div class="col-lg-3 col-xs-6">
                <div class="small-box bg-red">
                    <div class="inner">
                        <h3><?php echo $verifiedUsers; ?></h3>
                        <p>Verified Users</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-pie-graph"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
        <!-- /.row -->

        <!-- Bar Chart -->
        <div class="row">
            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Analytics Chart</h3>
                    </div>
                    <div class="box-body">
                        <canvas id="analyticsChart" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bar Chart for Company Hiring -->
        <div class="row">
            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Company Hiring Chart</h3>
                    </div>
                    <div class="box-body">
                        <canvas id="companyHiringChart" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Company Section -->
        <div class="row">
            <div class="col-lg-6">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Companies</h3>
                    </div>
                    <div class="box-body">
                        <p>Total Companies: <?php echo $totalCompanies; ?></p>
                    </div>
                </div>
            </div>

            <!-- Internships Section -->
            <div class="col-lg-6">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Internships</h3>
                    </div>
                    <div class="box-body">
                        <p>Total Internships: <?php echo $totalInternships; ?></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Hired Students Section -->
        <div class="row">
            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Hired Students</h3>
                    </div>
                    <div class="box-body">
                        <p>Total Hired Students: <?php echo $totalHiredStudents; ?></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tracking Form -->



    </section>
    <!-- /.content -->

    <script>
        // JavaScript code for initializing and populating the chart
        // Get data from PHP variables
        var newApplicants = <?php echo $newApplicants; ?>;
        var totalApplications = <?php echo $totalApplications; ?>;
        var userRegistrations = <?php echo $userRegistrations; ?>;
        var verifiedUsers = <?php echo $verifiedUsers; ?>;

        // Create a bar chart
        var ctx = document.getElementById('analyticsChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['New Applicants', 'Total Applications', 'User Registrations', 'Verified Users'],
                datasets: [{
                    label: 'Count',
                    data: [newApplicants, totalApplications, userRegistrations, verifiedUsers],
                    backgroundColor: [
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(54, 162, 235, 0.2)'
                    ],
                    borderColor: [
                        'rgba(75, 192, 192, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(54, 162, 235, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        // Generate and download the report when the button is clicked

    </script>
    <!-- Inside the script tag in your HTML file -->
    <!-- Inside the script tag in your HTML file -->
    <script>
        // JavaScript code for initializing and populating the chart

        // Get data from PHP array
        var companyData = <?php echo json_encode($companyData); ?>;

        // Create arrays to store labels and data for the chart
        var companyLabels = [];
        var hiredCounts = [];
        var pendingCounts = [];
        var inProgressCounts = [];

        // Loop through the companyData to populate the arrays
        for (var companyID in companyData) {
            if (companyData.hasOwnProperty(companyID)) {
                // Add the company name (you may fetch it from your database) to labels
                companyLabels.push("Company " + companyID);

                // Add counts for hired, pending, and in-progress students
                hiredCounts.push(companyData[companyID]['hired']);
                pendingCounts.push(companyData[companyID]['pending']);
                inProgressCounts.push(companyData[companyID]['in_progress']);
            }
        }

        // Create a stacked bar chart
        var ctx = document.getElementById('companyHiringChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: companyLabels,
                datasets: [{
                        label: 'Hired',
                        data: hiredCounts,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Pending',
                        data: pendingCounts,
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'In Progress',
                        data: inProgressCounts,
                        backgroundColor: 'rgba(255, 206, 86, 0.2)',
                        borderColor: 'rgba(255, 206, 86, 1)',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        stacked: true
                    },
                    x: {
                        stacked: true
                    }
                }
            }
        });

    </script>


</body>

</html>
