<?php



require_once ("../../include/initialize.php");
 if(!isset($_SESSION['ADMIN_USERID'])){
      redirect(web_root."admin/index.php");
     }

$action = (isset($_GET['action']) && $_GET['action'] != '') ? $_GET['action'] : '';

switch ($action) {
	case 'add' :
	doInsert();
	break;
	
	case 'edit' :
	doEdit();
	break; 
	
	case 'delete' :
	doDelete();
	break;

	case 'photos' :
	doupdateimage();
	break;
   
   
    case 'addfiles' :
	doAddFiles();
	break;

	case 'approve' :
	doApproved();
	break;

	case 'checkid' :
	Check_StudentID();
	break;
	

	}
   
function doInsert(){
    global $mydb;

    // Check if the form is submitted
    if(isset($_POST['btnRegister'])){
        // Sanitize and validate user inputs
        $requiredFields = ['FNAME', 'LNAME', 'MNAME', 'EMAILADDRESS', 'USERNAME', 'PASS', 'CONFIRMPASS'];
        $emptyFields = [];

        foreach ($requiredFields as $field) {
            if (empty($_POST[$field])) {
                $emptyFields[] = $field;
            }
        }

        if (!empty($emptyFields)) {
            $errorMessage = "All fields are required: " . implode(', ', $emptyFields);
            message($errorMessage, "error");
            redirect('index.php?view=add');
        } else {
            // Check if email address already exists (using prepared statement)
            $email = $_POST['EMAILADDRESS'];
            $sql = "SELECT * FROM tblapplicants WHERE EMAILADDRESS = ?";
            $params = [$email];
            $mydb->setQuery($sql, $params);
            $cur = $mydb->executeQuery();
            $maxrow = $mydb->num_rows($cur);

            if ($maxrow > 0) {
                message("Email address already in use!", "error");
                redirect("index.php?view=add");
            } else {
                // Verify that passwords match
                if ($_POST['PASS'] !== $_POST['CONFIRMPASS']) {
                    message("Passwords do not match!", "error");
                    redirect("index.php?view=add");
                }

                // Hash the password using a secure algorithm like bcrypt
                $hashedPassword = password_hash($_POST['PASS'], PASSWORD_BCRYPT);

                // Generate a new applicant ID
                $autonum = new Autonumber();
                $auto = $autonum->set_autonumber('APPLICANT');

                // Create a new Applicants instance and populate its properties
                $applicant = new Applicants();
                $applicant->APPLICANTID = date('Y') . $auto->AUTO;
                $applicant->FNAME = $_POST['FNAME'];
                $applicant->LNAME = $_POST['LNAME'];
                $applicant->MNAME = $_POST['MNAME'];
                $applicant->USERNAME = $_POST['USERNAME'];
                $applicant->PASS = $hashedPassword;
                $applicant->EMAILADDRESS = $email;

                // Other fields can be added here

                // Insert the applicant into the database (assuming you have a method like create())
                $applicant->create();

                // Update the autonumber counter
                $autonum->auto_update('APPLICANT');

                message("New applicant created successfully!", "success");
                redirect("index.php");
            }
        }
    }
}


