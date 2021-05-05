SELECT n_name, o_orderstatus, COUNT(*) FROM Q1, Q5
WHERE r_name = "ASIA" AND c_custkey = o_custkey
GROUP BY o_orderstatus, n_name
ORDER BY n_name;