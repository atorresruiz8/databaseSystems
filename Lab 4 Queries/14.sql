SELECT r1.r_name, r2.r_name, SUM(l_extendedprice)
FROM region r1, region r2, nation n1, nation n2, lineitem, customer, supplier, orders
WHERE l_orderkey = o_orderkey AND c_custkey = o_custkey AND c_nationkey = n2.n_nationkey
AND n2.n_regionkey = r2.r_regionkey AND l_suppkey = s_suppkey AND s_nationkey = n1.n_nationkey
AND n1.n_regionkey = r1.r_regionkey
GROUP BY r1.r_name, r2.r_name;