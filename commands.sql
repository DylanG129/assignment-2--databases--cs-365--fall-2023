

SELECT AES_DECRYPT(Password, @key_str, @init_vector) AS Password FROM Passwords WHERE WebsiteURL = 'http://www.someweb.com';

UPDATE Passwords SET WebsiteURL = 'http://www.someweb.com' WHERE ID = 1;

UPDATE Passwords SET Password = AES_ENCRYPT('TempPass', @key_str, @init_vector) WHERE ID = 1;

DELETE FROM Passwords WHERE WebsiteURL = 'http://www.website1.com';

DELETE FROM Passwords WHERE AES_DECRYPT(Password, @key_str, @init_vector) = 'pass';

