SELECT COUNT(*) AS musicas_no_historico
FROM SpotifyClone.history h
JOIN SpotifyClone.users u ON u.user_id = h.user_id
WHERE u.user_name = 'Barbara Liskov';
