SELECT n_name FROM nation, orders, customer
WHERE o_custkey = c_custkey AND c_nationkey = n_nationkey
GROUP BY n_name HAVING COUNT(o_totalprice) = (SELECT COUNT(o_totalprice) FROM nation, orders, customer
WHERE o_custkey = c_custkey AND c_nationkey = n_nationkey
GROUP BY n_name ORDER BY COUNT(o_totalprice) DESC LIMIT 1);