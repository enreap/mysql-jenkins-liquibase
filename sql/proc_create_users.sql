-- Create users table if not exists
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)
);

-- Stored procedure to add a new user
DROP PROCEDURE IF EXISTS add_user;
CREATE PROCEDURE add_user(IN p_username VARCHAR(50), IN p_email VARCHAR(100))
BEGIN
    INSERT INTO users(username, email) VALUES (p_username, p_email);
END;
