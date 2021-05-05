SELECT n_name, COUNT(*) FROM nation, orders, customer, region
WHERE r_name = "EUROPE" AND o_custkey = c_custkey AND r_regionkey = n_regionkey AND c_nationkey = n_nationkey
GROUP BY n_name;