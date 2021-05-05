CREATE TRIGGER T1
         AFTER INSERT
            ON orders
      FOR EACH ROW
BEGIN
    UPDATE orders
       SET o_orderdate = DATETIME('NOW', '+1 day');
END;


INSERT INTO orders
SELECT o_orderkey, o_custkey, o_orderstatus, o_totalprice, " ", o_orderpriority, o_clerk, o_shippriority, o_comment
FROM orders
WHERE o_orderdate LIKE "%1996-08%";

SELECT * FROM orders
WHERE o_orderdate LIKE "%2019%";