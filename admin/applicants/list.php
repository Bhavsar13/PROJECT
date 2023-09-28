<?php
$dbHost = 'localhost';
$dbUsername = 'root';
$dbPassword = '';
$dbName = 'Internship';

// Create a database connection
$mysqli = new mysqli($dbHost, $dbUsername, $dbPassword, $dbName);

// Check if the connection was successful
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Define a function to escape user inputs (to prevent SQL injection)
function escape_string($value, $mysqli)
{
    return $mysqli->real_escape_string($value);
}

if (!isset($_SESSION['ADMIN_USERID'])) {
    // Redirect to the login page or perform the appropriate action
    // Replace 'redirect' with the actual redirection code
    redirect(web_root . "admin/index.php");
}

$userId = $_SESSION['ADMIN_USERID'];

// Define the user's company ID using a prepared statement
function getUserCompanyId($userId, $mysqli)
{
    $query = "SELECT COMPANYID FROM tblusers WHERE USERID = ?";
    $stmt = $mysqli->prepare($query);

    if ($stmt) {
        $stmt->bind_param("i", $userId); // "i" stands for integer, adjust the type as needed
        $stmt->execute();
        $stmt->bind_result($companyId);
        $stmt->fetch();
        $stmt->close();

        return $companyId;
    } else {
        // Handle the error or return an appropriate default value
        return null; // Return null if the query fails
    }
}

// Modify your SQL query to use prepared statements and handle null COMPANYID
$userCompanyId = getUserCompanyId($userId, $mysqli);

if ($userCompanyId === null) {
    // User has null COMPANYID, modify the query to fetch all records
    $query = "SELECT * FROM tblcompany c, tbljobregistration j, tbljob j2, tblapplicants a 
              WHERE j.COMPANYID = c.COMPANYID 
              AND j.JOBID = j2.JOBID 
              AND j.APPLICANTID = a.APPLICANTID";
} else {
    // User has a COMPANYID, modify the query to fetch records only for their company
    $query = "SELECT * FROM tblcompany c, tbljobregistration j, tbljob j2, tblapplicants a 
              WHERE c.COMPANYID = j.COMPANYID 
              AND j.JOBID = j2.JOBID 
              AND j.APPLICANTID = a.APPLICANTID 
              AND c.COMPANYID = ?";
}

$stmt = $mysqli->prepare($query);

if ($stmt) {
    if ($userCompanyId !== null) {
        $stmt->bind_param("i", $userCompanyId); // "i" stands for integer, adjust the type as needed
    }
    $stmt->execute();
    $result = $stmt->get_result();

    if (!$result) {
        // Handle the query error if needed
        die("Query error: " . $mysqli->error);
    }

    // Rest of your code to display the results
    // ...

    $stmt->close();
} else {
    // Handle the query error if needed
    die("Query error: " . $mysqli->error);
}
?>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">List of Applicants</h1>
    </div>
</div>

<form class="wow fadeInDown action" action="controller.php?action=delete" method="POST">
    <table id="dash-table" class="table table-striped table-hover table-responsive" style="font-size:12px" cellspacing="0">
        <thead>
            <tr>
                <th>Applicant</th>
                <th>Job Title</th>
                <th>Company</th>
                <th>Applied Date</th>
                <th>Remarks</th>
                <th width="14%">Action</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = $result->fetch_assoc()) {
                echo '<tr>';
                echo '<td>' . $row['APPLICANT'] . '</td>';
                echo '<td>' . $row['OCCUPATIONTITLE'] . '</td>';
                echo '<td>' . $row['COMPANYNAME'] . '</td>';
                echo '<td>' . $row['REGISTRATIONDATE'] . '</td>';
                echo '<td>' . $row['REMARKS'] . '</td>';
                echo '<td align="center">
                        <a title="View" href="index.php?view=view&id=' . $row['REGISTRATIONID'] . '" class="btn btn-info btn-xs">
                        <span class="fa fa-info fw-fa"></span> View</a> 
                        <a title="Remove" href="controller.php?action=delete&id=' . $row['REGISTRATIONID'] . '" class="btn btn-danger btn-xs">
                        <span class="fa fa-trash-o fw-fa"></span> Remove</a>
                      </td>';
                echo '</tr>';
            }
            ?>
        </tbody>
    </table>
</form>
