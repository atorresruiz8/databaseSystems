SELECT r_name, s_name FROM Q2
GROUP BY r_name
ORDER BY r_name, MAX(s_acctbal);