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
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.musicas(
  musica_id INT PRIMARY KEY AUTO_INCREMENT,
  musica VARCHAR(100) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.historico_de_reproducoes(
  usuario_id INT NOT NULL,
  musica_id INT NOT NULL,
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

INSERT INTO SpotifyClone.usuarios(nome, idade, plano_id) VALUES ("Barbara Liskov", 82, 1);
INSERT INTO SpotifyClone.usuarios(nome, idade, plano_id) VALUES ("Robert Cecil Martin", 58, 1);
INSERT INTO SpotifyClone.usuarios(nome, idade, plano_id) VALUES ("Ada Lovelace", 37, 4);
INSERT INTO SpotifyClone.usuarios(nome, idade, plano_id) VALUES ("Martin Fowler", 46, 4);
INSERT INTO SpotifyClone.usuarios(nome, idade, plano_id) VALUES ("Sandi Metz", 58, 4);
INSERT INTO SpotifyClone.usuarios(nome, idade, plano_id) VALUES ("Paulo Freire", 19, 2);
INSERT INTO SpotifyClone.usuarios(nome, idade, plano_id) VALUES ("Bell Hooks", 26, 2);
INSERT INTO SpotifyClone.usuarios(nome, idade, plano_id) VALUES ("Christopher Alexander", 85, 3);
INSERT INTO SpotifyClone.usuarios(nome, idade, plano_id) VALUES ("Judith Butler", 45, 3);
INSERT INTO SpotifyClone.usuarios(nome, idade, plano_id) VALUES ("Jorge Amado", 58, 3);

INSERT INTO SpotifyClone.artistas(nome) VALUES ("Beyoncé");
INSERT INTO SpotifyClone.artistas(nome) VALUES ("Queen");
INSERT INTO SpotifyClone.artistas(nome) VALUES ("Elis Regina");
INSERT INTO SpotifyClone.artistas(nome) VALUES ("Baco Exu do Blues");
INSERT INTO SpotifyClone.artistas(nome) VALUES ("Blind Guardian");
INSERT INTO SpotifyClone.artistas(nome) VALUES ("Nina Simone");

INSERT INTO SpotifyClone.albuns(titulo, artista_id) VALUES ("Renaissance", 1);
INSERT INTO SpotifyClone.albuns(titulo, artista_id) VALUES ("Jazz", 2);
INSERT INTO SpotifyClone.albuns(titulo, artista_id) VALUES ("Hot Space", 2);
INSERT INTO SpotifyClone.albuns(titulo, artista_id) VALUES ("Falso Brilhante", 3);
INSERT INTO SpotifyClone.albuns(titulo, artista_id) VALUES ("Vento de Maio", 3);
INSERT INTO SpotifyClone.albuns(titulo, artista_id) VALUES ("QVVJFA?", 4);
INSERT INTO SpotifyClone.albuns(titulo, artista_id) VALUES ("Somewhere Far Beyond", 5);
INSERT INTO SpotifyClone.albuns(titulo, artista_id) VALUES ("I Put A Spell On You", 6);

INSERT INTO SpotifyClone.musicas(musica, album_id) VALUES ("Break My Soul", 1);
INSERT INTO SpotifyClone.musicas(musica, album_id) VALUES ("Virgo’s Groove", 1);
INSERT INTO SpotifyClone.musicas(musica, album_id) VALUES ("Alien Superstar", 1);
INSERT INTO SpotifyClone.musicas(musica, album_id) VALUES ("Don’t Stop Me Now", 2);
INSERT INTO SpotifyClone.musicas(musica, album_id) VALUES ("Under Pressure", 3);
INSERT INTO SpotifyClone.musicas(musica, album_id) VALUES ("Como Nossos Pais", 4);
INSERT INTO SpotifyClone.musicas(musica, album_id) VALUES ("O Medo de Amar é o Medo de Ser Livre", 5);
INSERT INTO SpotifyClone.musicas(musica, album_id) VALUES ("Samba em Paris", 6);
INSERT INTO SpotifyClone.musicas(musica, album_id) VALUES ("The Bard’s Song", 7);
INSERT INTO SpotifyClone.musicas(musica, album_id) VALUES ("Feeling Good", 8);

INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (1, 2);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (1, 8);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (1, 10);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (2, 10);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (2, 7);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (3, 10);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (3, 8);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (4, 6);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (5, 6);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (5, 5);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (6, 7);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (6, 1);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (7, 4);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (8, 4);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (9, 9);
INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, musica_id) VALUES (9, 3);

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