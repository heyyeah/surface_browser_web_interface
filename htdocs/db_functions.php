<?php
function connectToDatabase()
{
    try {
        $db = new PDO(
            'mysql:host=' . SB_DB_HOST . ';dbname=' . SB_DB_NAME . ';charset=utf8mb4',
            SB_DB_USER,
            SB_DB_PASS,
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
        );
        return $db;
    } catch (PDOException $e) {
        die('Database connection failed: ' . $e->getMessage());
    }
}
