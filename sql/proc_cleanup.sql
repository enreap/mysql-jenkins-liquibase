-- Stored procedure to delete old logs

DROP PROCEDURE IF EXISTS cleanup_old_logs;

CREATE PROCEDURE cleanup_old_logs()
BEGIN
    DELETE FROM logs
    WHERE created_at < NOW() - INTERVAL 30 DAY;
END;
