SELECT AVG(price) FROM (
    SELECT price, maker FROM pc JOIN product ON pc.model = product.model
    UNION ALL
    SELECT price, maker FROM laptop JOIN product ON laptop.model = product.model
) AS f WHERE maker = 'A';