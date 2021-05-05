SELECT COUNT(DISTINCT o_orderkey) FROM region, orders, nation, supplier, customer, lineitem
WHERE r_name = "EUROPE" AND s_nationkey = n_nationkey AND n_regionkey = r_regionkey
AND c_custkey = o_custkey AND o_orderkey = l_orderkey AND l_suppkey = s_suppkey
AND c_nationkey = (SELECT c_nationkey FROM customer, nation 
WHERE c_nationkey = n_nationkey AND n_name = "CANADA");