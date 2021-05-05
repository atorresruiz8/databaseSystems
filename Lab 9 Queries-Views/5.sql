SELECT c_name, COUNT(*) FROM Q1, Q5
WHERE n_name = "GERMANY" AND o_custkey = c_custkey AND o_orderyear LIKE "%1995%" 
GROUP BY c_name;