SELECT r_name, MAX(s_acctbal) FROM region, supplier, nation
WHERE r_regionkey = n_regionkey AND s_nationkey = n_nationkey
GROUP BY r_name;