<?php


if (!isset($_SESSION['ADMIN_USERID'])) {
    redirect(web_root."admin/index.php");
}

$applicantId = @$_GET['id'];
if ($applicantId == '') {
    redirect("index.php");
}

$applicant = new Applicants();
$app = $applicant->single_applicant($applicantId);

// Radio button for Gender
$maleChecked = ($app->SEX == 'Male') ? 'checked' : '';
$femaleChecked = ($app->SEX == 'Female') ? 'checked' : '';

// Dropdown for Civil Status
$civilStatusOptions = ['Single', 'Married', 'Widow', 'Other'];
$civilStatusSelect = '';
foreach ($civilStatusOptions as $status) {
    $selected = ($app->CIVILSTATUS == $status) ? 'selected' : '';
    $civilStatusSelect .= '<option ' . $selected . ' value="' . $status . '">' . $status . '</option>';
}

?>

<div class="center wow fadeInDown">
    <h2 class="page-header">Update Applicant</h2>
</div>

<!-- ... Previous code ... -->

<form class="form-horizontal span6" action="controller.php?action=edit" method="POST">
    <input id="APPLICANTID" name="APPLICANTID" type="hidden" value="<?php echo $app->APPLICANTID; ?>">

    <!-- Username -->
    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="USERNAME">Username:</label>
            <div class="col-md-8">
                <input class="form-control input-sm" id="USERNAME" name="USERNAME" placeholder="Username" type="text" value="<?php echo $app->USERNAME; ?>" autocomplete="off">
            </div>
        </div>
    </div>

    <!-- Password -->
    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="PASS">New Password:</label>
            <div class="col-md-8">
                <input class="form-control input-sm" id="PASS" name="PASS" placeholder="Password" type="password" value="" autocomplete="off">
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="CONFIRM_PASS">Confirm Password:</label>
            <div class="col-md-8">
                <input class="form-control input-sm" id="CONFIRM_PASS" name="CONFIRM_PASS" placeholder="Confirm Password" type="password" value="" autocomplete="off">
            </div>
        </div>
    </div>
    <!-- Email Address -->
    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="EMAILADDRESS">Email Address:</label>
            <div class="col-md-8">
                <input class="form-control input-sm" id="EMAILADDRESS" name="EMAILADDRESS" placeholder="Email Address" type="email" value="<?php echo $app->EMAILADDRESS; ?>" autocomplete="off">
            </div>
        </div>
    </div>

    <!-- Contact Number -->
    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="CONTACTNO">Contact No.:</label>
            <div class="col-md-8">
                <input class="form-control input-sm" id="CONTACTNO" name="CONTACTNO" placeholder="Contact No." type="text" value="<?php echo $app->CONTACTNO; ?>" autocomplete="off">
            </div>
        </div>
    </div>

    <!-- Save Button -->
    <div class="form-group">
        <div class="col-md-8">
            <label class="col-md-4 control-label" for="save"></label>
            <div class="col-md-8">
                <button class="btn btn-primary btn-sm" name="save" type="submit"><span class="fa fa-save fw-fa"></span> Save</button>
            </div>
        </div>
    </div>
</form>
