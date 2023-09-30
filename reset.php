<section id="content">
    <div class="container content">
        <p><?php check_message(); ?></p>
        <form class="row form-horizontal span6 wow fadeInDown" action="process.php?action=resetPassword" method="POST">

            <div class="form-group">
                <div class="col-md-8">
                    <label class="col-md-4 control-label" for="email">Email Address:</label>
                    <div class="col-md-8">
                        <input type="email" class="form-control input-sm" id="email" name="email" placeholder="Email Address" autocomplete="false" required>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-8">
                    <label class="col-md-4 control-label" for="newPassword">New Password:</label>
                    <div class="col-md-8">
                        <input class="form-control input-sm" id="newPassword" name="newPassword" placeholder="New Password" type="password" required>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-8">
                    <label class="col-md-4 control-label" for="confirmPassword">Confirm Password:</label>
                    <div class="col-md-8">
                        <input class="form-control input-sm" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" type="password" required>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-8">
                    <label class="col-md-4 control-label" for=""></label>
                    <div class="col-md-8">
                        <button class="btn btn-primary btn-sm" name="btnResetPassword" type="submit"><span class="fa fa-refresh fw-fa"></span> Reset Password</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
