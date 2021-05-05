SELECT COUNT(*) FROM supplier
WHERE s_name IN (SELECT s_name FROM supplier, orders, nation, lineitem, customer
WHERE n_name IN ("FRANCE", "GERMANY") AND s_nationkey = n_nationkey AND s_suppkey = l_suppkey
AND o_custkey = c_custkey AND o_orderkey = l_orderkey
GROUP BY s_name HAVING COUNT(o_orderkey) < 30);