function doEdit(){
    if(isset($_POST['save'])){
        // Check if 'PASS' and 'CONFIRM_PASS' match
        if ($_POST['PASS'] != $_POST['CONFIRM_PASS']) {
            message("Password and Confirm Password do not match. Please try again.", "error");
            redirect("index.php?view=edit&id=" . $_POST['APPLICANTID']);
            return; // Exit the function
        }

        $applicant = new Applicants();
        $applicant->APPLICANTID = $_POST['APPLICANTID'];
        $applicant->USERNAME = $_POST['USERNAME'];
        $applicant->PASS = ($_POST['PASS'] != '') ? sha1($_POST['PASS']) : (isset($_POST['OLDPASS']) ? $_POST['OLDPASS'] : ''); // Check if 'PASS' is set, if not, use 'OLDPASS' or an empty string

        $applicant->EMAILADDRESS = $_POST['EMAILADDRESS'];
        $applicant->CONTACTNO = $_POST['CONTACTNO'];

        if ($applicant->update($_POST['APPLICANTID'])) {
            message("Applicant information updated successfully!", "success");
        } else {
             message("Applicant information updated successfully!", "success");
        }

        redirect("index.php");
    }
}


	function doDelete(){
    if (isset($_GET['id'])) {
        $applicantId = $_GET['id'];

        $applicant = new Applicants();
        $applicant->delete($applicantId);

        message("Applicant has been deleted!", "success");
        redirect('index.php');
    }
}

 
 
  function UploadImage(){
			$target_dir = "../../employee/photos/";
			$target_file = $target_dir . date("dmYhis") . basename($_FILES["picture"]["name"]);
			$uploadOk = 1;
			$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
			
			
			if($imageFileType != "jpg" || $imageFileType != "png" || $imageFileType != "jpeg"
		|| $imageFileType != "gif" ) {
				 if (move_uploaded_file($_FILES["picture"]["tmp_name"], $target_file)) {
					return  date("dmYhis") . basename($_FILES["picture"]["name"]);
				}else{
					echo "Error Uploading File";
					exit;
				}
			}else{
					echo "File Not Supported";
					exit;
				}
} 

	function doupdateimage(){
 
			$errofile = $_FILES['photo']['error'];
			$type = $_FILES['photo']['type'];
			$temp = $_FILES['photo']['tmp_name'];
			$myfile =$_FILES['photo']['name'];
		 	$location="photo/".$myfile;


		if ( $errofile > 0) {
				message("No Image Selected!", "error");
				redirect("index.php?view=view&id=". $_GET['id']);
		}else{
	 
				@$file=$_FILES['photo']['tmp_name'];
				@$image= addslashes(file_get_contents($_FILES['photo']['tmp_name']));
				@$image_name= addslashes($_FILES['photo']['name']); 
				@$image_size= getimagesize($_FILES['photo']['tmp_name']);

			if ($image_size==FALSE ) {
				message("Uploaded file is not an image!", "error");
				redirect("index.php?view=view&id=". $_GET['id']);
			}else{
					//uploading the file
					move_uploaded_file($temp,"photo/" . $myfile);
		 	
					 

						$stud = New Student();
						$stud->StudPhoto	= $location;
						$stud->studupdate($_POST['StudentID']);
						redirect("index.php?view=view&id=". $_POST['StudentID']);
						 
							
					}
			}
			 
		}
function doApproved(){
global $mydb;
	if (isset($_POST['submit'])) {
		# code...
		$id = $_POST['JOBREGID'];
		$applicantid = $_POST['APPLICANTID'];

		$remarks = $_POST['REMARKS'];
		$sql="UPDATE `tbljobregistration` SET `REMARKS`='{$remarks}',PENDINGAPPLICATION=0,HVIEW=0,DATETIMEAPPROVED=NOW() WHERE `REGISTRATIONID`='{$id}'";
		$mydb->setQuery($sql);
		$cur = $mydb->executeQuery();

		if ($cur) {
			# code...
			$sql = "SELECT * FROM `tblfeedback` WHERE `REGISTRATIONID`='{$id}'";
			$mydb->setQuery($sql);
			$res = $mydb->loadSingleResult();
			if (isset($res)) {
				# code...
				$sql="UPDATE `tblfeedback` SET `FEEDBACK`='{$remarks}' WHERE `REGISTRATIONID`='{$id}'";
				$mydb->setQuery($sql);
				$cur = $mydb->executeQuery();
			}else{
				$sql="INSERT INTO `tblfeedback` (`APPLICANTID`, `REGISTRATIONID`,`FEEDBACK`) VALUES ('{$applicantid}','{$id}','{$remarks}')";
				$mydb->setQuery($sql);
				$cur = $mydb->executeQuery(); 

			}

			message("Applicant is calling for an interview.", "success");
			redirect("index.php?view=view&id=".$id); 
		}else{
			message("cannot be sve.", "error");
			redirect("index.php?view=view&id=".$id); 
		}


	}
}

 
?>
