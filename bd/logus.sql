-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: logusmedics
-- ------------------------------------------------------
-- Server version	5.7.29-log

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
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agenda` (
  `dataConsulta` date NOT NULL,
  `horaConsulta` time NOT NULL,
  `idEspecialidade` int(3) NOT NULL,
  `crm` int(11) NOT NULL,
  `idConsultorio` int(11) NOT NULL,
  `cpfPaciente` varchar(11) NOT NULL,
  `obs` text,
  PRIMARY KEY (`dataConsulta`,`horaConsulta`,`idConsultorio`),
  KEY `idmedico_idx` (`crm`),
  KEY `idconsultorio_idx` (`idConsultorio`),
  KEY `idespecialidade_idx` (`idEspecialidade`),
  KEY `idpaciente_idx` (`cpfPaciente`),
  CONSTRAINT `idconsultorio` FOREIGN KEY (`idConsultorio`) REFERENCES `consultorios` (`idconsultorios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idespecialidade` FOREIGN KEY (`idEspecialidade`) REFERENCES `especialidade` (`idespecialidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idmedico` FOREIGN KEY (`crm`) REFERENCES `medicos` (`crm`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idpaciente` FOREIGN KEY (`cpfPaciente`) REFERENCES `pacientes` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
INSERT INTO `agenda` VALUES ('2021-10-30','09:00:00',2,95680,1,'88873406092',NULL),('2021-10-31','08:00:00',2,122240,3,'80892801026',NULL);
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultorios`
--

DROP TABLE IF EXISTS `consultorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultorios` (
  `idconsultorios` int(11) NOT NULL AUTO_INCREMENT,
  `descricaoConsult` varchar(20) NOT NULL DEFAULT 'Consultório número ',
  PRIMARY KEY (`idconsultorios`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorios`
--

LOCK TABLES `consultorios` WRITE;
/*!40000 ALTER TABLE `consultorios` DISABLE KEYS */;
INSERT INTO `consultorios` VALUES (1,'Consultório 01'),(2,'Consultório 02'),(3,'Consultório 03'),(4,'Consultório 04'),(5,'Consultório 05');
/*!40000 ALTER TABLE `consultorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidade` (
  `idespecialidade` int(3) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`idespecialidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
INSERT INTO `especialidade` VALUES (1,'OFTALMOLOGISTA'),(2,'CIRURGIÃO'),(3,'ODONTOLOGISTA'),(4,'ONCOLOGISTA'),(5,'UROLOGISTA');
/*!40000 ALTER TABLE `especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicos` (
  `crm` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `idade` int(3) NOT NULL,
  PRIMARY KEY (`crm`),
  KEY `nmmedic` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES (95680,'PATRICIA MARQUES',50),(122240,'MANOEL IGNACIO DE LOIOLA',48),(150358,'JEFFERSON DE SOUZA JUNIOR',40),(182569,'MARCELA DA SILVA GIORDANO',30);
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `idade` int(3) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES ('02476854867','JESSICA ALVES FLORENCIO',30),('12438094001','MARCIO DE SOUZA',35),('80892801026','WISTER HURI',43),('88873406092','FLAVIA BARBOSA RAMOS',25),('90252579097','JUVENAL JUVENCIO',80),('92570278050','JOSE DA SILVA',60);
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'logusmedics'
--

--
-- Dumping routines for database 'logusmedics'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_horario_agenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_horario_agenda`(IN consultaData date, IN cpfPas varchar(11), IN crmMed int(11), IN consultorio int(11), IN especialidade int(3) )
Begin
     SET @ultimaConsulta  = 0;
     SET @contador = 0;
     SET @lcheckMedic = 0;
	 SET @ldataConsulta = ConsultaData;
     SET @lcpf = cpfPas;
     SET @lcrm = crmMed;
     SET @lconsultorio = consultorio;
     SET @lespecialidade = especialidade;
     
      SELECT count(cpfPaciente) from agenda 
			 where cpfPaciente = @lcpf 
             and dataConsulta = @ldataConsulta into @ultimaConsulta ;
      
      
       SELECT count(dataConsulta) from agenda 
                         where idConsultorio = @lconsultorio
                         and dataConsulta = @ldataConsulta into @contador;
                         
       SELECT idConsultorio from agenda 
                         where crm = @lcrm
                         and dataConsulta = @ldataConsulta limit 1  into @lcheckMedic;                  
             
      
     
      If @ultimaConsulta > 0 then
         SET @vSQL = 'SELECT "NUMERO MAXIMO DE CONSULTAS DESTE PACIENTE ATINGIDO" as RESULTADO, "ERROR" as STATUS';
       elseIf @contador = 12  then
			  SET @vSQL = 'SELECT " NUMERO DE CONSULTA DIARIAS EXCEDIDAS PARA ESTE CONSULTORIO" as RESULTADO, "ERROR" as STATUS';  
           elseIf ((@lcheckMedic > 0 ) AND ( @lcheckMedic <> @lconsultorio)) AND (@lespecialidade <> 2 ) then
                 SET @vSQL = 'SELECT " CONSULTORIO INDISPONIVEL PARA O MEDICO SELECIONADO" as RESULTADO, "ERROR" as STATUS';
               else  
                     SET @vSQL =  CONCAT(' SELECT ifnull(SEC_TO_TIME(TIME_TO_SEC(max(horaConsulta))+900), "08:00:00" ) as RESULTADO, "OK" as STATUS FROM agenda ',
							      ' WHERE idConsultorio = ', @lconsultorio , ' AND dataConsulta IN ("', @ldataConsulta,'")');
		   end if;
      
	 PREPARE my_Statement FROM @vSQL;
	 EXECUTE my_Statement;
		
     End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_max` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_max`(IN nomeTabela varchar(60), IN campo varchar(100))
Begin
     SET @tabela = nomeTabela;
     SET @campo = campo;
	 SET @vSQL =  CONCAT(' SELECT ifnull(MAX(',@Campo, ' ) + 1, 1 ) as PROXIMO FROM ', @tabela);
     
	 PREPARE my_Statement FROM @vSQL;
	 EXECUTE my_Statement;
		
     End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-31 14:38:41
