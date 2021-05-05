SELECT o_orderpriority, COUNT(distinct o_orderkey) FROM orders, lineitem
WHERE o_orderdate BETWEEN "1996-10-01" AND "1996-12-31" AND
l_orderkey = o_orderkey AND (julianday(l_commitdate)-julianday(l_receiptdate)) < 0
GROUP BY o_orderpriority;