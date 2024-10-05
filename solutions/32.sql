SELECT
    country,
    CAST(AVG((bore * bore * bore) / 2) AS DECIMAL(12,2)) AS weight
FROM classes
LEFT JOIN public.ships s on classes.class = s.class
GROUP BY country;