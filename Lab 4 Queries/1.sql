SELECT c_name, SUM(o_totalprice), n_name FROM customer, orders, nation
WHERE n_name = "FRANCE" AND c_custkey = o_custkey AND n_nationkey = c_nationkey
GROUP BY c_Name;