<?php
session_start();

// Handle language switching
$langChanged = false;
if (isset($_GET['lang']) && in_array($_GET['lang'], SUPPORTED_LANGUAGES)) {
    if (!isset($_SESSION['lang']) || $_SESSION['lang'] !== $_GET['lang']) {
        $_SESSION['lang'] = $_GET['lang'];
        $langChanged = true;
    }
} elseif (!isset($_SESSION['lang'])) {
    $_SESSION['lang'] = DEFAULT_LANGUAGE;
}

require_once 'translation.php';
$translator = new Translator($_SESSION['lang']);

// If language changed and this is the top frame, force reload of all frames
if ($langChanged && (!isset($_SERVER['HTTP_REFERER']) || strpos($_SERVER['HTTP_REFERER'], $_SERVER['HTTP_HOST']) === false)) {
    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}