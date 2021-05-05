SELECT p_mfgr, o_orderpriority, COUNT(*) FROM part, Q5, lineitem
WHERE p_partkey = l_partkey AND l_orderkey = o_orderkey
GROUP BY o_orderpriority, p_mfgr
ORDER BY p_mfgr;
