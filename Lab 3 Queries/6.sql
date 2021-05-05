SELECT DISTINCT n_name FROM nation, customer, orders
WHERE n_nationkey = c_nationkey AND o_custkey = c_custkey AND o_orderdate LIKE '1996-12%';