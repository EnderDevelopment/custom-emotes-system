CREATE TABLE IF NOT EXISTS custom_emotes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dict VARCHAR(255) NOT NULL,
    anim VARCHAR(255) NOT NULL,
    category VARCHAR(255) DEFAULT 'General'
);

INSERT INTO custom_emotes (name, dict, anim, category) VALUES
('Dance', 'anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity', 'hi_dance_facedj_17_v1_male^1', 'Dance'),
('Wave', 'gestures@m@standing@casual', 'gesture_hello', 'Greetings'),
('Point', 'gestures@m@standing@casual', 'gesture_point', 'Gestures');