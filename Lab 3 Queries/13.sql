SELECT AVG(c_acctbal) FROM customer, region, nation
WHERE r_name = 'EUROPE' AND c_mktsegment = 'MACHINERY' AND r_regionkey = n_regionkey AND n_nationkey = c_nationkey;