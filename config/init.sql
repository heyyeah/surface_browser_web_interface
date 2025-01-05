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

-- Insert default links (type 0)
INSERT INTO zkm (type, accessed, modified, address) VALUES
    (0, NOW(), NOW(), 'https://www.boxc.net/browserfood.html'),
    (0, NOW(), NOW(), 'https://www.boxc.net/browserfood2.html'),
    (0, NOW(), NOW(), 'https://www.boxc.net/browserfood3.html'),
    (0, NOW(), NOW(), 'https://www.boxc.net/browserfood4.html'),
    (0, NOW(), NOW(), 'https://www.boxc.net/browserfood5.html');

-- Insert test content links (type 5)
INSERT INTO zkm (type, accessed, modified, address) VALUES
    (5, NOW(), NOW(), 'https://www.boxc.net'),
    (5, NOW(), NOW(), 'https://boxc.net'),
    (5, NOW(), NOW(), 'https://www.boxc.net/files/zkm/browserfood_tests.html'),
    (5, NOW(), NOW(), 'https://www.boxc.net/files/zkm/index.phtml'),
    (5, NOW(), NOW(), 'https://theverge.com'),
    (5, NOW(), NOW(), 'https://cnn.com'),
    (5, NOW(), NOW(), 'https://bbc.com'),
    (5, NOW(), NOW(), 'https://techmeme.com'),
    (5, NOW(), NOW(), 'https://unsplash.com'),
    (5, NOW(), NOW(), 'https://macrumors.com'),
    (5, NOW(), NOW(), 'https://wallup.net/shaun-the-sheep-animation-family-comedy-shaun-sheep-adventure-9/'),
    (5, NOW(), NOW(), 'https://solarsystem.nasa.gov/solar-system/sun/overview/'),
    (5, NOW(), NOW(), 'https://www.amazon.com/dp/B0863TXGM3?tag=theverge02-20&ascsubtag=__vg1223awD__24092021__7om1av');
