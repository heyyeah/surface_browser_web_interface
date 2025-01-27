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
    (0, NOW() + INTERVAL 51 MINUTE, NOW() + INTERVAL 51 MINUTE, 'browserfood.html'),
    (0, NOW() + INTERVAL 52 MINUTE, NOW() + INTERVAL 52 MINUTE, 'https://www.bbc.com'),
    (1, NOW() + INTERVAL 53 MINUTE, NOW() + INTERVAL 53 MINUTE, 'browser art'),
    (0, NOW() + INTERVAL 54 MINUTE, NOW() + INTERVAL 54 MINUTE, 'https://edition.cnn.com'),
    (0, NOW() + INTERVAL 55 MINUTE, NOW() + INTERVAL 55 MINUTE, 'https://www.theverge.com'),
    (3, NOW() + INTERVAL 56 MINUTE, NOW() + INTERVAL 56 MINUTE, 'otters'),
    (0, NOW() + INTERVAL 57 MINUTE, NOW() + INTERVAL 57 MINUTE, 'https://www.theartnewspaper.com/keywords/digital-art'),
    (0, NOW() + INTERVAL 58 MINUTE, NOW() + INTERVAL 58 MINUTE, 'https://www.monopol-magazin.de'),
    (0, NOW() + INTERVAL 59 MINUTE, NOW() + INTERVAL 59 MINUTE, 'https://solarsystem.nasa.gov/solar-system/sun/overview/'),
    (0, NOW() + INTERVAL 1 HOUR, NOW() + INTERVAL 1 HOUR, 'https://artforum.com');

-- Insert test content links (type 5)
INSERT INTO zkm (type, accessed, modified, address) VALUES
    (5, NOW() - INTERVAL 50 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://www.boxc.net'),
    (5, NOW() - INTERVAL 49 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://boxc.net'),
    (5, NOW() - INTERVAL 48 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://www.boxc.net/files/zkm/browserfood_tests.html'),
    (5, NOW() - INTERVAL 47 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://www.boxc.net/browserfood_INC.html'),
    (5, NOW() - INTERVAL 46 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://www.boxc.net/browserfood_INC_i.html'),
    (5, NOW() - INTERVAL 45 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://www.boxc.net/files/zkm/index.phtml'),
    (5, NOW() - INTERVAL 44 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://theverge.com'),
    (6, NOW() - INTERVAL 43 MINUTE, NOW() - INTERVAL 1 HOUR, 'rabbits'),
    (5, NOW() - INTERVAL 42 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://cnn.com'),
    (5, NOW() - INTERVAL 41 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://bbc.com'),
    (5, NOW() - INTERVAL 40 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://techmeme.com'),
    (5, NOW() - INTERVAL 39 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://unsplash.com'),
    (5, NOW() - INTERVAL 38 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://macrumors.com'),
    (5, NOW() - INTERVAL 37 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://wallup.net/shaun-the-sheep-animation-family-comedy-shaun-sheep-adventure-9/'),
    (5, NOW() - INTERVAL 36 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://solarsystem.nasa.gov/solar-system/sun/overview/'),
    (5, NOW() - INTERVAL 35 MINUTE, NOW() - INTERVAL 1 HOUR, 'https://www.amazon.com/dp/B0863TXGM3?tag=theverge02-20&ascsubtag=__vg1223awD__24092021__7om1av');