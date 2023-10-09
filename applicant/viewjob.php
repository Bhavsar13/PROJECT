<?php 
global $mydb;
	$red_id = isset($_GET['id']) ? $_GET['id'] : '';

	$jobregistration = New JobRegistration();
	$jobreg = $jobregistration->single_jobregistration($red_id);
	 // `COMPANYID`, `JOBID`, `APPLICANTID`, `APPLICANT`, `REGISTRATIONDATE`, `REMARKS`, `FILEID`, `PENDINGAPPLICATION`


	$applicant = new Applicants();
	$appl = $applicant->single_applicant($jobreg->APPLICANTID);
 // `FNAME`, `LNAME`, `MNAME`, `ADDRESS`, `SEX`, `CIVILSTATUS`, `BIRTHDATE`, `BIRTHPLACE`, `AGE`, `USERNAME`, `PASS`, `EMAILADDRESS`,CONTACTNO

	$jobvacancy = New Jobs();
	$job = $jobvacancy->single_job($jobreg->JOBID);
 // `COMPANYID`, `CATEGORY`, `OCCUPATIONTITLE`, `REQ_NO_EMPLOYEES`, `SALARIES`, `DURATION_EMPLOYEMENT`, `QUALIFICATION_WORKEXPERIENCE`, `JOBDESCRIPTION`, `PREFEREDSEX`, `SECTOR_VACANCY`, `JOBSTATUS`, `DATEPOSTED`

	$company = new Company();
	$comp = $company->single_company($jobreg->COMPANYID);
	 // `COMPANYNAME`, `COMPANYADDRESS`, `COMPANYCONTACTNO`

	$sql = "SELECT * FROM `tblattachmentfile` WHERE `FILEID`=" .$jobreg->FILEID;
	$mydb->setQuery($sql);
	$attachmentfile = $mydb->loadSingleResult();


?>
<style type="text/css">
    .content-header {
        min-height: 50px;
        border-bottom: 1px solid #ddd;
        font-size: 20px;
        font-weight: bold;
    }

    .content-body {
        min-height: 350px;
        /*border-bottom: 1px solid #ddd;*/
    }

    .content-body>p {
        padding: 10px;
        font-size: 12px;
        font-weight: bold;
        border-bottom: 1px solid #ddd;
    }

    .content-footer {
        min-height: 100px;
        border-top: 1px solid #ddd;

    }

    .content-footer>p {
        padding: 5px;
        font-size: 15px;
        font-weight: bold;
    }

    .content-footer textarea {
        width: 100%;
        height: 200px;
    }

    .content-footer .submitbutton {
        margin-top: 20px;
        /*padding: 0;*/

    }

</style>
<form action="controller.php?action=approve" method="POST">
    <div class="col-sm-12 content-header" style="">View Details</div>
    <div class="col-sm-12 content-body">
        <h3><?php echo $job->OCCUPATIONTITLE; ?></h3>
        <input type="hidden" name="JOBREGID" value="<?php echo $jobreg->REGISTRATIONID;?>">

        <div class="col-sm-6">
            <ul>
                <li><i class="fp-ht-bed"></i>Required No. of Employee's : <?php echo $job->REQ_NO_EMPLOYEES; ?></li>
                <?php
$salary = isset($job->SALARIES) ? $job->SALARIES : null;

if (is_numeric($salary)) {
    $formattedSalary = number_format(floatval($salary), 2);
} else {
    $formattedSalary = 'N/A';
}

echo '<li><i class="fp-ht-food"></i>Salary: ' . $formattedSalary . '</li>';
?>

                <li><i class="fa fa-sun-"></i>Duration of Employment : <?php echo $job->DURATION_EMPLOYEMENT; ?></li>
            </ul>
        </div>

        <div class="col-sm-12">
            <p>Internship Description : </p>
            <p style="margin-left: 15px;"><?php echo $job->JOBDESCRIPTION;?></p>
        </div>
        <div class="col-sm-12">
            <p>Qualification/Work Experience : </p>
            <p style="margin-left: 15px;"><?php echo $job->QUALIFICATION_WORKEXPERIENCE; ?></p>
        </div>
        <div class="col-sm-12">
            <p>Employeer : </p>
            <p style="margin-left: 15px;"><?php echo $comp->COMPANYNAME ; ?></p>
            <p style="margin-left: 15px;">@ <?php echo $comp->COMPANYADDRESS ; ?></p>
        </div>
    </div>

    <div class="col-sm-12 content-footer">
        <p><i class="fa fa-paperclip"></i> Attachment Files</p>
        <div class="col-sm-12 slider">
            <h3>Download Resume <a href="<?php echo web_root.'/'.$attachmentfile->FILE_LOCATION; ?>">Here</a></h3>
        </div>
        <!-- Header for Download Video Introduction -->
        <div class="col-sm-12">
            <h3>Video Introduction</h3>
            <?php
            $videoLocation = isset($attachmentfile->VIDEO_LOCATION) ? web_root.'/'.$attachmentfile->VIDEO_LOCATION : '';
        ?>
            <video controls width="100%">
                <!-- MP4 format -->
                <source src="<?php echo $videoLocation; ?>" type="video/mp4">
                <!-- MOV format -->
                <source src="<?php echo $videoLocation; ?>" type="video/quicktime">
                <!-- AVI format -->
                <source src="<?php echo $videoLocation; ?>" type="video/x-msvideo">
                Your browser does not support the video tag.
            </video>
            <p>
                <a href="<?php echo $videoLocation; ?>" download>Download Video</a> |
                <a href="<?php echo $videoLocation; ?>" target="_blank">Watch Video</a>
            </p>
        </div>
        <div class="col-sm-12">
            <p>Feedback</p>
            <p><?php echo isset($jobreg->REMARKS) ? $jobreg->REMARKS : ""; ?></p>
        </div>
        <div class="col-sm-12  submitbutton ">
            <a href="index.php?view=appliedjobs" class="btn btn-primary fa fa-arrow-left">Back</a>
        </div>
    </div>
</form>
