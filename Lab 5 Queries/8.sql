SELECT COUNT(distinct s_name) FROM supplier, part, partsupp
WHERE p_type LIKE "%MEDIUM POLISHED%" AND p_size IN (3,23,26,49) AND s_suppkey = ps_suppkey
AND ps_partkey = p_partkey;