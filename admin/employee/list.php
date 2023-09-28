<?php
$dbHost = 'localhost';
$dbUsername = 'root';
$dbPassword = '';
$dbName = 'Internship'; // Replace with your actual database name

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
    $query = "SELECT * FROM tblemployees";
} else {
    // User has a COMPANYID, modify the query to fetch records only for their company
    $query = "SELECT * FROM tblemployees WHERE COMPANYID = ?";
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
        <h1 class="page-header">List of Employee's <a href="index.php?view=add" class="btn btn-primary btn-xs  "> <i class="fa fa-plus-circle fw-fa"></i> Add New Employee</a> </h1>
    </div>
    <!-- /.col-lg-12 -->
</div>


<form class="wow fadeInDown action" action="controller.php?action=delete" method="POST">
    <table id="dash-table" class="table table-striped table-hover table-responsive" style="font-size:12px" cellspacing="0">
        <thead>
            <tr>
                <th>EmployeeNo</th>
                <th>Name</th>
                <th>Address</th>
                <th>Sex</th>
                <th>Age</th>
                <th>ContactNo</th>
                <th>Position</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = $result->fetch_assoc()) {
                echo '<tr>';
                echo '<td>' . $row['EMPLOYEEID'] . '</td>';
                echo '<td>' . $row['LNAME'] . ', ' . $row['FNAME'] . '</td>';
                echo '<td>' . $row['ADDRESS'] . '</td>';
                echo '<td>' . $row['SEX'] . '</td>';
                echo '<td>' . $row['AGE'] . '</td>';
                echo '<td>' . $row['TELNO'] . '</td>';
                echo '<td>' . $row['POSITION'] . '</td>';
                echo '<td align="center">
                        <a title="Edit" href="index.php?view=edit&id=' . $row['EMPLOYEEID'] . '" class="btn btn-info btn-xs">
                        <span class="fa fa-edit fw-fa"></span> Edit</a> 
                        <a title="Delete" href="controller.php?action=delete&id=' . $row['EMPLOYEEID'] . '" class="btn btn-danger btn-xs">
                        <span class="fa fa-trash-o fw-fa"></span> Delete</a>
                      </td>';
                echo '</tr>';
            }
            ?>
        </tbody>
    </table>
</form>
