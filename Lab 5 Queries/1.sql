SELECT COUNT(distinct c_name) FROM customer, nation, region
WHERE r_regionkey = n_regionkey AND c_nationkey = n_nationkey
AND r_name != "EUROPE" AND r_name != "AFRICA";