SELECT COUNT(*) FROM supplier
WHERE s_name IN (SELECT s_name FROM supplier, nation, part, partsupp
WHERE n_name = "CANADA" AND p_partkey = ps_partkey AND s_nationkey = n_nationkey
AND ps_suppkey = s_suppkey
GROUP BY s_name HAVING COUNT(*) >= 4);