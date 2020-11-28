
--
CREATE DATABASE if not exists primevideo;
use primevideo;
-- --------------------------------------------------------

--
-- Table structure for table `accountteam`
--

DROP TABLE IF EXISTS `accounting`;
CREATE TABLE IF NOT EXISTS `accounting` (
  `username` varchar(10) NOT NULL,
  `password` int(10) NOT NULL,
  
  PRIMARY KEY (`username`)
);

--
-- Dumping data for table `accountteam`
--

INSERT INTO `accounting` (`username`, `password`) VALUES
('ringo', 223),
('paul', 3222);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `auth_id` int(10) NOT NULL,
  `password` int(10) NOT NULL,
  PRIMARY KEY (`auth_id`)
) ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`auth_id`, `password`) VALUES
(1, 1121121),
(2, 222111);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `ID` int(10) NOT NULL,
  `password` int(24) NOT NULL,
  `Name` varchar(23) NOT NULL,
  `Address` varchar(25) NOT NULL,
  `Age` int(25) NOT NULL,
  `PaymentOption` varchar(25) NOT NULL,
  `Username` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`)
) ;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`ID`, `password`, `Name`, `Address`, `Age`, `PaymentOption`, `Username`) VALUES
(1, 222111, 'john', '342232', 33, 'paypal', 'johna'),
(2, 555222, 'robert', '2311', 23, 'credit card', 'robertson');


-- --------------------------------------------------------

--
-- Table structure for table `costofmovie`
--

DROP TABLE IF EXISTS `costofmovie`;
CREATE TABLE IF NOT EXISTS `costofmovie` (
  `deal_ID` int(10) NOT NULL,
  `value` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`deal_ID`),
  FOREIGN KEY (`name`) REFERENCES `movies` (`name`)
) ;

--
-- Dumping data for table `costofmovie`
--

INSERT INTO `costofmovie` (`deal_ID`, `value`,`name`) VALUES
(1, 20,'Forrest gump'),
(2, 22, 'life of pi');


-- --------------------------------------------------------

--
-- Table structure for table `costofshow`
--

DROP TABLE IF EXISTS `costofshow`;
CREATE TABLE IF NOT EXISTS `costofshow` (
  `deal_ID` int(10) NOT NULL,
  `value` int(24) NOT NULL,
  `name` varchar(19) NOT NULL,
  PRIMARY KEY (`deal_ID`),
  FOREIGN KEY (`name`) REFERENCES `show` (`name`)
) ;

--
-- Dumping data for table `costofshow`
--

INSERT INTO `costofshow` (`deal_ID`, `value`,`name`) VALUES
(1, 22,'the office'),
(2, 23, 'community');

-- ----------------------------------------------------------
--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
CREATE TABLE IF NOT EXISTS `actor` (
  `actor_ID` int(10) NOT NULL,
  `Name` varchar(24) NOT NULL,
  PRIMARY KEY (`actor_ID`)
) ;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`actor_ID`, `Name`) VALUES
(1, 'alex'),
(2, 'denis');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
CREATE TABLE IF NOT EXISTS `director` (
  `dir_ID` int(10) NOT NULL,
  `Name` varchar(24) NOT NULL,
  PRIMARY KEY (`dir_ID`)
) ;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`dir_ID`, `Name`) VALUES
(1, 'james'),
(2, 'duke');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `name` varchar(20) NOT NULL,
  `Rating` varchar(24) NOT NULL,
  `Genre` varchar(25) NOT NULL,
  `Score` int(25) NOT NULL,
  `Picture` varchar(25) NOT NULL,
  `Description` varchar(255) NOT NULL,
  
  PRIMARY KEY (`name`)
);

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`name`, `Rating`, `Genre`, `Score`, `Picture`, `Description`) VALUES
('Forrest gump', 'NC', 'music', 5,  'IMG_20191220_134820.jpg', 'good'),
('life of pi', 'PG', 'arts', 7, 'IMG_20191106_140450', 'good');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `pay_ID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `ID` int(10) NOT NULL,
  PRIMARY KEY (`pay_ID`),
  FOREIGN KEY (`ID`) REFERENCES `client` (`ID`)
) ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`pay_ID`, `Amount`,`ID`) VALUES
(1, 2000,1),
(2, 3300,2);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `number` int(10) NOT NULL,
  `Status` varchar(24) NOT NULL,
  `username` varchar(10),  
  `pay_ID` int(11),
  PRIMARY KEY (`number`),
  FOREIGN KEY (`pay_ID`) REFERENCES `payment` (`pay_ID`),
  FOREIGN KEY (`username`) REFERENCES `accounting` (`username`)
) ;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`number`, `Status`,`pay_ID`,`username`) VALUES
(1, 'active',1,'ringo'),
(2, 'inactive',2,'paul');

-- ------------------------------------------------------
--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
CREATE TABLE IF NOT EXISTS `episode` (
  `ID` int(10) NOT NULL,
  `content` varchar(10) NOT NULL,
  `name` varchar(19) NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`name`) REFERENCES `show` (`name`)
) ;

--
-- Dumping data for table `episode`
--

INSERT INTO `episode` (`ID`, `content`, `name`) VALUES
(1, 'three','the office'),
(2, 'five','community');

-- ------------------------------------------------------

--
-- Table structure for table `show`
--

DROP TABLE IF EXISTS `show`;
CREATE TABLE IF NOT EXISTS `show` (
  `name` varchar(19) NOT NULL,
  `Rating` varchar(24) NOT NULL,
  `Genre` varchar(25) NOT NULL,
  `Score` int(25) NOT NULL,
  `Picture` varchar(25) NOT NULL,
  `Description` varchar(255) NOT NULL,  
  PRIMARY KEY (`name`)
);

--
-- Dumping data for table `show`
--

INSERT INTO `show` (`name`, `Rating`, `Genre`, `Score`, `Picture`, `Description`) VALUES
('the office', 'NC', 'music', 5,  'IMG_20191220_134820.jpg', 'good'),
('community', 'PG', 'arts', 7, 'IMG_20191106_140450', 'good');

-- --------------------------------------------------------

