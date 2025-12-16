-- Create orders table if not exists
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(20)
);

-- Stored procedure to update order status
DELIMITER $$
DROP PROCEDURE IF EXISTS update_order_status$$
CREATE PROCEDURE update_order_status(IN p_order_id INT, IN p_status VARCHAR(20))
BEGIN
    UPDATE orders SET status = p_status WHERE id = p_order_id;
END$$
DELIMITER ;
