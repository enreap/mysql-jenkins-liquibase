DROP PROCEDURE IF EXISTS add_user;

CREATE PROCEDURE add_user(
    IN p_username VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_company VARCHAR(50),
    IN p_domain VARCHAR(50),
    IN p_team VARCHAR(50)
)
BEGIN
    INSERT INTO users(username, email, company, domain, team)
    VALUES (p_username, p_email, p_company, p_domain, p_team);
END;
