SELECT r_name, COUNT(o_orderkey) FROM customer, region, nation, orders
WHERE o_orderstatus = 'F' AND r_regionkey = n_regionkey AND c_nationkey = n_nationkey AND o_custkey = c_custkey
GROUP BY r_name
ORDER BY COUNT(o_orderkey) DESC;