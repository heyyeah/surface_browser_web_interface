-- Skip database creation since it's handled by MySQL environment variables
USE surfacebrowser;

-- Drop and recreate table to ensure clean state
DROP TABLE IF EXISTS zkm;

CREATE TABLE zkm (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type TINYINT NOT NULL,
    accessed TIMESTAMP NOT NULL,
    modified TIMESTAMP NOT NULL,
    address TEXT NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Insert default links
INSERT INTO zkm (type, accessed, modified, address) VALUES
    (0, NOW(), NOW(), 'https://www.boxc.net/browserfood.html'),
    (0, NOW(), NOW(), 'https://www.boxc.net/browserfood2.html'),
    (0, NOW(), NOW(), 'https://www.boxc.net/browserfood3.html'),
    (0, NOW(), NOW(), 'https://www.boxc.net/browserfood4.html'),
    (0, NOW(), NOW(), 'https://www.boxc.net/browserfood5.html');
