-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           11.4.0-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para produto
CREATE DATABASE IF NOT EXISTS `produto` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;
USE `produto`;

-- Copiando estrutura para tabela produto.sq_opcional
CREATE TABLE IF NOT EXISTS `sq_opcional` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- Copiando dados para a tabela produto.sq_opcional: ~1 rows (aproximadamente)
DELETE FROM `sq_opcional`;
INSERT INTO `sq_opcional` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(4, 1, 9223372036854775806, 1, 1, 0, 0, 0);

-- Copiando estrutura para tabela produto.sq_pizzaria
CREATE TABLE IF NOT EXISTS `sq_pizzaria` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- Copiando dados para a tabela produto.sq_pizzaria: ~1 rows (aproximadamente)
DELETE FROM `sq_pizzaria`;
INSERT INTO `sq_pizzaria` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(3, 1, 9223372036854775806, 1, 1, 0, 0, 0);

-- Copiando estrutura para tabela produto.sq_produto
CREATE TABLE IF NOT EXISTS `sq_produto` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- Copiando dados para a tabela produto.sq_produto: ~1 rows (aproximadamente)
DELETE FROM `sq_produto`;
INSERT INTO `sq_produto` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(4, 1, 9223372036854775806, 1, 1, 0, 0, 0);

-- Copiando estrutura para tabela produto.sq_sabor
CREATE TABLE IF NOT EXISTS `sq_sabor` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- Copiando dados para a tabela produto.sq_sabor: ~1 rows (aproximadamente)
DELETE FROM `sq_sabor`;
INSERT INTO `sq_sabor` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(4, 1, 9223372036854775806, 1, 1, 0, 0, 0);

-- Copiando estrutura para tabela produto.tb_2tdspf_cardapio
CREATE TABLE IF NOT EXISTS `tb_2tdspf_cardapio` (
  `PIZZARIA` bigint(20) NOT NULL,
  `PRODUTO` bigint(20) NOT NULL,
  PRIMARY KEY (`PIZZARIA`,`PRODUTO`),
  KEY `FK_PIZZARIA_CARDAPIO` (`PRODUTO`),
  CONSTRAINT `FK_CARDAPIO_PIZZARIA` FOREIGN KEY (`PIZZARIA`) REFERENCES `tb_2tdspf_pizzaria` (`ID_PIZZARIA`),
  CONSTRAINT `FK_PIZZARIA_CARDAPIO` FOREIGN KEY (`PRODUTO`) REFERENCES `tb_2tdspf_produto` (`ID_PRODUTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Copiando dados para a tabela produto.tb_2tdspf_cardapio: ~6 rows (aproximadamente)
DELETE FROM `tb_2tdspf_cardapio`;
INSERT INTO `tb_2tdspf_cardapio` (`PIZZARIA`, `PRODUTO`) VALUES
	(1, 1),
	(2, 1),
	(1, 2),
	(2, 2),
	(1, 3),
	(2, 3);

-- Copiando estrutura para tabela produto.tb_2tdspf_opcional
CREATE TABLE IF NOT EXISTS `tb_2tdspf_opcional` (
  `PRECO` double DEFAULT NULL,
  `ID_OPCIONAL` bigint(20) NOT NULL,
  `NM_OPCIONAL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_OPCIONAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Copiando dados para a tabela produto.tb_2tdspf_opcional: ~3 rows (aproximadamente)
DELETE FROM `tb_2tdspf_opcional`;
INSERT INTO `tb_2tdspf_opcional` (`PRECO`, `ID_OPCIONAL`, `NM_OPCIONAL`) VALUES
	(9.99, 1, 'Borda de Catupiri'),
	(19.99, 2, 'Borda paozinho'),
	(19.99, 3, 'Coca Cola');

-- Copiando estrutura para tabela produto.tb_2tdspf_pizzaria
CREATE TABLE IF NOT EXISTS `tb_2tdspf_pizzaria` (
  `ID_PIZZARIA` bigint(20) NOT NULL,
  `NM_PIZZARIA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_PIZZARIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Copiando dados para a tabela produto.tb_2tdspf_pizzaria: ~2 rows (aproximadamente)
DELETE FROM `tb_2tdspf_pizzaria`;
INSERT INTO `tb_2tdspf_pizzaria` (`ID_PIZZARIA`, `NM_PIZZARIA`) VALUES
	(1, 'Benezinho\'s pizzaria'),
	(2, 'Dama e Dominó');

-- Copiando estrutura para tabela produto.tb_2tdspf_produto
CREATE TABLE IF NOT EXISTS `tb_2tdspf_produto` (
  `PRECO` double DEFAULT NULL,
  `ID_PRODUTO` bigint(20) NOT NULL,
  `SABOR` bigint(20) DEFAULT NULL,
  `NM_PRODUTO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUTO`),
  KEY `FK_SABOR_PRODUTO` (`SABOR`),
  CONSTRAINT `FK_SABOR_PRODUTO` FOREIGN KEY (`SABOR`) REFERENCES `tb_2tdspf_sabor` (`ID_SABOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Copiando dados para a tabela produto.tb_2tdspf_produto: ~3 rows (aproximadamente)
DELETE FROM `tb_2tdspf_produto`;
INSERT INTO `tb_2tdspf_produto` (`PRECO`, `ID_PRODUTO`, `SABOR`, `NM_PRODUTO`) VALUES
	(69.99, 1, 1, 'Pizza'),
	(49.99, 2, 2, 'Pizza de Calabresa'),
	(69.99, 3, 3, 'Pizza de Frango com Catupiri');

-- Copiando estrutura para tabela produto.tb_2tdspf_produto_opcional
CREATE TABLE IF NOT EXISTS `tb_2tdspf_produto_opcional` (
  `OPCIONAL` bigint(20) NOT NULL,
  `PRODUTO` bigint(20) NOT NULL,
  PRIMARY KEY (`OPCIONAL`,`PRODUTO`),
  KEY `FK_PRODUTO_OPCIONAL` (`PRODUTO`),
  CONSTRAINT `FK_OPCIONAL_PRODUTO` FOREIGN KEY (`OPCIONAL`) REFERENCES `tb_2tdspf_opcional` (`ID_OPCIONAL`),
  CONSTRAINT `FK_PRODUTO_OPCIONAL` FOREIGN KEY (`PRODUTO`) REFERENCES `tb_2tdspf_produto` (`ID_PRODUTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Copiando dados para a tabela produto.tb_2tdspf_produto_opcional: ~9 rows (aproximadamente)
DELETE FROM `tb_2tdspf_produto_opcional`;
INSERT INTO `tb_2tdspf_produto_opcional` (`OPCIONAL`, `PRODUTO`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(1, 3),
	(2, 3),
	(3, 3);

-- Copiando estrutura para tabela produto.tb_2tdspf_sabor
CREATE TABLE IF NOT EXISTS `tb_2tdspf_sabor` (
  `ID_SABOR` bigint(20) NOT NULL,
  `DS_SABOR` varchar(255) DEFAULT NULL,
  `NM_SABOR` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_SABOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Copiando dados para a tabela produto.tb_2tdspf_sabor: ~3 rows (aproximadamente)
DELETE FROM `tb_2tdspf_sabor`;
INSERT INTO `tb_2tdspf_sabor` (`ID_SABOR`, `DS_SABOR`, `NM_SABOR`) VALUES
	(1, 'Maravilhoso manjericão plantado e colhido pelos mais belos agricultores do Alegrete.', 'Manjericão'),
	(2, 'A mais saborosa calabresa da praça', 'Calabresa'),
	(3, 'Aqui ninguém tem pena', 'Frango com Catupiri');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
