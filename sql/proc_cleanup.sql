CREATE PROCEDURE cleanup_logs()
BEGIN
    DELETE FROM logs
    WHERE created_at < NOW() - INTERVAL 7 DAY;
END
