SELECT r_name, COUNT(distinct c_name) FROM region, nation, customer, orders
WHERE c_acctbal > (SELECT AVG(c_acctbal) FROM customer) AND c_custkey NOT IN (SELECT o_custkey FROM orders)
AND c_nationkey = n_nationkey AND n_regionkey = r_regionkey
GROUP BY r_name;