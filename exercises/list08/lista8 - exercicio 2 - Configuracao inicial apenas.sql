-- 2 (configuracao inicial)

CREATE SCHEMA IF NOT EXISTS lista8ex2;

USE lista8ex2;

CREATE TABLE IF NOT EXISTS fabricante
(
    codFabricante INT NOT NULL AUTO_INCREMENT,
    nomeFabricante VARCHAR(100) NOT NULL,
    PRIMARY KEY(codFabricante)
);

CREATE TABLE IF NOT EXISTS automovel
(
    codAuto INT NOT NULL AUTO_INCREMENT,
    codFabricante INT NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    pais VARCHAR(60) NOT NULL,
    preco_tabela DECIMAL(11, 2),
    PRIMARY KEY(codAuto),
    FOREIGN KEY(codFabricante) REFERENCES fabricante(codFabricante)
);

CREATE TABLE IF NOT EXISTS revendedora
(
    cnpj VARCHAR(14) NOT NULL,
    nome VARCHAR(200) NOT NULL,
    cidade VARCHAR(60) NOT NULL,
    estado CHAR(2) NOT NULL,
    PRIMARY KEY(cnpj)
);

CREATE TABLE IF NOT EXISTS consumidor
(
    identidade VARCHAR(14) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    PRIMARY KEY(identidade)
);

CREATE TABLE IF NOT EXISTS negocio
(
    codComprador VARCHAR(14) NOT NULL,
    codRevenda VARCHAR(14) NOT NULL,
    codAuto INT NOT NULL,
    data DATE NOT NULL,
    preco DECIMAL(11, 2),
    PRIMARY KEY(codComprador, codRevenda, codAuto, data),
    FOREIGN KEY(codComprador) references consumidor(identidade),
    FOREIGN KEY(codRevenda) references revendedora(cnpj),
    FOREIGN KEY(codAuto) references automovel(codAuto)
);

INSERT INTO fabricante (nomeFabricante)
VALUES	('Volkswagen'),
	('Peugeot'),
	('Chevrolet'),
	('Ford'),
	('Fiat');

INSERT INTO automovel
VALUES	(null, 1, 'Gol', 2000, 'Brasil', 25000),
	(null, 1, 'Golf', 2005, 'Argentina', 39000),
	(null, 5, 'Ford Ka', 1990, 'Brasil', 15000),
	(null, 3, 'Corsa Sedã', 1995, 'Brasil', 12500),
	(null, 5, 'Fiesta', 2003, 'Argentina', 20000),
	(null, 3, 'Corsa Sedã', 1995, 'Argentina', 10000);

INSERT INTO revendedora
VALUES	('121215', 'Garagem Auto-Estrada', 'Palmas', 'TO'),
	('154956', 'Siga Bem', 'Paraíso', 'TO'),
	('147896', 'Vá adiante', 'Goiânia', 'GO');

INSERT INTO consumidor
VALUES	('159753', 'José', 'Da Conceição'),
	('158741', 'Paulo', 'Da Silva Cunha'),
	('789564', 'Maria', "José d'Paula"),
	('498534', 'Joana', 'Maranhão da Silvêria');

INSERT INTO negocio
VALUES	('158741', '121215', 3, '2005-05-15', 17500),
	('498534', '154956', 5, '2007-07-15', 28000),
	('159753', '147896', 4, '2008-05-10', 15500),
	('498534', '147896', 2, '2008-06-15', 42000);


-- fim da configuracao inicial do exercicio 2

#a)
SELECT *
FROM automovel
WHERE preco_tabela BETWEEN 18000 AND 30000;

#b)
SELECT *
FROM automovel NATURAL JOIN fabricante;

#c)
SELECT modelo, nomeFabricante, pais
		FROM automovel a RIGHT JOIN fabricante f ON a.codFabricante = f.codFabricante
	UNION
		SELECT modelo, nomeFabricante, pais
        FROM fabricante f NATURAL JOIN automovel a
        WHERE f.codFabricante NOT IN ( 	SELECT f.codFabricante
										FROM automovel NATURAL JOIN fabricante)
ORDER BY modelo IS NULL, modelo, nomeFabricante;                                        
                                        

#d)
SELECT *
FROM consumidor LEFT JOIN negocio ON codComprador = identidade
WHERE codRevenda IS NULL;

#e)
SELECT modelo
FROM automovel NATURAL JOIN negocio
WHERE preco = (	SELECT MAX(preco)
				FROM negocio NATURAL JOIN automovel);
                
#f)
SELECT identidade, nome
FROM consumidor JOIN negocio ON codComprador = identidade
WHERE codAuto IN (	SELECT codAuto
					FROM automovel
                    WHERE pais = "Argentina");

#g)
SELECT modelo, ano, preco_tabela AS valor
	FROM automovel
    WHERE codAuto NOT IN (	SELECT codAuto
							FROM automovel WHERE pais = "Brasil")
	UNION
    SELECT modelo, ano, preco_tabela*1.5 AS valor 
    FROM automovel
    WHERE codAuto IN (	SELECT codAuto
						FROM automovel
						WHERE pais = "Brasil");
                

