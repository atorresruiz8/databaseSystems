SELECT r_name FROM region, customer, supplier, lineitem, orders, nation
WHERE s_nationkey = n_nationkey AND c_custkey = o_custkey AND l_orderkey = o_orderkey
AND r_regionkey = n_regionkey AND c_nationkey = n_nationkey  AND l_suppkey = s_suppkey
GROUP BY r_name
ORDER BY SUM(l_extendedprice) DESC LIMIT 1;