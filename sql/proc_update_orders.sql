CREATE PROCEDURE update_order(
    IN oid INT,
    IN stat VARCHAR(20)
)
BEGIN
    UPDATE orders
    SET status = stat
    WHERE id = oid;
END


-- DROP PROCEDURE IF EXISTS update_order;
-- CREATE PROCEDURE update_order(IN oid INT, IN stat VARCHAR(20))
-- BEGIN
--     UPDATE orders SET status = stat WHERE id = oid;
-- END;
