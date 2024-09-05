CREATE DATABASE  IF NOT EXISTS `bambuca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bambuca`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bambuca
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `andamento`
--

DROP TABLE IF EXISTS `andamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `andamento` (
  `id_andamento` int NOT NULL AUTO_INCREMENT,
  `tipo_andamento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_andamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `andamento`
--

LOCK TABLES `andamento` WRITE;
/*!40000 ALTER TABLE `andamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `andamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `id_avaliacao` int NOT NULL AUTO_INCREMENT,
  `estrelas` int NOT NULL,
  `comentario` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_avaliacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sexo` tinyint(1) NOT NULL,
  `data_nascimento` date NOT NULL,
  `cep` decimal(8,0) NOT NULL,
  `casa` int NOT NULL,
  `complemento` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienteGarcom`
--

DROP TABLE IF EXISTS `clienteGarcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienteGarcom` (
  `id_clienteGarcom` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_garcom` int DEFAULT NULL,
  `id_avaliacao` int DEFAULT NULL,
  PRIMARY KEY (`id_clienteGarcom`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_garcom` (`id_garcom`),
  KEY `id_avaliacao` (`id_avaliacao`),
  CONSTRAINT `clienteGarcom_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `clienteGarcom_ibfk_2` FOREIGN KEY (`id_garcom`) REFERENCES `garcom` (`id_garcom`),
  CONSTRAINT `clienteGarcom_ibfk_3` FOREIGN KEY (`id_avaliacao`) REFERENCES `avaliacao` (`id_avaliacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienteGarcom`
--

LOCK TABLES `clienteGarcom` WRITE;
/*!40000 ALTER TABLE `clienteGarcom` DISABLE KEYS */;
/*!40000 ALTER TABLE `clienteGarcom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientePedido`
--

DROP TABLE IF EXISTS `clientePedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientePedido` (
  `id_clientePedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_pedido` int NOT NULL,
  PRIMARY KEY (`id_clientePedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `clientePedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `clientePedido_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientePedido`
--

LOCK TABLES `clientePedido` WRITE;
/*!40000 ALTER TABLE `clientePedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientePedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garcom`
--

DROP TABLE IF EXISTS `garcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garcom` (
  `id_garcom` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_garcom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garcom`
--

LOCK TABLES `garcom` WRITE;
/*!40000 ALTER TABLE `garcom` DISABLE KEYS */;
/*!40000 ALTER TABLE `garcom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente` (
  `id_ingrediente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_ingrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES (2,'alface'),(3,'pão'),(4,'morango'),(5,'frango'),(6,'carne'),(7,'maçã'),(8,'abacaxi'),(9,'chocolate'),(10,'acelga');
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidade_pagamento`
--

DROP TABLE IF EXISTS `modalidade_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidade_pagamento` (
  `id_modalidade` int NOT NULL AUTO_INCREMENT,
  `id_pagamento` int DEFAULT NULL,
  `nome_modalidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_modalidade`),
  KEY `id_pagamento` (`id_pagamento`),
  CONSTRAINT `modalidade_pagamento_ibfk_1` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamento` (`id_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidade_pagamento`
--

LOCK TABLES `modalidade_pagamento` WRITE;
/*!40000 ALTER TABLE `modalidade_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `modalidade_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `total_participantes` int NOT NULL,
  `total_conta` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_garcom` int DEFAULT NULL,
  `id_andamento` int NOT NULL,
  `horario_pedido` time NOT NULL,
  `data_pedido` date NOT NULL,
  `status_pedido` char(1) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_garcom` (`id_garcom`),
  KEY `id_andamento` (`id_andamento`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_garcom`) REFERENCES `garcom` (`id_garcom`),
  CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`id_andamento`) REFERENCES `andamento` (`id_andamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoPrato`
--

DROP TABLE IF EXISTS `pedidoPrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidoPrato` (
  `id_pedidoPrato` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int DEFAULT NULL,
  `id_prato` int DEFAULT NULL,
  PRIMARY KEY (`id_pedidoPrato`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_prato` (`id_prato`),
  CONSTRAINT `pedidoPrato_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `pedidoPrato_ibfk_2` FOREIGN KEY (`id_prato`) REFERENCES `prato` (`id_prato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoPrato`
--

LOCK TABLES `pedidoPrato` WRITE;
/*!40000 ALTER TABLE `pedidoPrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidoPrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prato`
--

DROP TABLE IF EXISTS `prato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prato` (
  `id_prato` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `foto` longblob,
  PRIMARY KEY (`id_prato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prato`
--

LOCK TABLES `prato` WRITE;
/*!40000 ALTER TABLE `prato` DISABLE KEYS */;
/*!40000 ALTER TABLE `prato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pratoIngrediente`
--

DROP TABLE IF EXISTS `pratoIngrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pratoIngrediente` (
  `id_pratoIngrediente` int NOT NULL AUTO_INCREMENT,
  `id_prato` int DEFAULT NULL,
  `id_infrediente` int DEFAULT NULL,
  PRIMARY KEY (`id_pratoIngrediente`),
  KEY `id_prato` (`id_prato`),
  KEY `id_infrediente` (`id_infrediente`),
  CONSTRAINT `pratoIngrediente_ibfk_1` FOREIGN KEY (`id_prato`) REFERENCES `prato` (`id_prato`),
  CONSTRAINT `pratoIngrediente_ibfk_2` FOREIGN KEY (`id_infrediente`) REFERENCES `ingrediente` (`id_ingrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pratoIngrediente`
--

LOCK TABLES `pratoIngrediente` WRITE;
/*!40000 ALTER TABLE `pratoIngrediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `pratoIngrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone` (
  `id_telefone` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `ddd` int NOT NULL,
  `numero` int NOT NULL,
  `adicao9` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_telefone`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-04 23:57:53
