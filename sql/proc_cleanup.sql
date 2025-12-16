-- Create logs table if not exists
CREATE TABLE IF NOT EXISTS logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Stored procedure to delete old logs
DELIMITER $$
DROP PROCEDURE IF EXISTS cleanup_old_logs$$
CREATE PROCEDURE cleanup_old_logs()
BEGIN
    DELETE FROM logs WHERE created_at < NOW() - INTERVAL 30 DAY;
END$$
DELIMITER ;
