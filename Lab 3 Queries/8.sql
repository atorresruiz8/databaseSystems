SELECT s_name, s_comment FROM supplier, nation, region
WHERE s_comment >= 1000 AND r_name = 'ASIA' AND r_regionkey = n_regionkey AND s_nationkey = n_nationkey;