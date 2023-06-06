SELECT 
    IF(MIN(p.price) = 0, '0.00', '0') AS faturamento_minimo,
    CONVERT(MAX(p.price), CHAR) AS faturamento_maximo,
    CONVERT(ROUND(AVG(p.price), 2), CHAR) AS faturamento_medio,
    CONVERT(ROUND(SUM(p.price), 2), CHAR) AS faturamento_total
FROM SpotifyClone.users u
JOIN SpotifyClone.plans p ON u.plan_id = p.plan_id;

