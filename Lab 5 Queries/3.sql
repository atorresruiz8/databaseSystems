SELECT MAX(l_discount) FROM lineitem, orders
WHERE o_orderdate BETWEEN "1995-05-01" AND "1995-05-31" AND 
l_discount < (SELECT AVG(l_discount) FROM lineitem) AND l_orderkey = o_orderkey;