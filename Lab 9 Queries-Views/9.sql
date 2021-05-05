SELECT COUNT(distinct o_clerk) FROM Q5, Q2, lineitem
WHERE n_name = "RUSSIA" AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey;