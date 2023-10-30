-- adds new entry
INSERT INTO Passwords (WebsiteName, WebsiteURL, FirstName, LastName, Username, Email, Password, Comment)
VALUES ('Mysql', 'http://www.mysql.com', 'Dylan', 'Gomez', 'DylanG123', 'Dgomez123@yahoo.com', AES_ENCRYPT('RedCat14', @key_str, @init_vector), 'New MySQL account');

-- gives back deciphered password
SELECT CAST(AES_DECRYPT(Password, @key_str, @init_vector) AS CHAR) AS Real_pass FROM Passwords WHERE WebsiteURL = 'http://www.someweb.com';

-- gives back all entry info from a limit of WebsiteURLs with 'https'
SELECT *, CAST(AES_DECRYPT(Password, @key_str, @init_vector)AS CHAR) AS Real_pass
FROM Passwords 
WHERE WebsiteURL LIKE 'https://%' 
LIMIT 2;

-- change WebsiteURL using WebsiteURL
UPDATE Passwords SET WebsiteURL = 'http://www.newsite.com' WHERE WebsiteURL = 'https://www.actualsite.com';

-- change Password using WebsiteURL
UPDATE Passwords SET Password = AES_ENCRYPT('newpassword', @key_str, @init_vector) WHERE WebsiteURL = 'https://www.somesite.com';

-- delete entry based on given WebsiteURL
DELETE FROM Passwords WHERE WebsiteURL = 'http://www.thesite.com';

-- delete entry based on given Password
DELETE FROM Passwords WHERE AES_DECRYPT(Password, @key_str, @init_vector) = 'thepass';

