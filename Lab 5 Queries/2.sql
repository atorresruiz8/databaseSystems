SELECT r_name, COUNT(distinct s_name) FROM region, nation, supplier
WHERE s_nationkey = n_nationkey AND n_regionkey = r_regionkey
AND r_name = "AFRICA" AND s_acctbal > (SELECT AVG(s_acctbal) FROM supplier, region, nation
WHERE s_nationkey = n_nationkey AND n_regionkey = r_regionkey AND r_name = "AFRICA")
UNION
SELECT r_name, COUNT(distinct s_name) FROM region, nation, supplier
WHERE s_nationkey = n_nationkey AND n_regionkey = r_regionkey
AND r_name = "AMERICA" AND s_acctbal > (SELECT AVG(s_acctbal) FROM supplier, region, nation
WHERE s_nationkey = n_nationkey AND n_regionkey = r_regionkey AND r_name = "AMERICA")
UNION
SELECT r_name, COUNT(distinct s_name) FROM region, nation, supplier
WHERE s_nationkey = n_nationkey AND n_regionkey = r_regionkey
AND r_name = "ASIA" AND s_acctbal > (SELECT AVG(s_acctbal) FROM supplier, region, nation
WHERE s_nationkey = n_nationkey AND n_regionkey = r_regionkey AND r_name = "ASIA")
UNION
SELECT r_name, COUNT(distinct s_name) FROM region, nation, supplier
WHERE s_nationkey = n_nationkey AND n_regionkey = r_regionkey
AND r_name = "EUROPE" AND s_acctbal > (SELECT AVG(s_acctbal) FROM supplier, region, nation
WHERE s_nationkey = n_nationkey AND n_regionkey = r_regionkey AND r_name = "EUROPE")
UNION
SELECT r_name, COUNT(distinct s_name) FROM region, nation, supplier
WHERE s_nationkey = n_nationkey AND n_regionkey = r_regionkey
AND r_name = "MIDDLE EAST" AND s_acctbal > (SELECT AVG(s_acctbal) FROM supplier, region, nation
WHERE s_nationkey = n_nationkey AND n_regionkey = r_regionkey AND r_name = "MIDDLE EAST");