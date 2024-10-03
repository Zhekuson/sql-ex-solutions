WITH sub AS (
    SELECT model, price FROM printer
    UNION
    SELECT model, price FROM pc
    UNION
    SELECT model, price FROM laptop
)

SELECT model FROM sub WHERE price >= (SELECT MAX(price) FROM sub)