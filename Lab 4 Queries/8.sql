SELECT n_name, COUNT(*) FROM nation, orders, supplier, region, lineitem
WHERE r_name = "AMERICA" AND s_nationkey = n_nationkey AND n_regionkey = r_regionkey
AND o_orderstatus = "F" AND o_orderkey = l_orderkey AND l_suppkey = s_suppkey
AND o_orderdate BETWEEN "1995-01-01" AND "1995-12-31"
GROUP BY n_name;