SELECT
  user_name AS pessoa_usuaria,
  IF(MAX(date_play) >= '2021-01-01', 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM
  SpotifyClone.users
  LEFT JOIN SpotifyClone.history ON users.user_id = history.user_id
GROUP BY
  users.user_id
ORDER BY
  pessoa_usuaria ASC;

