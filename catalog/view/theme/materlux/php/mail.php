<?php 

require 'phpmailer/PHPMailerAutoload.php';
include_once('catalog/view/theme/materlux/php/phpmailer/class.phpmailer.php');

require_once('catalog/view/theme/materlux/php/phpmailer/class.smtp.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if ($_POST['email']) {
        $email = 'E-mail:' . $_POST['email'] . '<br>';
    }
    if ($_POST['name']) {
        $name = 'Имя:' . $_POST['name'] . '<br>';
    }
    if ($_POST['message']) {
        $message = 'Сообщение:' . $_POST['message'] . '<br>';
    }
    if ($_POST['phone']) {
        $phone = 'Телефон:' . $_POST['phone'] . '<br>';
    }
    if ($_POST['link']) {
        $link = 'Страница отправки:' . $_POST['link'] . '<br>';
    }
    if ($_POST['subject']) {
        $subject = 'Тема:' . $_POST['subject'] . '<br>';
    }
    if ($_POST['title']) {
        $title = $_POST['title'];
    }
    if ($_POST['width']) {
        $width = 'Ширина:' . $_POST['width'] . '<br>';
    }
    if ($_POST['height']) {
        $height = 'Длина:' . $_POST['height'] . '<br>';
    }
    if ($_POST['product']) {
        $product = 'Товар: <a href="' . $_POST['productlink'].'" > ' . $_POST['product'] . '</a><br>';
    }
}
$mail = new PHPMailer(true);                              // Passing `true` enables exceptions
try {
    
	$mail->isSMTP(); 
$mail->Host = 'smtp.timeweb.ru';  
$mail->SMTPAuth = true;                      
$mail->Username = 'sales@materlux2.ru'; // Ваш логин в Яндексе. Именно логин, без @yandex.ru
$mail->Password = 'pkbT2RhR'; // Ваш пароль
$mail->SMTPSecure = 'none';                            
$mail->Port = 25;
$mail->CharSet = 'UTF-8';
$mail->setFrom('sales@materlux2.ru'); // Ваш Email
$mail->addAddress('sales@materlux2.ru'); // Email получателя

    //Content
    $mail->isHTML(true);                                  // Set email format to HTML
    $mail->Subject = $title;
    $mail->Body = $subject . $name . $email . $phone . $message . $link . $height . $width . $product ;
    $mail->AltBody = 'Привет, мир! Это альтернативное письмо';

    $mail->send();
    echo 'Message has been sent';
} catch (Exception $e) {
    echo $e->getMessage();
    echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
}
?>