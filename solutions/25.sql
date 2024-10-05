WITH minram AS (SELECT min(ram) FROM pc)
SELECT DISTINCT maker
FROM product
JOIN public.printer p on product.model = p.model
WHERE maker IN (SELECT maker
                FROM product
                         JOIN pc ON product.model = pc.model
                WHERE pc.ram <= (SELECT * FROM minram)
                  AND pc.speed >= (SELECT max(pc.speed) FROM pc WHERE ram <= (SELECT * FROM minram)));