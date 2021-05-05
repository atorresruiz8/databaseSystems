SELECT n_name FROM nation, lineitem, supplier, orders
WHERE l_shipdate BETWEEN "1996-01-01" AND "1996-12-31" AND n_nationkey = s_nationkey AND l_suppkey = s_suppkey 
AND l_orderkey = o_orderkey
GROUP BY n_name ORDER BY SUM(l_extendedprice) DESC LIMIT 1;