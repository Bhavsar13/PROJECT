<?php
if (!isset($_SESSION['ADMIN_USERID'])) {
    redirect(web_root."admin/index.php");
}

$autonum = New Autonumber();
$res = $autonum->set_autonumber('applicantid');
?>

<section id="feature" class="transparent-bg">
    <div class="container">
        <div class="center wow fadeInDown">
            <h2 class="page-header">Add New Applicant</h2>
        </div>

        <div class="row">
            <div class="features">

                <form class="form-horizontal span6 wow fadeInDown" action="controller.php?action=add" method="POST">

                    <div class="form-group">
                        <div class="col-md-8">
                            <label class="col-md-4 control-label" for="FNAME">Firstname:</label>

                            <div class="col-md-8">
                                <input class="form-control input-sm" id="FNAME" name="FNAME" placeholder="Firstname" type="text" value="" onkeyup="javascript:capitalize(this.id, this.value);" autocomplete="off">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-8">
                            <label class="col-md-4 control-label" for="LNAME">Lastname:</label>

                            <div class="col-md-8">
                                <input class="form-control input-sm" id="LNAME" name="LNAME" placeholder="Lastname" onkeyup="javascript:capitalize(this.id, this.value);" autocomplete="off">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-8">
                            <label class="col-md-4 control-label" for="MNAME">Middle Name:</label>

                            <div class="col-md-8">
                                <input class="form-control input-sm" id="MNAME" name="MNAME" placeholder="Middle Name" onkeyup="javascript:capitalize(this.id, this.value);" autocomplete="off">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-8">
                            <label class="col-md-4 control-label" for="EMAILADDRESS">Email Address:</label>
                            <div class="col-md-8">
                                <input type="Email" class="form-control input-sm" id="EMAILADDRESS" name="EMAILADDRESS" placeholder="Email Address" autocomplete="false" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-8">
                            <label class="col-md-4 control-label" for="USERNAME">Username:</label>

                            <div class="col-md-8">
                                <input class="form-control input-sm" id="USERNAME" name="USERNAME" placeholder="Username" onkeyup="javascript:capitalize(this.id, this.value);" autocomplete="off">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-8">
                            <label class="col-md-4 control-label" for="PASS">Password:</label>

                            <div class="col-md-8">
                                <input class="form-control input-sm" id="PASS" name="PASS" placeholder="Password" type="password" onkeyup="javascript:capitalize(this.id, this.value);" autocomplete="off">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-8">
                            <label class="col-md-4 control-label" for="CONFIRMPASS">Confirm Password:</label>

                            <div class="col-md-8">
                                <input class="form-control input-sm" id="CONFIRMPASS" name="CONFIRMPASS" placeholder="Confirm Password" type="password" required autocomplete="off">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-8">
                            <label class="col-md-4 control-label" for=""></label>

                            <div class="col-md-8">
                                <label><input type="checkbox"> By Sign up you are agree with our <a href="#">terms and condition</a></label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-8">
                            <label class="col-md-4 control-label" for="idno"></label>

                            <div class="col-md-8">
                                <button class="btn btn-primary btn-sm" name="btnRegister" type="submit"><span class="fa fa-save fw-fa"></span> Save</button>
                            </div>
                        </div>
                    </div>
                    <!-- Other fields can be added similarly -->

                </form>
            </div>
            <!--/.features-->
        </div>
        <!--/.row-->
    </div>
    <!--/.container-->
</section>
<!--/#feature-->
