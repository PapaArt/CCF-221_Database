USE lista6;

#Questão 1
ALTER TABLE carro ADD numerodevalvulas INT;
#a)
UPDATE carro
SET numerodevalvulas = 8;

UPDATE carro
SET numerodevalvulas = 16
WHERE versao = "T-JET" OR versao = "SEL2.5";

UPDATE carro
SET numerodevalvulas = 24
WHERE versao = "SELV6";

#b)
SELECT DISTINCT modelo
FROM carro 
WHERE numerodevalvulas >= 16;

#c)
UPDATE carro
SET cilindrada = 2400 AND numerodevalvulas = 16
WHERE modelo = "Vectra" AND versao = "Elite";

#d)
ALTER TABLE montadora CHANGE COLUMN nome nomemontadora VARCHAR(30);
SELECT *
FROM montadora;

#e)
# O comando seria -> DROP TABLE carro;

#f)
# O comando seria -> DROP DATABASE lista6;