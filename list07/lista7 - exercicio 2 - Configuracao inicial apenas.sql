-- 2 (configuracao inicial)

CREATE SCHEMA IF NOT EXISTS lista7ex2;

USE lista7ex2;

CREATE TABLE IF NOT EXISTS departamento
(
    did VARCHAR(2) NOT NULL,
    nomedepto VARCHAR(50) NOT NULL,
    PRIMARY KEY(did)
);

CREATE TABLE IF NOT EXISTS funcionario
(
    fid VARCHAR(2) NOT NULL,
    nome VARCHAR(100),
    did VARCHAR(2) NOT NULL,
    salario DECIMAL(11, 2) NOT NULL,
    PRIMARY KEY(fid),
    FOREIGN KEY(did) REFERENCES departamento(did)
);

INSERT INTO departamento (did, nomedepto)
VALUES 	('D1', 'Contabilidade'),
	('D2', 'Administração'),
	('D3', 'Informática'),
	('D4', 'RH');

INSERT INTO funcionario (fid, nome, did, salario)
VALUES 	('E1', 'José', 'D1', 1000.00),
	('E2', 'Maria', 'D1', 2000.00),
	('E3', 'João', 'D2', 1500.00),
	('E4', null, 'D3', 1500.00),
	('E5', 'João', 'D1', 1500.00);


-- fim da configuracao inicial do exercicio 2

#a)
SELECT nome, salario
FROM funcionario
WHERE nome LIKE "%o%";

#b)
SELECT DISTINCT nome
FROM funcionario NATURAL JOIN departamento
WHERE nomedepto = "Contabilidade";

#c)
SELECT nome, salario
FROM funcionario
WHERE salario >= 1500 AND salario <= 2000;

#d)
ALTER TABLE funcionario CHANGE COLUMN salario salario_atual DECIMAL(11,2); 

SELECT nome, nomedepto, salario_atual*1.2
FROM funcionario NATURAL JOIN departamento;

#e)
SELECT MAX(salario_atual)
FROM funcionario;

#f)
SELECT nome, salario_atual
FROM funcionario
WHERE salario_atual = (SELECT MAX(salario_atual)
	  FROM funcionario);

#g)
SELECT nomedepto, AVG(salario_atual) AS media_salarial
FROM departamento d JOIN funcionario f ON d.did = f.did
GROUP BY nomedepto
ORDER BY nomedepto;

#h)
SELECT nomedepto, AVG(salario_atual) AS media_salarial
FROM departamento d JOIN funcionario f ON d.did = f.did
WHERE (	SELECT COUNT(*)
		FROM funcionario
		WHERE did = d.did) > 2
GROUP BY nomedepto
ORDER BY nomedepto;

