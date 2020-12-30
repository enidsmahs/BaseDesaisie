CREATE database IF NOT EXISTS sama_boutik_db;

 SET NAMES utf8 ;

USE sama_boutik_db;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(45) DEFAULT NULL,
  `adresseClient` varchar(45) DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depenses`
--

DROP TABLE IF EXISTS `depenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `depenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designation` varchar(45) DEFAULT NULL,
  `prix` double DEFAULT NULL,
  `quantite` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depenses`
--

LOCK TABLES `depenses` WRITE;
/*!40000 ALTER TABLE `depenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `depenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facture`
--

DROP TABLE IF EXISTS `facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `facture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateFacture` varchar(45) DEFAULT NULL,
  `numeroFacture` int DEFAULT NULL,
  `totalFactureHT` varchar(45) DEFAULT NULL,
  `idLogin` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_facture_login1_idx` (`idLogin`),
  CONSTRAINT `fk_facture_login1` FOREIGN KEY (`idLogin`) REFERENCES `login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=969931 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facture`
--

LOCK TABLES `facture` WRITE;
/*!40000 ALTER TABLE `facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facture_commande`
--

DROP TABLE IF EXISTS `facture_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `facture_commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateFacture` varchar(45) DEFAULT NULL,
  `numeroFacture` int DEFAULT NULL,
  `totalFactureHT` double DEFAULT NULL,
  `etatFacture` varchar(45) DEFAULT NULL,
  `reglement` varchar(45) DEFAULT NULL,
  `numeroCheque` varchar(45) DEFAULT NULL,
  `idClient` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_facture_commande_client1_idx` (`idClient`),
  CONSTRAINT `fk_facture_commande_client1` FOREIGN KEY (`idClient`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=650299 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facture_commande`
--

LOCK TABLES `facture_commande` WRITE;
/*!40000 ALTER TABLE `facture_commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `facture_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligne_achat`
--

DROP TABLE IF EXISTS `ligne_achat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ligne_achat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prixProduit` double DEFAULT NULL,
  `quantiteProduit` int DEFAULT NULL,
  `dateAchat` varchar(45) DEFAULT NULL,
  `idProduit` int NOT NULL,
  `idFacture` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ligne_achat_produits_idx` (`idProduit`),
  KEY `fk_ligne_achat_facture1_idx` (`idFacture`),
  CONSTRAINT `fk_ligne_achat_facture1` FOREIGN KEY (`idFacture`) REFERENCES `facture` (`id`),
  CONSTRAINT `fk_ligne_achat_produits` FOREIGN KEY (`idProduit`) REFERENCES `produits` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligne_achat`
--

LOCK TABLES `ligne_achat` WRITE;
/*!40000 ALTER TABLE `ligne_achat` DISABLE KEYS */;
/*!40000 ALTER TABLE `ligne_achat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligne_commande`
--

DROP TABLE IF EXISTS `ligne_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ligne_commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prixProduit` double DEFAULT NULL,
  `quantiteProduit` int DEFAULT NULL,
  `dateCommande` varchar(45) DEFAULT NULL,
  `idFactureCommande` int NOT NULL,
  `idProduit` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ligne_commande_facture_commande1_idx` (`idFactureCommande`),
  KEY `fk_ligne_commande_produits1_idx` (`idProduit`),
  CONSTRAINT `fk_ligne_commande_facture_commande1` FOREIGN KEY (`idFactureCommande`) REFERENCES `facture_commande` (`id`),
  CONSTRAINT `fk_ligne_commande_produits1` FOREIGN KEY (`idProduit`) REFERENCES `produits` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligne_commande`
--

LOCK TABLES `ligne_commande` WRITE;
/*!40000 ALTER TABLE `ligne_commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `ligne_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `passe` varchar(45) DEFAULT NULL,
  `confirmation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'admin','admin','admin');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_role`
--

DROP TABLE IF EXISTS `login_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `login_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idLogin` int NOT NULL,
  `idRole` int NOT NULL,
  PRIMARY KEY (`id`,`idLogin`,`idRole`),
  KEY `fk_login_has_roles_roles1_idx` (`idRole`),
  KEY `fk_login_has_roles_login1_idx` (`idLogin`),
  CONSTRAINT `fk_login_has_roles_login1` FOREIGN KEY (`idLogin`) REFERENCES `login` (`id`),
  CONSTRAINT `fk_login_has_roles_roles1` FOREIGN KEY (`idRole`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_role`
--

LOCK TABLES `login_role` WRITE;
/*!40000 ALTER TABLE `login_role` DISABLE KEYS */;
INSERT INTO `login_role` VALUES (1,1,1);
/*!40000 ALTER TABLE `login_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `referenceProduit` varchar(45) DEFAULT NULL,
  `nomProduit` varchar(45) DEFAULT NULL,
  `descriptionProduit` varchar(45) DEFAULT NULL,
  `prixProduit` double DEFAULT NULL,
  `quantiteProduit` int DEFAULT NULL,
  `imageProduit` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-25 21:41:53
