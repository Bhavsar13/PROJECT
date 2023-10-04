 <style>
     #password-strength {
         font-weight: bold;
         margin-top: 10px;
         text-align: center;
     }

     #password-strength-text {
         font-size: 18px;
     }

     .strength-weak {
         color: red;
     }

     .strength-medium {
         color: orange;
     }

     .strength-strong {
         color: green;
     }

 </style>
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
                     <label class="col-md-4 control-label" for="password-strength">Password Strength:</label>
                     <div class="col-md-8">
                         <span id="password-strength"></span>
                         <i class="fa fa-info-circle" data-toggle="tooltip" data-placement="top" title="Strong passwords should include at least one uppercase letter, one lowercase letter, one digit, and one special character. Minimum length: 8 characters."></i>
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
 <script>
     document.addEventListener('DOMContentLoaded', function() {
         const passwordField = document.getElementById('PASS');
         const passwordStrength = document.getElementById('password-strength');
         const infoIcon = document.querySelector('.fa-info-circle'); // Select the "i" element

         // Function to check the password format and display strength
         function checkPasswordFormat() {
             const password = passwordField.value;

             if (/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(password)) {
                 passwordStrength.textContent = 'Strong';
                 passwordStrength.style.color = 'green';
             } else {
                 passwordStrength.textContent = 'Weak';
                 passwordStrength.style.color = 'red';
             }
         }

         // Add an event listener to the password field to check format on input
         passwordField.addEventListener('input', checkPasswordFormat);

         // Initialize Bootstrap tooltip for the info button
         $(infoIcon).tooltip();
     });

 </script>
