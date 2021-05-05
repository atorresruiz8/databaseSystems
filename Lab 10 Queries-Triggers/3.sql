CREATE TRIGGER T4
         AFTER DELETE
            ON lineitem
      FOR EACH ROW
BEGIN
    UPDATE orders
       SET o_orderpriority = "HIGH"
     WHERE o_orderkey = OLD.l_orderkey;
END;

CREATE TRIGGER T5
         AFTER INSERT
            ON lineitem
      FOR EACH ROW
BEGIN
    UPDATE orders
       SET o_orderpriority = "HIGH"
     WHERE o_orderkey = NEW.l_orderkey;
END;

DELETE FROM lineitem
WHERE l_orderkey = (SELECT l_orderkey FROM lineitem, orders WHERE o_orderkey = l_orderkey AND o_orderdate LIKE "%1995-08%");

SELECT COUNT(*) FROM orders
WHERE o_orderdate LIKE "%1995-08%" AND o_orderpriority LIKE "%HIGH%";