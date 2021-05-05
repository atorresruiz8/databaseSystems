SELECT COUNT(*) FROM supplier, partsupp, nation
WHERE s_nationkey = n_nationkey AND s_suppkey = ps_suppkey AND n_name = "CANADA"
AND ps_supplycost*ps_availqty IN (SELECT ps_supplycost * ps_availqty FROM partsupp
LIMIT (SELECT COUNT(*) * 0.03 FROM partsupp));