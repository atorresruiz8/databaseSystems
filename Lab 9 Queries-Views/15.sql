SELECT COUNT(DISTINCT o_orderkey) FROM Q151, Q152, orders, lineitem
WHERE s_suppkey = l_suppkey AND l_orderkey = o_orderkey AND o_custkey = c_custkey;