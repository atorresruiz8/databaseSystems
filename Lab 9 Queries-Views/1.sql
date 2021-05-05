SELECT c_name, SUM(o_totalprice), n_name FROM Q1, orders
WHERE n_name = "FRANCE" AND c_custkey = o_custkey
GROUP BY c_name;