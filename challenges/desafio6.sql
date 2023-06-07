SELECT 
    CASE WHEN MIN(p.price) = 0 THEN '0.00' ELSE '0' END AS faturamento_minimo,
    CAST(MAX(p.price) AS CHAR) AS faturamento_maximo,
    CAST(ROUND(AVG(p.price), 2) AS CHAR) AS faturamento_medio,
    CAST(ROUND(SUM(p.price), 2) AS CHAR) AS faturamento_total
FROM SpotifyClone.users u
JOIN SpotifyClone.plans p ON u.plan_id = p.plan_id;
