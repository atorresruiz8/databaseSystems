SELECT c_name, COUNT(*) FROM customer, orders, nation
WHERE n_name = "GERMANY" AND o_custkey = c_custkey AND c_nationkey = n_nationkey AND o_orderdate BETWEEN "1995-01-01" AND "1995-12-31"
GROUP BY c_name