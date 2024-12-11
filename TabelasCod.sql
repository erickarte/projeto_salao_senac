-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SalaoSenac
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SalaoSenac
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SalaoSenac` DEFAULT CHARACTER SET utf8 ;
USE `SalaoSenac` ;

-- -----------------------------------------------------
-- Table `SalaoSenac`.`Funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Funcionarios` (
  `matricula` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `nomeSocial` VARCHAR(25) NULL,
  `nacionalidade` VARCHAR(25) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `genero` CHAR(1) NOT NULL,
  `cpf` VARCHAR(14) NULL,
  `salario` DECIMAL(7,2) UNSIGNED ZEROFILL NOT NULL,
  `ch` INT NOT NULL,
  `dataAdm` DATETIME NOT NULL,
  `dataDem` DATETIME NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(15) NOT NULL,
  `Funcionarios_matricula` INT NOT NULL,
  PRIMARY KEY (`idTelefone`),
  UNIQUE INDEX `numero_UNIQUE` (`numero` ASC) VISIBLE,
  INDEX `fk_Telefone_Funcionarios1_idx` (`Funcionarios_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Funcionarios1`
    FOREIGN KEY (`Funcionarios_matricula`)
    REFERENCES `SalaoSenac`.`Funcionarios` (`matricula`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`Pontos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Pontos` (
  `idPonto` INT NOT NULL AUTO_INCREMENT,
  `dataHora` DATETIME NOT NULL,
  `tipoES` CHAR(1) BINARY NOT NULL,
  `validacao` VARCHAR(45) NULL,
  `Funcionarios_matricula` INT NOT NULL,
  PRIMARY KEY (`idPonto`),
  INDEX `fk_Pontos_Funcionarios1_idx` (`Funcionarios_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Pontos_Funcionarios1`
    FOREIGN KEY (`Funcionarios_matricula`)
    REFERENCES `SalaoSenac`.`Funcionarios` (`matricula`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`Ocorrencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Ocorrencias` (
  `idOcorrencia` INT NOT NULL AUTO_INCREMENT,
  `dataHora` DATETIME NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `qtdDias` INT NULL,
  `obs` VARCHAR(150) NULL,
  `Funcionarios_matricula` INT NOT NULL,
  PRIMARY KEY (`idOcorrencia`),
  INDEX `fk_Ocorrencias_Funcionarios1_idx` (`Funcionarios_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Ocorrencias_Funcionarios1`
    FOREIGN KEY (`Funcionarios_matricula`)
    REFERENCES `SalaoSenac`.`Funcionarios` (`matricula`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`ContatoEmergencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`ContatoEmergencia` (
  `numTelefone` VARCHAR(17) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `parentesco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`numTelefone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`Funcionarios_ContatoEmergencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Funcionarios_ContatoEmergencia` (
  `Funcionarios_matricula` INT NOT NULL,
  `ContatoEmergencia_numTelefone` VARCHAR(17) NOT NULL,
  PRIMARY KEY (`Funcionarios_matricula`, `ContatoEmergencia_numTelefone`),
  INDEX `fk_Funcionarios_has_ContatoEmergencia_ContatoEmergencia1_idx` (`ContatoEmergencia_numTelefone` ASC) VISIBLE,
  INDEX `fk_Funcionarios_has_ContatoEmergencia_Funcionarios1_idx` (`Funcionarios_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionarios_has_ContatoEmergencia_Funcionarios1`
    FOREIGN KEY (`Funcionarios_matricula`)
    REFERENCES `SalaoSenac`.`Funcionarios` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionarios_has_ContatoEmergencia_ContatoEmergencia1`
    FOREIGN KEY (`ContatoEmergencia_numTelefone`)
    REFERENCES `SalaoSenac`.`ContatoEmergencia` (`numTelefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`Departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Departamentos` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  `Gerente_matricula` INT NULL,
  PRIMARY KEY (`idDepartamento`),
  INDEX `fk_Departamentos_Funcionarios1_idx` (`Gerente_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Departamentos_Funcionarios1`
    FOREIGN KEY (`Gerente_matricula`)
    REFERENCES `SalaoSenac`.`Funcionarios` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`Cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Cargos` (
  `cbo` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cbo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`Trabalhar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Trabalhar` (
  `Funcionarios_matricula` INT NOT NULL,
  `Departamentos_idDepartamento` INT NOT NULL,
  `Cargos_cbo` VARCHAR(15) NOT NULL,
  `dataInicio` DATETIME NOT NULL,
  `dataFim` DATETIME NULL,
  INDEX `fk_Trabalhar_Funcionarios1_idx` (`Funcionarios_matricula` ASC) VISIBLE,
  INDEX `fk_Trabalhar_Departamentos1_idx` (`Departamentos_idDepartamento` ASC) VISIBLE,
  INDEX `fk_Trabalhar_Cargos1_idx` (`Cargos_cbo` ASC) VISIBLE,
  PRIMARY KEY (`Departamentos_idDepartamento`, `Cargos_cbo`, `Funcionarios_matricula`),
  CONSTRAINT `fk_Trabalhar_Funcionarios1`
    FOREIGN KEY (`Funcionarios_matricula`)
    REFERENCES `SalaoSenac`.`Funcionarios` (`matricula`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabalhar_Departamentos1`
    FOREIGN KEY (`Departamentos_idDepartamento`)
    REFERENCES `SalaoSenac`.`Departamentos` (`idDepartamento`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabalhar_Cargos1`
    FOREIGN KEY (`Cargos_cbo`)
    REFERENCES `SalaoSenac`.`Cargos` (`cbo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`Profissional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Profissional` (
  `Funcionarios_matricula` INT NOT NULL,
  `especialidade` VARCHAR(45) NOT NULL,
  `conselho` VARCHAR(15) NULL,
  PRIMARY KEY (`Funcionarios_matricula`),
  CONSTRAINT `fk_ProfSaude_Funcionarios1`
    FOREIGN KEY (`Funcionarios_matricula`)
    REFERENCES `SalaoSenac`.`Funcionarios` (`matricula`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Clientes` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `dataAniversario` DATE NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`Atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Atendimento` (
  `idAtendimento` INT NOT NULL AUTO_INCREMENT,
  `valorFinal` DECIMAL(7,2) NOT NULL,
  `data` DATETIME NOT NULL,
  `cupomFiscal` VARCHAR(150) NOT NULL,
  `imposto` DECIMAL(6,2) NOT NULL,
  `desconto` DECIMAL(4,2) NULL,
  `cashBack` DECIMAL(6,2) NULL,
  `Funcionarios_matricula` INT NOT NULL,
  `Clientes_idCliente` INT NOT NULL,
  PRIMARY KEY (`idAtendimento`),
  INDEX `fk_Vendas_Funcionarios1_idx` (`Funcionarios_matricula` ASC) VISIBLE,
  INDEX `fk_Vendas_Clientes1_idx` (`Clientes_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Vendas_Funcionarios1`
    FOREIGN KEY (`Funcionarios_matricula`)
    REFERENCES `SalaoSenac`.`Funcionarios` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendas_Clientes1`
    FOREIGN KEY (`Clientes_idCliente`)
    REFERENCES `SalaoSenac`.`Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`Servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Servicos` (
  `idServico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`idServico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`ServicoPrestado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`ServicoPrestado` (
  `Servicos_idServico` INT NOT NULL,
  `Atendimento_idAtendimento` INT NOT NULL,
  `Funcionarios_matricula` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `valor` DECIMAL(6,2) NOT NULL,
  `desconto` DECIMAL(4,2) NULL,
  INDEX `fk_ItensServicoVenda_Servicos1_idx` (`Servicos_idServico` ASC) VISIBLE,
  INDEX `fk_ItensServicoVenda_Vendas1_idx` (`Atendimento_idAtendimento` ASC) VISIBLE,
  INDEX `fk_ItensServicoVenda_ProfSaude1_idx` (`Funcionarios_matricula` ASC) VISIBLE,
  PRIMARY KEY (`Servicos_idServico`, `Atendimento_idAtendimento`, `Funcionarios_matricula`),
  CONSTRAINT `fk_ItensServicoVenda_Servicos1`
    FOREIGN KEY (`Servicos_idServico`)
    REFERENCES `SalaoSenac`.`Servicos` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItensServicoVenda_Vendas1`
    FOREIGN KEY (`Atendimento_idAtendimento`)
    REFERENCES `SalaoSenac`.`Atendimento` (`idAtendimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItensServicoVenda_ProfSaude1`
    FOREIGN KEY (`Funcionarios_matricula`)
    REFERENCES `SalaoSenac`.`Profissional` (`Funcionarios_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`Agendamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Agendamento` (
  `idAgendamento` INT NOT NULL,
  `Clientes_idCliente` INT NOT NULL,
  `Servicos_idServico` INT NOT NULL,
  `Horario` DATETIME NOT NULL,
  PRIMARY KEY (`idAgendamento`),
  INDEX `fk_Agendamento_Clientes1_idx` (`Clientes_idCliente` ASC) VISIBLE,
  INDEX `fk_Agendamento_Servicos1_idx` (`Servicos_idServico` ASC) VISIBLE,
  CONSTRAINT `fk_Agendamento_Clientes1`
    FOREIGN KEY (`Clientes_idCliente`)
    REFERENCES `SalaoSenac`.`Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Agendamento_Servicos1`
    FOREIGN KEY (`Servicos_idServico`)
    REFERENCES `SalaoSenac`.`Servicos` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`Agendamento_Funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Agendamento_Funcionarios` (
  `Agendamento_idAgendamento` INT NOT NULL,
  `Funcionarios_matricula` INT NULL,
  PRIMARY KEY (`Agendamento_idAgendamento`),
  INDEX `fk_Agendamento_has_Funcionarios_Funcionarios1_idx` (`Funcionarios_matricula` ASC) VISIBLE,
  INDEX `fk_Agendamento_has_Funcionarios_Agendamento1_idx` (`Agendamento_idAgendamento` ASC) VISIBLE,
  CONSTRAINT `fk_Agendamento_has_Funcionarios_Agendamento1`
    FOREIGN KEY (`Agendamento_idAgendamento`)
    REFERENCES `SalaoSenac`.`Agendamento` (`idAgendamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Agendamento_has_Funcionarios_Funcionarios1`
    FOREIGN KEY (`Funcionarios_matricula`)
    REFERENCES `SalaoSenac`.`Funcionarios` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SalaoSenac`.`Profissional_Atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SalaoSenac`.`Profissional_Atendimento` (
  `Profissional_Funcionarios_matricula` INT NOT NULL,
  `Atendimento_idAtendimento` INT NOT NULL,
  PRIMARY KEY (`Profissional_Funcionarios_matricula`, `Atendimento_idAtendimento`),
  INDEX `fk_Profissional_has_Atendimento_Atendimento1_idx` (`Atendimento_idAtendimento` ASC) VISIBLE,
  INDEX `fk_Profissional_has_Atendimento_Profissional1_idx` (`Profissional_Funcionarios_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Profissional_has_Atendimento_Profissional1`
    FOREIGN KEY (`Profissional_Funcionarios_matricula`)
    REFERENCES `SalaoSenac`.`Profissional` (`Funcionarios_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profissional_has_Atendimento_Atendimento1`
    FOREIGN KEY (`Atendimento_idAtendimento`)
    REFERENCES `SalaoSenac`.`Atendimento` (`idAtendimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
