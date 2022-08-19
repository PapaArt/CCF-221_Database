
-- -----------------------------------------------------
-- Schema trabalhobd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trabalhobd` DEFAULT CHARACTER SET utf8mb4;
USE `trabalhobd` ;

-- -----------------------------------------------------
-- Table `trabalhobd`.`fabricante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`fabricante` (
  `idfabricante` INT NOT NULL,
  `nomefab` VARCHAR(30) NULL,
  `ano_fundacao` INT NULL,
  PRIMARY KEY (`idfabricante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`plataforma` (
  `idplataforma` INT NOT NULL,
  `nomeplat` VARCHAR(30) NULL,
  `ano_lancamento` INT NULL,
  `memoria` INT NULL,
  `idfabricante` INT NOT NULL,
  PRIMARY KEY (`idplataforma`),
  INDEX `fk_plataforma_fabricante1_idx` (`idfabricante` ASC) VISIBLE,
  CONSTRAINT `idfabricante`
    FOREIGN KEY (`idfabricante`)
    REFERENCES `trabalhobd`.`fabricante` (`idfabricante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`midia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`midia` (
  `idmidia` INT NOT NULL,
  `nomemid` VARCHAR(30) NULL,
  `velocidade_leitura` INT NULL,
  PRIMARY KEY (`idmidia`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `trabalhobd`.`compativel_midia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`compativel_midia` (
  `idplataforma` INT NOT NULL,
  `idmidia` INT NOT NULL,
  PRIMARY KEY (`idplataforma`, `idmidia`),
  INDEX `fk_plataforma_has_midia_midia1_idx` (`idmidia` ASC) VISIBLE,
  INDEX `fk_plataforma_has_midia_plataforma_idx` (`idplataforma` ASC) VISIBLE,
  CONSTRAINT `fk_idplataforma`
    FOREIGN KEY (`idplataforma`)
    REFERENCES `trabalhobd`.`plataforma` (`idplataforma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idmidia`
    FOREIGN KEY (`idmidia`)
    REFERENCES `trabalhobd`.`midia` (`idmidia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`jogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`jogo` (
  `idjogo` INT NOT NULL,
  `nomejogo` VARCHAR(30) NULL,
  `descricao` VARCHAR(30) NULL,
  PRIMARY KEY (`idjogo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`compativel_jogo_plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`compativel_jogo_plataforma` (
  `idplataforma` INT NOT NULL,
  `idjogo` INT NOT NULL,
  `quantidade` INT NULL,
  `ano_lancamento_jogo` INT NULL,
  PRIMARY KEY (`idplataforma`, `idjogo`),
  INDEX `fk_plataforma_has_jogo_jogo1_idx` (`idjogo` ASC) VISIBLE,
  INDEX `fk_plataforma_has_jogo_plataforma1_idx` (`idplataforma` ASC) VISIBLE,
  CONSTRAINT `fk_idplataforma_jogo`
    FOREIGN KEY (`idplataforma`)
    REFERENCES `trabalhobd`.`plataforma` (`idplataforma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idjogo`
    FOREIGN KEY (`idjogo`)
    REFERENCES `trabalhobd`.`jogo` (`idjogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


INSERT INTO `trabalhobd`.`fabricante` (`idfabricante`, `nomefab`, `ano_fundacao`) VALUES (1, 'Nintendo', 1889);
INSERT INTO `trabalhobd`.`fabricante` (`idfabricante`, `nomefab`, `ano_fundacao`) VALUES (2, 'Sony', 1946);
INSERT INTO `trabalhobd`.`fabricante` (`idfabricante`, `nomefab`, `ano_fundacao`) VALUES (3, 'Microsoft', 1975);
INSERT INTO `trabalhobd`.`fabricante` (`idfabricante`, `nomefab`, `ano_fundacao`) VALUES (4, 'Atari', 1972);


INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (1, 'Atari 2600', 1977, '128', 4);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (2, 'NES', 1985, '2048', 1);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (3, 'SNES', 1990, '131072', 1);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (4, 'Wii', 2006, '92274688', 1);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (5, 'Xbox360', 2005, '536870912', 3);
INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) VALUES (6, 'PlayStation3', 2006, '536870912', 2);


INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (1, 'CD', 10);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (2, 'DVD', 20);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (3, 'Blu-ray', 40);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (4, 'Disquete', 1);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (5, 'SD', 100);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (6, 'Cartucho', 1000);
INSERT INTO `trabalhobd`.`midia` (`idmidia`, `nomemid`, `velocidade_leitura`) VALUES (7, 'HD-USB', 100);


INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (1, 'River Raid', 'Tiro');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (2, 'Mario Bros', 'Aventura');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (3, 'F-Zero', 'Corrida');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (4, 'Super Mario Bros', 'Aventura');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (5, 'Wii Sports', 'Esportes variados');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (6, 'FIFA12', 'Futebol');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (7, 'God of War 3', 'Ação');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (8, 'Forza MotorSport', 'Corrida realista');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (9, 'Gran Turismo 5', 'Corrida realista');
INSERT INTO `trabalhobd`.`jogo` (`idjogo`, `nomejogo`, `descricao`) VALUES (10, 'Street Fighter IV', 'Luta');


INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (1, 6);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (2, 4);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (2, 6);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (3, 6);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (4, 2);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (4, 5);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (5, 2);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (5, 7);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (6, 3);
INSERT INTO `trabalhobd`.`compativel_midia` (`idplataforma`, `idmidia`) VALUES (6, 7);



INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (1, 1, 2, 1982);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (1, 2, 2, 1983);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (2, 2, 1, 1983);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (3, 3, 1, 1990);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (4, 3, 1, 2007);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (2, 4, 1, 1985);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (4, 4, 1, 2007);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (4, 5, 1, 2006);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (4, 6, 1, 2011);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (5, 6, 1, 2011);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (6, 6, 1, 2011);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (6, 7, 2, 2012);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (5, 8, 1, 2011);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (6, 9, 1, 2010);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (5, 10, 2, 2008);
INSERT INTO `trabalhobd`.`compativel_jogo_plataforma` (`idplataforma`, `idjogo`, `quantidade`, `ano_lancamento_jogo`) VALUES (6, 10, 1, 2008);

#1)
SELECT DISTINCT nomeplat
FROM compativel_midia NATURAL JOIN plataforma NATURAL JOIN midia
WHERE velocidade_leitura > 100;

#2)
SELECT nomeplat, ano_lancamento
FROM plataforma NATURAL JOIN fabricante
WHERE ano_fundacao > 1970;

#3)
SELECT nomemid, velocidade_leitura
FROM midia
WHERE velocidade_leitura BETWEEN 10 AND 30
ORDER BY velocidade_leitura DESC, nomemid;

#4)
ALTER TABLE `plataforma` CHANGE `memoria` `memoria` BIGINT;

INSERT INTO `trabalhobd`.`plataforma` (`idplataforma`, `nomeplat`, `ano_lancamento`, `memoria`, `idfabricante`) 
VALUES (7, 'WiiU', 2012, 2147483648, (	SELECT idfabricante
										FROM fabricante
                                        WHERE nomefab = 'Nintendo'));

#5)
SELECT nomeplat, nomefab, quantidade AS numero_jogos
FROM compativel_jogo_plataforma NATURAL JOIN plataforma NATURAL JOIN fabricante
ORDER BY nomeplat;

#6)
SELECT nomejogo
FROM jogo NATURAL JOIN compativel_jogo_plataforma
GROUP BY nomejogo
HAVING COUNT(idplataforma) > 1;

#7)
SELECT DISTINCT quantidade AS jogos_lancados, ano_lancamento_jogo
FROM compativel_jogo_plataforma
GROUP BY ano_lancamento_jogo
ORDER BY ano_lancamento_jogo;

#8)
SELECT nomejogo, ano_lancamento_jogo, nomeplat
FROM compativel_jogo_plataforma NATURAL JOIN jogo NATURAL JOIN plataforma
HAVING MIN(ano_lancamento_jogo);

#9)
SELECT DISTINCT AVG(memoria) AS media_memoria_utilizada
FROM plataforma NATURAL JOIN compativel_jogo_plataforma;

#10)
SELECT nomefab
FROM compativel_midia NATURAL JOIN fabricante NATURAL JOIN midia
GROUP BY nomefab
HAVING COUNT(idmidia) > 1;













