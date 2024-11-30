<?php
define('SB_DB_HOST', getenv('MYSQL_HOST'));
define('SB_DB_NAME', getenv('MYSQL_DATABASE'));
define('SB_DB_USER', getenv('MYSQL_USER'));
define('SB_DB_PASS', getenv('MYSQL_PASSWORD'));
define('SB_DATA_TABLE', 'zkm');
define('SB_MAXROWS', 20);
define('SB_NUM_DEFAULT_LINKS', 5);
define('SB_DISABLE_GALLERY_HOURS_CHECK', true);
define('SB_ENABLE_AI_SEEDS', getenv('ENABLE_AI_SEEDS') === 'true');
