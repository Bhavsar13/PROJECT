<?php

require_once("include/initialize.php");
require_once 'send_email.php'; 
$action = isset($_GET['action']) ? $_GET['action'] : '';

switch ($action) {
   
    case 'submitapplication' :
	doSubmitApplication();
	break;
  
	case 'register' :
	doRegister();
	break;  
case 'verifyemail':
    verifyEmail();
    break;
	case 'login' :
	doLogin();
	break; 
        
   case 'resetPassword': // Add this case for password reset
        doResetPassword();
        break;    
	}

function doResetPassword() {
    global $mydb;

    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["email"]) && isset($_POST["newPassword"])) {
        $email = $_POST["email"];
        $newPassword = $_POST["newPassword"];

        // Create a PDO connection
        try {
            $pdo = new PDO("mysql:host=localhost;dbname=Internship", "root", "");
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Database connection failed: " . $e->getMessage());
        }

        // Perform a SQL query to check if the email exists in the database
        $sql = "SELECT `APPLICANTID` FROM `tblapplicants` WHERE `EMAILADDRESS` = :email";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $result = $stmt->fetch();

        if ($result) {
            // Email exists in the database, update the password
            $hashedPassword = sha1($newPassword); // Use SHA-1 for hashing (replace with your preferred hashing method)

            $updateSql = "UPDATE `tblapplicants` SET `PASS` = :hashedPassword WHERE `EMAILADDRESS` = :email";
            $updateStmt = $pdo->prepare($updateSql);
            $updateStmt->bindParam(':hashedPassword', $hashedPassword);
            $updateStmt->bindParam(':email', $email);

            if ($updateStmt->execute()) {
                message("Password has been reset successfully.", "success");
                redirect("index.php?q=success");
            } else {
                message("Error resetting password.", "error");
                redirect("reset.php");
            }
        } else {
            message("Email address not found.", "error");
            redirect("reset.php");
        }
    }
}

function verifyEmail() {
    global $mydb;

    // Get the verification code from the form input
    $verificationCode = isset($_POST['verificationCode']) ? $_POST['verificationCode'] : '';

    if (empty($verificationCode)) {
        // Handle the case where the verification code is missing
        // Display an error message or redirect to an error page
        // Optionally, you can include a link to resend the verification email
        message("Verification code is required.", "error");
        redirect("verify.php"); // Replace with the appropriate URL
        return;
    }

    // Check if the verification code exists in the database
    // Assuming you have a table named 'tblapplicants' with a column 'EMAIL_VERIFICATION_CODE'
    // Replace 'EMAIL_VERIFICATION_CODE' with your actual database column name
    $sql = "SELECT * FROM `tblapplicants` WHERE `EMAIL_VERIFICATION_CODE` = '{$verificationCode}'";
    $mydb->setQuery($sql);
    $result = $mydb->loadSingleResult();

    if ($result) {
        // Verification code is valid, update the 'email_verified' field to 1
        // Assuming you have a column named 'email_verified' in your 'tblapplicants' table
        // Replace 'email_verified' with your actual database column name
        $updateSql = "UPDATE `tblapplicants` SET `email_verified` = 1 WHERE `EMAIL_VERIFICATION_CODE` = '{$verificationCode}'";
        $mydb->setQuery($updateSql);
        $mydb->executeQuery();
         message("Email verification successful. You can now log in to your account.", "success");

        // Redirect to success.php
        redirect("index.php?q=success");
        exit;
    } else {
        // Invalid verification code
        message("Invalid verification code. Please check and try again.", "error");
        redirect("verify.php"); // Replace with the appropriate URL
    }
}


function doSubmitApplication() {
    global $mydb;
    $jobid = isset($_GET['JOBID']) ? $_GET['JOBID'] : '';

    if (empty($jobid)) {
        // Handle the case where 'JOBID' is not set appropriately
        redirect(web_root . "index.php?q=apply");
        return;
    }

    // Check if 'APPLICANTID' is set in the session
    if (isset($_SESSION['APPLICANTID'])) {
        // 'APPLICANTID' is set in the session, handle accordingly
        $applicantid = $_SESSION['APPLICANTID'];

        $autonum = new Autonumber();
        $fileid = $autonum->set_autonumber('FILEID');

        $picture = UploadFile(); // Upload resume
        $location = "/resume/" . $picture;

        $video = UploadVideo(); // Upload video
        $videoLocation = "/resume/" . $video;

        if (($picture === false) && ($video === false)) {
            // Handle case where neither resume nor video is uploaded
            redirect(web_root . "index.php?q=apply&job=" . $jobid . "&view=personalinfo");
        } else {
            // Handle both resume and video attachments in a single database entry
            insertFileIntoDatabase($fileid->AUTO, 'DOCUMENT', $location, $videoLocation, $jobid, $applicantid);
            doUpdate($jobid, $fileid->AUTO);
        }

        // Continue with any other actions specific to a logged-in applicant
    }

    $autonum = new Autonumber();
    $autonum->auto_update('FILEID');
}


