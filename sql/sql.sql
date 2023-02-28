-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema seguros
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema seguros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `seguros` DEFAULT CHARACTER SET utf8 ;
USE `seguros` ;

-- -----------------------------------------------------
-- Table `seguros`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguros`.`Cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(20) NULL,
  `estado` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NULL,
  `rua` VARCHAR(45) NULL,
  `telefone_fixo` VARCHAR(45) NULL,
  `telefone_celular` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `cpf_UNIQUE` ON `seguros`.`Cliente` (`cpf` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `seguros`.`Carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguros`.`Carro` (
  `id_carro` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `ano` VARCHAR(45) NOT NULL,
  `chassi` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_carro`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `placa_UNIQUE` ON `seguros`.`Carro` (`placa` ASC) VISIBLE;

CREATE UNIQUE INDEX `chassi_UNIQUE` ON `seguros`.`Carro` (`chassi` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `seguros`.`Apolice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguros`.`Apolice` (
  `id_apolice` INT NOT NULL AUTO_INCREMENT,
  `valor_cobertura` DECIMAL NULL,
  `valor_franquia` DECIMAL NULL,
  `data_inicio_vigencia` DATE NULL,
  `data_fim_vigencia` DATE NULL,
  `Cliente_id_cliente` INT NOT NULL,
  `Carro_id_carro` INT NOT NULL,
  PRIMARY KEY (`id_apolice`),
  CONSTRAINT `fk_Apolice_Cliente`
    FOREIGN KEY (`Cliente_id_cliente`)
    REFERENCES `seguros`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apolice_Carro1`
    FOREIGN KEY (`Carro_id_carro`)
    REFERENCES `seguros`.`Carro` (`id_carro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Apolice_Cliente_idx` ON `seguros`.`Apolice` (`Cliente_id_cliente` ASC) VISIBLE;

CREATE INDEX `fk_Apolice_Carro1_idx` ON `seguros`.`Apolice` (`Carro_id_carro` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `seguros`.`Sinistro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguros`.`Sinistro` (
  `id_sinistro` INT NOT NULL AUTO_INCREMENT,
  `hora_sinistro` INT NULL,
  `data_sinistro` DATE NULL,
  `local_sinistro` VARCHAR(45) NULL,
  `condutor` VARCHAR(45) NULL,
  `Carro_id_carro` INT NOT NULL,
  PRIMARY KEY (`id_sinistro`, `Carro_id_carro`),
  CONSTRAINT `fk_Sinistro_Carro1`
    FOREIGN KEY (`Carro_id_carro`)
    REFERENCES `seguros`.`Carro` (`id_carro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Sinistro_Carro1_idx` ON `seguros`.`Sinistro` (`Carro_id_carro` ASC) VISIBLE;


-- -----------------------------------------------------
-- Data for table `seguros`.`Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `seguros`;
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (1, 'Ken J Sánchez', '15296387930', 'Feminino', 'Minas Gerais', 'Belo Horizonte', 'Centro', '10', 'Rua Teste das Castanheiras', '36418855', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (2, 'Terri Lee Duffy', '10578963690', 'M', 'Minas Gerais', 'Belo Horizonte', 'Camargos', '20', 'Rua Teste dos Pinheiros', '36895566', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (3, 'Roberto  Tamburello', '36925874120', 'M', 'Minas Gerais', 'Belo Horizonte', 'Santa Efigenia', '30', 'Rua teste dos poetas', '36895566', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (4, 'Rob  Walters', '23658979630', 'M', 'Minas Gerais', 'Belo Horizonte', 'Centro', '40', 'Rua teste dos prazeres', '36895566', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (5, 'Gail A Erickson', '78952589746', 'M', 'Minas Gerais', 'Belo Horizonte', 'Santo Antônio', '50', 'Rua teste da poesia', '36895566', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (6, 'Jossef H Goldberg', '78936979890', 'M', 'Minas Gerais', 'Belo Horizonte', 'Sion', '60', 'Rua teste Guimarães', '36895566', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (7, 'Dylan A Miller', '74185236930', 'M', 'Minas Gerais', 'Belo Horizonte', 'Calafate', '70', 'Rua Alfredo Sorte', '36895566', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (8, 'Diane L Margheim', '11594893690', 'F', 'Minas Gerais', 'Belo Horizonte', 'Pampulha', '80', 'Rua A ', '36895566', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (9, 'Gigi N Matthew', '96385276350', 'F', 'Minas Gerais', 'Belo Horizonte', 'Centro', '90', 'Rua B', '36895566', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (10, 'Michael  Raheem', '96389678979', 'Masculino', 'Minas Gerais', 'Belo Horizonte', 'Centro', '100', 'Rua C ', '36895566', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (11, 'Ovidiu V Cracium', '78589632149', 'M', 'Minas Gerais', 'Belo Horizonte', 'Centro', '110', 'Rua D', '', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (12, 'Thierry B D\'Hers', '8569586350', 'Masculino', 'Minas Gerais', 'Belo Horizonte', 'Centro', '120', 'Rua Sônia Abrão', '', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (13, 'Janice M Galvin', '78985858585', 'F', 'São Paulo', 'São Paulo', 'Jardins', '130', 'Rua Primeiro de Maio', '', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (14, 'Michael I Sullivan', '85287563201', 'Masculino', 'São Paulo', 'São Paulo', 'Pinheiros', '140', 'Rua pinheirinho', '', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (15, 'Sharon B Salavaria', '78985632050', 'Feminino', 'São Paulo', 'São Paulo', 'Jardins', '150', 'Rua Primeiro de Maio', '', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (16, 'David M Bradley', '75386391470', 'M', 'São Paulo', 'São Paulo', 'Jardins', '160', 'Rua Primeiro de Maio', '', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (17, 'Kevin F Brown', '78985286304', 'M', 'São Paulo', 'São Paulo', 'Jardins', '170', 'Rua Primeiro de Maio', '', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (18, 'John L Wood', '45689520540', 'Masculino', 'São Paulo', 'São Paulo', 'Pinheiros', '180', 'Rua pinheirinho', '', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (19, 'Mary A Dempsey', '78963852820', 'F', 'São Paulo', 'São Paulo', 'Pinheiros', '190', 'rua pinheirinho', '', '');
INSERT INTO `seguros`.`Cliente` (`id_cliente`, `nome`, `cpf`, `sexo`, `estado`, `cidade`, `bairro`, `numero`, `rua`, `telefone_fixo`, `telefone_celular`) VALUES (20, 'Wanida M Benshoof', '785636588', 'F', 'São Paulo', '', '', '', '', '', '');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
