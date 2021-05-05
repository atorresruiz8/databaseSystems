SELECT n_name, COUNT(s_nationkey), AVG(s_acctbal) FROM nation, supplier
WHERE supplier.s_nationkey = nation.n_nationkey GROUP BY nation.n_name
HAVING COUNT(supplier.s_nationkey) >= 5;