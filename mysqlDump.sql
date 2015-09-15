-- MySQL dump 10.13  Distrib 5.6.19, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ediss
-- ------------------------------------------------------
-- Server version	5.6.19-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `SurveyResponse`
--

DROP TABLE IF EXISTS `SurveyResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SurveyResponse` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(12) DEFAULT NULL,
  `AnswerCount` int(11) DEFAULT NULL,
  `date_attempted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `question1_response` varchar(100) DEFAULT NULL,
  `question2_response` varchar(100) DEFAULT NULL,
  `question3_response` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `SurveyResponse_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `UserList` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SurveyResponse`
--

LOCK TABLES `SurveyResponse` WRITE;
/*!40000 ALTER TABLE `SurveyResponse` DISABLE KEYS */;
INSERT INTO `SurveyResponse` VALUES (18,1,0,'2015-09-08 19:25:37','3 - Wrong','2 - Wrong','2 - Wrong'),(19,3,1,'2015-09-08 19:39:06','1 - Correct','3 - Wrong','1 - Wrong'),(20,1,2,'2015-09-08 19:49:00','1 - Correct','1 - Correct','1 - Wrong'),(21,2,2,'2015-09-08 20:18:28','1 - Correct','1 - Correct','1 - Wrong'),(22,1,1,'2015-09-09 12:05:39','3 - Wrong','1 - Correct','1 - Wrong'),(23,1,2,'2015-09-09 12:10:00','1 - Correct','1 - Correct','1 - Wrong'),(24,1,0,'2015-09-09 12:10:35','undefined - Wrong','undefined - Wrong','undefined - Wrong'),(25,1,2,'2015-09-09 12:13:56','1 - Correct','1 - Correct','1 - Wrong'),(26,1,2,'2015-09-09 13:44:06','1 - Correct','1 - Correct','1 - Wrong'),(27,3,2,'2015-09-09 13:44:41','1 - Correct','1 - Correct','1 - Wrong'),(28,1,2,'2015-09-09 13:48:47','1 - Correct','1 - Correct','1 - Wrong'),(29,1,2,'2015-09-09 13:50:44','1 - Correct','1 - Correct','1 - Wrong'),(33,3,2,'2015-09-09 14:41:14','1 - Correct','1 - Correct','2 - Wrong'),(34,1,2,'2015-09-09 14:47:26','1 - Correct','1 - Correct','1 - Wrong'),(35,3,2,'2015-09-09 14:47:39','1 - Correct','1 - Correct','1 - Wrong'),(36,1,2,'2015-09-13 22:23:57','1 - Correct','1 - Correct','1 - Wrong');
/*!40000 ALTER TABLE `SurveyResponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserList`
--

DROP TABLE IF EXISTS `UserList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserList` (
  `userid` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserList`
--

LOCK TABLES `UserList` WRITE;
/*!40000 ALTER TABLE `UserList` DISABLE KEYS */;
INSERT INTO `UserList` VALUES (1,'hsmith','smith','customer'),(2,'jadmin','admin','admin'),(3,'tbucktoo','bucktoo','customer'),(4,'type',NULL,NULL),(5,NULL,NULL,NULL),(6,NULL,NULL,NULL),(7,NULL,NULL,NULL),(8,NULL,NULL,NULL),(9,'jk','8d8f2628cfce1853efc0d027be4f6ce4','admin');
/*!40000 ALTER TABLE `UserList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `asin` varchar(10) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(3000) DEFAULT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'0827229534','Patterns of Preaching: A Sermon Sampler',NULL,'Book'),(2,'0738700797','Candlemas: Feast of Flames',NULL,'Book'),(3,'0486287785','World War II Allied Fighter Planes Trading Cards',NULL,'Book'),(4,'0842328327','Life Application Bible Commentary: 1 and 2 Timothy and Titus',NULL,'Book'),(5,'1577943082','Prayers That Avail Much for Business: Executive',NULL,'Book'),(6,'0486220125','How the Other Half Lives: Studies Among the Tenements of New York',NULL,'Book'),(7,'B00000AU3R','Batik',NULL,'Music'),(8,'0231118597','Losing Matt Shepard',NULL,'Book'),(9,'1859677800','Making Bread: The Taste of Traditional Home-Baking',NULL,'Book'),(10,'0375709363','The Edward Said Reader',NULL,'Book'),(11,'0871318237','Resetting the Clock : Five Anti-Aging Hormones That Improve and Extend Life',NULL,'Book'),(12,'1590770218','Fantastic Food with Splenda : 160 Great Recipes for Meals Low in Sugar, Carbohydrates, Fat, and Calo',NULL,'Book'),(13,'0313230269','Clockwork Worlds : Mechanized Environments in SF (Contributions to the Study of Science Fiction and ',NULL,'Book'),(14,'B00004W1W1','Later...',NULL,'Music'),(15,'1559362022','Wake Up and Smell the Coffee',NULL,'Book'),(16,'0195110382','War at Sea: A Naval History of World War II',NULL,'Book'),(17,'0849311012','Telecommunications Cost Management',NULL,'Book'),(18,'B000007R0T','Sol to Soul',NULL,'Music'),(19,'078510870X','Ultimate Marvel Team-Up',NULL,'Book'),(20,'3895780812','Computed Tomography : Fundamentals, System Technology, Image Quality, Applications',NULL,'Book'),(21,'0790747324','The Time Machine',NULL,'DVD'),(22,'B00005NTSV','Come What May',NULL,'Music'),(23,'0393049388','\"title\"','\"12344\"','Book'),(24,'0553525476','The Casebook of Sherlock Holmes, Volume 2 (Casebook of Sherlock Holmes)',NULL,'Book'),(25,'0939165252','Jailed for Freedom: American Women Win the Vote',NULL,'Book'),(26,'1590930509','Chicken Little',NULL,'Book'),(27,'0231096704','The Columbia Anthology of Gay Literature',NULL,'Book'),(28,'1893732290','God Knows Marriage Isn\'t Always Easy: 12 Ways to Add Zest (God Knows)',NULL,'Book'),(29,'0781718791','Advanced Pediatric Clinical Assessment: Skills and Procedures',NULL,'Book'),(30,'0471150274','Solving Statics Problems with MathCAD',NULL,'Book'),(31,'0895872218','Backroad Buffets & Country Cafes: A Southern Guide to Meat-And-Threes & Down-Home Dining',NULL,'Book'),(32,'0761116982','Staff Meals from Chanterelle',NULL,'Book'),(33,'0439240751','Double Jeopardy (T*Witches, 6)',NULL,'Book'),(34,'B000002O8D','Southern By the Grace of God: Lynyrd Skynyrd Tribute Tour, Vol. 1',NULL,'Music'),(35,'0618111212','Burnt Toast on Davenport Street',NULL,'Book'),(36,'1898630038','Uists & Barra (Pevensey Island guides)',NULL,'Book'),(37,'B000056PNC','Mark Messier - Leader, Champion & Legend',NULL,'DVD'),(38,'0787950599','Resolving Conflicts At Work : A Complete Guide for Everyone on the Job',NULL,'Book'),(39,'0312199406','Night of Many Dreams : A Novel',NULL,'Book'),(40,'1573221740','Renovations: A Father and Son Rebuild a House and Rediscover Each Other',NULL,'Book'),(41,'0130132543','Workbook: The Long-Term Care Nursing Assistant',NULL,'Book'),(42,'B000056PNB','Pixote',NULL,'DVD'),(43,'0486268780','Selected Poems (Dover Thrift Editions)',NULL,'Book'),(44,'B000056PNE','The NBA\'s 100 Greatest Plays',NULL,'DVD'),(45,'1861007418','Beginning ASP.NET Databases using C#',NULL,'Book'),(46,'0826449379','Alternative Worlds in Fantasy Fiction (Contemporary Classics of Children\'s Literature)',NULL,'Book'),(47,'0590568833','How to Kill a Monster (Goosebumps)',NULL,'Book'),(48,'0439420717','Scooby-doo Mysteries #24 (Scooby-Doo Mysteries)',NULL,'Book'),(49,'B00004W1WI','Murder She Wrote',NULL,'Music'),(50,'B00004W1WK','Still Life',NULL,'Music'),(51,'0687054532','Out on the Edge: A Wake-Up Call for Church Leaders on the Edge of the Media Reformation',NULL,'Book'),(52,'0875420532','Secrets of Gypsy Love Magick (Llewellyn\'s New Age Series)',NULL,'Book'),(53,'0944708498','Baby Boomer Retirement: 65 Simple Ways to Protect Your Future',NULL,'Book'),(54,'0613100093','Betsy & Tacy Go over the Big Hill (Betsy and Tacy Books)',NULL,'Book'),(55,'0486275035','Goldilocks and the Three Bears : Full-Color Picture Book (Dover Little Activity Books)',NULL,'Book'),(56,'1550416243','Three Bricks Shy of a Load: A Collection of True Stories About Ordinary People Doing Really Dumb Stu',NULL,'Book'),(57,'0398068917','Investigating Computer Crime: A Primer for Security Managers',NULL,'Book'),(58,'087842461X','Raptors of the Rockies: Biology of the Birds of Prey and Species Accounts of the Raptors of the Rock',NULL,'Book'),(59,'6303360041','None But the Lonely Heart',NULL,'Video'),(60,'0393971694','Renaissance Music: Music in Western Europe, 1400-1600 (Norton Introduction to Music History)',NULL,'Book'),(61,'1550373080','Hermanos (Hablemos)',NULL,'Book'),(62,'0026879077','Scoring High on the Stanford Achievement Test',NULL,'Book'),(63,'0966723821','Historia De Cancer De Una Dietista : Informacion & Inspiracion para la Recuperacion & Curacion Sobre',NULL,'Book'),(64,'0689846088','A Charlie Brown Christmas',NULL,'Book'),(65,'0273651870','Economics for Business',NULL,'Book'),(66,'0393037622','Blood and Guts: A Short History of Medicine',NULL,'Book'),(67,'1571515429','Picture Me With My Friend Jesus: Girl Version (Picture Me)',NULL,'Book'),(68,'0810114275','Experiencing and the Creation of Meaning: A Philosophical and Psychological Approach to the Subjecti',NULL,'Book'),(69,'0415925398','Negotiated Empires: Centers and Peripheries in the New World, 1500-1820',NULL,'Book'),(70,'0415223954','Geographies of Young People: The Morally Contested Spaces of Identity (Critical Geographies)',NULL,'Book'),(71,'B0000060T5','Jonny Quest - Bandit in Adventures Best Friend',NULL,'Video'),(72,'157281196X','Power of Flowers: An Archetypal Journey Through Nature',NULL,'Book'),(73,'0375803394','The Perfect Plan (7th Heaven)',NULL,'Book'),(74,'0113300174','Service Delivery (It Infrastructure Library Series)',NULL,'Book'),(75,'0786863919','Disney A to Z : The Updated Official Encyclopedia (Disney a to Z)',NULL,'Book'),(76,'1581150040','The Writer\'s Legal Guide (2nd ed)',NULL,'Book'),(77,'0312982178','Water Touching Stone',NULL,'Book'),(78,'0874850037','The Ebony Cookbook: A Date With a Dish',NULL,'Book'),(79,'0811726371','Today\'s Military Wife: Meeting the Challenges of Service Life (Today\'s Military Wife)',NULL,'Book'),(80,'1884997015','In Quest of God: The Saga of an Extraordinary Pilgrimage',NULL,'Book'),(81,'6304286961','The Doors',NULL,'Video'),(82,'0140430407','Puddnhead Wilson : And, Those Extraordinary Twins (The Penguin English Library)',NULL,'Book'),(83,'059516630X','A Candle for Bobby',NULL,'Book'),(84,'B000063W82','The Best of Schoolhouse Rock! - 30th Anni versary Edition',NULL,'Video'),(85,'0912500476','Amamantar Sencillo y Puro',NULL,'Book'),(86,'0807205249','Junie B. Jones Collection: Books 9-12',NULL,'Book'),(87,'0415157528','Colloquial Polish: The Complete Course for Beginners (Colloquial Series (Book Only))',NULL,'Book'),(88,'039802278X','Normal and Abnormal Development: The Influence of Primitive Reflexes on Motor Development',NULL,'Book'),(89,'B00005ARCQ','Desde Que Samba E Samba',NULL,'Music'),(90,'0671727737','The Eagle Has Landed',NULL,'Book'),(91,'1566913810','Foghorn Outdoors: New England Hiking 3 Ed: The Complete Guide to More than 380 Hikes',NULL,'Book'),(92,'037575380X','Black No More : A Novel (Modern Library (Paperback))',NULL,'Book'),(93,'0965740056','BizPricerÂ¿ Business Valuation Manual w/Software',NULL,'Book'),(94,'039572774X','The American Heritage Dictionary of Idioms',NULL,'Book'),(95,'0887402631','The Heavy Flak Guns, 1933-1945: 88Mm, 105Mm, 128Mm, 150Mm, and Ballistic Directional Equipment',NULL,'Book'),(96,'0310485002','Becoming a Contagious Christian',NULL,'Book'),(97,'042515517X','Year of the Tiger',NULL,'Book'),(98,'B0000646IJ','Brahms: Violin Concerto; Double Concerto',NULL,'Music'),(99,'0071402306','An Employee\'s Guide to Stock Options',NULL,'Book'),(100,'0787958743','Guide to Effective Staff Development in Health Care Organizations : A Systems Approach to Successful',NULL,'Book');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_mapping`
--

DROP TABLE IF EXISTS `product_category_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category_mapping` (
  `id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category` varchar(3000) DEFAULT NULL,
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_category_mapping_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_mapping`
--

LOCK TABLES `product_category_mapping` WRITE;
/*!40000 ALTER TABLE `product_category_mapping` DISABLE KEYS */;
INSERT INTO `product_category_mapping` VALUES (1,1,'Books_Subjects_Religion & Spirituality_Christianity_Clergy_Preaching'),(2,1,'Books_Subjects_Religion & Spirituality_Christianity_Clergy_Sermons'),(3,2,'Books_Subjects_Religion & Spirituality_Earth-Based Religions_Wicca'),(4,2,'Books_Subjects_Religion & Spirituality_Earth-Based Religions_Witchcraft'),(5,3,'Books_Subjects_Home & Garden_Crafts & Hobbies_General'),(6,4,'Books_Subjects_Religion & Spirituality_Christianity_Reference_Commentaries_New Testament'),(7,4,'Books_Subjects_Religion & Spirituality_Christianity_Christian Living_Discipleship'),(8,4,'Books_Subjects_Religion & Spirituality_Christianity_Bibles_Translations_Life Application'),(9,4,'Books_Subjects_Religion & Spirituality_Bible & Other Sacred Texts_Bible_New Testament'),(10,4,'Books_Subjects_Religion & Spirituality_Christianity_Bibles_Study Guides, History & Reference_General'),(11,5,'Books_Subjects_Religion & Spirituality_Christianity_Worship & Devotion_Prayerbooks'),(12,5,'Books_Subjects_Religion & Spirituality_Christianity_Christian Living_Business'),(13,6,'Books_Subjects_Arts & Photography_Photography_Photo Essays'),(14,6,'Books_Subjects_History_Americas_United States_General'),(15,6,'Books_Subjects_History_Jewish_General'),(16,6,'Books_Subjects_Nonfiction_Social Sciences_Sociology_Urban'),(17,6,'_Categories_Camera & Photo_Photography Books_Photo Essays'),(18,7,'Music_Styles_Jazz_General'),(19,7,'Music_Styles_Jazz_Modern Postbebop'),(20,7,'Music_Specialty Stores_Imports_Jazz'),(21,8,'Books_Subjects_Gay & Lesbian_Nonfiction_General'),(22,8,'Books_Subjects_Nonfiction_Crime & Criminals_Criminology'),(23,8,'Books_Subjects_Nonfiction_Politics_General'),(24,8,'Books_Subjects_Nonfiction_Politics_U.S.'),(25,9,'Books_Subjects_Cooking, Food & Wine_Baking_Bread'),(26,10,'Books_Subjects_Literature & Fiction_History & Criticism_Criticism & Theory_General'),(27,10,'Books_Subjects_Nonfiction_Politics_History & Theory'),(28,10,'Books_Subjects_Nonfiction_Social Sciences_Anthropology_Cultural'),(29,11,'Books_Subjects_Health, Mind & Body_Alternative Medicine_General'),(30,11,'Books_Subjects_Medicine_Alternative & Holistic_General'),(31,11,'Books_Subjects_Professional & Technical_Medical_Alternative Medicine_General'),(32,11,'Books_Specialty Stores_jp-unknown2'),(33,12,'Books_Subjects_Cooking, Food & Wine_Cooking by Ingredient_Herbs, Spices & Condiments'),(34,12,'Books_Subjects_Cooking, Food & Wine_General'),(35,12,'Books_Subjects_Cooking, Food & Wine_Special Diet_Diabetic & Sugar-Free'),(36,12,'Books_Subjects_Cooking, Food & Wine_Special Diet_Low Fat'),(37,12,'Books_Subjects_Health, Mind & Body_Nutrition_General'),(38,12,'Books_Subjects_Health, Mind & Body_Diets & Weight Loss_Special Conditions_Low Carbohydrate'),(39,12,'Books_Subjects_Health, Mind & Body_Diets & Weight Loss_Special Conditions_Low Sugar'),(40,12,'Books_Subjects_Health, Mind & Body_Diets & Weight Loss_Special Conditions_Low-Fat Diet'),(41,12,'Books_Subjects_Health, Mind & Body_Diets & Weight Loss_Diets_Low Carb'),(42,13,'Books_Subjects_Literature & Fiction_History & Criticism_Criticism & Theory_General'),(43,13,'Books_Subjects_Science Fiction & Fantasy_Fantasy_History & Criticism'),(44,13,'Books_Subjects_Science Fiction & Fantasy_Science Fiction_History & Criticism'),(45,14,'Music_Styles_Jazz_General'),(46,14,'Music_Specialty Stores_Indie Music_Jazz_General'),(47,15,'Books_Subjects_Literature & Fiction_Drama_United States'),(48,15,'Books_Subjects_Arts & Photography_Performing Arts_Theater_General'),(49,15,'Books_Subjects_Literature & Fiction_Authors, A-Z_( B )_Bogosian, Eric'),(50,16,'Books_Subjects_History_Military_Naval'),(51,16,'Books_Subjects_History_Military_World War II_General'),(52,16,'Books_Subjects_History_Military_World War II_Naval'),(53,17,'Books_Subjects_Business & Investing_Management & Leadership_Management'),(54,17,'Books_Subjects_Computers & Internet_Hardware_Microprocessors & System Design_General'),(55,17,'Books_Subjects_Engineering_General'),(56,17,'Books_Subjects_Engineering_Telecommunications_General'),(57,17,'Books_Subjects_Engineering_Industrial, Manufacturing & Operational Systems_Engineering Economics'),(58,17,'Books_Subjects_Computers & Internet_General'),(59,17,'_Amazon.com Stores_Home & Office_Business & Investing Books_Management & Leadership_Management'),(60,18,'Music_Styles_Jazz_General'),(61,19,'Books_Subjects_Children\'s Books_Literature_Science Fiction, Fantasy, Mystery & Horror_Comics & Graphic Novels'),(62,19,'Books_Subjects_Comics & Graphic Novels_Publishers_Marvel'),(63,19,'Books_Subjects_Teens_Science Fiction & Fantasy_Fantasy'),(64,19,'Books_Subjects_Comics & Graphic Novels_Graphic Novels_Superheroes'),(65,20,'Books_Subjects_Medicine_Specialties_Radiology_General'),(66,20,'Books_Subjects_Professional & Technical_Medical_Medicine_Internal Medicine_Radiology_General'),(67,20,'Books_Subjects_Computers & Internet_General'),(68,21,'_DVD_Genres_Drama_General'),(69,21,'_DVD_Genres_Science Fiction & Fantasy_Fantasy'),(70,21,'_DVD_Genres_Science Fiction & Fantasy_General'),(71,21,'_DVD_Genres_Science Fiction & Fantasy_Classic Sci-Fi'),(72,21,'_DVD_Genres_Science Fiction & Fantasy_Monsters & Mutants'),(73,21,'_DVD_Genres_Science Fiction & Fantasy_By Theme_Time Travel'),(74,21,'_DVD_Actors & Actresses_( B )_Bissell, Whit'),(75,21,'_DVD_Actors & Actresses_( C )_Cabot, Sebastian'),(76,21,'_DVD_Actors & Actresses_( F )_Frees, Paul'),(77,21,'_DVD_Actors & Actresses_( H )_Helmore, Tom'),(78,21,'_DVD_Actors & Actresses_( L )_Lloyd, Doris'),(79,21,'_DVD_Actors & Actresses_( M )_Mimieux, Yvette'),(80,21,'_DVD_Actors & Actresses_( T )_Taylor, Rod'),(81,21,'_DVD_Actors & Actresses_( Y )_Young, Alan'),(82,21,'_DVD_Directors_( P )_Pal, George'),(83,21,'_DVD_Genres_Art House & International_By Theme_Costume Adventures'),(84,21,'_DVD_Genres_Drama_Classics'),(85,21,'_DVD_Special Features_Today\'s Deals in DVD_Deals Under $15'),(86,21,'_DVD_Special Features_Titles_( T )'),(87,21,'_DVD_Genres_Art House & International_By Country_United Kingdom_General'),(88,21,'_DVD_Specialty Stores_Studio Specials_Warner Home Video_Drama'),(89,21,'_DVD_Specialty Stores_Studio Specials_Warner Home Video_All Titles'),(90,21,'_DVD_Specialty Stores_Studio Specials_Warner Home Video_Classics'),(91,21,'_Amazon.com Stores_Amazon.com Outlet_Categories_DVD Outlet_Deals Under $15'),(92,21,'_DVD_Genres_Science Fiction & Fantasy_Futuristic'),(93,21,'_DVD_Specialty Stores_Studio Specials_Warner Home Video_DVDs Under $15'),(94,22,'Music_Styles_Jazz_General'),(95,22,'Music_Styles_Jazz_Vocal Jazz_Vocal Jazz General'),(96,22,'Music_Styles_Broadway & Vocalists_Traditional Vocal Pop'),(97,22,'Music_Specialty Stores_Indie Music_Jazz_General'),(98,22,'Music_Specialty Stores_Indie Music_Jazz_Vocal Jazz'),(99,23,'Books_Subjects_Literature & Fiction_General_Contemporary'),(100,23,'Books_Subjects_Mystery & Thrillers_Mystery_General'),(101,23,'Books_Subjects_Mystery & Thrillers_General'),(102,24,'Books_Formats_Books on Tape_Mystery & Thrillers_Mystery'),(103,24,'Books_Formats_Books on Tape_Radio Shows'),(104,24,'Books_Subjects_Entertainment_Radio_General Broadcasting'),(105,24,'Books_Subjects_Mystery & Thrillers_Mystery_British Detectives'),(106,24,'Books_Subjects_Mystery & Thrillers_Mystery_Sherlock Holmes'),(107,24,'Books_Subjects_Mystery & Thrillers_Authors, A-Z_( D )_Doyle, Arthur Conan_General'),(108,24,'Books_Formats_Books on Tape_Authors, A-Z_( D )_Doyle, Arthur Conan'),(109,24,'Books_Formats_Books on Tape_Mystery & Thrillers_Authors, A-Z_( D )_Doyle, Sir Arthur Conan'),(110,24,'Books_Formats_Books on Tape_General'),(111,25,'Books_Subjects_Nonfiction_Government_Elections'),(112,25,'Books_Subjects_Nonfiction_Women\'s Studies_History'),(113,26,'Books_Subjects_Children\'s Books_Literature_Fairy Tales, Folk Tales & Myths_Stories'),(114,26,'Books_Subjects_Children\'s Books_Ages 4-8_Picture Books'),(115,26,'Books_Subjects_Children\'s Books_Ages 4-8_General'),(116,27,'Books_Subjects_Literature & Fiction_General_Classics'),(117,27,'Books_Subjects_Gay & Lesbian_Nonfiction_General'),(118,27,'Books_Subjects_Nonfiction_Social Sciences_Special Groups_Lesbian Studies'),(119,28,'Books_Subjects_Religion & Spirituality_Christianity_Christian Living_Faith'),(120,28,'Books_Subjects_Religion & Spirituality_Christianity_Christian Living_Relationships_Marriage'),(121,29,'Books_Subjects_Medicine_Nursing_Assessment & Diagnosis'),(122,29,'Books_Subjects_Medicine_Nursing_Pediatric & Neonatal'),(123,29,'Books_Subjects_Medicine_Specialties_Pediatrics_General'),(124,29,'Books_Subjects_Professional & Technical_Medical_Nursing_Assessment & Diagnosis'),(125,29,'Books_Subjects_Professional & Technical_Medical_Nursing_Pediatrics'),(126,30,'Books_Subjects_Engineering_Mechanical_General'),(127,30,'Books_Subjects_Engineering_Aerospace_Advanced Mechanics'),(128,30,'Books_Subjects_Engineering_Civil_Mechanics'),(129,30,'Books_Specialty Stores_jp-unknown1'),(130,31,'Books_Subjects_Business & Investing_Industries & Professions_Hospitality, Travel & Tourism'),(131,31,'Books_Subjects_Cooking, Food & Wine_General'),(132,31,'Books_Subjects_Cooking, Food & Wine_Regional & International_U.S. Regional_South'),(133,31,'Books_Subjects_Travel_General_Food & Lodging_Dining'),(134,31,'Books_Subjects_Travel_United States_Regions_South_General'),(135,31,'_Amazon.com Stores_Travel_Categories_Travel Books_General_Food & Lodging_Dining'),(136,31,'_Amazon.com Stores_Travel_Categories_Travel Books_United States_Regions_South_General'),(137,31,'_Amazon.com Stores_Home & Office_Business & Investing Books_Industries & Professions_Hospitality, Travel & Tourism'),(138,32,'Books_Subjects_Cooking, Food & Wine_Gastronomy_History'),(139,32,'Books_Subjects_Cooking, Food & Wine_General'),(140,32,'Books_Subjects_Cooking, Food & Wine_Professional Cooking_Professional'),(141,32,'Books_Subjects_Cooking, Food & Wine_Regional & International_U.S. Regional_General'),(142,32,'Books_Subjects_Cooking, Food & Wine_Regional & International_U.S. Regional_Middle Atlantic'),(143,33,'Books_Subjects_Children\'s Books_Literature_Science Fiction, Fantasy, Mystery & Horror_Science Fiction, Fantasy, & Magic'),(144,33,'Books_Subjects_Teens_Science Fiction & Fantasy_Fantasy'),(145,33,'Books_Subjects_Teens_Science Fiction & Fantasy_Science Fiction'),(146,33,'Books_Subjects_Children\'s Books_Series_Fantasy & Adventure_T.Witches'),(147,33,'Books_Specialty Stores_jp-unknown1'),(148,33,'Books_Subjects_Children\'s Books_Issues_Twins'),(149,34,'Music_Styles_Rock_Blues Rock'),(150,34,'Music_Styles_Classic Rock_Southern Rock'),(151,34,'Music_Styles_Classic Rock_Album-Oriented Rock (AOR)'),(152,34,'Music_Styles_Classic Rock_Live Albums_Southern Rock'),(153,34,'Music_Styles_Classic Rock_Arena Rock'),(154,35,'Books_Subjects_Children\'s Books_Animals_Dogs_Fiction'),(155,35,'Books_Subjects_Children\'s Books_Literature_Humorous'),(156,35,'Books_Subjects_Children\'s Books_Literature_Science Fiction, Fantasy, Mystery & Horror_Science Fiction, Fantasy, & Magic'),(157,35,'Books_Subjects_Children\'s Books_Ages 4-8_Picture Books'),(158,35,'Books_Subjects_Children\'s Books_Ages 4-8_General'),(159,36,'Books_Subjects_Travel_Europe_Great Britain_General'),(160,36,'Books_Subjects_Travel_Europe_Great Britain_Scotland_General'),(161,36,'_Amazon.com Stores_Travel_Categories_Travel Books_Europe_Great Britain_General'),(162,36,'_Amazon.com Stores_Travel_Categories_Travel Books_Europe_Great Britain_Scotland_General'),(163,37,'_DVD_Genres_Sports_General'),(164,37,'_DVD_Genres_Sports_Biography'),(165,37,'_DVD_Genres_Sports_Hockey'),(166,37,'_DVD_Special Features_Titles_( M )'),(167,38,'Books_Subjects_Business & Investing_Business Life_General'),(168,38,'Books_Subjects_Business & Investing_Industries & Professions_Human Resources & Personnel Management'),(169,38,'Books_Subjects_Computers & Internet_Digital Business & Culture_Manager\'s Guides to Computing'),(170,38,'Books_Subjects_Health, Mind & Body_Psychology & Counseling_Occupational & Organizational'),(171,38,'_Amazon.com Stores_Home & Office_Business & Investing Books_Biographies & Primers_Secrets of Success'),(172,38,'_Amazon.com Stores_Home & Office_Business & Investing Books_Industries & Professions_Human Resources & Personnel Management'),(173,38,'_Amazon.com Stores_Home & Office_Computer & Internet Books_Internet_Digital Business & Culture_Manager\'s Guides to Computing'),(174,39,'Books_Subjects_Literature & Fiction_General_Contemporary'),(175,39,'Books_Specialty Stores_Book Clubs_Literature & Fiction_Popular Fiction'),(176,40,'Books_Subjects_Home & Garden_Home Design_Remodeling & Renovation_General'),(177,40,'Books_Subjects_Parenting & Families_Family Relationships_Parent & Adult Child'),(178,40,'Books_Subjects_Biographies & Memoirs_Memoirs'),(179,41,'Books_Subjects_Medicine_Nursing_Reference'),(180,41,'Books_Subjects_Medicine_Physician & Patient_Hospice Care'),(181,41,'Books_Subjects_Professional & Technical_Medical_Nursing_Reference'),(182,42,'_DVD_Genres_Art House & International_General'),(183,42,'_DVD_Genres_Drama_General'),(184,42,'_DVD_Genres_Art House & International_By Country_Brazil'),(185,42,'_DVD_Directors_( B )_Babenco, Hector'),(186,42,'_DVD_Genres_Art House & International_By Theme_Children'),(187,42,'_DVD_Genres_Art House & International_By Theme_Coming of Age'),(188,42,'_DVD_Genres_Drama_By Theme_Coming of Age'),(189,42,'_DVD_Genres_Art House & International_By Original Language_Portuguese'),(190,42,'_DVD_Special Features_Titles_( P )'),(191,42,'_DVD_Genres_Drama_By Theme_Childhood Drama'),(192,42,'_DVD_Genres_Drama_By Theme_Urban Life'),(193,42,'_DVD_Genres_Drama_By Theme_Down on Their Luck'),(194,42,'_DVD_Genres_Drama_By Theme_Kids in Trouble'),(195,42,'_DVD_Specialty Stores_Studio Specials_New Yorker Films_All New Yorker Titles'),(196,42,'_DVD_Specialty Stores_Studio Specials_New Yorker Films_Latin American Cinema'),(197,43,'Books_Subjects_Literature & Fiction_World Literature_United States_Classics_Whitman, Walt'),(198,43,'Books_Subjects_Literature & Fiction_World Literature_United States_Poetry_20th Century'),(199,43,'Books_Subjects_Literature & Fiction_Poetry_General'),(200,43,'Books_Subjects_Literature & Fiction_Poetry_Single Authors_United States'),(201,43,'Books_Subjects_Literature & Fiction_Authors, A-Z_( W )_Whitman, Walt'),(202,43,'Books_Subjects_Literature & Fiction_World Literature_United States_19th Century'),(203,43,'Books_Subjects_Literature & Fiction_World Literature_United States_Poetry_General'),(204,44,'_DVD_Genres_Sports_General'),(205,44,'_DVD_Genres_Sports_Basketball'),(206,44,'_DVD_Special Features_Today\'s Deals in DVD_Deals Under $20'),(207,44,'_DVD_Special Features_Titles_( N )'),(208,44,'_Amazon.com Stores_Amazon.com Outlet_Categories_DVD Outlet_Deals Under $20'),(209,45,'Books_Subjects_Computers & Internet_Programming_Web Programming_Active Server Pages'),(210,45,'Books_Subjects_Computers & Internet_Programming_Languages & Tools_C & C++_General'),(211,45,'Books_Subjects_Computers & Internet_Programming_General'),(212,45,'Books_Subjects_Religion & Spirituality_Christianity_Theology_Eschatology'),(213,45,'Books_Subjects_Computers & Internet_General'),(214,45,'Books_Subjects_Computers & Internet_Databases_General'),(215,46,'Books_Subjects_Literature & Fiction_Books & Reading_General'),(216,46,'Books_Subjects_Literature & Fiction_History & Criticism_Criticism & Theory_General'),(217,46,'Books_Subjects_Parenting & Families_Literature Guides'),(218,46,'Books_Subjects_Science Fiction & Fantasy_Fantasy_History & Criticism'),(219,46,'Books_Subjects_Science Fiction & Fantasy_Science Fiction_History & Criticism'),(220,46,'Books_Subjects_Teens_Literature & Fiction_Classics'),(221,46,'Books_Subjects_Teens_Science Fiction & Fantasy_Fantasy'),(222,46,'Books_Subjects_Teens_Science Fiction & Fantasy_Science Fiction'),(223,47,'Books_Subjects_Children\'s Books_Literature_Science Fiction, Fantasy, Mystery & Horror_Spine-Chilling Horror'),(224,47,'Books_Subjects_Horror_Authors, A-Z_( S )_Stine, R. L.'),(225,47,'Books_Subjects_Children\'s Books_Ages 9-12_General'),(226,47,'Books_Subjects_Children\'s Books_Authors & Illustrators, A-Z_( S )_Stine, R. L.'),(227,47,'Books_Subjects_Children\'s Books_Obsessions_Monsters'),(228,48,'Books_Subjects_Children\'s Books_Literature_Humorous'),(229,48,'Books_Subjects_Children\'s Books_Literature_Popular Culture'),(230,48,'Books_Subjects_Children\'s Books_Literature_Science Fiction, Fantasy, Mystery & Horror_Mysteries, Espionage, & Detectives'),(231,48,'Books_Subjects_Children\'s Books_Literature_Science Fiction, Fantasy, Mystery & Horror_Spine-Chilling Horror'),(232,48,'Books_Subjects_Horror_Authors, A-Z_( J )_James, Del'),(233,48,'Books_Subjects_Children\'s Books_Series_Mystery & Detective_Scooby-Doo Mystery'),(234,48,'Books_Subjects_Children\'s Books_Series_Mystery & Detective_Scooby Doo Mysteries'),(235,50,'Music_Styles_Rock_General'),(236,51,'Books_Subjects_Religion & Spirituality_Christianity_Church History_General'),(237,51,'Books_Subjects_Religion & Spirituality_Christianity_Clergy_Ministry'),(238,51,'Books_Subjects_Religion & Spirituality_Christianity_Protestantism_Pentecostal'),(239,52,'Books_Subjects_Health, Mind & Body_Relationships_Love & Romance'),(240,52,'Books_Subjects_Nonfiction_Social Sciences_Folklore & Mythology'),(241,52,'Books_Subjects_Nonfiction_Social Sciences_Sociology_General'),(242,52,'Books_Subjects_Religion & Spirituality_Occult_Magic'),(243,52,'Books_Subjects_Religion & Spirituality_Occult_Occultism'),(244,53,'Books_Subjects_Business & Investing_General'),(245,53,'Books_Subjects_Business & Investing_Personal Finance_Financial Planning'),(246,53,'Books_Subjects_Business & Investing_Personal Finance_Retirement Planning'),(247,53,'Books_Subjects_Parenting & Families_Aging Parents_Retirement Planning'),(248,53,'_Amazon.com Stores_Home & Office_Business & Investing Books_General'),(249,53,'_Amazon.com Stores_Home & Office_Business & Investing Books_Personal Finance_Financial Planning'),(250,53,'_Amazon.com Stores_Home & Office_Business & Investing Books_Personal Finance_Retirement Planning'),(251,54,'Books_Subjects_Children\'s Books_Literature_Action & Adventure'),(252,54,'Books_Subjects_Children\'s Books_People & Places_Social Situations_Friendship_Fiction'),(253,54,'Books_Subjects_Children\'s Books_Series_Classics_Betsy & Tacy'),(254,54,'Books_Subjects_Children\'s Books_Ages 9-12_General'),(255,55,'Books_Subjects_Children\'s Books_Literature_Humorous'),(256,55,'Books_Subjects_Children\'s Books_Ages 4-8_General'),(257,56,'Books_Subjects_Entertainment_Humor_Essays'),(258,56,'Books_Subjects_Entertainment_Humor_General'),(259,57,'Books_Subjects_Computers & Internet_Digital Business & Culture_Hackers'),(260,57,'Books_Subjects_Computers & Internet_Digital Business & Culture_Project Management_Security'),(261,57,'Books_Subjects_Computers & Internet_General'),(262,57,'_Amazon.com Stores_Home & Office_Computer & Internet Books_Internet_Digital Business & Culture_Hackers'),(263,57,'_Amazon.com Stores_Home & Office_Computer & Internet Books_Internet_Digital Business & Culture_Project Management_Security'),(264,58,'Books_Subjects_Outdoors & Nature_Field Guides_Birds'),(265,58,'Books_Subjects_Outdoors & Nature_Field Guides_Regional_United States_Rocky Mountains'),(266,58,'Books_Subjects_Outdoors & Nature_Birdwatching_General'),(267,58,'Books_Subjects_Outdoors & Nature_Reference'),(268,58,'Books_Specialty Stores_jp-unknown2'),(269,59,'_VHS_Actors & Actresses_( B )_Barrymore, Ethel'),(270,59,'_VHS_Actors & Actresses_( B )_Bohnen, Roman'),(271,59,'_VHS_Actors & Actresses_( B )_Boulton, Matthew'),(272,59,'_VHS_Actors & Actresses_( C )_Coulouris, George'),(273,59,'_VHS_Actors & Actresses_( D )_Duryea, Dan'),(274,59,'_VHS_Actors & Actresses_( F )_Fitzgerald, Barry'),(275,59,'_VHS_Actors & Actresses_( G )_Grant, Cary'),(276,59,'_VHS_Actors & Actresses_( S )_Shayne, Konstantin'),(277,59,'_VHS_Actors & Actresses_( S )_Soderling, Walter'),(278,59,'_VHS_Actors & Actresses_( W )_Wyatt, Jane'),(279,59,'_VHS_Genres_Drama_General'),(280,59,'_VHS_Genres_Drama_Classics'),(281,59,'_VHS_Genres_Drama_By Theme_Psychological Drama'),(282,59,'_VHS_Genres_Drama_Family Life_Mothers & Sons'),(283,60,'Books_Subjects_Entertainment_Music_History & Criticism'),(284,60,'Books_Specialty Stores_New & Used Textbooks_Humanities_Art & Music_Appreciation & History'),(285,60,'Books_Specialty Stores_New & Used Textbooks_Humanities_Art & Music_Music_General'),(286,60,'Books_Specialty Stores_New & Used Textbooks_Humanities_History_Europe'),(287,61,'Books_Subjects_Children\'s Books_People & Places_Family Life_Siblings_Nonfiction'),(288,61,'Books_Subjects_Children\'s Books_People & Places_Multilingual_Spanish'),(289,61,'Books_Formats_Libros en espaÃ±ol_Infantil y juvenil_Bebes a 3 aÃ±os'),(290,62,'Books_Subjects_Children\'s Books_Reference & Nonfiction_School & Education'),(291,63,'Books_Subjects_Biographies & Memoirs_Professionals & Academics_Medical'),(292,63,'Books_Subjects_Health, Mind & Body_Diets & Weight Loss_Special Conditions_General'),(293,63,'Books_Subjects_Health, Mind & Body_Alternative Medicine_General'),(294,63,'Books_Subjects_Medicine_Special Topics_Nutrition'),(295,63,'Books_Subjects_Medicine_Internal Medicine_Oncology_General'),(296,63,'Books_Formats_Libros en espaÃ±ol_BiografÃ­as y memorias'),(297,63,'Books_Subjects_Health, Mind & Body_Disorders & Diseases_Cancer_General'),(298,64,'Books_Subjects_Children\'s Books_People & Places_Holidays & Festivals_Christmas_Fiction'),(299,64,'Books_Subjects_Children\'s Books_Ages 4-8_Picture Books'),(300,64,'Books_Subjects_Children\'s Books_Ages 4-8_General'),(301,65,'Books_Subjects_Business & Investing_General'),(302,65,'_Amazon.com Stores_Home & Office_Business & Investing Books_General'),(303,66,'Books_Subjects_Science_General'),(304,66,'Books_Subjects_Science_Mathematics_History'),(305,66,'Books_Subjects_Medicine_General'),(306,66,'Books_Subjects_Medicine_Special Topics_History'),(307,67,'Books_Subjects_Children\'s Books_Religions_Christianity_Biographies'),(308,67,'Books_Subjects_Children\'s Books_Religions_Fiction_Christian'),(309,67,'Books_Subjects_Children\'s Books_Religions_Christianity_Ages 4-8'),(310,67,'Books_Subjects_Children\'s Books_Religions_Christianity_Jesus'),(311,68,'Books_Subjects_Nonfiction_Philosophy_Epistemology'),(312,68,'Books_Subjects_Nonfiction_Philosophy_General'),(313,68,'Books_Subjects_Nonfiction_Philosophy_Modern'),(314,68,'Books_Subjects_Nonfiction_Philosophy_Movements_Phenomenology'),(315,69,'Books_Subjects_History_Historical Study_Historiography'),(316,69,'Books_Subjects_History_Americas_General'),(317,70,'Books_Subjects_Nonfiction_Social Sciences_Human Geography'),(318,70,'Books_Subjects_Nonfiction_Social Sciences_Sociology_General'),(319,70,'Books_Subjects_Nonfiction_Social Sciences_Children\'s Studies'),(320,71,'_VHS_Genres_Kids & Family_Animation'),(321,71,'_VHS_Genres_Kids & Family_General'),(322,71,'_VHS_Genres_Kids & Family_Characters & Series_Jonny Quest'),(323,71,'_VHS_Genres_Kids & Family_Characters & Series_Cartoon Network_General'),(324,71,'_VHS_Genres_Kids & Family_7-9 Years'),(325,72,'Books_Subjects_Entertainment_Games_Card Games_General'),(326,72,'Books_Subjects_Entertainment_Games_General'),(327,72,'Books_Subjects_Religion & Spirituality_New Age_Divination_Tarot'),(328,73,'Books_Subjects_Children\'s Books_Literature_Popular Culture'),(329,73,'Books_Subjects_Children\'s Books_People & Places_Family Life_General'),(330,73,'Books_Subjects_Children\'s Books_Ages 9-12_General'),(331,73,'Books_Subjects_Children\'s Books_Religions_Christianity_Ages 9-12'),(332,73,'Books_Subjects_Children\'s Books_Religions_Christianity_Series_Seventh Heaven'),(333,74,'Books_Subjects_Business & Investing_Biographies & Primers_Company Profiles'),(334,74,'Books_Subjects_Business & Investing_General'),(335,74,'Books_Subjects_Business & Investing_Management & Leadership_Management Science'),(336,74,'Books_Subjects_Business & Investing_Reference_General'),(337,74,'_Amazon.com Stores_Home & Office_Business & Investing Books_Biographies & Primers_Company Profiles'),(338,74,'_Amazon.com Stores_Home & Office_Business & Investing Books_General'),(339,74,'_Amazon.com Stores_Home & Office_Business & Investing Books_Management & Leadership_Management Science'),(340,74,'_Amazon.com Stores_Home & Office_Business & Investing Books_Reference_General'),(341,75,'Books_Subjects_Entertainment_Movies_Reference'),(342,75,'Books_Subjects_Entertainment_Television_Reference'),(343,75,'Books_Subjects_Home & Garden_Antiques & Collectibles_Americana'),(344,75,'Books_Subjects_Reference_Encyclopedias_Art'),(345,75,'Books_Subjects_Entertainment_Movies_Encyclopedias'),(346,75,'Books_Subjects_Reference_Encyclopedias_Pop Culture'),(347,75,'Books_Subjects_Reference_Encyclopedias_Television'),(348,76,'Books_Subjects_Law_Intellectual Property_Patent, Trademark & Copyright'),(349,76,'Books_Subjects_Law_Practical Guides_General'),(350,76,'Books_Subjects_Law_Law Practice_Reference'),(351,76,'Books_Subjects_Reference_Publishing & Books_Authorship'),(352,76,'Books_Subjects_Reference_Writing_General'),(353,76,'Books_Subjects_Professional & Technical_Law_Intellectual Property_Patent, Trademark & Copyright'),(354,76,'Books_Subjects_Professional & Technical_Law_Law Practice_Reference'),(355,77,'Books_Subjects_Mystery & Thrillers_Mystery_General'),(356,77,'Books_Subjects_Mystery & Thrillers_General'),(357,78,'Books_Subjects_Cooking, Food & Wine_General'),(358,78,'Books_Subjects_Cooking, Food & Wine_Regional & International_U.S. Regional_African American'),(359,79,'Books_Subjects_Nonfiction_Women\'s Studies_General'),(360,79,'Books_Subjects_Reference_General'),(361,80,'Books_Subjects_Biographies & Memoirs_General'),(362,80,'Books_Subjects_Religion & Spirituality_Other Eastern Religions_General'),(363,80,'Books_Subjects_Religion & Spirituality_Spirituality_General'),(364,80,'Books_Subjects_Religion & Spirituality_Authors, A-Z_( E )_Easwaran, Eknath'),(365,81,'_VHS_Actors & Actresses_( B )_Burkley, Dennis'),(366,81,'_VHS_Actors & Actresses_( D )_Dillon, Kevin'),(367,81,'_VHS_Actors & Actresses_( I )_Idol, Billy'),(368,81,'_VHS_Actors & Actresses_( K )_Kilmer, Val'),(369,81,'_VHS_Actors & Actresses_( M )_Maberly to Mazzello_Maclachlan, Kyle'),(370,81,'_VHS_Actors & Actresses_( M )_Maberly to Mazzello_Madsen, Michael'),(371,81,'_VHS_Actors & Actresses_( Q )_Quinlan, Kathleen'),(372,81,'_VHS_Actors & Actresses_( R )_Ryan, Meg'),(373,81,'_VHS_Actors & Actresses_( S )_Studi, Wes'),(374,81,'_VHS_Actors & Actresses_( W )_Westerman, Floyd Red Crow'),(375,81,'_VHS_Actors & Actresses_( W )_Whaley, Frank'),(376,81,'_VHS_Actors & Actresses_( W )_Wincott, Michael'),(377,81,'_VHS_Directors_( S )_Stone, Oliver'),(378,81,'_VHS_Genres_Drama_By Theme_Biography'),(379,81,'_VHS_Genres_Drama_General'),(380,81,'_VHS_Special Features_Today\'s Deals in Video_Drama'),(381,81,'_VHS_Genres_Musicals & Performing Arts_Musicals_Drama'),(382,81,'_Amazon.com Stores_Amazon.com Outlet_Categories_Video Outlet_Drama'),(383,81,'_VHS_Genres_Drama_By Theme_Addiction & Alcoholism'),(384,81,'_VHS_Genres_Drama_By Theme_Artists & Writers'),(385,82,'Books_Subjects_Literature & Fiction_World Literature_United States_Classics_Twain, Mark'),(386,82,'Books_Subjects_Literature & Fiction_General_Classics'),(387,82,'Books_Subjects_Literature & Fiction_World Literature_United States_19th Century'),(388,82,'Books_Subjects_Literature & Fiction_Authors, A-Z_( T )_Twain, Mark_General'),(389,82,'Books_Subjects_Literature & Fiction_Authors, A-Z_( T )_Twain, Mark_Paperback'),(390,83,'Books_Subjects_Lietrature & Fiction_General_Contemporary'),(391,84,'_VHS_Actors & Actresses_( S )_Sheldon, Jack'),(392,84,'_VHS_Genres_Kids & Family_Animation'),(393,84,'_VHS_Genres_Kids & Family_General'),(394,84,'_VHS_Genres_Kids & Family_Characters & Series_Schoolhouse Rock'),(395,84,'_VHS_Genres_Kids & Family_3-6 Years'),(396,84,'_VHS_Genres_Kids & Family_7-9 Years'),(397,84,'_VHS_Genres_Kids & Family_10-12 Years'),(398,84,'_VHS_Specialty Stores_Disney Home Video_All Disney Titles'),(399,84,'_VHS_Specialty Stores_Disney Home Video_By Age_3-6 Years'),(400,84,'_VHS_Specialty Stores_Disney Home Video_By Age_7-11 Years'),(401,84,'_VHS_Specialty Stores_Disney Home Video_By Age_For the Whole Family'),(402,84,'_VHS_Specialty Stores_Disney Home Video_Animated Cartoons_All Titles'),(403,85,'Books_Subjects_Parenting & Families_Parenting_Babies & Toddlers_Breastfeeding'),(404,85,'_Categories_Feeding_Breastfeeding_Books'),(405,85,'_Specialty Stores_Books, Music & More_Books, Music & Videos for Parents_Breastfeeding Books'),(406,86,'Books_Formats_Books on Tape_Children\'s Books_General'),(407,86,'Books_Formats_Books on Tape_Literature & Fiction_General'),(408,86,'Books_Formats_Books on Tape_General'),(409,87,'Books_Subjects_Reference_Dictionaries & Thesauruses_English (All)'),(410,87,'Books_Subjects_Reference_Dictionaries & Thesauruses_Foreign Language_Polish'),(411,87,'Books_Subjects_Reference_Foreign Languages_Instruction_Polish'),(412,87,'Books_Subjects_Reference_General'),(413,89,'Music_Styles_International_South & Central America_Brazil'),(414,89,'Music_Styles_International_General'),(415,89,'Music_Styles_Latin Music_General'),(416,89,'Music_Styles_International_Latin Music_Samba'),(417,89,'Music_Specialty Stores_Indie Music_International_General'),(418,89,'Music_Specialty Stores_Indie Music_Latin Music_General'),(419,89,'_Amazon.com Stores_Travel_Categories_Music for Travelers_South & Central America_Brazil'),(420,89,'_Amazon.com Stores_Travel_Categories_Music for Travelers_Latin Music_Samba'),(421,90,'Books_Subjects_Mystery & Thrillers_Thrillers_Spy Stories & Tales of Intrigue'),(422,91,'Books_Subjects_Travel_United States_Regions_Northeast_New England'),(423,91,'_Amazon.com Stores_Travel_Categories_Travel Books_United States_Regions_Northeast_New England'),(424,92,'Books_Subjects_Literature & Fiction_World Literature_United States_Classics_General'),(425,92,'Books_Subjects_Literature & Fiction_General_Classics'),(426,92,'Books_Subjects_Literature & Fiction_General_Contemporary'),(427,92,'Books_Subjects_Literature & Fiction_Short Stories_United States'),(428,93,'Books_Subjects_Business & Investing_Finance_Corporate Finance'),(429,93,'Books_Subjects_Business & Investing_Small Business & Entrepreneurship_General'),(430,93,'_Amazon.com Stores_Home & Office_Business & Investing Books_Finance_Corporate Finance'),(431,93,'_Amazon.com Stores_Home & Office_Business & Investing Books_Small Business & Entrepreneurship_General'),(432,94,'Books_Subjects_Reference_Dictionaries & Thesauruses_English (All)'),(433,94,'Books_Subjects_Reference_Dictionaries & Thesauruses_General'),(434,94,'Books_Subjects_Reference_Dictionaries & Thesauruses_Slang & Idioms'),(435,94,'Books_Subjects_Reference_General'),(436,95,'Books_Subjects_Science_Technology_History of Technology'),(437,96,'Books_Subjects_Religion & Spirituality_Christianity_Christian Living_Discipleship'),(438,96,'Books_Subjects_Religion & Spirituality_Christianity_Christian Living_General'),(439,96,'Books_Subjects_Religion & Spirituality_Christianity_Protestantism_Inspirational'),(440,97,'Books_Subjects_Literature & Fiction_General_Contemporary'),(441,97,'Books_Subjects_Mystery & Thrillers_Thrillers_Spy Stories & Tales of Intrigue'),(442,98,'Music_Styles_Classical_Featured Composers, A-Z_( B )_Brahms, Johannes_All Works by Brahms'),(443,98,'Music_Styles_Classical_Forms & Genres_Concertos_Concertinos'),(444,98,'Music_Styles_Classical_Forms & Genres_Concertos_General'),(445,98,'Music_Styles_Classical_Instruments_Strings_Violin'),(446,98,'Music_Styles_Classical_Featured Performers, A-Z_( B )_Berlin Philharmonic Orchestra'),(447,98,'Music_Styles_Classical_Featured Performers, A-Z_( S )_Shaham, Gil'),(448,98,'Music_Styles_Classical_General'),(449,98,'Music_Labels_Amazon.com Label Stores_Deutsche Grammophon Records'),(450,99,'Books_Subjects_Business & Investing_Finance_Finance & Investing'),(451,99,'Books_Subjects_Business & Investing_General'),(452,99,'Books_Subjects_Business & Investing_Investing_Options'),(453,99,'Books_Subjects_Business & Investing_Personal Finance_General'),(454,99,'Books_Subjects_Professional & Technical_Accounting & Finance_Finance_General'),(455,99,'_Amazon.com Stores_Home & Office_Business & Investing Books_Finance_Finance & Investing'),(456,99,'_Amazon.com Stores_Home & Office_Business & Investing Books_General'),(457,99,'_Amazon.com Stores_Home & Office_Business & Investing Books_Investing_Options'),(458,99,'_Amazon.com Stores_Home & Office_Business & Investing Books_Personal Finance_General'),(459,100,'Books_Subjects_Medicine_Administration & Policy_General'),(460,100,'Books_Subjects_Professional & Technical_Medical_Administration & Medicine Economics_General');
/*!40000 ALTER TABLE `product_category_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_tab`
--

DROP TABLE IF EXISTS `sample_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_tab` (
  `id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category` varchar(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_tab`
--

LOCK TABLES `sample_tab` WRITE;
/*!40000 ALTER TABLE `sample_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `sample_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt`
--

DROP TABLE IF EXISTS `tt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt`
--

LOCK TABLES `tt` WRITE;
/*!40000 ALTER TABLE `tt` DISABLE KEYS */;
INSERT INTO `tt` VALUES (1,'sjd');
/*!40000 ALTER TABLE `tt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccess`
--

DROP TABLE IF EXISTS `useraccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccess` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `menuid` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `menuid` (`menuid`),
  CONSTRAINT `useraccess_ibfk_1` FOREIGN KEY (`menuid`) REFERENCES `usermenu` (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccess`
--

LOCK TABLES `useraccess` WRITE;
/*!40000 ALTER TABLE `useraccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `useraccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdetail`
--

DROP TABLE IF EXISTS `userdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdetail` (
  `userid` int(11) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT 'customer',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetail`
--

LOCK TABLES `userdetail` WRITE;
/*!40000 ALTER TABLE `userdetail` DISABLE KEYS */;
INSERT INTO `userdetail` VALUES (NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hsmith','smith','customer'),(NULL,'gjgjgj','rr',NULL,NULL,NULL,'12345',NULL,'jadmin','admin','admin'),(NULL,NULL,NULL,NULL,NULL,'PS','11132','jk@gm.com','jk','jk','customer'),(NULL,NULL,NULL,NULL,NULL,'PA','12345','jk@gm.com','jk12','jk','customer'),(NULL,NULL,NULL,NULL,NULL,NULL,'12345','jk@gm.com','jk123','jk','customer'),(NULL,NULL,NULL,NULL,NULL,NULL,'12345','jk@gm.com','jk1234566','jk','customer'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tbucktoo','bucktoo','customer');
/*!40000 ALTER TABLE `userdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermenu`
--

DROP TABLE IF EXISTS `usermenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermenu` (
  `menuid` int(11) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermenu`
--

LOCK TABLES `usermenu` WRITE;
/*!40000 ALTER TABLE `usermenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `usermenu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-15 16:30:29