function insertFileIntoDatabase($fileid, $fileType, $fileLocation, $videoLocation, $jobid, $applicantid) {
    global $mydb;

    // Combine the FILE_NAME for both resume and video into 'DOCUMENT'
    $fileType = 'DOCUMENT';

    $sql = "INSERT INTO `tblattachmentfile` (FILEID, `USERATTACHMENTID`, `FILE_NAME`, `FILE_LOCATION`, `VIDEO_LOCATION`, `JOBID`)
            VALUES ('" . date('Y') . $fileid . "', '{$applicantid}', '{$fileType}', '{$fileLocation}', '{$videoLocation}', '{$jobid}')";
    $mydb->setQuery($sql);
    $res = $mydb->executeQuery();
}


function doInsert($jobid=0,$fileid=0) {
if (isset($_POST['submit'])) {
global $mydb;

$birthdate = $_POST['year'].'-'.$_POST['month'].'-'.$_POST['day'];

$age = date_diff(date_create($birthdate),date_create('today'))->y;

if ($age < 20){ message("Invalid age. 20 years old and above is allowed.", "error" ); redirect("index.php?q=register"); }else{ $autonum=New Autonumber(); $auto=$autonum->set_autonumber('APPLICANT');

    $applicant =New Applicants();
    $applicant->APPLICANTID = date('Y').$auto->AUTO;
    $applicant->FNAME = $_POST['FNAME'];
    $applicant->LNAME = $_POST['LNAME'];
    $applicant->MNAME = $_POST['MNAME'];
    $applicant->ADDRESS = $_POST['ADDRESS'];
    $applicant->SEX = $_POST['optionsRadios'];
    $applicant->CIVILSTATUS = $_POST['CIVILSTATUS'];
    $applicant->BIRTHDATE = $birthdate;
    $applicant->BIRTHPLACE = $_POST['BIRTHPLACE'];
    $applicant->AGE = $age;
    $applicant->USERNAME = $_POST['USERNAME'];
    $applicant->PASS = sha1($_POST['PASS']);
    $applicant->EMAILADDRESS = $_POST['EMAILADDRESS'];
    $applicant->CONTACTNO = $_POST['TELNO'];
    $applicant->DEGREE = $_POST['DEGREE'];
    $applicant->create();




    $sql = "SELECT * FROM `tblcompany` c,`tbljob` j WHERE c.`COMPANYID`=j.`COMPANYID` AND JOBID = '{$jobid}'" ;
    $mydb->setQuery($sql);
    $result = $mydb->loadSingleResult();


    $jobreg = New JobRegistration();
    $jobreg->COMPANYID = $result->COMPANYID;
    $jobreg->JOBID = $result->JOBID;
    $jobreg->APPLICANTID = date('Y').$auto->AUTO;
    $jobreg->APPLICANT = $_POST['FNAME'] . ' ' . $_POST['LNAME'];
    $jobreg->REGISTRATIONDATE = date('Y-m-d');
    $jobreg->FILEID = date('Y').$fileid;
    $jobreg->REMARKS = 'Pending';
    $jobreg->DATETIMEAPPROVED = date('Y-m-d H:i');
    $jobreg->create();


    message("Your application has been successfully submitted. Please await a response from the hosting company to determine your suitability for the role.","success");
    redirect("index.php?q=success&job=".$result->JOBID);


    }
    }
    }
