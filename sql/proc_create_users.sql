DROP PROCEDURE IF EXISTS add_user;
CREATE PROCEDURE add_user(IN uname VARCHAR(50), IN mail VARCHAR(100))
BEGIN
    INSERT INTO users(username, email) VALUES (uname, mail);
END;
