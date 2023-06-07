SELECT
  a.artist_name AS artista,
  CASE
    WHEN COUNT(fs.song_id) >= 5 THEN 'A'
    WHEN COUNT(fs.song_id) BETWEEN 3 AND 4 THEN 'B'
    WHEN COUNT(fs.song_id) BETWEEN 1 AND 2 THEN 'C'
    ELSE '-'
  END AS ranking
FROM
  SpotifyClone.artists a
LEFT JOIN
  SpotifyClone.songs s ON a.artist_id = s.artist_id
LEFT JOIN
  SpotifyClone.favorites fs ON s.song_id = fs.song_id
GROUP BY
  artista
ORDER BY
  COUNT(fs.song_id) DESC,
  artista ASC;