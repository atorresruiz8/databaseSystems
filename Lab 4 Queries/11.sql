SELECT r_name, s_name FROM region, supplier, nation
WHERE n_nationkey = s_nationkey AND r_regionkey = n_regionkey
GROUP BY r_name
ORDER BY r_name, MAX(s_acctbal);