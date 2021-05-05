SELECT MAX((l_extendedprice*(1-l_discount))) FROM lineitem
WHERE l_shipdate > julianday(1994-10-02);