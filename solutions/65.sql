WITH selection AS (SELECT maker,
                          type,
                          row_number() over (partition by maker ORDER BY maker, length(type)) AS number,
                          length(type)                                                        as len
                   FROM (
                       SELECT DISTINCT type, maker FROM product
                        ) AS s)

SELECT row_number() over () as num,
       CASE
           WHEN number = 1
               THEN maker
           ELSE ''
           END              AS maker,
       type

FROM selection
ORDER BY num;
