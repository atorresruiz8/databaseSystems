SELECT COUNT(*) FROM part
WHERE p_name IN (SELECT p_name FROM part, partsupp, supplier, nation
WHERE n_name = "CANADA" AND n_nationkey = s_nationkey AND p_partkey = ps_partkey 
AND s_suppkey = ps_suppkey
GROUP BY p_name HAVING COUNT(*) > 1);