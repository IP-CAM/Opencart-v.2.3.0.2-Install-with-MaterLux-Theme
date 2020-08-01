<?php
// HTTP
define('HTTP_SERVER', 'http://'.$_SERVER['HTTP_HOST'].'/');

// HTTPS
define('HTTPS_SERVER', 'http://'.$_SERVER['HTTP_HOST'].'/');

// DIR
define('DIR_APPLICATION', $_SERVER['DOCUMENT_ROOT'].'/catalog/');
define('DIR_SYSTEM', $_SERVER['DOCUMENT_ROOT'].'/system/');
define('DIR_IMAGE', $_SERVER['DOCUMENT_ROOT'].'/image/');
define('DIR_LANGUAGE', $_SERVER['DOCUMENT_ROOT'].'/catalog/language/');
define('DIR_TEMPLATE', $_SERVER['DOCUMENT_ROOT'].'/catalog/view/theme/');
define('DIR_CONFIG', $_SERVER['DOCUMENT_ROOT'].'/system/config/');
define('DIR_CACHE', $_SERVER['DOCUMENT_ROOT'].'/system/storage/cache/');
define('DIR_DOWNLOAD', $_SERVER['DOCUMENT_ROOT'].'/system/storage/download/');
define('DIR_LOGS', $_SERVER['DOCUMENT_ROOT'].'/system/storage/logs/');
define('DIR_MODIFICATION', $_SERVER['DOCUMENT_ROOT'].'/system/storage/modification/');
define('DIR_UPLOAD', $_SERVER['DOCUMENT_ROOT'].'/system/storage/upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'co44002_materlux');
define('DB_PASSWORD', '64RmwsPT');
define('DB_DATABASE', 'co44002_materlux');
define('DB_PORT', '3306');
define('DB_PREFIX', 'mat_lux_');
