SELECT n_name, COUNT(*) FROM Q2, Q5, lineitem
WHERE r_name = "AMERICA" AND o_orderstatus = "F" AND o_orderkey = l_orderkey 
AND l_suppkey = s_suppkey AND o_orderyear LIKE "%1995%"
GROUP BY n_name;