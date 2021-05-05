SELECT COUNT(distinct s_name) FROM supplier, part, partsupp
WHERE p_retailprice = (SELECT MIN(p_retailprice) FROM part) AND p_partkey = ps_partkey AND s_suppkey = ps_suppkey;