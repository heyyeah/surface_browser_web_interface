<?php
require_once 'config.php';
require_once 'init.php';
require_once 'db_functions.php';
require_once 'link_functions.php';

try {
    error_log("Clear queue request received");
    $db = connectToDatabase();
    
    // Update all non-default links to be accessed
    $stmt = $db->prepare("UPDATE " . SB_DATA_TABLE . " 
                         SET type = :type_accessed, 
                             accessed = NOW() 
                         WHERE id > :num_default_links 
                         AND type < :type_accessed");
                         
    $stmt->execute([
        'type_accessed' => TYPE_ACCESSED,
        'num_default_links' => SB_NUM_DEFAULT_LINKS,
        'type_accessed' => TYPE_ACCESSED
    ]);
    
    echo "Queue cleared successfully";
} catch (PDOException $e) {
    error_log("Database error while clearing queue: " . $e->getMessage());
    echo "Error clearing queue";
}
?>
