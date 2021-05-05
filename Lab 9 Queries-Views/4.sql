SELECT s_name, COUNT(*) FROM Q2, part, partsupp
WHERE n_name = "BRAZIL" AND s_suppkey = ps_suppkey AND ps_partkey = p_partkey AND p_size < 20
GROUP BY s_name;