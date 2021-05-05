SELECT n_name, o_orderstatus, COUNT(*) FROM nation, orders, region, customer
WHERE r_name = "ASIA" AND n_nationkey = c_nationkey AND c_custkey = o_custkey AND r_regionkey = n_regionkey
GROUP BY o_orderstatus, n_name
ORDER BY n_name;