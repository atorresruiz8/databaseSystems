SELECT COUNT(DISTINCT c_custkey) FROM lineitem, customer, orders
WHERE l_discount >= 0.04 AND l_orderkey = o_orderkey AND c_custkey = o_custkey;