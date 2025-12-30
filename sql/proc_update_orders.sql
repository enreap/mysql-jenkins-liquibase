DROP PROCEDURE IF EXISTS update_order_status;

CREATE PROCEDURE update_order_status(
    IN p_order_id INT,
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE orders
    SET status = p_status
    WHERE id = p_order_id;
END;
