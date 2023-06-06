SELECT
    user.user_name AS pessoa_usuaria,
    COUNT(history.date_play) AS musicas_ouvidas,
    ROUND(SUM(song.duration) / 60, 2) AS total_minutos
FROM
    SpotifyClone.users AS user
    INNER JOIN SpotifyClone.history AS history ON user.user_id = history.user_id
    INNER JOIN SpotifyClone.songs AS song ON song.song_id = history.song_id
GROUP BY
    pessoa_usuaria
ORDER BY
    pessoa_usuaria ASC;


