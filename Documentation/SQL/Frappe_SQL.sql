CREATE DATABASE  IF NOT EXISTS `lms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lms`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: database-1.ceo7csjfbddw.ap-south-1.rds.amazonaws.com    Database: lms
-- ------------------------------------------------------
-- Server version	8.0.23

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `BID` int NOT NULL AUTO_INCREMENT,
  `bookID` int NOT NULL,
  `title` varchar(75) NOT NULL,
  `authors` varchar(100) NOT NULL,
  `average_rating` decimal(3,2) NOT NULL,
  `isbn` varchar(15) NOT NULL,
  `isbn13` bigint NOT NULL,
  `language_code` varchar(45) NOT NULL,
  `num_pages` int NOT NULL,
  `ratings_count` int NOT NULL,
  `text_reviews_count` varchar(5) NOT NULL,
  `publication_date` date NOT NULL,
  `publisher` varchar(75) NOT NULL,
  PRIMARY KEY (`BID`),
  UNIQUE KEY `bookID_UNIQUE` (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (142,39763,'The Mystical Poems of Rumi 1: First Selection  Poems 1-200','Rumi/A.J. Arberry',4.28,'0226731510',9780226731513,'eng',208,114,'8','1974-03-15','University Of Chicago Press'),(143,17946,'Seven Nights','Jorge Luis Borges/Eliot Weinberger',4.33,'0811209059',9780811209052,'eng',121,1037,'60','1985-05-29','New Directions Publishing Corporation'),(144,32637,'Imajica: The Reconciliation','Clive Barker',4.42,'0061094153',9780061094156,'eng',544,2583,'30','1995-05-10','HarperTorch'),(145,28869,'Pégate un tiro para sobrevivir: un viaje personal por la América de los mit','Chuck Klosterman',3.81,'8439720033',9788439720034,'spa',272,27,'2','2006-02-28','Literatura Random House'),(146,8598,'Eats  Shoots & Leaves: Why  Commas Really Do Make a Difference!','Lynne Truss/Bonnie Timmons',4.15,'0399244913',9780399244919,'eng',32,1371,'205','2006-07-25','G.P. Putnam\'s Sons Books for Young Readers'),(147,10970,'Outlander','Matt Keefe',3.85,'184416411X',9781844164110,'eng',254,54,'5','2006-12-26','Games Workshop(uk)'),(148,14258,'English Passengers','Matthew Kneale',4.06,'0140285210',9780140285215,'en-GB',462,537,'65','2001-04-26','Penguin'),(149,44145,'The Bar on the Seine','Georges Simenon/David Watson',3.69,'0143038311',9780143038313,'en-US',160,380,'54','2006-12-26','Penguin Books'),(150,44229,'The Silver Pigs (Marcus Didius Falco  #1)','Lindsey Davis',3.94,'0345369076',9780345369079,'eng',241,144,'26','1991-02-13','Fawcett Books'),(151,2543,'Las intermitencias de la muerte','José Saramago/Pilar del Río',4.00,'9587043642',9789587043648,'spa',274,2862,'306','2005-12-01','Alfaguara'),(152,1226,'Life of Pi','Yann Martel',3.91,'0156030209',9780156030205,'en-US',401,4318,'668','2004-05-03','Mariner Books / Harvest Books'),(153,25257,'Mein Urgroßvater  die Helden und ich','James Krüss',4.30,'3551552711',9783551552716,'ger',250,16,'1','2002-12-01','Carlsen'),(154,10767,'Merde!: The Real French You Were Never Taught at School','Geneviève/Michael    Heath',3.96,'0684854279',9780684854274,'eng',112,155,'13','1998-12-09','Gallery Books'),(155,33308,'There\'s No Toilet Paper . . . on the Road Less Traveled: The Best of Travel','Doug Lansky',3.38,'1932361278',9781932361278,'eng',216,413,'53','2005-11-16','Travelers\' Tales'),(156,29680,'The Coen Brothers: Interviews','William Rodney Allen',3.82,'1578068894',9781578068890,'eng',208,73,'3','2006-08-18','University Press of Mississippi'),(157,9742,'The Audacity of Hope: Thoughts on Reclaiming the American Dream','Barack Obama',3.75,'0307237699',9780307237699,'eng',375,127324,'4496','2006-10-17','Crown'),(158,15004,'First Love: A Gothic Tale','Joyce Carol Oates/Barry Moser/Erhan Sunar',3.19,'088001508X',9780880015080,'eng',86,579,'83','1997-08-21','Ecco'),(159,32816,'The Canterbury Tales: Fifteen Tales and the General Prologue','Geoffrey Chaucer/V.A. Kolve/Glending Olson',3.95,'0393925870',9780393925876,'enm',600,1149,'41','2005-08-01','W. W. Norton & Company'),(160,2912,'Escape from Fire Mountain (World of Adventure  #3)','Gary Paulsen/Steve Chorney',3.67,'0440410258',9780440410256,'eng',80,114,'17','1995-01-01','Yearling'),(161,2123,'The 36-Hour Day: A Family Guide to Caring for Persons with Alzheimer Diseas','Nancy L. Mace/Peter V. Rabins',4.24,'0446618764',9780446618762,'eng',624,69,'6','2006-11-01','Grand Central Life & Style'),(162,31434,'The Poetry of Sylvia Plath','Claire Brennan',4.25,'0231124279',9780231124270,'eng',202,27,'0','2001-08-29','Columbia University Press'),(163,33493,'The Keeper\'s Companion Vol. 1 (Call of Cthulhu RPG)','Keith Herber/Brian M. Sammons/William Dietze/Chaosium Inc.',3.92,'1568821441',9781568821443,'eng',208,65,'1','2003-09-15','Chaosium'),(164,31582,'The Selected Poems of Federico García Lorca','Federico García Lorca',4.32,'0811200914',9780811200912,'mul',180,236,'23','1955-06-01','New Directions Publishing Corporation'),(165,6667,'Boy: Tales of Childhood (Roald Dahl\'s Autobiography  #1)','Roald Dahl/Quentin Blake',4.10,'0141311401',9780141311401,'eng',176,45253,'1934','2001-04-05','Puffin Books'),(166,12564,'Sometimes a Great Notion','Ken Kesey/Charles Bowden',4.17,'0143039865',9780143039860,'eng',715,577,'80','2006-08-29','Penguin Classics'),(167,10148,'The Complete Sherlock Holmes  Volume II','Arthur Conan Doyle/Kyle Freeman',4.47,'1593080409',9781593080402,'eng',709,874,'57','2003-10-01','Barnes  Noble Classics'),(168,13737,'The Twelve Kingdoms: Sea of Shadow (The Twelve Kingdoms  #1)','Fuyumi Ono/小野 不由美/Akihiro Yamada/山田 章博/Elye J. Alexander/Alexander O. Smith',4.20,'1598169467',9781598169461,'en-US',464,2504,'172','2007-03-13','TokyoPop'),(169,26968,'Quicksand','Nella Larsen',3.68,'0486451402',9780486451404,'eng',125,181,'29','2006-09-15','Dover Publications'),(170,5061,'La verdad acerca de las Industrias Farmacéuticas: cómo nos engaña y qué hac','Marcia Angell',3.95,'9580493510',9789580493518,'spa',324,3,'0','2006-12-01','Norma'),(171,15174,'Something Rising','Haven Kimmel',3.61,'0743247779',9780743247771,'eng',288,1237,'154','2005-04-05','Free Press'),(172,41909,'Harry Potter ve Sırlar Odası (Harry Potter  #2)','J.K. Rowling/Sevin Okyay',4.42,'3570211029',9783570211021,'tur',403,1000,'41','2001-10-01','Yapı Kredi Yayınları'),(173,8,'Harry Potter Boxed Set  Books 1-5 (Harry Potter  #1-5)','J.K. Rowling/Mary GrandPré',4.78,'0439682584',9780439682589,'eng',2690,41428,'164','2004-09-13','Scholastic'),(174,2,'Harry Potter and the Order of the Phoenix (Harry Potter  #5)','J.K. Rowling/Mary GrandPré',4.49,'0439358078',9780439358071,'eng',870,2153167,'29221','2004-09-01','Scholastic Inc.'),(175,2002,'Harry Potter Schoolbooks Box Set: Two Classic Books from the Library of Hog','J.K. Rowling',4.40,'043932162X',9780439321624,'eng',240,11515,'139','2001-11-01','Arthur A. Levine'),(176,15877,'Ultimate Unofficial Guide to the Mysteries of Harry Potter: Analysis of Boo','Galadriel Waters/Astre Mithrandir',4.05,'0972393617',9780972393614,'en-US',412,2774,'37','2003-01-01','Wizarding World Press'),(177,15867,'Mugglenet.Com\'s What Will Happen in Harry Potter 7: Who Lives  Who Dies  Wh','Ben Schoen/Andy Gordon/Gretchen Stull/Emerson Spartz/Jamie Lawrence',4.23,'1569755833',9781569755839,'en-GB',216,9023,'112','2006-10-19','Ulysses Press'),(178,31819,'Harry Potter and Philosophy: If Aristotle Ran Hogwarts','David Baggett/Shawn E. Klein',4.48,'0812694554',9780812694550,'eng',243,11422,'78','2004-09-10','Open Court'),(179,15876,'Harry Potter y la Orden del Fénix (Harry Potter  #5)','J.K. Rowling',4.49,'8478888845',9788478888849,'spa',893,5637,'458','2004-02-21','Emece Editores'),(180,1,'Harry Potter and the Half-Blood Prince (Harry Potter  #6)','J.K. Rowling/Mary GrandPré',4.57,'0439785960',9780439785969,'eng',652,2095690,'27591','2006-09-16','Scholastic Inc.'),(181,4,'Harry Potter and the Chamber of Secrets (Harry Potter  #2)','J.K. Rowling',4.42,'0439554896',9780439554893,'eng',352,6333,'244','2003-11-01','Scholastic'),(182,3258,'Greek Tragedies  Volume 2','David Grene/Richmond Lattimore/Aeschylus/Sophocles/Euripides',4.29,'0226307751',9780226307756,'eng',304,327,'12','1960-02-15','University Of Chicago Press'),(183,30044,'Young Men and Fire','Norman Maclean',4.08,'0226500624',9780226500621,'eng',301,4346,'386','1993-11-05','University Of Chicago Press'),(184,16113,'A Dance to the Music of Time: 1st Movement (A Dance to the Music of Time  #','Anthony Powell',3.95,'0226677141',9780226677149,'eng',718,3817,'271','1995-05-31','University of Chicago Press'),(185,44514,'A Preface to Democratic Theory','Robert A. Dahl',3.63,'0226134342',9780226134345,'en-GB',200,88,'8','2006-09-15','University of Chicago Press'),(186,1470,'Euripides II: The Cyclops / Heracles / Iphigenia in Tauris / Helen','Euripides/David Grene/Richmond Lattimore/Witter Bynner/William Arrowsmith',4.31,'0226307816',9780226307817,'eng',264,790,'12','2002-04-15','University of Chicago Press'),(187,1073,'The Crescent Obscured: The United States and the Muslim World  1776-1815','Robert J. Allison',3.62,'0226014908',9780226014906,'eng',284,31,'5','2000-07-15','University of Chicago Press'),(188,16115,'A Dance to the Music of Time: 2nd Movement (A Dance to the Music of Time  #','Anthony Powell',4.29,'0226677168',9780226677163,'eng',722,1237,'87','1995-06-15','University of Chicago Press'),(189,28028,'Bengal Nights','Mircea Eliade/Catherine Spencer',3.93,'0226204197',9780226204192,'en-US',184,257,'29','1995-04-01','University of Chicago Press'),(190,15880,'Harrius Potter et Philosophi Lapis','J.K. Rowling/Peter Needham',4.47,'1582348251',9781582348254,'lat',249,195,'24','2003-07-07','Bloomsbury'),(191,32639,'Sacrament','Clive Barker',3.75,'0006482643',9780006482642,'eng',594,3942,'106','1997-05-01','Harper Voyager'),(192,34605,'The Damnation Game','Clive Barker',3.82,'0425188930',9780425188934,'eng',433,15857,'350','2002-11-05','Berkley Books'),(193,34498,'The Truth (Discworld  #25; Industrial Revolution  #2)','Terry Pratchett',4.27,'0413771164',9780413771162,'eng',336,43964,'880','2002-02-21','Bloomsbury Methuen Drama'),(194,10765,'A Year in the Merde','Stephen Clarke',3.54,'1582346178',9781582346175,'en-US',276,11429,'979','2006-05-02','Bloomsbury Publishing PLC'),(195,4278,'Medicus (Gaius Petreius Ruso  #1)','Ruth Downie',3.73,'1596912316',9781596912311,'eng',386,5723,'695','2007-03-06','Bloomsbury Publishing PLC'),(196,15782,'Sideways Arithmetic from Wayside School (Wayside School #2.5)','Louis Sachar',3.88,'0747569126',9780747569121,'eng',96,3708,'74','2004-05-01','Bloomsbury U.S.A. Children\'s Books'),(197,10008,'Eleanor Rigby','Douglas Coupland',3.65,'1582346437',9781582346434,'eng',272,8517,'372','2006-05-30','Bloomsbury USA'),(198,9714,'Gabriel Garcia Marquez\'s Love in the Time of Cholera: A Reader\'s Guide','Thomas Fahy',4.24,'0826414753',9780826414755,'eng',188,1953,'84','2003-04-10','Bloomsbury Academic'),(199,29726,'Don DeLillo\'s White Noise: A Reader\'s Guide','Leonard  Orr',3.92,'0826414745',9780826414748,'eng',96,76,'9','2003-04-10','Bloomsbury Academic'),(200,23859,'Soldiers of Salamis','Javier Cercas/Anne McLean',3.81,'1582344728',9781582344720,'eng',213,429,'71','2005-01-10','Bloomsbury USA'),(201,4295,'David Foster Wallace\'s Infinite Jest: A Reader\'s Guide','Stephen J. Burn',3.82,'082641477X',9780826414779,'en-GB',96,900,'48','2003-05-20','Bloomsbury Academic'),(202,44478,'Architecture and Tourism: Perception  Performance and Place','D. Medina Lasansky',3.20,'1859737099',9781859737095,'eng',320,5,'1','2004-09-04','Bloomsbury Academic'),(203,22332,'Cyberpunk and Cyberculture: Science Fiction and the Work of William Gibson','Dani Cavallaro',3.77,'0485006073',9780485006070,'eng',258,62,'4','2001-09-13','Bloomsbury Academic'),(204,1480,'Plays 1: Medea/The Phoenician Women/Bacchae','Euripides/David Thompson/J. Michael Walton',3.78,'0413752801',9780413752802,'eng',192,9,'0','2000-11-09','Bloomsbury Methuen Drama'),(205,44900,'The Alchemist’s Kitchen: Extraordinary Potions & Curious Notions','Guy Ogilvy',4.03,'0802715400',9780802715401,'eng',58,136,'12','2006-10-17','Bloomsbury'),(206,31842,'The Undead and Philosophy: Chicken Soup for the Soulless','Richard V. Greene/K. Silem Mohammad',3.70,'0812696018',9780812696011,'en-US',288,196,'18','2006-08-29','Open Court'),(207,31833,'Star Wars and Philosophy: More Powerful than You Can Possibly Imagine','Kevin S. Decker/Jason T. Eberl/William Irwin/George Lucas/William O. Stephens/Walter Ritoku Robinson',4.05,'0812695836',9780812695830,'eng',227,1774,'35','2005-03-23','Open Court'),(208,31912,'Buffy the Vampire Slayer and Philosophy: Fear and Trembling in Sunnydale','James B. South/William Irwin',4.06,'0812695313',9780812695311,'eng',335,2519,'85','2003-03-13','Open Court'),(209,31882,'The Matrix and Philosophy: Welcome to the Desert of the Real','William Irwin/Gerald J. Erion/Barry  Smith/Carolyn Korsmeyer/Jonathan J. Sanford/Jason Holt/Theodore',3.91,'081269502X',9780812695021,'eng',280,1947,'71','2002-08-28','Open Court'),(210,16893,'The Crack-Up','F. Scott Fitzgerald/Edmund Wilson',3.92,'0811212475',9780811212472,'eng',347,2477,'133','2003-04-30','New Directions Publishing Corporation'),(211,11320,'The Captain\'s Verses','Pablo Neruda/Donald Devenish Walsh',4.25,'0811215806',9780811215800,'mul',151,4494,'160','2004-07-19','New Directions Publishing Corporation');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `IID` int NOT NULL AUTO_INCREMENT,
  `BID` int NOT NULL,
  `Registered` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IID`),
  KEY `IID_inventory_idx` (`BID`),
  KEY `iid_inven_idx` (`BID`),
  CONSTRAINT `IID_inven` FOREIGN KEY (`BID`) REFERENCES `books` (`BID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (93,142,'2021-06-01 23:37:30'),(94,143,'2021-06-01 23:37:30'),(95,144,'2021-06-01 23:37:30'),(96,145,'2021-06-01 23:37:30'),(97,146,'2021-06-01 23:37:30'),(98,147,'2021-06-01 23:37:30'),(99,148,'2021-06-01 23:37:30'),(100,149,'2021-06-01 23:37:30'),(101,150,'2021-06-01 23:37:30'),(102,151,'2021-06-01 23:37:30'),(103,152,'2021-06-01 23:37:31'),(104,153,'2021-06-01 23:37:31'),(105,154,'2021-06-01 23:37:31'),(106,155,'2021-06-01 23:37:31'),(107,156,'2021-06-01 23:37:31'),(108,157,'2021-06-01 23:37:31'),(109,158,'2021-06-01 23:37:31'),(110,159,'2021-06-01 23:37:31'),(111,160,'2021-06-01 23:37:31'),(112,161,'2021-06-01 23:37:31'),(113,162,'2021-06-01 23:37:31'),(114,163,'2021-06-01 23:37:31'),(115,164,'2021-06-01 23:37:31'),(116,165,'2021-06-01 23:37:31'),(117,166,'2021-06-01 23:37:31'),(118,167,'2021-06-01 23:37:31'),(119,168,'2021-06-01 23:37:32'),(120,169,'2021-06-01 23:37:32'),(121,170,'2021-06-01 23:37:32'),(122,171,'2021-06-01 23:37:32'),(123,172,'2021-06-11 17:08:19'),(124,173,'2021-06-11 17:08:19'),(125,173,'2021-06-11 17:08:19'),(126,174,'2021-06-11 17:08:19'),(127,175,'2021-06-11 17:08:19'),(128,176,'2021-06-11 17:08:19'),(129,177,'2021-06-11 17:08:19'),(130,178,'2021-06-11 17:08:19'),(131,179,'2021-06-11 17:08:19'),(132,180,'2021-06-11 17:08:19'),(133,181,'2021-06-11 17:08:19'),(134,180,'2021-06-11 17:08:19'),(135,143,'2021-06-11 17:15:42'),(137,143,'2021-06-11 17:16:41'),(138,144,'2021-06-11 17:16:41'),(139,145,'2021-06-11 17:16:41'),(140,146,'2021-06-11 17:16:42'),(141,147,'2021-06-11 17:16:42'),(142,148,'2021-06-11 17:16:43'),(143,149,'2021-06-11 17:16:43'),(144,150,'2021-06-11 17:16:43'),(145,151,'2021-06-11 17:16:44'),(146,152,'2021-06-11 17:16:44'),(147,153,'2021-06-11 17:16:45'),(148,154,'2021-06-11 17:16:45'),(149,155,'2021-06-11 17:16:46'),(150,156,'2021-06-11 17:16:46'),(151,157,'2021-06-11 17:16:46'),(152,158,'2021-06-11 17:16:47'),(153,159,'2021-06-11 17:16:47'),(154,160,'2021-06-11 17:16:47'),(155,161,'2021-06-11 17:16:48'),(157,143,'2021-06-11 17:20:12'),(158,144,'2021-06-11 17:20:12'),(159,145,'2021-06-11 17:20:13'),(160,146,'2021-06-11 17:20:13'),(161,147,'2021-06-11 17:20:13'),(162,148,'2021-06-11 17:20:14'),(163,149,'2021-06-11 17:20:14'),(164,150,'2021-06-11 17:20:14'),(165,151,'2021-06-11 17:20:15'),(166,152,'2021-06-11 17:20:15'),(167,153,'2021-06-11 17:20:16'),(168,154,'2021-06-11 17:20:16'),(169,155,'2021-06-11 17:20:16'),(170,156,'2021-06-11 17:20:17'),(171,157,'2021-06-11 17:20:17'),(172,158,'2021-06-11 17:20:17'),(173,159,'2021-06-11 17:20:18'),(174,160,'2021-06-11 17:20:18'),(175,161,'2021-06-11 17:20:18'),(176,142,'2021-06-11 17:25:20'),(177,143,'2021-06-11 17:25:21'),(178,144,'2021-06-11 17:25:21'),(179,145,'2021-06-11 17:25:21'),(180,146,'2021-06-11 17:25:22'),(181,147,'2021-06-11 17:25:22'),(182,148,'2021-06-11 17:25:22'),(183,149,'2021-06-11 17:25:23'),(184,150,'2021-06-11 17:25:23'),(185,151,'2021-06-11 17:25:23'),(186,152,'2021-06-11 17:25:24'),(187,153,'2021-06-11 17:25:24'),(188,154,'2021-06-11 17:25:24'),(189,155,'2021-06-11 17:25:25'),(190,156,'2021-06-11 17:25:25'),(191,157,'2021-06-11 17:25:25'),(192,158,'2021-06-11 17:25:26'),(193,159,'2021-06-11 17:25:26'),(194,160,'2021-06-11 17:25:26'),(195,161,'2021-06-11 17:25:27'),(196,142,'2021-06-11 17:25:35'),(197,143,'2021-06-11 17:25:35'),(198,144,'2021-06-11 17:25:36'),(199,145,'2021-06-11 17:25:36'),(200,146,'2021-06-11 17:25:36'),(201,147,'2021-06-11 17:25:37'),(202,148,'2021-06-11 17:25:37'),(203,149,'2021-06-11 17:25:37'),(204,150,'2021-06-11 17:25:38'),(205,151,'2021-06-11 17:25:38'),(206,152,'2021-06-11 17:25:38'),(207,153,'2021-06-11 17:25:39'),(208,154,'2021-06-11 17:25:39'),(209,155,'2021-06-11 17:25:39'),(210,156,'2021-06-11 17:25:40'),(211,157,'2021-06-11 17:25:40'),(212,158,'2021-06-11 17:25:40'),(213,159,'2021-06-11 17:25:41'),(214,160,'2021-06-11 17:25:41'),(215,161,'2021-06-11 17:25:41'),(216,142,'2021-06-11 17:26:34'),(217,143,'2021-06-11 17:26:35'),(218,144,'2021-06-11 17:26:35'),(219,145,'2021-06-11 17:26:35'),(220,146,'2021-06-11 17:26:36'),(221,147,'2021-06-11 17:26:36'),(222,148,'2021-06-11 17:26:36'),(223,149,'2021-06-11 17:26:37'),(224,150,'2021-06-11 17:26:37'),(225,151,'2021-06-11 17:26:37'),(226,152,'2021-06-11 17:26:38'),(227,153,'2021-06-11 17:26:38'),(228,154,'2021-06-11 17:26:38'),(229,155,'2021-06-11 17:26:39'),(230,156,'2021-06-11 17:26:39'),(231,157,'2021-06-11 17:26:39'),(232,158,'2021-06-11 17:26:40'),(233,159,'2021-06-11 17:26:40'),(234,160,'2021-06-11 17:26:41'),(235,161,'2021-06-11 17:26:41'),(236,142,'2021-06-11 17:27:04'),(237,143,'2021-06-11 17:27:04'),(238,144,'2021-06-11 17:27:04'),(239,145,'2021-06-11 17:27:05'),(240,146,'2021-06-11 17:27:05'),(241,147,'2021-06-11 17:27:05'),(242,148,'2021-06-11 17:27:06'),(243,149,'2021-06-11 17:27:06'),(244,150,'2021-06-11 17:27:06'),(245,151,'2021-06-11 17:27:07'),(246,152,'2021-06-11 17:27:07'),(247,153,'2021-06-11 17:27:07'),(248,154,'2021-06-11 17:27:08'),(249,155,'2021-06-11 17:27:08'),(250,156,'2021-06-11 17:27:08'),(251,157,'2021-06-11 17:27:09'),(252,158,'2021-06-11 17:27:09'),(253,159,'2021-06-11 17:27:09'),(254,160,'2021-06-11 17:27:10'),(255,161,'2021-06-11 17:27:10'),(256,142,'2021-06-11 17:28:05'),(257,143,'2021-06-11 17:28:06'),(258,144,'2021-06-11 17:28:06'),(259,145,'2021-06-11 17:28:06'),(260,146,'2021-06-11 17:28:07'),(261,142,'2021-06-16 09:16:18'),(262,143,'2021-06-16 09:16:18'),(263,144,'2021-06-16 09:16:18'),(264,145,'2021-06-16 09:16:18'),(265,146,'2021-06-16 09:16:18'),(266,147,'2021-06-16 09:16:18'),(267,148,'2021-06-16 09:16:18'),(268,149,'2021-06-16 09:16:18'),(269,150,'2021-06-16 09:16:18'),(270,151,'2021-06-16 09:16:18'),(271,152,'2021-06-16 09:16:18'),(272,153,'2021-06-16 09:16:18'),(273,154,'2021-06-16 09:16:18'),(274,155,'2021-06-16 09:16:18'),(275,156,'2021-06-16 09:16:18'),(276,157,'2021-06-16 09:16:18'),(277,158,'2021-06-16 09:16:18'),(278,159,'2021-06-16 09:16:18'),(279,160,'2021-06-16 09:16:18'),(280,161,'2021-06-16 09:16:18'),(281,142,'2021-06-16 09:16:23'),(282,142,'2021-06-16 09:16:31'),(283,142,'2021-06-16 09:16:31'),(284,142,'2021-06-23 15:33:42'),(285,142,'2021-06-23 15:33:42'),(286,142,'2021-06-23 15:33:42'),(287,182,'2021-06-23 15:33:42'),(288,183,'2021-06-23 15:33:42'),(289,184,'2021-06-23 15:33:42'),(290,185,'2021-06-23 15:33:42'),(291,186,'2021-06-23 15:33:42'),(292,187,'2021-06-23 15:33:42'),(293,186,'2021-06-23 15:33:42'),(294,184,'2021-06-23 15:33:42'),(295,188,'2021-06-23 15:33:42'),(296,189,'2021-06-23 15:33:42'),(297,190,'2021-06-28 05:56:30'),(298,172,'2021-06-28 05:56:30'),(299,173,'2021-06-28 05:56:30'),(300,173,'2021-06-28 05:56:31'),(301,174,'2021-06-28 05:56:31'),(302,175,'2021-06-28 05:56:32'),(303,179,'2021-06-28 05:56:32'),(304,180,'2021-06-28 05:56:32'),(305,181,'2021-06-28 05:56:33'),(306,180,'2021-06-28 05:56:33'),(307,144,'2021-06-28 07:45:16'),(308,191,'2021-06-28 07:45:16'),(309,192,'2021-06-28 07:45:16'),(310,142,'2021-08-05 08:47:20'),(311,191,'2021-08-05 08:54:32'),(312,191,'2021-08-05 08:54:34'),(313,143,'2021-08-05 09:01:10'),(314,143,'2021-08-05 09:01:12'),(315,142,'2021-08-05 09:26:21'),(316,143,'2021-08-05 09:26:21'),(317,144,'2021-08-05 09:26:21'),(318,145,'2021-08-05 09:26:22'),(319,146,'2021-08-05 09:26:22'),(320,147,'2021-08-05 09:26:22'),(321,148,'2021-08-05 09:26:23'),(322,149,'2021-08-05 09:26:23'),(323,150,'2021-08-05 09:26:23'),(324,151,'2021-08-05 09:26:24'),(325,152,'2021-08-05 09:26:24'),(326,153,'2021-08-05 09:26:24'),(327,154,'2021-08-05 09:26:25'),(328,155,'2021-08-05 09:26:25'),(329,156,'2021-08-05 09:26:26'),(330,157,'2021-08-05 09:26:26'),(331,158,'2021-08-05 09:26:27'),(332,159,'2021-08-05 09:26:27'),(333,160,'2021-08-05 09:26:27'),(334,161,'2021-08-05 09:26:28'),(335,143,'2021-08-05 09:29:26'),(336,142,'2021-08-05 09:29:39'),(337,142,'2021-08-05 09:30:09'),(338,142,'2021-08-05 09:31:38'),(339,142,'2021-08-05 09:38:51'),(340,189,'2021-08-05 09:39:34'),(341,142,'2021-08-05 09:49:59'),(342,142,'2021-08-05 09:54:02'),(343,142,'2021-08-05 10:10:04'),(344,142,'2021-08-05 10:13:03'),(345,142,'2021-08-05 10:27:08'),(346,142,'2021-08-05 10:28:38'),(347,143,'2021-08-05 10:28:38'),(348,144,'2021-08-05 10:28:41'),(349,145,'2021-08-05 10:28:41'),(350,146,'2021-08-05 10:28:41'),(351,147,'2021-08-05 10:28:42'),(352,148,'2021-08-05 10:28:42'),(353,149,'2021-08-05 10:28:43'),(354,150,'2021-08-05 10:28:43'),(355,151,'2021-08-05 10:28:44'),(356,152,'2021-08-05 10:28:44'),(357,153,'2021-08-05 10:28:45'),(358,154,'2021-08-05 10:28:46'),(359,155,'2021-08-05 10:28:46'),(360,156,'2021-08-05 10:28:46'),(361,157,'2021-08-05 10:28:47'),(362,158,'2021-08-05 10:28:47'),(363,159,'2021-08-05 10:28:48'),(364,160,'2021-08-05 10:28:48'),(365,161,'2021-08-05 10:28:49'),(366,142,'2021-08-12 16:59:41'),(367,142,'2021-08-12 16:59:41'),(368,142,'2021-08-16 17:36:38'),(369,142,'2021-08-16 17:36:38'),(370,155,'2021-08-27 13:04:30'),(371,190,'2021-08-27 13:52:30'),(372,193,'2021-08-27 13:52:32'),(373,194,'2021-08-27 13:52:34'),(374,195,'2021-08-27 13:52:36'),(375,196,'2021-08-27 13:52:38'),(376,197,'2021-08-27 13:52:40'),(377,198,'2021-08-27 13:52:42'),(378,199,'2021-08-27 13:52:44'),(379,200,'2021-08-27 13:52:47'),(380,201,'2021-08-27 13:52:49'),(381,202,'2021-08-27 13:52:51'),(382,203,'2021-08-27 13:52:53'),(383,204,'2021-08-27 13:52:55'),(384,205,'2021-08-27 13:52:57'),(385,206,'2021-08-27 13:58:54'),(386,207,'2021-08-27 13:58:56'),(387,208,'2021-08-27 13:58:59'),(388,209,'2021-08-27 13:59:01'),(389,208,'2021-08-27 13:59:03'),(390,142,'2021-09-05 08:56:00'),(391,158,'2021-09-05 08:56:02'),(392,143,'2021-09-05 08:56:04'),(393,164,'2021-09-05 08:56:06'),(394,210,'2021-09-05 08:56:08'),(395,211,'2021-09-05 08:56:11');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `MID` int NOT NULL AUTO_INCREMENT,
  `Full_Name` varchar(75) NOT NULL,
  `Email_ID` varchar(75) NOT NULL,
  `Mobile_No` varchar(45) NOT NULL,
  `Auth` varchar(45) DEFAULT 'Activated',
  PRIMARY KEY (`MID`),
  UNIQUE KEY `Email_ID_UNIQUE` (`Email_ID`),
  UNIQUE KEY `Mobile_No_UNIQUE` (`Mobile_No`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Madhav','parikh.madhav1999@gmail.com','9998256749','Activated'),(2,'Nimesh','nimesh@gnmail.com  ','9918256749','Activated'),(3,'Nita Parikh ','nitaparikh@gmail.com ','9409541372','Activated');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns` (
  `RID` int NOT NULL AUTO_INCREMENT,
  `SID` int NOT NULL,
  `TID` int NOT NULL,
  `Timestamp` timestamp NOT NULL,
  PRIMARY KEY (`RID`),
  KEY `INDEX` (`SID`,`TID`),
  KEY `transaction_idx` (`TID`),
  CONSTRAINT `settings` FOREIGN KEY (`SID`) REFERENCES `settings` (`SID`),
  CONSTRAINT `transaction` FOREIGN KEY (`TID`) REFERENCES `transactions` (`TID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
INSERT INTO `returns` VALUES (5,7,5,'2021-08-19 14:11:03'),(6,7,6,'2021-08-24 13:38:02');
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `SID` int NOT NULL AUTO_INCREMENT,
  `Validity` int NOT NULL,
  `Charges` int NOT NULL COMMENT 'Amount to be charged',
  `Limit` int NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (7,0,50,500,'2021-08-19 12:42:39'),(8,0,50,500,'2021-08-29 10:57:23');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `TID` int NOT NULL AUTO_INCREMENT,
  `IID` int NOT NULL,
  `MID` int NOT NULL,
  `Issued` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Returned` timestamp NULL DEFAULT NULL,
  `Status` varchar(45) NOT NULL DEFAULT 'issued',
  PRIMARY KEY (`TID`),
  KEY `IID_inventory_transactions_idx` (`IID`),
  KEY `memeber_transactions_idx` (`MID`),
  CONSTRAINT `IID_inventory_transactions` FOREIGN KEY (`IID`) REFERENCES `inventory` (`IID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `memeber_transactions` FOREIGN KEY (`MID`) REFERENCES `members` (`MID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (5,93,1,'2021-05-01 19:39:33','2021-08-19 14:11:03','returned'),(6,106,1,'2021-05-01 19:58:31','2021-08-24 13:38:02','returned'),(7,111,2,'2021-06-01 10:57:47','0000-00-00 00:00:00','issued'),(8,165,3,'2021-06-28 06:02:53','0000-00-00 00:00:00','issued'),(9,262,3,'2021-06-28 07:46:24','0000-00-00 00:00:00','issued'),(10,308,1,'2021-08-07 10:40:23','0000-00-00 00:00:00','issued'),(11,94,1,'2021-08-07 10:40:34','0000-00-00 00:00:00','issued'),(12,291,1,'2021-08-07 10:40:44','0000-00-00 00:00:00','issued'),(13,362,2,'2021-08-18 18:14:00','0000-00-00 00:00:00','issued');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-06  8:47:47
