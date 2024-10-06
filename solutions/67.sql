WITH grouped AS (SELECT town_from, town_to, COUNT(*) as cnt FROM trip GROUP BY town_from, town_to)
SELECT COUNT(*) FROM grouped WHERE cnt >= (SELECT MAX(cnt) FROM grouped);