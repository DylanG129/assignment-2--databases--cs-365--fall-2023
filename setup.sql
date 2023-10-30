DROP TABLE IF EXISTS Passwords;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('my secret passphrase', 512));
SET @init_vector = RANDOM_BYTES(16);

CREATE TABLE Passwords (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    WebsiteName VARCHAR(255) NOT NULL,
    WebsiteURL VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Password VARBINARY(255) NOT NULL,
    Comment TEXT,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO Passwords (WebsiteName, WebsiteURL, FirstName, LastName, Username, Email, Password, Comment)
VALUES 
('Youtube', 'https://www.youtube.com', 'Toby', 'Amita', 'TobyA21', 'TAmita88@gmail.com', AES_ENCRYPT('CoolDogs322', @key_str, @init_vector), 'My youtube addiction'),
('Google', 'https://www.google.com', 'Elina', 'Zahi', 'ElinaZ33', 'EZahi42@outlook.com', AES_ENCRYPT('YellowKitten426', @key_str, @init_vector), 'My google account'),
('Twitter', 'http://www.twitter.com', 'Ember', 'Marjory', 'EmberM28', 'EMajory09@gmail.com', AES_ENCRYPT('Crazyfrog501', @key_str, @init_vector), 'My twitter problem'),
('Tiktok', 'https://www.tiktok.com', 'Julius', 'Norton', 'JuliusN22', 'JNorton12@gmail.com', AES_ENCRYPT('GummyBear092', @key_str, @init_vector), 'shameful tiktok account'),
('Twitch', 'http://www.twitch.tv', 'Rona', 'Alysha', 'RonaA128', 'RAlysha52@yahoo.com', AES_ENCRYPT('SweetCaroline111', @key_str, @init_vector), 'catch up on the vtubers'),
('Quaver', 'https://www.quavergame.com', 'Lizzie', 'Emmitt', 'LizzieE23', 'LEmitt73@outlook.com', AES_ENCRYPT('RhythmGod129', @key_str, @init_vector), 'look at my states and placement'),
('Steam', 'http://www.store.steampowered.com', 'Daniella', 'Aaron', 'DaniellaA5', 'DAaron99@outlook.com', AES_ENCRYPT('IWillSurvive88', @key_str, @init_vector), 'What is the point of gamestop'),
('Microsoft', 'https://www.microsoft.com', 'Erica', 'Jaz', 'EricaJ12', 'Ejaz48@yahoo.com', AES_ENCRYPT('HMBaby1MTime', @key_str, @init_vector), 'microsoft is slowly taking over'),
('Outlook', 'http://www.outlook.live.com', 'Cora', 'Rocky', 'CoraR91', 'CRocky71@outlook.com', AES_ENCRYPT('D0ntSt0pBel1even', @key_str, @init_vector), 'everyone is using outlook'),
('Spotify', 'https://www.open.spotify.com', 'Tiara', 'Riordan', 'TiaraR02', 'TRiordan03@yahoo.com', AES_ENCRYPT('ATS1ngleLad1es', @key_str, @init_vector), 'I have an interesting taste in music');