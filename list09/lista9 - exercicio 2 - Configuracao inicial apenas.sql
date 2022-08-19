-- 2 (configuracao inicial)

CREATE SCHEMA IF NOT EXISTS lista9ex2;

USE lista9ex2;

CREATE TABLE IF NOT EXISTS carros
(
    idcarros INT,
    montadora VARCHAR(20),
    modelo VARCHAR(20),
    versao VARCHAR(20),
    cilindrada INT,
    combustivel VARCHAR(20),
    PRIMARY KEY (idcarros)
);

INSERT INTO carros 
VALUES 	(1, 'fiat', 'Palio', 'Fire', 1000, 'flex'),
	(2, 'fiat', 'Palio', '1.8R', 1800, 'flex'),
	(3, 'volkswagen', 'Gol', 'Trend', 1000, 'flex'),
	(4, 'volkswagen', 'Gol', 'Power', 1600, 'flex'),
	(5, 'chevrolet', 'Vectra', 'Elegance', 2000, 'flex'),
	(6, 'chevrolet', 'Vectra', 'Elite', 2000, 'flex'),
	(7, 'ford', 'Fusion', 'SEL2.5', 2500, 'gasolina'),
	(8, 'ford', 'Fusion', 'SELV6', 3000, 'gasolina'),
	(9, 'fiat', 'Punto', 'Sporting', 1800, 'flex'),
	(10, 'fiat', 'Punto', 'T-JET', 1400, 'gasolina'),
	(11, 'volkswagen', 'Polo', 'Confortline', 1600, 'flex'),
	(12, 'volkswagen', 'Polo', 'GT', 2000, 'flex');

-- fim da configuracao inicial do exercicio 2

#a)
SELECT modelo, versao, UPPER(montadora)
FROM carros;

#b)
SELECT modelo, versao, LEFT(montadora, 4)
FROM carros;

#c)
SELECT CONCAT(UPPER(montadora), "-", LOWER(modelo))
FROM carros;  

#d)
SELECT DISTINCT REVERSE(CONCAT(UPPER(montadora), "-", LOWER(modelo)))
FROM carros;

#e)
SELECT modelo, POWER(cilindrada, 3)
FROM carros;

#f)
SELECT montadora, modelo, FORMAT(RAND()*(9+1), 2) AS NOTA
FROM carros
ORDER BY NOTA DESC;

#g)
SELECT montadora, modelo, CEIL(RAND()*(9+1)) AS NOTA
FROM carros
ORDER BY NOTA DESC;

#h)
SELECT montadora, modelo, FLOOR(RAND()*(10+1)) AS NOTA
FROM carros
ORDER BY NOTA DESC;

#i)
SELECT montadora, modelo, FORMAT(RAND(2)*(9+1), 2) AS NOTA
FROM carros
ORDER BY NOTA DESC;

#j)
CREATE FUNCTION preco_estimado(cilindrada INT)
RETURNS INT
READS SQL DATA
RETURN ((cilindrada * 25) + (RAND()*(cilindrada*3 - cilindrada + 1) + cilindrada));

#k)
SELECT montadora, modelo, versao, preco_estimado(cilindrada) AS preco
FROM carros
ORDER BY preco;

#l)
DELIMITER //
CREATE FUNCTION max_cilindrada(montadora_parameter VARCHAR(20))
RETURNS CHAR(255)
READS SQL DATA
BEGIN
	DECLARE valor CHAR(255);
    SET valor = (	SELECT(CONCAT(UPPER(montadora), ", ", modelo, " ", versao, ", ", cilindrada, " cilindradas"))
					FROM carros
                    WHERE montadora_parameter = montadora
                    AND cilindrada = (	SELECT MAX(cilindrada)
										FROM carros
                                        WHERE montadora = montadora_parameter)
                    ORDER BY modelo, versao
                    LIMIT 1);
	RETURN valor;
END; //
DELIMITER ;

#m)
SELECT max_cilindrada("fiat");
    
