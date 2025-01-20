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
    (0, NOW() + INTERVAL 1 SECOND, NOW(), 'https://www.boxc.net/browserfood.html'),
    (0, NOW() + INTERVAL 2 SECOND, NOW(), 'https://www.bbc.com'),
    (3, NOW() + INTERVAL 3 SECOND, NOW(), 'browser art'),
    (0, NOW() + INTERVAL 4 SECOND, NOW(), 'https://edition.cnn.com'),
    (0, NOW() + INTERVAL 5 SECOND, NOW(), 'https://www.theverge.com'),
    (3, NOW() + INTERVAL 6 SECOND, NOW(), 'otters'),
    (0, NOW() + INTERVAL 7 SECOND, NOW(), 'https://www.boxc.net/browserfood2.html'),
    (0, NOW() + INTERVAL 8 SECOND, NOW(), 'https://solarsystem.nasa.gov/solar-system/sun/overview/'),
    (0, NOW() + INTERVAL 9 SECOND, NOW(), 'https://www.boxc.net/browserfood3.html'),
    (0, NOW() + INTERVAL 10 SECOND, NOW(), 'https://www.theartnewspaper.com/keywords/digital-art');

-- Insert test content links (type 5)
INSERT INTO zkm (type, accessed, modified, address) VALUES
    (5, NOW() + INTERVAL 11 SECOND, NOW(), 'https://www.boxc.net'),
    (5, NOW() + INTERVAL 12 SECOND, NOW(), 'https://boxc.net'),
    (5, NOW() + INTERVAL 13 SECOND, NOW(), 'https://www.boxc.net/files/zkm/browserfood_tests.html'),
    (5, NOW() + INTERVAL 14 SECOND, NOW(), 'https://www.boxc.net/browserfood_INC.html'),
    (5, NOW() + INTERVAL 15 SECOND, NOW(), 'https://www.boxc.net/browserfood_INC_i.html'),
    (5, NOW() + INTERVAL 16 SECOND, NOW(), 'https://www.boxc.net/files/zkm/index.phtml'),
    (5, NOW() + INTERVAL 17 SECOND, NOW(), 'https://theverge.com'),
    (6, NOW() + INTERVAL 18 SECOND, NOW(), 'rabbits'),
    (5, NOW() + INTERVAL 19 SECOND, NOW(), 'https://cnn.com'),
    (5, NOW() + INTERVAL 20 SECOND, NOW(), 'https://bbc.com'),
    (5, NOW() + INTERVAL 21 SECOND, NOW(), 'https://techmeme.com'),
    (5, NOW() + INTERVAL 22 SECOND, NOW(), 'https://unsplash.com'),
    (5, NOW() + INTERVAL 23 SECOND, NOW(), 'https://macrumors.com'),
    (5, NOW() + INTERVAL 24 SECOND, NOW(), 'https://wallup.net/shaun-the-sheep-animation-family-comedy-shaun-sheep-adventure-9/'),
    (5, NOW() + INTERVAL 25 SECOND, NOW(), 'https://solarsystem.nasa.gov/solar-system/sun/overview/'),
    (5, NOW() + INTERVAL 26 SECOND, NOW(), 'https://www.amazon.com/dp/B0863TXGM3?tag=theverge02-20&ascsubtag=__vg1223awD__24092021__7om1av');