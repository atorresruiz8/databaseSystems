SELECT COUNT(distinct o_clerk) FROM orders, nation, supplier, lineitem
WHERE n_name = "RUSSIA" AND n_nationkey = s_nationkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey;