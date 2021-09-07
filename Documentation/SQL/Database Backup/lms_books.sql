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
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (142,39763,'The Mystical Poems of Rumi 1: First Selection  Poems 1-200','Rumi/A.J. Arberry',4.28,'0226731510',9780226731513,'eng',208,114,'8','1974-03-15','University Of Chicago Press'),(143,17946,'Seven Nights','Jorge Luis Borges/Eliot Weinberger',4.33,'0811209059',9780811209052,'eng',121,1037,'60','1985-05-29','New Directions Publishing Corporation'),(144,32637,'Imajica: The Reconciliation','Clive Barker',4.42,'0061094153',9780061094156,'eng',544,2583,'30','1995-05-10','HarperTorch'),(145,28869,'Pégate un tiro para sobrevivir: un viaje personal por la América de los mit','Chuck Klosterman',3.81,'8439720033',9788439720034,'spa',272,27,'2','2006-02-28','Literatura Random House'),(146,8598,'Eats  Shoots & Leaves: Why  Commas Really Do Make a Difference!','Lynne Truss/Bonnie Timmons',4.15,'0399244913',9780399244919,'eng',32,1371,'205','2006-07-25','G.P. Putnam\'s Sons Books for Young Readers'),(147,10970,'Outlander','Matt Keefe',3.85,'184416411X',9781844164110,'eng',254,54,'5','2006-12-26','Games Workshop(uk)'),(148,14258,'English Passengers','Matthew Kneale',4.06,'0140285210',9780140285215,'en-GB',462,537,'65','2001-04-26','Penguin'),(149,44145,'The Bar on the Seine','Georges Simenon/David Watson',3.69,'0143038311',9780143038313,'en-US',160,380,'54','2006-12-26','Penguin Books'),(150,44229,'The Silver Pigs (Marcus Didius Falco  #1)','Lindsey Davis',3.94,'0345369076',9780345369079,'eng',241,144,'26','1991-02-13','Fawcett Books'),(151,2543,'Las intermitencias de la muerte','José Saramago/Pilar del Río',4.00,'9587043642',9789587043648,'spa',274,2862,'306','2005-12-01','Alfaguara'),(152,1226,'Life of Pi','Yann Martel',3.91,'0156030209',9780156030205,'en-US',401,4318,'668','2004-05-03','Mariner Books / Harvest Books'),(153,25257,'Mein Urgroßvater  die Helden und ich','James Krüss',4.30,'3551552711',9783551552716,'ger',250,16,'1','2002-12-01','Carlsen'),(154,10767,'Merde!: The Real French You Were Never Taught at School','Geneviève/Michael    Heath',3.96,'0684854279',9780684854274,'eng',112,155,'13','1998-12-09','Gallery Books'),(155,33308,'There\'s No Toilet Paper . . . on the Road Less Traveled: The Best of Travel','Doug Lansky',3.38,'1932361278',9781932361278,'eng',216,413,'53','2005-11-16','Travelers\' Tales'),(156,29680,'The Coen Brothers: Interviews','William Rodney Allen',3.82,'1578068894',9781578068890,'eng',208,73,'3','2006-08-18','University Press of Mississippi'),(157,9742,'The Audacity of Hope: Thoughts on Reclaiming the American Dream','Barack Obama',3.75,'0307237699',9780307237699,'eng',375,127324,'4496','2006-10-17','Crown'),(158,15004,'First Love: A Gothic Tale','Joyce Carol Oates/Barry Moser/Erhan Sunar',3.19,'088001508X',9780880015080,'eng',86,579,'83','1997-08-21','Ecco'),(159,32816,'The Canterbury Tales: Fifteen Tales and the General Prologue','Geoffrey Chaucer/V.A. Kolve/Glending Olson',3.95,'0393925870',9780393925876,'enm',600,1149,'41','2005-08-01','W. W. Norton & Company'),(160,2912,'Escape from Fire Mountain (World of Adventure  #3)','Gary Paulsen/Steve Chorney',3.67,'0440410258',9780440410256,'eng',80,114,'17','1995-01-01','Yearling'),(161,2123,'The 36-Hour Day: A Family Guide to Caring for Persons with Alzheimer Diseas','Nancy L. Mace/Peter V. Rabins',4.24,'0446618764',9780446618762,'eng',624,69,'6','2006-11-01','Grand Central Life & Style'),(162,31434,'The Poetry of Sylvia Plath','Claire Brennan',4.25,'0231124279',9780231124270,'eng',202,27,'0','2001-08-29','Columbia University Press'),(163,33493,'The Keeper\'s Companion Vol. 1 (Call of Cthulhu RPG)','Keith Herber/Brian M. Sammons/William Dietze/Chaosium Inc.',3.92,'1568821441',9781568821443,'eng',208,65,'1','2003-09-15','Chaosium'),(164,31582,'The Selected Poems of Federico García Lorca','Federico García Lorca',4.32,'0811200914',9780811200912,'mul',180,236,'23','1955-06-01','New Directions Publishing Corporation'),(165,6667,'Boy: Tales of Childhood (Roald Dahl\'s Autobiography  #1)','Roald Dahl/Quentin Blake',4.10,'0141311401',9780141311401,'eng',176,45253,'1934','2001-04-05','Puffin Books'),(166,12564,'Sometimes a Great Notion','Ken Kesey/Charles Bowden',4.17,'0143039865',9780143039860,'eng',715,577,'80','2006-08-29','Penguin Classics'),(167,10148,'The Complete Sherlock Holmes  Volume II','Arthur Conan Doyle/Kyle Freeman',4.47,'1593080409',9781593080402,'eng',709,874,'57','2003-10-01','Barnes  Noble Classics'),(168,13737,'The Twelve Kingdoms: Sea of Shadow (The Twelve Kingdoms  #1)','Fuyumi Ono/小野 不由美/Akihiro Yamada/山田 章博/Elye J. Alexander/Alexander O. Smith',4.20,'1598169467',9781598169461,'en-US',464,2504,'172','2007-03-13','TokyoPop'),(169,26968,'Quicksand','Nella Larsen',3.68,'0486451402',9780486451404,'eng',125,181,'29','2006-09-15','Dover Publications'),(170,5061,'La verdad acerca de las Industrias Farmacéuticas: cómo nos engaña y qué hac','Marcia Angell',3.95,'9580493510',9789580493518,'spa',324,3,'0','2006-12-01','Norma'),(171,15174,'Something Rising','Haven Kimmel',3.61,'0743247779',9780743247771,'eng',288,1237,'154','2005-04-05','Free Press'),(172,41909,'Harry Potter ve Sırlar Odası (Harry Potter  #2)','J.K. Rowling/Sevin Okyay',4.42,'3570211029',9783570211021,'tur',403,1000,'41','2001-10-01','Yapı Kredi Yayınları'),(173,8,'Harry Potter Boxed Set  Books 1-5 (Harry Potter  #1-5)','J.K. Rowling/Mary GrandPré',4.78,'0439682584',9780439682589,'eng',2690,41428,'164','2004-09-13','Scholastic'),(174,2,'Harry Potter and the Order of the Phoenix (Harry Potter  #5)','J.K. Rowling/Mary GrandPré',4.49,'0439358078',9780439358071,'eng',870,2153167,'29221','2004-09-01','Scholastic Inc.'),(175,2002,'Harry Potter Schoolbooks Box Set: Two Classic Books from the Library of Hog','J.K. Rowling',4.40,'043932162X',9780439321624,'eng',240,11515,'139','2001-11-01','Arthur A. Levine'),(176,15877,'Ultimate Unofficial Guide to the Mysteries of Harry Potter: Analysis of Boo','Galadriel Waters/Astre Mithrandir',4.05,'0972393617',9780972393614,'en-US',412,2774,'37','2003-01-01','Wizarding World Press'),(177,15867,'Mugglenet.Com\'s What Will Happen in Harry Potter 7: Who Lives  Who Dies  Wh','Ben Schoen/Andy Gordon/Gretchen Stull/Emerson Spartz/Jamie Lawrence',4.23,'1569755833',9781569755839,'en-GB',216,9023,'112','2006-10-19','Ulysses Press'),(178,31819,'Harry Potter and Philosophy: If Aristotle Ran Hogwarts','David Baggett/Shawn E. Klein',4.48,'0812694554',9780812694550,'eng',243,11422,'78','2004-09-10','Open Court'),(179,15876,'Harry Potter y la Orden del Fénix (Harry Potter  #5)','J.K. Rowling',4.49,'8478888845',9788478888849,'spa',893,5637,'458','2004-02-21','Emece Editores'),(180,1,'Harry Potter and the Half-Blood Prince (Harry Potter  #6)','J.K. Rowling/Mary GrandPré',4.57,'0439785960',9780439785969,'eng',652,2095690,'27591','2006-09-16','Scholastic Inc.'),(181,4,'Harry Potter and the Chamber of Secrets (Harry Potter  #2)','J.K. Rowling',4.42,'0439554896',9780439554893,'eng',352,6333,'244','2003-11-01','Scholastic'),(182,3258,'Greek Tragedies  Volume 2','David Grene/Richmond Lattimore/Aeschylus/Sophocles/Euripides',4.29,'0226307751',9780226307756,'eng',304,327,'12','1960-02-15','University Of Chicago Press'),(183,30044,'Young Men and Fire','Norman Maclean',4.08,'0226500624',9780226500621,'eng',301,4346,'386','1993-11-05','University Of Chicago Press'),(184,16113,'A Dance to the Music of Time: 1st Movement (A Dance to the Music of Time  #','Anthony Powell',3.95,'0226677141',9780226677149,'eng',718,3817,'271','1995-05-31','University of Chicago Press'),(185,44514,'A Preface to Democratic Theory','Robert A. Dahl',3.63,'0226134342',9780226134345,'en-GB',200,88,'8','2006-09-15','University of Chicago Press'),(186,1470,'Euripides II: The Cyclops / Heracles / Iphigenia in Tauris / Helen','Euripides/David Grene/Richmond Lattimore/Witter Bynner/William Arrowsmith',4.31,'0226307816',9780226307817,'eng',264,790,'12','2002-04-15','University of Chicago Press'),(187,1073,'The Crescent Obscured: The United States and the Muslim World  1776-1815','Robert J. Allison',3.62,'0226014908',9780226014906,'eng',284,31,'5','2000-07-15','University of Chicago Press'),(188,16115,'A Dance to the Music of Time: 2nd Movement (A Dance to the Music of Time  #','Anthony Powell',4.29,'0226677168',9780226677163,'eng',722,1237,'87','1995-06-15','University of Chicago Press'),(189,28028,'Bengal Nights','Mircea Eliade/Catherine Spencer',3.93,'0226204197',9780226204192,'en-US',184,257,'29','1995-04-01','University of Chicago Press'),(190,15880,'Harrius Potter et Philosophi Lapis','J.K. Rowling/Peter Needham',4.47,'1582348251',9781582348254,'lat',249,195,'24','2003-07-07','Bloomsbury'),(191,32639,'Sacrament','Clive Barker',3.75,'0006482643',9780006482642,'eng',594,3942,'106','1997-05-01','Harper Voyager'),(192,34605,'The Damnation Game','Clive Barker',3.82,'0425188930',9780425188934,'eng',433,15857,'350','2002-11-05','Berkley Books'),(193,34498,'The Truth (Discworld  #25; Industrial Revolution  #2)','Terry Pratchett',4.27,'0413771164',9780413771162,'eng',336,43964,'880','2002-02-21','Bloomsbury Methuen Drama'),(194,10765,'A Year in the Merde','Stephen Clarke',3.54,'1582346178',9781582346175,'en-US',276,11429,'979','2006-05-02','Bloomsbury Publishing PLC'),(195,4278,'Medicus (Gaius Petreius Ruso  #1)','Ruth Downie',3.73,'1596912316',9781596912311,'eng',386,5723,'695','2007-03-06','Bloomsbury Publishing PLC'),(196,15782,'Sideways Arithmetic from Wayside School (Wayside School #2.5)','Louis Sachar',3.88,'0747569126',9780747569121,'eng',96,3708,'74','2004-05-01','Bloomsbury U.S.A. Children\'s Books'),(197,10008,'Eleanor Rigby','Douglas Coupland',3.65,'1582346437',9781582346434,'eng',272,8517,'372','2006-05-30','Bloomsbury USA'),(198,9714,'Gabriel Garcia Marquez\'s Love in the Time of Cholera: A Reader\'s Guide','Thomas Fahy',4.24,'0826414753',9780826414755,'eng',188,1953,'84','2003-04-10','Bloomsbury Academic'),(199,29726,'Don DeLillo\'s White Noise: A Reader\'s Guide','Leonard  Orr',3.92,'0826414745',9780826414748,'eng',96,76,'9','2003-04-10','Bloomsbury Academic'),(200,23859,'Soldiers of Salamis','Javier Cercas/Anne McLean',3.81,'1582344728',9781582344720,'eng',213,429,'71','2005-01-10','Bloomsbury USA'),(201,4295,'David Foster Wallace\'s Infinite Jest: A Reader\'s Guide','Stephen J. Burn',3.82,'082641477X',9780826414779,'en-GB',96,900,'48','2003-05-20','Bloomsbury Academic'),(202,44478,'Architecture and Tourism: Perception  Performance and Place','D. Medina Lasansky',3.20,'1859737099',9781859737095,'eng',320,5,'1','2004-09-04','Bloomsbury Academic'),(203,22332,'Cyberpunk and Cyberculture: Science Fiction and the Work of William Gibson','Dani Cavallaro',3.77,'0485006073',9780485006070,'eng',258,62,'4','2001-09-13','Bloomsbury Academic'),(204,1480,'Plays 1: Medea/The Phoenician Women/Bacchae','Euripides/David Thompson/J. Michael Walton',3.78,'0413752801',9780413752802,'eng',192,9,'0','2000-11-09','Bloomsbury Methuen Drama'),(205,44900,'The Alchemist’s Kitchen: Extraordinary Potions & Curious Notions','Guy Ogilvy',4.03,'0802715400',9780802715401,'eng',58,136,'12','2006-10-17','Bloomsbury'),(206,31842,'The Undead and Philosophy: Chicken Soup for the Soulless','Richard V. Greene/K. Silem Mohammad',3.70,'0812696018',9780812696011,'en-US',288,196,'18','2006-08-29','Open Court'),(207,31833,'Star Wars and Philosophy: More Powerful than You Can Possibly Imagine','Kevin S. Decker/Jason T. Eberl/William Irwin/George Lucas/William O. Stephens/Walter Ritoku Robinson',4.05,'0812695836',9780812695830,'eng',227,1774,'35','2005-03-23','Open Court'),(208,31912,'Buffy the Vampire Slayer and Philosophy: Fear and Trembling in Sunnydale','James B. South/William Irwin',4.06,'0812695313',9780812695311,'eng',335,2519,'85','2003-03-13','Open Court'),(209,31882,'The Matrix and Philosophy: Welcome to the Desert of the Real','William Irwin/Gerald J. Erion/Barry  Smith/Carolyn Korsmeyer/Jonathan J. Sanford/Jason Holt/Theodore',3.91,'081269502X',9780812695021,'eng',280,1947,'71','2002-08-28','Open Court'),(210,16893,'The Crack-Up','F. Scott Fitzgerald/Edmund Wilson',3.92,'0811212475',9780811212472,'eng',347,2477,'133','2003-04-30','New Directions Publishing Corporation'),(211,11320,'The Captain\'s Verses','Pablo Neruda/Donald Devenish Walsh',4.25,'0811215806',9780811215800,'mul',151,4494,'160','2004-07-19','New Directions Publishing Corporation'),(212,2898,'Three Stories and a Reflection','Patrick Süskind',3.57,'0747534934',9780747534938,'eng',128,24,'3','1997-11-13','Bloomsbury Publishing PLC'),(213,19983,'The Drift House: The First Voyage','Dale Peck',3.65,'159990005X',9781599900056,'eng',437,618,'69','2006-11-01','Bloomsbury Publishing PLC'),(214,15448,'On a Pale Horse','Piers Anthony',4.13,'0345305183',9780345305183,'eng',325,156,'13','1984-09-12','Del Rey Books'),(215,11494,'Humboldt\'s Gift','Saul Bellow',3.86,'0140189440',9780140189445,'eng',487,6995,'378','1996-06-01','Penguin Classics'),(216,21402,'Pompeii','Robert   Harris/Michael Cumpsty',3.82,'0739341774',9780739341773,'eng',0,7,'1','2006-09-05','Random House Audio'),(217,41304,'Strangers from a Different Shore: A History of Asian Americans','Ronald Takaki',4.13,'0316831301',9780316831307,'en-US',640,888,'45','1998-09-23','Back Bay Books'),(218,42432,'God Emperor of Dune (Dune Chronicles #4)','Frank Herbert',3.84,'0575075066',9780575075061,'eng',454,51343,'896','2003-03-13','Victor Gollancz'),(219,17022,'My Ishmael (Ishmael  #3)','Daniel Quinn',4.07,'0553379658',9780553379655,'eng',293,8654,'412','1998-10-06','Bantam'),(220,23929,'Selected Letters  1940-1956','Jack Kerouac/Ann Charters',4.13,'0140234446',9780140234442,'eng',656,804,'21','1996-03-01','Penguin (Non-Classics)'),(221,18062,'The Best of Wodehouse: An Anthology','P.G. Wodehouse/John Mortimer',4.41,'0307266613',9780307266613,'eng',840,413,'46','2007-06-19','Everyman\'s Library'),(222,17174,'A Yellow Raft in Blue Water','Michael Dorris',3.86,'0312421850',9780312421854,'en-US',372,16190,'897','2003-03-05','Picador USA'),(223,3368,'Don\'t Make Me Think: A Common Sense Approach to Web Usability','Steve Krug',4.25,'0321344758',9780321344755,'en-US',201,7736,'641','2005-08-28','New Riders Publishing'),(224,15972,'The Gravedigger\'s Daughter','Joyce Carol Oates',3.55,'0061236829',9780061236822,'eng',582,7518,'860','2007-05-29','Ecco'),(225,15973,'Middle Age: A Romance','Joyce Carol Oates',3.58,'0060934905',9780060934903,'eng',480,1650,'199','2002-10-01','Ecco'),(226,36314,'Tales of H.P. Lovecraft','H.P. Lovecraft/Joyce Carol Oates',4.19,'0060957905',9780060957902,'eng',352,5300,'137','2000-09-19','Ecco'),(227,12053,'The Sheltering Sky','Paul Bowles',3.91,'006083482X',9780060834821,'eng',313,906,'132','2005-09-20','Ecco Press'),(228,11782,'Missing Mom','Joyce Carol Oates',3.55,'0060816228',9780060816223,'eng',464,3510,'357','2006-08-22','Ecco'),(229,38500,'Women','Charles Bukowski',3.86,'0061177598',9780061177590,'eng',291,52415,'2081','2014-07-29','Ecco'),(230,38501,'Ham on Rye','Charles Bukowski',4.14,'006117758X',9780061177583,'eng',288,65829,'2318','2014-07-29','Ecco'),(231,33313,'Kitchen Confidential: Adventures in the Culinary Underbelly','Anthony Bourdain',4.07,'0060899220',9780060899226,'eng',312,183882,'9427','2007-01-09','Ecco/Harper Perennial');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
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

-- Dump completed on 2021-09-07 20:12:44
