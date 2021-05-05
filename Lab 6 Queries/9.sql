SELECT distinct p_name FROM part, orders, customer, nation, region, lineitem
WHERE r_name = "AMERICA" AND o_orderkey = l_orderkey AND c_custkey = o_custkey 
AND n_regionkey = r_regionkey AND p_partkey = l_partkey
AND p_name IN (SELECT p_name FROM part, partsupp, supplier, region, nation
WHERE r_name = "ASIA" AND p_partkey = ps_partkey AND s_suppkey = ps_suppkey AND s_nationkey = n_nationkey
AND r_regionkey = n_regionkey
GROUP BY p_name HAVING COUNT(distinct s_suppkey) = 4)
ORDER BY p_name;