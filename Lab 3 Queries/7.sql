SELECT l_receiptdate, COUNT(l_receiptdate) FROM lineitem, customer, orders
WHERE c_name = 'Customer#000000118' AND o_orderkey = l_orderkey AND c_custkey = o_custkey
GROUP BY l_receiptdate;