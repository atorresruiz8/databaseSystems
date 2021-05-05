SELECT n_name FROM nation, customer
WHERE c_nationkey = n_nationkey
GROUP BY n_name HAVING COUNT(c_custkey) = (SELECT COUNT(c_custkey) FROM customer, nation 
WHERE c_nationkey = n_nationkey
GROUP BY n_name ORDER BY COUNT(c_custkey) DESC LIMIT 1);