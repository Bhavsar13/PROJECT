<!DOCTYPE html>
<html>

<head>
    <title>Email Verification</title>
</head>

<body>
    <section id="content">
        <div class="container content">

            <form class="row form-horizontal span6 wow fadeInDown" action="process.php?action=verifyemail" method="POST">
                <div class="form-group">
                    <div class="col-md-8">
                        <label for="verificationCode">Enter Verification Code:</label>
                        <input type="text" id="verificationCode" name="verificationCode" class="form-control" required>
                    </div>
                </div>
                <!-- JavaScript to autofill the verification code -->
                <script>
                    // Replace 'your_verification_code' with the actual code value
                    document.getElementById('verificationCode').value = '';

                </script>

                <!-- Add any additional fields or styling as needed -->

                <button type="submit" class="btn btn-primary">Verify</button>
            </form>

        </div>
    </section>
</body>

</html>
