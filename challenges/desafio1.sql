DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans (
    plan_id INT AUTO_INCREMENT,
    plan_name VARCHAR(100) NOT NULL,
    price DOUBLE NOT NULL,
    CONSTRAINT PRIMARY KEY(plan_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.users (
    user_id INT AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    date_start DATE NOT NULL,
    CONSTRAINT PRIMARY KEY(user_id),
    FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans(plan_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists (
    artist_id INT AUTO_INCREMENT,
    artist_name VARCHAR(100) NOT NULL,
    CONSTRAINT PRIMARY KEY(artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.follows (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;
CREATE TABLE SpotifyClone.albums (
    album_id INT AUTO_INCREMENT,
    album_name VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    year_release YEAR NOT NULL,
    CONSTRAINT PRIMARY KEY(album_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs (
    song_id INT AUTO_INCREMENT,
    song_name VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    duration INT NOT NULL,
    CONSTRAINT PRIMARY KEY(song_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id),
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.history (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    date_play DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY(user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
    FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs(song_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (plan_name, price) 
VALUES 
    ("gratuito", '0'), 
    ("familiar", '7.99'), 
    ("universitário", '5.99'), 
    ("pessoal", '6.99');

INSERT INTO SpotifyClone.users (user_name, age, plan_id, date_start) 
VALUES
    ('Barbara Liskov', '82', '1', '2019-10-20'),
    ('Robert Cecil Martin', '58', '1', '2017-01-06'),
    ('Ada Lovelace', '37', '2', '2017-12-30'),
    ('Martin Fowler', '46', '2', '2017-01-17'),
    ('Sandi Metz', '58', '2', '2018-04-29'),
	  ('Paulo Freire', '19', '3', '2018-02-14'),
	  ('Bell Hooks', '26', '3', '2018-01-05'),
	  ('Christopher Alexander', '85', '4', '2019-06-05'),
	  ('Judith Butler', '45', '4', '2020-05-13'),
	  ('Jorge Amado', '58', '4', '2017-02-17');

INSERT INTO SpotifyClone.artists (artist_name) 
VALUES
  ('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

INSERT INTO SpotifyClone.follows (user_id, artist_id) 
VALUES
	('1', '1'),
	('1', '2'),
	('1', '3'),
	('2', '1'),
	('2', '3'),
	('3', '2'),
	('4', '4'),
	('5', '5'),
	('5', '6'),
	('6', '6'),
	('6', '1'),
	('7', '6'),
	('9', '3'),
	('10', '2');

INSERT INTO SpotifyClone.albums (album_name, artist_id, year_release) 
VALUES
	('Renaissance', '1', '2022'),
	('Jazz', '2', '1978'),
	('Hot Space', '2', '1982'),
	('Falso Brilhante', '3', '1998'),
	('Vento de Maio', '3', '2001'),
	('QVVJFA?', '4', '2003'),
	('Somewhere Far Beyond', '5', '2007'),
	('I Put A Spell On You', '6', '2012');

INSERT INTO SpotifyClone.songs (song_name, artist_id, album_id, duration) 
VALUES
	('Break My Soul', '1', '1', '279'),
	('Virgos Groove', '1', '1', '369'),
	('Alien Superstar', '1', '1', '116'),
	('Dont Stop Me Now', '2', '2', '203'),
	('Under Pressure', '2', '3', '152'),
	('Como Nossos Pais', '3', '4', '105'),
	('O Medo de Amar é o Medo de Ser Livre', '3', '5', '207'),
	('Samba em Paris', '4', '6', '267'),
	('The Bards Song', '5', '7', '244'),
	('Feeling Good', '6', '8', '100');

INSERT INTO SpotifyClone.history (song_id, user_id, date_play) 
VALUES
  ('8', '1', '2022-02-28 10:45:55'),
  ('2', '1', '2020-05-02 05:30:35'),
  ('10', '1', '2020-03-06 11:22:33'),
  ('10', '2', '2022-08-05 08:05:17'),
  ('7', '2', '2020-01-02 07:40:33'),
  ('10', '3', '2020-11-13 16:55:13'),
  ('2', '3', '2020-12-05 18:38:30'),
  ('8', '4', '2021-08-15 17:10:10'),
  ('8', '5', '2022-01-09 01:44:33'),
  ('5', '5', '2020-08-06 15:23:43'),
  ('7', '6', '2017-01-24 00:31:17'),
  ('1', '6', '2017-10-12 12:35:20'),
  ('4', '7', '2011-12-15 22:30:49'),
  ('4', '8', '2012-03-17 14:56:41'),
  ('9', '9', '2022-02-24 21:14:22'),
  ('3', '10', '2015-12-13 08:30:22');
