SELECT o_orderpriority, COUNT(o_orderkey) FROM orders, lineitem
WHERE o_orderdate BETWEEN "1996-01-01" AND "1996-12-31" AND o_orderkey = l_orderkey
AND (julianday(l_commitdate) - julianday(l_receiptdate)) > 0
GROUP BY o_orderpriority;