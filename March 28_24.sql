--Items which are frequently brought together--

With market_basket AS
(
SELECT c1.orderid,c1.customerid,
c1.productid AS product1,
c2.productid AS product2
From custorder c1 JOIN custorder c2
ON c1.orderid=c2.orderid AND c1.customerid=c2.customerid
AND c1.productid>c2.productid
)

SELECT product1,product2,COUNT(*) AS products_bought_together
FROM market_basket
GROUP BY product1,product2
ORDER BY products_bought_together DESC