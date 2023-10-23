<?php
require_once("include/initialize.php");
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

function sendVerificationEmail($recipientEmail, $verificationCode) {
    $mail = new PHPMailer(true);

    try {
        // Server settings
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com'; // Specify your SMTP server
        $mail->SMTPAuth = true;
        $mail->Username = 'sujalbhavsar22@gmail.com'; // SMTP username
        $mail->Password = 'xquujsisydfnitcf'; // SMTP password
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        // Recipients
        $mail->setFrom('sujalbhavsar22@gmail.com', 'Personallocalhost'); // Sender's email and name
        $mail->addAddress($recipientEmail); // Recipient's email
        $mail->addReplyTo('sujalbhavsar22@gmail.com', 'Personallocalhost'); // Reply-to email and name

        // Content
        $verificationLink = "http://localhost/Internship/index.php?q=verify&code={$verificationCode}"; // Use "&" instead of "?"

        // Create a verification code element
        $verificationCodeElement = "<p>Your verification code: <strong>{$verificationCode}</strong></p>";

        $mail->isHTML(true);
        $mail->Subject = 'Email Verification';

        // Combine the verification link and code elements in the email body
        $mail->Body = "Click the following link to verify your email: <a href='{$verificationLink}'>Verify Email</a><br>{$verificationCodeElement}";

        // Send email
        $mail->send();
        return true;
    } catch (Exception $e) {
        // Handle any exceptions here
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        return false;
    }
}


// Handle email verification here
