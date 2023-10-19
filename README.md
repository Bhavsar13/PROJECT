Locate the downloaded zip file and extract it to your XAMPP htdocs directory. 
For Windows (MS), this directory is usually located at C:\xampp\htdocs\. 
For macOS, it's typically in /Applications/XAMPP/xamppfiles/htdocs/. 
3. Database Configuration: 
Open your web browser and go to http://localhost/phpmyadmin. 
Create a new database named "internship." 
Select the "internship" database and import the SQL file included in the "internship" folder. 
Modifying Email Configuration (send_email.php) 
To ensure that the email verification functionality works as intended, you must update the email configuration settings in the send_email.php file. This file is responsible for sending verification emails. Follow the steps below to modify the email configuration: 
Open the send_email.php file in your code editor. 
Locate the following section in the code: 
Php 
// Email Configuration 
$mail->isSMTP(); 
$mail->Host = 'smtp.gmail.com'; // Specify your SMTP server 
$mail->SMTPAuth = true; 
$mail->Username = 'your_email@gmail.com'; // SMTP username 
$mail->Password = 'your_password'; // SMTP password 
$mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; 
$mail->Port = 587; 
  
// Sender and Recipient Information 
$mail->setFrom('your_email@gmail.com', 'Personallocalhost'); // Sender's email and name 
$mail->addAddress($recipientEmail); // Recipient's email 
$mail->addReplyTo('your_email@gmail.com', 'Personallocalhost'); // Reply-to email and name 
Replace 'your_email@gmail.com' with your actual email address that you want to use for sending verification emails. 
Replace 'your_password' with the corresponding email password. 
Save the send_email.php file. 
  
  
GENERATE PASSWORD STEPS: 
  
Sign into Google: Start by signing into your Google Account. 
Access Google Account Settings: 
Click on your profile picture in the upper-right corner. 
Select "Google Account." 
Navigate to Security: 
In the left sidebar, click on "Security." 
Two-Step Verification: 
Under the "Signing into Google" section, find "2-Step Verification" and click on it. 
Follow the prompts to enable two-step verification. This will provide an additional layer of security to your account. 
App Passwords: 
Scroll down to the "App passwords" section and click on "App passwords." 
Generate App Password: 
You'll be prompted to enter your Google account password for security. 
Next, click on the "Select app" dropdown menu to choose the application or service you want to generate an app password for. 
Then, click the "Select device" dropdown menu and choose the device or platform the app password is for. 
Click "Generate" to create the app password. 
Copy the App Password: 
Google will generate a unique app password for the application and device you selected. 
Copy this app password. 
Use the App Password in Your Code: 
In your code where you need to use the password (e.g., PHP code for sending emails), paste the app password you generated into the appropriate field. 
phpCopy code 
$mail->Password = 'your_generated_app_password';  
  
Secure the App Password: 
Treat the app password with the same level of security as your Google account password. Do not share it with others. 
  
  
 Web Server Configuration: 
Ensure that XAMPP is running. Start Apache and MySQL from the XAMPP Control Panel. 
Open your web browser and navigate to http://localhost/internship. 
 Testing the Installation: 
You should now see the internship portal homepage. 
Test the functionality to ensure there are no errors. 
Troubleshooting: If you encounter any issues during installation, please refer to the troubleshooting section in the full installation guide for solutions to common problems. 
Conclusion: Congratulations! You have successfully installed internship portal on your XAMPP localhost, which works on both Windows and macOS. If you have any questions or need further assistance, please don't hesitate to reach out. 
  
Full Installation Guide:  
  
Troubleshooting: 
If you encounter any issues during the installation process, please refer to the following troubleshooting section for solutions to common problems. If your specific issue is not covered here, don't hesitate to seek additional support, or contact us for assistance. 
1. Problem: Unable to Access the Project Homepage 
Solution: 
Ensure that your XAMPP server is running. Open XAMPP Control Panel and start Apache and MySQL. 
Check the project files' location in the htdocs directory. 
Verify that you are accessing the correct URL, e.g., http://localhost/internship. 
Clear your browser cache and try again. 
2. Problem: Database Connection Issues 
Solution: 
Double-check your database configuration settings in the project. Make sure the username, password, and database name match your XAMPP setup. 
Verify that the MySQL service is running in XAMPP. 
If you changed the default MySQL port, ensure its correctly configured in your project. 
3. Problem: Missing or Incorrect Data After Import 
Solution: 
Reimport the SQL file into the database. Check if there were any errors during the import process. 
Make sure the SQL file provided with the project matches your project version. 
4. Problem: PHP Errors or Blank Pages 
Solution: 
Enable error reporting in PHP to see detailed error messages. Check the PHP error log for clues. 
Verify that your project is compatible with PHP 7.4.28 and Apache 2.4.52. 
5. Problem: Slow Performance 
Solution: 
Check your system's resource usage. If your system is resource-constrained, consider optimizing your environment. 
Review your project's code for potential bottlenecks and optimize if necessary. 
6. Problem: Other Issues 
Solution: 
If your issue is not covered here, please consult the project's community or support resources. 
