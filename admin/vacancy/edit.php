<?php
if (!isset($_SESSION['ADMIN_USERID'])){
    redirect(web_root."admin/index.php");
}

$jobid = $_GET['id'];
$job = New Jobs();
$res = $job->single_job($jobid);

// Fetch the COMPANYID of the currently logged-in user from the session
$loggedInUserId = $_SESSION['ADMIN_USERID'];
$companyID = '';  // Initialize the variable
$userRole = '';  // Initialize the user role variable

// Check if the user is logged in and the session variable exists
if (isset($loggedInUserId)) {
    // Retrieve the COMPANYID and ROLE from the user data in your database (assuming you have a user model or function to fetch user data)
    $sql = "SELECT COMPANYID, ROLE FROM tblusers WHERE USERID = '$loggedInUserId'";
    $mydb->setQuery($sql);
    $user = $mydb->loadSingleResult();

    if ($user) {
        $companyID = $user->COMPANYID;  // Assign the COMPANYID to the variable
        $userRole = $user->ROLE;  // Assign the user's role to the variable
    }
}
?>

<form class="form-horizontal span6" action="controller.php?action=edit" method="POST">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Update Internship Vacancy</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>

    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="COMPANYID">Company Name:</label>
            <div class="col-md-8">
                <input type="hidden" name="JOBID" value="<?php echo $res->JOBID; ?>">
                <?php if ($userRole === 'Administrator'): ?>
                <!-- Display the dropdown menu for administrators -->
                <select class="form-control input-sm" id="COMPANYID" name="COMPANYID">
                    <?php
                    $sql = "SELECT COMPANYID, COMPANYNAME FROM tblcompany";
                    $mydb->setQuery($sql);
                    $companies = $mydb->loadResultList();
                    foreach ($companies as $company) {
                        $selected = ($company->COMPANYID == $res->COMPANYID) ? 'selected' : '';
                        echo '<option value="' . $company->COMPANYID . '" ' . $selected . '>' . $company->COMPANYNAME . '</option>';
                    }
                    ?>
                </select>
                <?php else: ?>
                <!-- Display the Company Name field as read-only for other team roles -->
                <input class="form-control input-sm" id="COMPANYID" name="COMPANYID" type="text" value="<?php echo $res->COMPANYID; ?>" readonly>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="CATEGORY">Category:</label>

            <div class="col-md-8">
                <select class="form-control input-sm" id="CATEGORY" name="CATEGORY">
                    <option value="None">Select</option>
                    <?php 
                            $sql ="SELECT * FROM `tblcategory` WHERE CATEGORY='".$res->CATEGORY."'";
                            $mydb->setQuery($sql);
                            $cur  = $mydb->loadResultList();
                            foreach ($cur as $result) {
                              # code...
                              echo '<option SELECTED value='.$result->CATEGORY.'>'.$result->CATEGORY.'</option>';
                            }
                            $sql ="SELECT * FROM `tblcategory` WHERE CATEGORY!='".$res->CATEGORY."'";
                            $mydb->setQuery($sql);
                            $cur  = $mydb->loadResultList();
                            foreach ($cur as $result) {
                              # code...
                              echo '<option value='.$result->CATEGORY.'>'.$result->CATEGORY.'</option>';
                            }

                          ?>
                </select>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="OCCUPATIONTITLE">Occupation Title:</label>
            <div class="col-md-8">
                <input class="form-control input-sm" id="OCCUPATIONTITLE" name="OCCUPATIONTITLE" placeholder="Occupation Title" autocomplete="none" value="<?php echo $res->OCCUPATIONTITLE; ?>" />
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="REQ_NO_EMPLOYEES">Required no. of Employees:</label>
            <div class="col-md-8">
                <input class="form-control input-sm" id="REQ_NO_EMPLOYEES" name="REQ_NO_EMPLOYEES" placeholder="Required no. of Employees" autocomplete="none" value="<?php echo $res->REQ_NO_EMPLOYEES ?>" />
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="SALARIES">Salary:</label>
            <div class="col-md-8">
                <input class="form-control input-sm" id="SALARIES" name="SALARIES" placeholder="Salary" autocomplete="none" value="<?php echo $res->SALARIES ?>" />
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="DURATION_EMPLOYEMENT">Duration of Employment:</label>
            <div class="col-md-8">
                <input class="form-control input-sm" id="DURATION_EMPLOYEMENT" name="DURATION_EMPLOYEMENT" placeholder="Duration of Employment" autocomplete="none" value="<?php echo $res->DURATION_EMPLOYEMENT ?>" />
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="QUALIFICATION_WORKEXPERIENCE">Qualification/Work Experience:</label>
            <div class="col-md-8">
                <textarea class="form-control input-sm" id="QUALIFICATION_WORKEXPERIENCE" name="QUALIFICATION_WORKEXPERIENCE" placeholder="Qualification/Work Experience" autocomplete="none"><?php echo $res->QUALIFICATION_WORKEXPERIENCE ?></textarea>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="JOBDESCRIPTION">Job Description:</label>
            <div class="col-md-8">
                <textarea class="form-control input-sm" id="JOBDESCRIPTION" name="JOBDESCRIPTION" placeholder="Job Description" autocomplete="none"><?php echo $res->JOBDESCRIPTION ?></textarea>
            </div>
        </div>
    </div>



    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="idno"></label>

            <div class="col-md-8">
                <button class="btn btn-primary btn-sm" name="save" type="submit"><span class="fa fa-save fw-fa"></span> Save</button>
                <!-- <a href="index.php" class="btn btn-info"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;<strong>Back</strong></a> -->

            </div>
        </div>
    </div>



</form>
