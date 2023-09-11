<!-- Your HTML form here -->
<section id="content">
    <div class="container content">
        <p><?php check_message(); ?></p>
        <form class="row form-horizontal span6 wow fadeInDown" action="process.php?action=register" method="POST">
            <h2 class="">Registration</h2>
            <div class="form-group">
                <div class="col-md-8">
                    <label class="col-md-4 control-label" for="EMAILADDRESS">Email Address:</label>
                    <div class="col-md-8">
                        <input type="email" class="form-control input-sm" id="EMAILADDRESS" name="EMAILADDRESS" placeholder="Email Address" autocomplete="false" required>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-8">
                    <label class="col-md-4 control-label" for="USERNAME">Username:</label>
                    <div class="col-md-8">
                        <input class="form-control input-sm" id="USERNAME" name="USERNAME" placeholder="Username" required>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-8">
                    <label class="col-md-4 control-label" for="PASS">Password:</label>
                    <div class="col-md-8">
                        <input class="form-control input-sm" id="PASS" name="PASS" placeholder="Password" type="password" required>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-8">
                    <label class="col-md-4 control-label" for="CONFIRM_PASS">Confirm Password:</label>
                    <div class="col-md-8">
                        <input class="form-control input-sm" id="CONFIRM_PASS" name="CONFIRM_PASS" placeholder="Confirm Password" type="password" required>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-8">
                    <label class="col-md-4 control-label" for=""></label>
                    <div class="col-md-8">
                        <label><input type="checkbox" required> By signing up, you agree to our <a href="#">terms and conditions</a></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-8">
                    <label class="col-md-4 control-label" for="idno"></label>
                    <div class="col-md-8">
                        <button class="btn btn-primary btn-sm" name="btnRegister" type="submit"><span class="fa fa-save fw-fa"></span> Register</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