function doUpdate($jobid=0,$fileid=0) {
	if (isset($_POST['submit'])) {
	global $mydb;   

			$applicant =New Applicants();
			$appl  = $applicant->single_applicant($_SESSION['APPLICANTID']);

			 

			$sql = "SELECT * FROM `tblcompany` c,`tbljob` j WHERE c.`COMPANYID`=j.`COMPANYID` AND JOBID = '{$jobid}'" ;
			$mydb->setQuery($sql);
			$result = $mydb->loadSingleResult();


			$jobreg = New JobRegistration(); 
			$jobreg->COMPANYID = $result->COMPANYID;
			$jobreg->JOBID     = $result->JOBID;
			$jobreg->APPLICANTID = $appl->APPLICANTID;
			$jobreg->APPLICANT   = $appl->FNAME . ' ' . $appl->LNAME;
			$jobreg->REGISTRATIONDATE = date('Y-m-d');
			$jobreg->FILEID = date('Y').$fileid;
			$jobreg->REMARKS = 'Pending';
			$jobreg->DATETIMEAPPROVED = date('Y-m-d H:i');
			$jobreg->create();

  
			message("Your application has been successfully submitted. Please await a response from the hosting company to determine your suitability for the role.","success");
			redirect("index.php?q=success&job=".$result->JOBID);
 
	}
}
function isStrongPassword($password) {
    // Define a regular expression pattern for a strong password
    $pattern = "/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/";
    
    // Use preg_match to check if the password matches the pattern
    return preg_match($pattern, $password);
}
function doRegister() {
    global $mydb;
    if (isset($_POST['btnRegister'])) {
        // Check if the password and confirm password fields match
        if ($_POST['PASS'] !== $_POST['CONFIRM_PASS']) {
            message("Password and confirm password do not match.", "error");
            redirect("index.php?q=register");
        }

          $password = $_POST['PASS'];
        if (!isStrongPassword($password)) {
            message("Password is weak. It should include at least one uppercase letter, one lowercase letter, one digit, and one special character. Minimum length: 8 characters.", "error");
            redirect("index.php?q=register");
            return;
        }

        // Generate a verification token
        $verificationCode = generateVerificationCode(6);
        
        // Check if the username is already taken
        $existingUser = Applicants::usernameExists($_POST['USERNAME']);
        if ($existingUser) {
            message("Username already exists. Please choose a different one.", "error");
            redirect("index.php?q=register");
        }

        // Check if the email address is already taken
        $existingEmail = Applicants::emailExists($_POST['EMAILADDRESS']);
        if ($existingEmail) {
            message("Email address already exists. Please use a different one.", "error");
            redirect("index.php?q=register");
        }

        // Create a new applicant record with verification token
        $autonum = new Autonumber();
        $auto = $autonum->set_autonumber('APPLICANT');

        $applicant = new Applicants();
        $applicant->APPLICANTID = date('Y') . $auto->AUTO;
        $applicant->USERNAME = $_POST['USERNAME'];
        $applicant->PASS = sha1($_POST['PASS']);
        $applicant->EMAILADDRESS = $_POST['EMAILADDRESS'];
          $applicant->EMAIL_VERIFICATION_CODE = $verificationCode; // Store the codeStore the token
        $applicant->create();

        $autonum->auto_update('APPLICANT');

        // Send a verification email with the token
       sendVerificationEmail($_POST['EMAILADDRESS'], $verificationCode);

        message("Registration successful. Please check your email to verify your address.", "success");
        redirect("index.php?q=success");
    }
}
function generateVerificationCode($length = 6) {
    $characters = '0123456789';
    $code = '';

    for ($i = 0; $i < $length; $i++) {
        $code .= $characters[rand(0, strlen($characters) - 1)];
    }

    return $code;
}
 function doLogin(){

     $email = trim($_POST['USERNAME']);
     $upass = trim($_POST['PASS']);
     $h_upass = sha1($upass);

     //it creates a new objects of member
     $applicant = new Applicants();
     //make use of the static function, and we passed to parameters
     $res = $applicant->applicantAuthentication($email, $h_upass);
     if ($res==true) {

     message("You are now successfully login!","success");

     // $sql="INSERT INTO `tbllogs` (`USERID`,USERNAME, `LOGDATETIME`, `LOGROLE`, `LOGMODE`)
     // VALUES (".$_SESSION['USERID'].",'".$_SESSION['FULLNAME']."','".date('Y-m-d H:i:s')."','".$_SESSION['UROLE']."','Logged in')";
     // mysql_query($sql) or die(mysql_error());
     redirect(web_root."applicant/");

     }else{
     echo "Account does not exist! Please contact Administrator.";
     }
 }
function UploadFile($jobid = 0) {
    $target_dir = $_SERVER['DOCUMENT_ROOT'] . "/Internship/resume/"; 
    $target_file = $target_dir . date("dmYhis") . basename($_FILES["picture"]["name"]);
    $uploadOk = 1;
    $fileType = pathinfo($target_file, PATHINFO_EXTENSION);

    // Check if the file type is not one of the allowed formats
    if ($fileType != "pdf" && ($fileType != "doc" && $fileType != "docx")) {
        // Display an error message and return false
        message("File format not supported. Only PDF, DOC, and DOCX files are allowed.", "error");
        return false;
    }

    // Log details about the move_uploaded_file operation
    error_log("Moving uploaded file: " . $_FILES["picture"]["tmp_name"] . " to " . $target_file);

    // Move the uploaded file
    if (move_uploaded_file($_FILES["picture"]["tmp_name"], $target_file)) {
        return date("dmYhis") . basename($_FILES["picture"]["name"]);
    } else {
        // Display the actual error message
        $errorMessage = error_get_last()['message'];
        message("Error uploading file: " . $errorMessage, "error");
        return false;
    }
}
function UploadVideo($jobid = 0) {
$target_dir = $_SERVER['DOCUMENT_ROOT'] . "/Internship/resume/"; // Set your video upload directory
$target_file = $target_dir . date("dmYhis") . basename($_FILES["video"]["name"]);
$uploadOk = 1;
$videoFileType = pathinfo($target_file, PATHINFO_EXTENSION);

// Define an array of allowed video formats
$allowedFormats = array("mp4", "avi", "mov");

// Check if the file type is allowed
if (!in_array(strtolower($videoFileType), $allowedFormats)) {
// Display an error message and return false
message("Video format not supported. Allowed formats: MP4, AVI, MOV.", "error");
return false;
}

// Log details about the move_uploaded_file operation
error_log("Moving uploaded video: " . $_FILES["video"]["tmp_name"] . " to " . $target_file);

// Move the uploaded video
if (move_uploaded_file($_FILES["video"]["tmp_name"], $target_file)) {
return date("dmYhis") . basename($_FILES["video"]["name"]);
} else {
// Display the actual error message
$errorMessage = error_get_last()['message'];
message("Error uploading video: " . $errorMessage, "error");
return false;
}
}

?>
