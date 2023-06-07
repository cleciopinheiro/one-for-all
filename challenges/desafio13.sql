SELECT
  faixa_etaria,
  COUNT(DISTINCT u.user_id) AS total_pessoas_usuarias,
  COUNT(DISTINCT fs.user_id, fs.song_id) AS total_favoritadas
FROM (
  SELECT
    users.user_id,
    users.age,
    CASE
      WHEN users.age <= 30 THEN 'Até 30 anos'
      WHEN users.age > 30 AND users.age <= 60 THEN 'Entre 31 e 60 anos'
      ELSE 'Maior de 60 anos'
    END AS faixa_etaria
  FROM SpotifyClone.users
) AS u
LEFT JOIN SpotifyClone.favorites AS fs ON u.user_id = fs.user_id
GROUP BY faixa_etaria
ORDER BY
  CASE
    WHEN faixa_etaria = 'Até 30 anos' THEN 1
    WHEN faixa_etaria = 'Entre 31 e 60 anos' THEN 2
    ELSE 3
  END;