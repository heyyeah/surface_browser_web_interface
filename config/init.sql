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
    (0, NOW() - INTERVAL 20 SECOND, NOW() - INTERVAL 19 SECOND, 'browserfood.html'),
    (0, NOW() - INTERVAL 19 SECOND, NOW() - INTERVAL 18 SECOND, 'https://www.bbc.com'),
    (1, NOW() - INTERVAL 18 SECOND, NOW() - INTERVAL 17 SECOND, 'browser art'),
    (0, NOW() - INTERVAL 17 SECOND, NOW() - INTERVAL 16 SECOND, 'https://edition.cnn.com'),
    (0, NOW() - INTERVAL 16 SECOND, NOW() - INTERVAL 15 SECOND, 'https://www.theverge.com'),
    (3, NOW() - INTERVAL 15 SECOND, NOW() - INTERVAL 14 SECOND, 'otters'),
    (0, NOW() - INTERVAL 14 SECOND, NOW() - INTERVAL 13 SECOND, 'https://www.theartnewspaper.com/keywords/digital-art'),
    (0, NOW() - INTERVAL 13 SECOND, NOW() - INTERVAL 12 SECOND, 'https://www.monopol-magazin.de'),
    (0, NOW() - INTERVAL 12 SECOND, NOW() - INTERVAL 11 SECOND, 'https://solarsystem.nasa.gov/solar-system/sun/overview/'),
    (0, NOW() - INTERVAL 11 SECOND, NOW() - INTERVAL 10 SECOND, 'https://artforum.com');

-- Insert test content links (type 5)
INSERT INTO zkm (type, accessed, modified, address) VALUES
    (5, NOW() - INTERVAL 21 SECOND, NOW() - INTERVAL 20 SECOND, 'https://www.boxc.net'),
    (5, NOW() - INTERVAL 22 SECOND, NOW() - INTERVAL 21 SECOND, 'browserfood.html'),
    (6, NOW() - INTERVAL 23 SECOND, NOW() - INTERVAL 22 SECOND, 'sprüngli'),
    (7, NOW() - INTERVAL 24 SECOND, NOW() - INTERVAL 23 SECOND, 'sprüngli'),
    (5, NOW() - INTERVAL 25 SECOND, NOW() - INTERVAL 24 SECOND, 'https://www.boxc.net/files/zkm/browserfood_tests.html'),
    (5, NOW() - INTERVAL 26 SECOND, NOW() - INTERVAL 25 SECOND, 'https://www.boxc.net/browserfood_INC.html'),
    (5, NOW() - INTERVAL 27 SECOND, NOW() - INTERVAL 26 SECOND, 'https://www.boxc.net/browserfood_INC_i.html'),
    (5, NOW() - INTERVAL 28 SECOND, NOW() - INTERVAL 27 SECOND, 'https://www.boxc.net/files/zkm/index.phtml'),
    (5, NOW() - INTERVAL 29 SECOND, NOW() - INTERVAL 28 SECOND, 'https://theverge.com'),
    (6, NOW() - INTERVAL 30 SECOND, NOW() - INTERVAL 29 SECOND, 'chocolate'),
    (5, NOW() - INTERVAL 31 SECOND, NOW() - INTERVAL 30 SECOND, 'https://cnn.com'),
    (5, NOW() - INTERVAL 32 SECOND, NOW() - INTERVAL 31 SECOND, 'https://bbc.com'),
    (5, NOW() - INTERVAL 33 SECOND, NOW() - INTERVAL 32 SECOND, 'https://techmeme.com'),
    (5, NOW() - INTERVAL 34 SECOND, NOW() - INTERVAL 33 SECOND, 'https://unsplash.com'),
    (5, NOW() - INTERVAL 35 SECOND, NOW() - INTERVAL 34 SECOND, 'https://macrumors.com'),
    (5, NOW() - INTERVAL 36 SECOND, NOW() - INTERVAL 35 SECOND, 'https://wallup.net/shaun-the-sheep-animation-family-comedy-shaun-sheep-adventure-9/'),
    (5, NOW() - INTERVAL 37 SECOND, NOW() - INTERVAL 36 SECOND, 'https://solarsystem.nasa.gov/solar-system/sun/overview/'),
    (5, NOW() - INTERVAL 38 SECOND, NOW() - INTERVAL 37 SECOND, 'https://www.amazon.com/dp/B0863TXGM3?tag=theverge02-20&ascsubtag=__vg1223awD__24092021__7om1av');