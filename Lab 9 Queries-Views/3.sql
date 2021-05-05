SELECT n_name, COUNT(*) FROM Q1, orders
WHERE r_name = "EUROPE" AND o_custkey = c_custkey
GROUP BY n_name;