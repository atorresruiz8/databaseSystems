SELECT n_name, strftime('%Y',o_orderdate), COUNT(n_name) FROM orders, supplier, nation, lineitem
WHERE o_orderpriority = '3-MEDIUM' AND l_orderkey = o_orderkey AND l_suppkey = s_suppkey AND n_nationkey = s_nationkey
GROUP BY n_name, strftime('%Y',o_orderdate);