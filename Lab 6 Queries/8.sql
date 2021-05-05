SELECT COUNT(distinct o_orderkey) FROM orders, customer
WHERE c_custkey = o_custkey AND o_orderkey NOT IN (SELECT o_orderkey FROM orders, lineitem, nation, supplier, region
WHERE n_regionkey = r_regionkey AND s_suppkey = l_suppkey AND o_orderkey = l_orderkey 
AND s_nationkey = n_nationkey AND r_name != "ASIA");