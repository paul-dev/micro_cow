<?php
// HTTP
define('HTTP_SERVER', 'http://' . $_SERVER['HTTP_HOST'] . '/platform/');
define('HTTP_CATALOG', 'http://' . $_SERVER['HTTP_HOST'] . '/');

// HTTPS
define('HTTPS_SERVER', 'https://' . $_SERVER['HTTP_HOST'] . '/platform/');
define('HTTPS_CATALOG', 'https://' . $_SERVER['HTTP_HOST'] . '/');

// DIR
define('DIR_APPLICATION', '/WWW/WORKSPACE/micro_cow/platform/');
define('DIR_SYSTEM', '/WWW/WORKSPACE/micro_cow/system/');
define('DIR_LANGUAGE', '/WWW/WORKSPACE/micro_cow/platform/language/');
define('DIR_TEMPLATE', '/WWW/WORKSPACE/micro_cow/platform/view/template/');
define('DIR_CONFIG', '/WWW/WORKSPACE/micro_cow/system/config/');
define('DIR_IMAGE', '/WWW/WORKSPACE/micro_cow/image/');
define('DIR_CACHE', '/WWW/WORKSPACE/micro_cow/system/cache/');
define('DIR_DOWNLOAD', '/WWW/WORKSPACE/micro_cow/system/download/');
define('DIR_UPLOAD', '/WWW/WORKSPACE/micro_cow/system/upload/');
define('DIR_LOGS', '/WWW/WORKSPACE/micro_cow/system/logs/');
define('DIR_MODIFICATION', '/WWW/WORKSPACE/micro_cow/system/modification/');
define('DIR_CATALOG', '/WWW/WORKSPACE/micro_cow/catalog/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'root');
define('DB_DATABASE', 'dev_mall');
define('DB_PREFIX', 'mc_');