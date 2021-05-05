SELECT strftime('%m', l_shipdate), AVG(l_quantity) FROM lineitem
WHERE l_shipdate BETWEEN "1996-01-01" AND "1996-12-31"
GROUP BY strftime('%m', l_shipdate);