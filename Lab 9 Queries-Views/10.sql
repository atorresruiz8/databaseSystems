SELECT p_type, MAX(l_discount) FROM Q10, lineitem
WHERE p_type LIKE '%ECONOMY%'
GROUP BY p_type;