SELECT p_type, MAX(l_discount) FROM part, lineitem
WHERE p_partkey = l_partkey AND p_type LIKE '%ECONOMY%'
GROUP BY p_type;