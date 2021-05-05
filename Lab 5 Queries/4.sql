SELECT n_name, COUNT(distinct c_name), COUNT(distinct s_name) FROM region, supplier, customer, nation
WHERE r_name = "EUROPE" AND c_nationkey = n_nationkey AND r_regionkey = n_regionkey
AND s_nationkey = n_nationkey
GROUP BY n_name;