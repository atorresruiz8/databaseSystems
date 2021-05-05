SELECT n_name, COUNT(*) FROM supplier, nation
WHERE s_nationkey = n_nationkey
GROUP BY n_name;