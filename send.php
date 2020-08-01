<?php

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

$to = "Bob White <sales@materlux2.ru>";
 
//тема письма
$subj = '=?UTF-8?B?' . $subject . '?=';
 
//текст письма
$mess = '
<html>
    <head>
        <title>'.$subject.'</title>
    </head>
    <body>
        <p>'.$subject . $name . $email . $phone . $message . $link . $height . $width . $product.'</p>
    </body>
</html>';
 
//для отправки HTML-почты установим шапку Content-type
$headers= "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=utf-8\r\n";
 
//дополнительные параметры
$headers .= "From: =?UTF-8?B?" . $title . "?= <robot@materlux2.ru>\r\n"; //адрес отправителя
//$headers .= "Cc: sales@materlux2.ru\r\n"; //вторичные получатели письма, к которым направляется копия письма.
//$headers .= "Bcc: sales@materlux2.ru\r\n"; //имена и адреса получателей письма, чьи адреса не следует показывать другим получателям
 
//отправляем
mail($to, $subj, $mess, $headers);
?>