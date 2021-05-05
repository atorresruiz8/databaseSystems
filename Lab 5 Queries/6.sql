SELECT p_mfgr FROM supplier, part, partsupp
WHERE ps_availqty = (SELECT MIN(ps_availqty) FROM supplier, part, partsupp
WHERE s_name = "Supplier#000000053" AND s_suppkey = ps_suppkey) AND ps_suppkey = s_suppkey
AND ps_partkey = p_partkey AND s_name = "Supplier#000000053";