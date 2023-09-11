<?php
require_once("include/initialize.php");

$action = isset($_GET['action']) ? $_GET['action'] : '';

switch ($action) {
   
    case 'submitapplication' :
	doSubmitApplication();
	break;
  
	case 'register' :
	doRegister();
	break;  

	case 'login' :
	doLogin();
	break; 
	}



function doSubmitApplication() { 
    global $mydb;   
    $jobid  = $_GET['JOBID'];

    $autonum = new Autonumber();
    $applicantid = $autonum->set_autonumber('APPLICANT');
    $autonum = new Autonumber();
    $fileid = $autonum->set_autonumber('FILEID');

    $picture = UploadFile(); // Upload resume
    $location = "/resume/" . $picture;

    $video = UploadVideo(); // Upload video
    $videoLocation = "/resume/" . $video;

    if ($picture == "" && $video == "") {
        // Handle case where neither resume nor video is uploaded
        redirect(web_root . "index.php?q=apply&job=" . $jobid . "&view=personalinfo");
    } else {
        if (isset($_SESSION['APPLICANTID'])) {
            // Handle resume attachment
            if ($picture != "") {
                $sql = "INSERT INTO `tblattachmentfile` (FILEID, `USERATTACHMENTID`, `FILE_NAME`, `FILE_LOCATION`, `JOBID`) 
                        VALUES ('" . date('Y') . $fileid->AUTO . "', '{$_SESSION['APPLICANTID']}', 'Resume', '{$location}', '{$jobid}')";
                $mydb->setQuery($sql);
                $res = $mydb->executeQuery();

                doUpdate($jobid, $fileid->AUTO, $location);
            }
            
            // Handle video attachment
            if ($video != "") {
                $sql = "INSERT INTO `tblattachmentfile` (FILEID, `USERATTACHMENTID`, `FILE_NAME`, `VIDEO_LOCATION`, `JOBID`) 
                        VALUES ('" . date('Y') . $fileid->AUTO . "', '{$_SESSION['APPLICANTID']}', 'Video', '{$videoLocation}', '{$jobid}')";
                $mydb->setQuery($sql);
                $res = $mydb->executeQuery();
            }
        } else {
            // Handle resume attachment
            if ($picture != "") {
                $sql = "INSERT INTO `tblattachmentfile` (FILEID, `USERATTACHMENTID`, `FILE_NAME`, `FILE_LOCATION`, `JOBID`) 
                        VALUES ('" . date('Y') . $fileid->AUTO . "', '" . date('Y') . $applicantid->AUTO . "', 'Resume', '{$location}', '{$jobid}')";
                $mydb->setQuery($sql);
                $res = $mydb->executeQuery();

                doInsert($jobid, $fileid->AUTO, $location);

                $autonum = new Autonumber();
                $autonum->auto_update('APPLICANT');
            }
            
            // Handle video attachment
            if ($video != "") {
                $sql = "INSERT INTO `tblattachmentfile` (FILEID, `USERATTACHMENTID`, `FILE_NAME`, `VIDEO_LOCATION`, `JOBID`) 
                        VALUES ('" . date('Y') . $fileid->AUTO . "', '" . date('Y') . $applicantid->AUTO . "', 'Video', '{$videoLocation}', '{$jobid}')";
                $mydb->setQuery($sql);
                $res = $mydb->executeQuery();
            }
        }
    }

    $autonum = new Autonumber();
    $autonum->auto_update('FILEID'); 
}
function doInsert($jobid=0,$fileid=0) {
	if (isset($_POST['submit'])) {  
	global $mydb; 

        $birthdate =  $_POST['year'].'-'.$_POST['month'].'-'.$_POST['day'];

			$age = date_diff(date_create($birthdate),date_create('today'))->y;

			if ($age < 20){
			message("Invalid age. 20 years old and above is allowed.", "error");
			redirect("index.php?q=register");

			}else{

			$autonum = New Autonumber();
			$auto = $autonum->set_autonumber('APPLICANT');
			 
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
			$jobreg->JOBID     = $result->JOBID;
			$jobreg->APPLICANTID = date('Y').$auto->AUTO;
			$jobreg->APPLICANT   = $_POST['FNAME'] . ' ' . $_POST['LNAME'];
			$jobreg->REGISTRATIONDATE = date('Y-m-d');
			$jobreg->FILEID = date('Y').$fileid;
			$jobreg->REMARKS = 'Pending';
			$jobreg->DATETIMEAPPROVED = date('Y-m-d H:i');
			$jobreg->create();
  

			message("Your application already submitted. Please wait for the company confirmation if your are qualified to this job.","success");
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

  
			message("Your application already submitted. Please wait for the company confirmation if your are qualified to this job.","success");
			redirect("index.php?q=success&job=".$result->JOBID);
 
	}
}

function doRegister() {
    global $mydb;
    if (isset($_POST['btnRegister'])) {
        // Check if the password and confirm password fields match
        if ($_POST['PASS'] !== $_POST['CONFIRM_PASS']) {
            message("Password and confirm password do not match.", "error");
            redirect("index.php?q=register");
        }

        // Check if the username is already taken
         $existingUser = Applicants::usernameExists($_POST['USERNAME']);
        if ($existingUser) {
            // Debugging statement
            error_log("Username already exists. Please choose a different one.");
            message("Username already exists. Please choose a different one.", "error");
            redirect("index.php?q=register");
        }

        // Check if the email address is already taken
        $existingEmail = Applicants::emailExists($_POST['EMAILADDRESS']);
        if ($existingEmail) {
            // Debugging statement
            error_log("Email address already exists. Please use a different one.");
            message("Email address already exists. Please use a different one.", "error");
            redirect("index.php?q=register");
        }

        // Create a new applicant record
        $autonum = new Autonumber();
        $auto = $autonum->set_autonumber('APPLICANT');

        $applicant = new Applicants();
        $applicant->APPLICANTID = date('Y') . $auto->AUTO;
        $applicant->USERNAME = $_POST['USERNAME'];
        $applicant->PASS = sha1($_POST['PASS']);
        $applicant->EMAILADDRESS = $_POST['EMAILADDRESS'];
        
        // Check if the username or email address is already taken again before creating the account
        if (!$applicant->create()) {
            message("Account creation failed. Please try again later.", "error");
            redirect("index.php?q=register");
        }

        $autonum->auto_update('APPLICANT');

        message("You are successfully registered to the site. You can login now!", "success");
        redirect("index.php?q=success");
    }
}


 function doLogin(){
	
	$email = trim($_POST['USERNAME']);
	$upass  = trim($_POST['PASS']);
	$h_upass = sha1($upass);
 
  //it creates a new objects of member
    $applicant = new Applicants();
    //make use of the static function, and we passed to parameters
    $res = $applicant->applicantAuthentication($email, $h_upass);
    if ($res==true) { 

       	message("You are now successfully login!","success");
       
       // $sql="INSERT INTO `tbllogs` (`USERID`,USERNAME, `LOGDATETIME`, `LOGROLE`, `LOGMODE`) 
       //    VALUES (".$_SESSION['USERID'].",'".$_SESSION['FULLNAME']."','".date('Y-m-d H:i:s')."','".$_SESSION['UROLE']."','Logged in')";
       //    mysql_query($sql) or die(mysql_error()); 
         redirect(web_root."applicant/");
     
    }else{
    	 echo "Account does not exist! Please contact Administrator."; 
    } 
}
function UploadFile($jobid = 0) {
    $target_dir = $_SERVER['DOCUMENT_ROOT'] . "/PROJECT/resume/"; 
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
    $target_dir = $_SERVER['DOCUMENT_ROOT'] . "/PROJECT/resume/"; // Set your video upload directory
    $target_file = $target_dir . date("dmYhis") . basename($_FILES["video"]["name"]);
    $uploadOk = 1;
    $videoFileType = pathinfo($target_file, PATHINFO_EXTENSION);

    // Check if the file type is allowed (you can add more video formats if needed)
    if ($videoFileType != "mp4" && $videoFileType != "avi" && $videoFileType != "mov") {
        // Display an error message and return false
        message("Video format not supported. Only MP4, AVI, and MOV files are allowed.", "error");
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
