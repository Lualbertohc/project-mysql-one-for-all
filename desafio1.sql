DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.planos(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(45) NOT NULL,
  valor DECIMAL(3, 2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.usuarios(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  idade INT NOT NULL,
  data_assinatura DATE NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos(plano_id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.artistas(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.albuns(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(100) NOT NULL,
  lancamento YEAR NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.musicas(
  musica_id INT PRIMARY KEY AUTO_INCREMENT,
  musica VARCHAR(100) NOT NULL,
  duracao_segundos INT NOT NULL,
  album_id INT NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id),
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.historico_de_reproducoes(
  usuario_id INT NOT NULL,
  musica_id INT NOT NULL,
  data_reproducao DATETIME NOT NULL, 
  CONSTRAINT PRIMARY KEY (usuario_id, musica_id),
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
  FOREIGN KEY (musica_id) REFERENCES SpotifyClone.musicas(musica_id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.lista_de_seguidores(
  usuario_id INT,
  artista_id INT,
  CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.planos(tipo, valor) VALUES ("gratuito", 0);
INSERT INTO SpotifyClone.planos(tipo, valor) VALUES ("universitario", 5.99);
INSERT INTO SpotifyClone.planos(tipo, valor) VALUES ("pessoal", 6.99);
INSERT INTO SpotifyClone.planos(tipo, valor) VALUES ("familiar", 7.99);

INSERT INTO SpotifyClone.usuarios(nome, idade, data_assinatura, plano_id) VALUES ("Barbara Liskov", 82, "2019-10-20", 1);
INSERT INTO SpotifyClone.usuarios(nome, idade, data_assinatura, plano_id) VALUES ("Robert Cecil Martin", 58, "2017-01-06", 1);
INSERT INTO SpotifyClone.usuarios(nome, idade, data_assinatura, plano_id) VALUES ("Ada Lovelace", 37, "2017-12-30", 4);
INSERT INTO SpotifyClone.usuarios(nome, idade, data_assinatura, plano_id) VALUES ("Martin Fowler", 46, "2017-01-17", 4);
INSERT INTO SpotifyClone.usuarios(nome, idade, data_assinatura, plano_id) VALUES ("Sandi Metz", 58, "2018-04-29", 4);
INSERT INTO SpotifyClone.usuarios(nome, idade, data_assinatura, plano_id) VALUES ("Paulo Freire", 19, "2018-02-14", 2);
INSERT INTO SpotifyClone.usuarios(nome, idade, data_assinatura, plano_id) VALUES ("Bell Hooks", 26, "2018-01-05", 2);
INSERT INTO SpotifyClone.usuarios(nome, idade, data_assinatura, plano_id) VALUES ("Christopher Alexander", 85, "2019-06-05", 3);
INSERT INTO SpotifyClone.usuarios(nome, idade, data_assinatura, plano_id) VALUES ("Judith Butler", 45, "2020-05-13", 3);
INSERT INTO SpotifyClone.usuarios(nome, idade, data_assinatura, plano_id) VALUES ("Jorge Amado", 58, "2017-02-17", 3);

INSERT INTO SpotifyClone.artistas(nome) VALUES ("Beyoncé");
INSERT INTO SpotifyClone.artistas(nome) VALUES ("Queen");
INSERT INTO SpotifyClone.artistas(nome) VALUES ("Elis Regina");
INSERT INTO SpotifyClone.artistas(nome) VALUES ("Baco Exu do Blues");
INSERT INTO SpotifyClone.artistas(nome) VALUES ("Blind Guardian");
INSERT INTO SpotifyClone.artistas(nome) VALUES ("Nina Simone");

INSERT INTO SpotifyClone.albuns(titulo, lancamento, artista_id) VALUES ("Renaissance", "2022", 1);
INSERT INTO SpotifyClone.albuns(titulo, lancamento, artista_id) VALUES ("Jazz", "1978", 2);
INSERT INTO SpotifyClone.albuns(titulo, lancamento, artista_id) VALUES ("Hot Space", "1982", 2);
INSERT INTO SpotifyClone.albuns(titulo, lancamento, artista_id) VALUES ("Falso Brilhante", "1998", 3);
INSERT INTO SpotifyClone.albuns(titulo, lancamento, artista_id) VALUES ("Vento de Maio", "2001", 3);
INSERT INTO SpotifyClone.albuns(titulo, lancamento, artista_id) VALUES ("QVVJFA?", "2003", 4);
INSERT INTO SpotifyClone.albuns(titulo, lancamento, artista_id) VALUES ("Somewhere Far Beyond", "2007", 5);
INSERT INTO SpotifyClone.albuns(titulo, lancamento, artista_id) VALUES ("I Put A Spell On You", "2012", 6);

INSERT INTO SpotifyClone.musicas(musica, duracao_segundos, album_id, artista_id) VALUES ("Break My Soul", 279, 1, 1);
INSERT INTO SpotifyClone.musicas(musica, duracao_segundos, album_id, artista_id) VALUES ("Virgo’s Groove", 369, 1, 1);
INSERT INTO SpotifyClone.musicas(musica, duracao_segundos, album_id, artista_id) VALUES ("Alien Superstar", 116, 1, 1);
INSERT INTO SpotifyClone.musicas(musica, duracao_segundos, album_id, artista_id) VALUES ("Don’t Stop Me Now", 203, 2, 2);
INSERT INTO SpotifyClone.musicas(musica, duracao_segundos, album_id, artista_id) VALUES ("Under Pressure", 152, 3, 2);
INSERT INTO SpotifyClone.musicas(musica, duracao_segundos, album_id, artista_id) VALUES ("Como Nossos Pais", 105, 4, 3);
INSERT INTO SpotifyClone.musicas(musica, duracao_segundos, album_id, artista_id) VALUES ("O Medo de Amar é o Medo de Ser Livre", 207, 5, 3);
INSERT INTO SpotifyClone.musicas(musica, duracao_segundos, album_id, artista_id) VALUES ("Samba em Paris", 267, 6, 4);
INSERT INTO SpotifyClone.musicas(musica, duracao_segundos, album_id, artista_id) VALUES ("The Bard’s Song", 244, 7, 5);
INSERT INTO SpotifyClone.musicas(musica, duracao_segundos, album_id, artista_id) VALUES ("Feeling Good", 100, 8, 6);

INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (1, 2, "2020-05-02 05:30:35");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (1, 8, "2022-02-28 10:45:55");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (1, 10, "2020-03-06 11:22:33");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (2, 10, "2022-08-05 08:05:17");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (2, 7, "2020-01-02 07:40:33");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (3, 10, "2020-11-13 16:55:13");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (3, 2, "2020-12-05 18:38:30");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (4, 8, "2021-08-15 17:10:10");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (5, 8, "2022-01-09 01:44:33");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (5, 5, "2020-08-06 15:23:43");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (6, 7, "2017-01-24 00:31:17");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (6, 1, "2017-10-12 12:35:20");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (7, 4, "2011-12-15 22:30:49");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (8, 4, "2012-03-17 14:56:41");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (9, 9, "2022-02-24 21:14:22");
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id, data_reproducao) VALUES (10, 3, "2015-12-13 08:30:22");

INSERT INTO SpotifyClone.lista_de_seguidores(usuario_id, artista_id) VALUES (1, 1);
INSERT INTO SpotifyClone.lista_de_seguidores(usuario_id, artista_id) VALUES (1, 2);
INSERT INTO SpotifyClone.lista_de_seguidores(usuario_id, artista_id) VALUES (1, 3);
INSERT INTO SpotifyClone.lista_de_seguidores(usuario_id, artista_id) VALUES (2, 1);
INSERT INTO SpotifyClone.lista_de_seguidores(usuario_id, artista_id) VALUES (2, 3);
INSERT INTO SpotifyClone.lista_de_seguidores(usuario_id, artista_id) VALUES (3, 2);
INSERT INTO SpotifyClone.lista_de_seguidores(usuario_id, artista_id) VALUES (4, 4);
INSERT INTO SpotifyClone.lista_de_seguidores(usuario_id, artista_id) VALUES (5, 5);
INSERT INTO SpotifyClone.lista_de_seguidores(usuario_id, artista_id) VALUES (5, 6);
INSERT INTO SpotifyClone.lista_de_seguidores(usuario_id, artista_id) VALUES (6, 1);
INSERT INTO SpotifyClone.lista_de_seguidores(usuario_id, artista_id) VALUES (6, 6);
INSERT INTO SpotifyClone.lista_de_seguidores(usuario_id, artista_id) VALUES (7, 6);
INSERT INTO SpotifyClone.lista_de_seguidores(usuario_id, artista_id) VALUES (9, 3);
INSERT INTO SpotifyClone.lista_de_seguidores(usuario_id, artista_id) VALUES (10, 2);