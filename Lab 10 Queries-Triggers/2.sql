CREATE TRIGGER T2
         AFTER UPDATE
            ON customer
          WHEN OLD.c_acctbal <> NEW.c_acctbal
BEGIN
    UPDATE customer
       SET c_comment = "Negative balance!!! Add money now!"
     WHERE c_acctbal < 0;
END;

CREATE TRIGGER T3
         AFTER UPDATE
            ON customer
          WHEN OLD.c_acctbal <> NEW.c_acctbal
BEGIN
    UPDATE customer
       SET c_comment = "Balance is no longer negative. Warning removed."
     WHERE c_acctbal > -1;
END;

UPDATE customer
SET c_acctbal = -100
WHERE c_nationkey IN (SELECT n_nationkey FROM nation, region WHERE n_regionkey = r_regionkey AND r_name = "ASIA");

SELECT COUNT(*) FROM customer, nation
WHERE n_name = "CHINA" AND n_nationkey = c_nationkey AND c_acctbal <= -1;

UPDATE customer
SET c_acctbal = -100
WHERE 
c_nationkey IN (SELECT n_nationkey FROM nation WHERE n_name = "JAPAN");

SELECT COUNT(*) FROM region, nation, customer
WHERE r_name = "ASIA" AND r_regionkey = n_regionkey AND c_nationkey = n_nationkey AND c_acctbal <= -1;
