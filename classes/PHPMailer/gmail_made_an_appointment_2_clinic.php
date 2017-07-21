<?php
/**
 * This example shows settings to use when sending via Google's Gmail servers.
 */

//SMTP needs accurate times, and the PHP time zone MUST be set
//This should be done in your php.ini, but this is how to do it if you don't have access to that
date_default_timezone_set('Etc/UTC');

require 'PHPMailerAutoload.php';


$email=$_POST ['clinic_mail'];
$appID=$_POST ['appID'];
$drName =$_POST ['drName'];

$clinicName =$_POST ['clinicName'];
$firstName =$_POST ['firstName'];
$lastName =$_POST ['lastName'];
$date =$_POST ['date'];
$time =$_POST ['time'];
$addr =$_POST ['addr'];
$contactNumber =$_POST ['contactNumber'];
$contactEmail =$_POST ['contactEmail'];



//Create a new PHPMailer instance
$mail = new PHPMailer;

//Tell PHPMailer to use SMTP
$mail->isSMTP();

//Enable SMTP debugging
// 0 = off (for production use)
// 1 = client messages
// 2 = client and server messages
$mail->SMTPDebug = 2;

//Ask for HTML-friendly debug output
$mail->Debugoutput = 'html';

//Set the hostname of the mail server
$mail->Host = 'hp207.hostpapa.com';
// use
// $mail->Host = gethostbyname('smtp.gmail.com');
// if your network does not support SMTP over IPv6

//Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
$mail->Port = 587;

//Set the encryption system to use - ssl (deprecated) or tls
$mail->SMTPSecure = 'tls';

//Whether to use SMTP authentication
$mail->SMTPAuth = true;

//Username to use for SMTP authentication - use full email address for gmail
$mail->Username = "info@drpages.com.au";

//Password to use for SMTP authentication
$mail->Password = "Focus\$Data2017";

//Set who the message is to be sent from
$mail->setFrom('info@drpages.com.au', 'Focusdata');

//Set an alternative reply-to address
$mail->addReplyTo('info@drpages.com.au', 'Focusdata');

//Set who the message is to be sent to
$mail->addAddress($email, $firstName);




//Set the subject line
$mail->Subject = 'DrPages Appointment #'.$appID.' with Dr '.$drName.' at '.$clinicName.' Practice - CONFIRMED';



$content=file_get_contents('made_an_appointment_to_clinic.html');
$content=str_replace("{{firstname}}",$firstName,$content);
$content=str_replace("{{lastname}}",$lastName,$content);
$content=str_replace("{{clinicname}}",$clinicName,$content);
$content=str_replace("{{drname}}",$drName,$content);

$content=str_replace("{{date}}",$date,$content);

$content=str_replace("{{time}}",$time,$content);

$content=str_replace("{{addr}}",$addr,$content);

$content=str_replace("{{contactNumber}}",$contactNumber,$content);
$content=str_replace("{{contactEmail}}",$contactEmail,$content);
$mail->msgHTML($content, dirname(__FILE__));

//Replace the plain text body with one created manually
$mail->AltBody = '';

//Attach an image file
//$mail->addAttachment('../../img/logo_en.png');

//send the message, check for errors
if (!$mail->send()) {
    echo "Mailer Error: " . $mail->ErrorInfo;
} else {
    echo "Message sent!";
}
