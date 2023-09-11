<!DOCTYPE html>
<html>


<body>
    <section id="content" class="py-5">
        <div class="container">

            <form class="form-horizontal" method="POST" action="process.php?action=edit">



                <!-- Step 1: Personal Information -->
                <div class="profile-step" id="step-1">
                    <h2>Step 1: Personal Information</h2>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="FNAME">Firstname:</label>
                        <div class="col-md-8">

                            <input class="form-control input-sm" id="FNAME" name="FNAME" placeholder="Firstname" type="text" onkeyup="javascript:capitalize(this.id, this.value);" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="LNAME">Lastname:</label>
                        <div class="col-md-8">
                            <input class="form-control" id="LNAME" name="LNAME" placeholder="Lastname" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="MNAME">Middle Name:</label>
                        <div class="col-md-8">
                            <input class="form-control" id="MNAME" name="MNAME" placeholder="Middle Name" type="text">
                        </div>
                    </div>
                </div>

                <!-- Step 2: Contact Information -->
                <div class="profile-step" id="step-2">
                    <h2>Step 2: Contact Information</h2>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="ADDRESS">Address:</label>
                        <div class="col-md-8">
                            <textarea class="form-control input-sm" id="ADDRESS" name="ADDRESS" placeholder="Address" type="text" value="" required onkeyup="javascript:capitalize(this.id, this.value);" autocomplete="off"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="TELNO">Contact No.:</label>
                        <div class="col-md-8">
                            <input class="form-control input-sm" id="TELNO" name="TELNO" placeholder="Contact No." type="text" any required onkeyup="javascript:capitalize(this.id, this.value);" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="EMAILADDRESS">Email Address:</label>
                        <div class="col-md-8">
                            <input type="Email" class="form-control input-sm" id="EMAILADDRESS" name="EMAILADDRESS" placeholder="Email Address" autocomplete="off" />
                        </div>
                    </div>
                </div>

                <!-- Step 3: Additional Information -->
                <div class="profile-step" id="step-3">
                    <h2>Step 3: Additional Information</h2>
                    <div class="form-group">
                        <label class="col-md-4 control-label">Gender:</label>
                        <div class="col-md-8">
                            <div class="col-lg-5">
                                <div class="radio">
                                    <label><input checked id="optionsRadios1" checked="True" name="optionsRadios" type="radio" value="Female">Female</label>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="radio">
                                    <label><input id="optionsRadios2" name="optionsRadios" type="radio" value="Male"> Male</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label">Date of Birth:</label>
                        <div class="col-md-8">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </span>
                                <input class="form-control input-sm date_picker" id="BIRTHDATE" name="BIRTHDATE" placeholder="Date of Birth" type="text" required autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="BIRTHPLACE">Place of Birth:</label>
                        <div class="col-md-8">
                            <textarea class="form-control input-sm" id="BIRTHPLACE" name="BIRTHPLACE" placeholder="Place of Birth" type="text" value="" required onkeyup="javascript:capitalize(this.id, this.value);" autocomplete="off"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="DEGREE">Work Experience</label>
                        <div class="col-md-8">
                            <input class="form-control input-sm" id="DEGREE" name="DEGREE" placeholder="Educational Attainment" onkeyup="javascript:capitalize(this.id, this.value);" autocomplete="off">
                        </div>
                    </div>
                </div>

                <!-- Step 4: Username and Password -->


                <!-- Navigation Buttons -->
                <div class="navigation-buttons">
                    <button type="button" id="prev-button" onclick="prevStep()">Previous</button>
                    <button type="button" id="next-button" onclick="nextStep()">Next</button>
                    <button type="button" id="skip-button" onclick="skipStep()">Skip</button>
                    <button type="button" id="finish-button" style="display: none;" onclick="submitForm()">Finish</button>

                </div>
            </form>
        </div>
    </section>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Initialize current step
        let currentStep = 1;

        // Function to show the current step
        function showStep(step) {
            for (let i = 1; i <= 3; i++) {
                const stepElement = document.getElementById("step-" + i);
                if (stepElement) {
                    stepElement.style.display = i === step ? "block" : "none";
                }
            }
            // Show/hide buttons based on the current step
            const prevButton = document.getElementById("prev-button");
            const nextButton = document.getElementById("next-button");
            const finishButton = document.getElementById("finish-button");
            if (step === 1) {
                prevButton.style.display = "none";
                nextButton.style.display = "inline-block";
                finishButton.style.display = "none";
            } else if (step === 3) { // Show "Finish" button on step 3
                prevButton.style.display = "inline-block";
                nextButton.style.display = "none"; // Hide "Next" button
                finishButton.style.display = "inline-block";
            } else {
                prevButton.style.display = "inline-block";
                nextButton.style.display = "inline-block";
                finishButton.style.display = "none";
            }
        }

        // Function to navigate to the next step
        function nextStep() {
            if (currentStep < 3) {
                currentStep++;
                showStep(currentStep);
            }
        }

        // Function to navigate to the previous step
        function prevStep() {
            if (currentStep > 1) {
                currentStep--;
                showStep(currentStep);
            }
        }

        // Function to submit the form (you can add AJAX here to save data to the database)
        function submitForm() {
            document.querySelector('form').submit();
        }

        // Function to skip the step
        function skipStep() {
            // Redirect to "index.php?q=home"
            window.location.href = "index.php?q=home";
        }

        // Show the initial step
        showStep(currentStep);

    </script>
</body>

</html>
