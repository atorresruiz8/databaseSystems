SELECT COUNT(DISTINCT o_orderkey) FROM supplier, customer, orders, lineitem
WHERE c_acctbal < 0 AND s_acctbal > 0 AND s_suppkey = l_suppkey
AND l_orderkey = o_orderkey AND o_custkey = c_custkey;