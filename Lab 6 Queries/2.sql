SELECT COUNT(*) FROM customer
WHERE c_name IN (SELECT c_name FROM customer, orders
WHERE o_orderdate BETWEEN "1995-08-01" AND "1995-08-31" AND c_custkey = o_custkey
GROUP BY c_name HAVING COUNT(*) <= 2);