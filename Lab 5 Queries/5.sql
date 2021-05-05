SELECT s_name, p_size, MIN(ps_supplycost) FROM supplier, part, partsupp, region, nation
WHERE r_name = "AMERICA" AND p_type LIKE "%STEEL%" AND n_regionkey = r_regionkey 
AND s_nationkey = n_nationkey AND s_suppkey = ps_suppkey AND p_partkey = ps_partkey
GROUP BY p_size
ORDER BY s_name;