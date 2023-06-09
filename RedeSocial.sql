-- MySQL Script generated by MySQL Workbench
-- Mon May 15 16:12:17 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_RedeSocial
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_RedeSocial
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_RedeSocial` DEFAULT CHARACTER SET utf8 ;
USE `db_RedeSocial` ;

-- -----------------------------------------------------
-- Table `db_RedeSocial`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_RedeSocial`.`tb_usuario` (
  `id` BIGINT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `usuario` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_RedeSocial`.`tb_tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_RedeSocial`.`tb_tema` (
  `id` BIGINT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_RedeSocial`.`tb_postagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_RedeSocial`.`tb_postagem` (
  `id` BIGINT NOT NULL,
  `titulo` VARCHAR(255) NOT NULL,
  `conteudo` VARCHAR(255) NOT NULL,
  `data_publicacao` DATE NOT NULL,
  `tb_usuario_id` BIGINT NOT NULL,
  `tb_tema_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_postagem_tb_usuario_idx` (`tb_usuario_id` ASC) VISIBLE,
  INDEX `fk_tb_postagem_tb_tema1_idx` (`tb_tema_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_postagem_tb_usuario`
    FOREIGN KEY (`tb_usuario_id`)
    REFERENCES `db_RedeSocial`.`tb_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_postagem_tb_tema1`
    FOREIGN KEY (`tb_tema_id`)
    REFERENCES `db_RedeSocial`.`tb_tema` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
