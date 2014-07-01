-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2013 at 10:20 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `musicdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `AlbumID` int(11) NOT NULL AUTO_INCREMENT,
  `AlbumName` varchar(100) DEFAULT NULL,
  `GenreID` int(11) DEFAULT NULL,
  `ReleaseDate` date DEFAULT NULL,
  `CoverArt` text,
  `Rating` float DEFAULT NULL,
  PRIMARY KEY (`AlbumID`),
  KEY `GenreID` (`GenreID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2572 ;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`AlbumID`, `AlbumName`, `GenreID`, `ReleaseDate`, `CoverArt`, `Rating`) VALUES
(2354, 'Mylo Xyloto', 928, '2012-02-01', 'http://userserve-ak.last.fm/serve/126/67649916.png', 5),
(2355, 'A Rush of Blood to the Head', 926, '2006-08-14', 'http://userserve-ak.last.fm/serve/126/85845017.png', 9.5),
(2356, 'Parachutes', 926, '2006-08-14', 'http://userserve-ak.last.fm/serve/126/87203265.png', 6),
(2357, 'Viva la Vida or Death and All His Friends', 926, '2008-06-13', 'http://userserve-ak.last.fm/serve/126/49404383.png', 1),
(2358, 'X & Y', 926, NULL, 'http://userserve-ak.last.fm/serve/126/72571542.png', 9),
(2359, 'X&Y', 926, '2005-06-07', 'http://userserve-ak.last.fm/serve/126/46163645.png', 7),
(2360, 'Viva la Vida', 926, '2008-07-25', 'http://userserve-ak.last.fm/serve/126/27155507.png', 4),
(2361, 'Every Teardrop Is A Waterfall', 935, '2011-06-26', 'http://userserve-ak.last.fm/serve/126/80895725.png', 2),
(2362, 'Christmas Lights', 926, '2010-12-01', 'http://userserve-ak.last.fm/serve/126/55258759.png', 5),
(2363, 'Viva La Vida - Prospekt''s March Edition', 926, NULL, 'http://userserve-ak.last.fm/serve/126/55449271.jpg', 7),
(2364, 'Prospekt''s March EP', 926, '2008-11-21', 'http://userserve-ak.last.fm/serve/126/49403877.png', 9),
(2365, 'Live 2012', 926, '2012-11-16', 'http://userserve-ak.last.fm/serve/126/83698465.png', 2),
(2366, 'Live 2003', 926, '2006-08-14', 'http://userserve-ak.last.fm/serve/126/78668616.png', 8),
(2367, 'Lost!', 926, '2008-11-09', 'http://userserve-ak.last.fm/serve/126/71630924.png', 1),
(2368, 'The Blue Room', 926, NULL, 'http://userserve-ak.last.fm/serve/126/86760991.png', 2),
(2369, 'Fix You', 926, '2005-09-13', 'http://userserve-ak.last.fm/serve/126/27154199.png', 5),
(2370, 'Speed Of Sound', 926, '2009-07-14', 'http://userserve-ak.last.fm/serve/126/71567304.png', 3),
(2371, 'Clocks', 926, '2009-07-14', 'http://userserve-ak.last.fm/serve/126/71494780.png', 10),
(2372, 'The Scientist', 926, '2003-03-01', 'http://userserve-ak.last.fm/serve/126/71492564.png', 8),
(2373, 'Yellow', 926, '2003-03-01', 'http://userserve-ak.last.fm/serve/126/27155845.png', 10),
(2374, 'Mince Spies', 948, '2001-11-30', 'http://userserve-ak.last.fm/serve/126/6050349.jpg', 6),
(2375, 'In My Place', 926, '2003-03-01', 'http://userserve-ak.last.fm/serve/126/71492528.png', 1),
(2376, 'Shiver', 926, '2008-04-28', 'http://userserve-ak.last.fm/serve/126/27155675.png', 8),
(2377, 'Without Parachutes', 951, '2001-11-30', 'http://userserve-ak.last.fm/serve/126/49424701.png', 9),
(2378, 'Brothers & Sisters', 926, '2004-08-03', 'http://userserve-ak.last.fm/serve/126/86761711.png', 9),
(2379, 'Life In Technicolor ii', 926, '2009-01-30', 'http://userserve-ak.last.fm/serve/126/80895841.png', 7),
(2380, 'Violet Hill', 926, '2008-05-06', 'http://userserve-ak.last.fm/serve/126/71601598.png', 5),
(2381, 'Talk', 926, '2006-02-07', 'http://userserve-ak.last.fm/serve/126/71568126.png', 5),
(2382, 'Don''t Panic', 926, '2009-09-01', 'http://userserve-ak.last.fm/serve/126/69860846.png', 6),
(2383, 'Coldplay', 926, NULL, 'http://userserve-ak.last.fm/serve/126/87318377.jpg', 7),
(2384, 'X And Y', 926, NULL, 'http://userserve-ak.last.fm/serve/126/86762641.png', 4),
(2385, 'The Blue Room EP', 926, NULL, 'http://userserve-ak.last.fm/serve/126/86761001.png', 8),
(2386, 'Strawberry Swing', 926, '2009-09-13', 'http://userserve-ak.last.fm/serve/126/31354373.png', 7),
(2387, 'The Blue Room E.P.', 959, NULL, 'http://userserve-ak.last.fm/serve/126/86761009.png', 5),
(2388, 'God Put a Smile Upon Your Face', 926, '2003-07-29', 'http://userserve-ak.last.fm/serve/126/27154053.png', 7),
(2389, 'Trouble', 926, '2001-07-10', 'http://userserve-ak.last.fm/serve/126/27153387.png', 1),
(2390, 'Unplugged', 926, NULL, 'http://userserve-ak.last.fm/serve/126/69846370.jpg', 8),
(2391, 'Rush of Blood to the Head', 926, NULL, 'http://userserve-ak.last.fm/serve/126/86762381.png', 2),
(2392, 'B-sides', 926, NULL, 'http://userserve-ak.last.fm/serve/126/3650934.jpg', 8),
(2393, 'Brothers & Sisters EP', 926, NULL, 'http://userserve-ak.last.fm/serve/126/86761735.png', 9),
(2394, 'Scientist', 926, NULL, 'http://ec1.images-amazon.com/images/P/B00006LVGB.01._SCMZZZZZZZ_.jpg', 6),
(2395, 'Brothers and Sisters', 926, NULL, 'http://userserve-ak.last.fm/serve/126/86761733.png', 8),
(2396, 'Lost?', 926, NULL, 'http://userserve-ak.last.fm/serve/126/5834730.jpg', 8),
(2397, 'Talk, Pt. 3', 926, NULL, 'http://images.amazon.com/images/P/B000CNGGAI.01._SCMZZZZZZZ_.jpg', 4),
(2398, 'The Hardest Part', 926, '2006-05-15', 'http://userserve-ak.last.fm/serve/126/27154431.png', 7),
(2399, 'Safety', 926, NULL, 'http://userserve-ak.last.fm/serve/126/3714297.jpg', 8),
(2400, 'In My Place (New Album Version)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/48448107.jpg', 5),
(2401, 'B-Sides (disc 2)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/3650930.jpg', 5),
(2403, 'Songs for the One I Love', 926, NULL, 'http://userserve-ak.last.fm/serve/126/75390158.jpg', 7),
(2404, 'OK Computer', 926, '2003-03-01', 'http://userserve-ak.last.fm/serve/126/66781226.png', 4),
(2405, 'Kid A', 926, '2008-06-02', 'http://userserve-ak.last.fm/serve/126/51654499.png', 5),
(2406, 'The Bends', 926, '2001-04-30', 'http://userserve-ak.last.fm/serve/126/62328943.png', 10),
(2407, 'In Rainbows', 926, '2007-12-28', 'http://userserve-ak.last.fm/serve/126/47882499.png', 8),
(2408, 'The King of Limbs', 926, '2011-02-18', 'http://userserve-ak.last.fm/serve/126/58789533.png', 4),
(2409, 'Pablo Honey', 926, '2003-03-03', 'http://userserve-ak.last.fm/serve/126/49158523.png', 6),
(2410, 'The Best Of', 926, '2008-06-02', 'http://userserve-ak.last.fm/serve/126/54963937.png', 1),
(2411, 'Hail to the Thief', 926, '2009-08-31', 'http://userserve-ak.last.fm/serve/126/80756193.png', 2),
(2412, 'Amnesiac', 976, '2009-08-31', 'http://userserve-ak.last.fm/serve/126/52753499.png', 6),
(2413, 'OK Computer (Collector''s Edition)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/66781162.png', 6),
(2414, 'I Might Be Wrong: Live Recordings', 926, '2001-11-13', 'http://userserve-ak.last.fm/serve/126/46372667.png', 2),
(2415, 'My Iron Lung', 926, '2003-03-01', 'http://userserve-ak.last.fm/serve/126/76419118.png', 2),
(2416, 'Hail To The Thief (Collector''s Edition)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/65938116.png', 10),
(2417, 'Kid A (Collector''s Edition)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/60692601.png', 7),
(2418, 'The Bends (Collectors Edition)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/86676569.png', 5),
(2419, 'I Might Be Wrong', 926, NULL, 'http://userserve-ak.last.fm/serve/126/66550360.png', 9),
(2420, 'Amnesiac (Collector''s Edition)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/65906850.png', 5),
(2421, 'Pablo Honey (Collector''s Edition)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/60707897.png', 7),
(2422, 'Karma Police', 926, '2003-03-01', 'http://userserve-ak.last.fm/serve/126/79011167.png', 2),
(2423, 'Com Lag: 2+2=5', 926, NULL, 'http://userserve-ak.last.fm/serve/126/51516639.png', 8),
(2424, 'Fake Plastic Trees', 926, '2003-03-01', 'http://userserve-ak.last.fm/serve/126/70109648.png', 3),
(2425, 'Airbag/How Am I Driving?', 926, NULL, 'http://userserve-ak.last.fm/serve/126/81122059.png', 2),
(2426, 'Itch', 982, '1998-06-30', 'http://userserve-ak.last.fm/serve/126/81976635.png', 5),
(2427, 'Street Spirit (Fade Out)', 926, '2003-03-01', 'http://userserve-ak.last.fm/serve/126/78847945.png', 6),
(2428, 'High & Dry', 926, '2003-03-01', 'http://userserve-ak.last.fm/serve/126/79010319.png', 4),
(2429, 'Com Lag', 926, NULL, 'http://userserve-ak.last.fm/serve/126/51516571.png', 4),
(2430, 'Unplugged', 926, NULL, 'http://userserve-ak.last.fm/serve/126/79009753.png', 2),
(2431, 'DeLuxe Collection', 926, NULL, 'http://userserve-ak.last.fm/serve/126/55132901.gif', 4),
(2432, 'Album Box Set', 926, NULL, 'http://userserve-ak.last.fm/serve/126/58961421.png', 5),
(2433, 'Knives Out', 926, '2003-03-03', 'http://userserve-ak.last.fm/serve/126/76873982.png', 3),
(2434, 'My Iron Lung EP', 926, NULL, 'http://userserve-ak.last.fm/serve/126/79010071.png', 7),
(2435, 'Pyramid Song', 926, '2003-03-03', 'http://userserve-ak.last.fm/serve/126/79010177.png', 3),
(2436, 'Towering Above the Rest (disc 1)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/82408789.png', 9),
(2437, 'No Surprises', 989, '2003-03-01', 'http://userserve-ak.last.fm/serve/126/79009977.png', 2),
(2438, 'Go To Sleep', 926, '2003-08-18', 'http://userserve-ak.last.fm/serve/126/79010731.png', 4),
(2439, 'Towering Above the Rest (disc 2)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/82408807.png', 4),
(2440, 'Hail to the Thief (live 2002)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/66089604.png', 2),
(2441, 'Paranoid Android', 926, '2003-03-03', 'http://userserve-ak.last.fm/serve/126/79010603.png', 5),
(2442, 'Hail To The Thief (Retail)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/66089582.png', 6),
(2443, '5 Album Set (Pablo Honey/The Bends/OK Computer/Kid A/Amnesiac)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/82690929.jpg', 2),
(2444, 'Just', 926, '2003-03-01', 'http://userserve-ak.last.fm/serve/126/81017757.png', 3),
(2445, 'Airbag / How Am I Driving?', 926, '1998-04-21', 'http://userserve-ak.last.fm/serve/126/81122073.png', 4.5),
(2446, 'College EP', 926, '2000-11-30', 'http://userserve-ak.last.fm/serve/126/4629541.jpg', 7),
(2447, 'Drill', 926, '1991-11-30', 'http://userserve-ak.last.fm/serve/126/74437056.png', 8),
(2448, 'There, There', 926, NULL, 'http://userserve-ak.last.fm/serve/126/79010801.png', 5),
(2449, 'Hail To The Theif', 926, NULL, 'http://userserve-ak.last.fm/serve/126/53214477.png', 7),
(2450, 'The Golden Unplugged Album', 926, NULL, 'http://userserve-ak.last.fm/serve/126/76163120.png', 7),
(2451, 'Vanilla Sky', 926, NULL, 'http://userserve-ak.last.fm/serve/126/50373343.jpg', 9),
(2452, 'Hail to the Thief. (The Gloaming.)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/79010935.png', 2),
(2453, 'Creep', 926, '1999-12-23', 'http://userserve-ak.last.fm/serve/126/74804200.png', 6),
(2454, 'Talk That Talk', 1001, '2011-11-21', 'http://userserve-ak.last.fm/serve/126/85035097.png', 5),
(2455, 'Loud', 1003, '2011-08-18', 'http://userserve-ak.last.fm/serve/126/78437932.png', 9),
(2456, 'Diamonds', 926, '2012-12-18', 'http://userserve-ak.last.fm/serve/126/82327227.png', 1),
(2457, 'Rated R', 926, '2009-11-23', 'http://userserve-ak.last.fm/serve/126/71230426.png', 9),
(2458, 'Good Girl Gone Bad', 1007, '2008-11-07', 'http://userserve-ak.last.fm/serve/126/82474787.png', 4),
(2459, 'We Found Love', 926, NULL, 'http://userserve-ak.last.fm/serve/126/69320882.png', 3),
(2460, 'Good Girl Gone Bad: Reloaded', 926, '2008-06-16', 'http://userserve-ak.last.fm/serve/126/63735909.png', 3),
(2461, 'Unapologetic', 926, '2012-11-19', 'http://userserve-ak.last.fm/serve/126/85035275.png', 4),
(2462, 'A Girl Like Me', 926, '2006-05-01', 'http://userserve-ak.last.fm/serve/126/36992015.png', 9.5),
(2463, 'Talk That Talk (Deluxe Edition)', 926, NULL, 'http://userserve-ak.last.fm/serve/126/72566312.png', 8),
(2464, 'Music of the Sun', 926, '2005-09-19', 'http://userserve-ak.last.fm/serve/126/72771190.png', 9),
(2465, 'We Found Love (feat. Calvin Harris) - Single', 926, NULL, 'http://userserve-ak.last.fm/serve/126/69172520.png', 8),
(2466, 'Only Girl (In The World)', 926, '2010-09-13', 'http://userserve-ak.last.fm/serve/126/51768903.png', 3),
(2467, 'Russian Roulette', 926, '2009-11-02', 'http://userserve-ak.last.fm/serve/126/36803187.png', 2),
(2468, 'S&M Remix', 926, NULL, 'http://userserve-ak.last.fm/serve/126/69740966.png', 4),
(2469, 'Where Have You Been', 926, '2012-06-19', 'http://userserve-ak.last.fm/serve/126/76525256.png', 2),
(2470, 'Take A Bow', 1016, '2008-05-26', 'http://userserve-ak.last.fm/serve/126/5860631.jpg', 4),
(2471, 'Good Girl Gone Bad: The Remixes', 1016, '2009-01-27', 'http://userserve-ak.last.fm/serve/126/46065231.png', 5),
(2472, 'Talk That Talk (Deluxe Version)', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/70065256.png', 5),
(2473, 'Disturbia', 1016, '2008-09-29', 'http://userserve-ak.last.fm/serve/126/51462057.png', 9),
(2474, 'You Da One', 1016, '2012-01-17', 'http://userserve-ak.last.fm/serve/126/87494549.png', 10),
(2475, 'Rated R: Remixed', 1021, '2010-05-25', 'http://userserve-ak.last.fm/serve/126/45783921.png', 5),
(2476, 'Rehab', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/51462001.png', 1),
(2477, 'Umbrella', 1016, '2007-05-21', 'http://userserve-ak.last.fm/serve/126/67679782.png', 8),
(2478, 'Loud (Bonus Track Version)', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/54292343.png', 8),
(2479, 'Unfaithful', 1024, '2006-07-17', 'http://userserve-ak.last.fm/serve/126/57096039.png', 7),
(2480, 'Take A Bow (Int''l Maxi)', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/51462693.png', 8),
(2481, 'California King Bed', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/87494533.png', 5),
(2482, 'Rude Boy', 1016, '2010-03-01', 'http://userserve-ak.last.fm/serve/126/40544103.png', 8),
(2483, 'Good Girl Gone Bad: Reloaded (UK Edition)', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/51462839.png', 2),
(2484, 'Pon de Replay', 1016, '2005-08-22', 'http://userserve-ak.last.fm/serve/126/51462775.png', 7),
(2485, 'Wait Your Turn', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/86464837.png', 1),
(2486, 'Don''t Stop The Music', 1028, '2007-08-07', 'http://userserve-ak.last.fm/serve/126/86695655.png', 6),
(2487, 'Hate That I Love You', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/86698221.png', 7),
(2488, 'SOS', 1016, '2006-04-10', 'http://userserve-ak.last.fm/serve/126/51462107.png', 2),
(2489, 'Shut Up and Drive', 1016, '2007-08-20', 'http://userserve-ak.last.fm/serve/126/9659379.jpg', 6),
(2490, 'Don''t Stop The Music/ Remixes', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/70252606.png', 2),
(2491, 'Redemption Song', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/51463005.png', 8),
(2492, 'What''s My Name?', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/53628757.png', 1),
(2493, 'Don''t Stop The Music Hit Pack', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/51463149.png', 9),
(2494, 'We Ride', 1016, '2006-11-13', 'http://userserve-ak.last.fm/serve/126/87793343.jpg', 8),
(2495, 'Russian Roulette (The Remixes)', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/51462919.png', 6),
(2496, 'If It''s Lovin'' That You Want', 1016, '2010-11-29', 'http://userserve-ak.last.fm/serve/126/87855705.jpg', 4),
(2497, 'A Girl Like Me (CD Full Length)', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/70253714.png', 4),
(2498, 'Girl Like Me', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/70252496.png', 5),
(2499, 'If I Never See Your Face Again', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/86699387.png', 7),
(2500, 'Don''t Stop The Music 5 Track EP', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/70252670.png', 5),
(2501, 'Good Girl Gone Bad (The Remixes)', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/72771348.png', 7),
(2502, 'A Girl Like Me (Int''l)', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/51462751.png', 5),
(2503, 'Disturbia (Remixes)', 1033, '2008-08-05', 'http://userserve-ak.last.fm/serve/126/51462879.png', 3),
(2504, 'Black Holes and Revelations', 1016, '2007-12-01', 'http://userserve-ak.last.fm/serve/126/82296429.png', 1),
(2505, 'The Resistance', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/65553108.png', 4),
(2506, 'Absolution', 1016, '2005-10-02', 'http://userserve-ak.last.fm/serve/126/79800415.png', 8.5),
(2507, 'Origin of Symmetry', 1016, '2005-09-30', 'http://userserve-ak.last.fm/serve/126/41121761.png', 3),
(2508, 'Showbiz', 1016, '2010-02-22', 'http://userserve-ak.last.fm/serve/126/74048974.png', 8),
(2509, 'Supermassive Black Hole', 1016, '2006-06-22', 'http://userserve-ak.last.fm/serve/126/65407108.png', 2),
(2510, 'Hullabaloo Soundtrack', 1016, '2006-04-03', 'http://userserve-ak.last.fm/serve/126/52105975.png', 3),
(2511, 'HAARP', 1016, '2008-03-14', 'http://userserve-ak.last.fm/serve/126/81475829.png', 2),
(2512, 'Hullabaloo', 1016, '2003-02-18', 'http://userserve-ak.last.fm/serve/126/52105963.png', 4),
(2513, 'Feeling Good / Hyper Music', 1016, '2001-11-19', 'http://userserve-ak.last.fm/serve/126/31321331.jpg', 6),
(2514, 'Knights of Cydonia', 1016, '2006-11-27', 'http://userserve-ak.last.fm/serve/126/37098669.jpg', 6),
(2515, 'Unintended', 1016, '2000-08-08', 'http://userserve-ak.last.fm/serve/126/31303863.jpg', 8),
(2516, 'Hysteria', 1016, '2003-12-22', 'http://userserve-ak.last.fm/serve/126/81333697.png', 8),
(2517, 'Starlight', 1016, '2006-08-21', 'http://userserve-ak.last.fm/serve/126/65407120.png', 3),
(2518, 'Hullabaloo (Disc 1)', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/33872573.png', 3),
(2519, 'Dead Star / In Your World', 1016, '2003-03-10', 'http://userserve-ak.last.fm/serve/126/71071428.png', 7),
(2520, 'Time Is Running Out', 1016, '2004-07-20', 'http://userserve-ak.last.fm/serve/126/81332555.png', 2),
(2521, 'Muscle Museum', 1050, '2007-02-26', 'http://userserve-ak.last.fm/serve/126/67461054.png', 4),
(2522, 'Plug In Baby', 1016, '2001-03-05', 'http://userserve-ak.last.fm/serve/126/46482137.png', 5),
(2523, 'Hullabaloo (Disc 2)', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/33872571.png', 10),
(2524, 'New Born', 1016, '2001-06-03', 'http://userserve-ak.last.fm/serve/126/81330139.png', 2),
(2525, 'Invincible', 1016, '2007-03-30', 'http://userserve-ak.last.fm/serve/126/65407140.png', 4),
(2526, 'Bliss', 1016, '2007-02-26', 'http://userserve-ak.last.fm/serve/126/82603577.jpg', 9),
(2527, 'Butterflies and Hurricanes', 1016, '2004-11-30', 'http://userserve-ak.last.fm/serve/126/30391299.jpg', 10),
(2528, 'Map of the Problematique', 1016, '2007-06-18', 'http://userserve-ak.last.fm/serve/126/9580633.jpg', 3),
(2529, 'Random 1-8', 1016, '2000-10-04', 'http://userserve-ak.last.fm/serve/126/81475593.png', 2),
(2530, 'Cave', 1016, '1999-09-06', 'http://userserve-ak.last.fm/serve/126/81175633.png', 3),
(2531, 'Uno', 1059, '2007-02-26', 'http://userserve-ak.last.fm/serve/126/35574737.jpg', 3),
(2532, 'Muscle Museum EP', 1016, '1999-01-11', 'http://userserve-ak.last.fm/serve/126/31320793.jpg', 4),
(2533, 'Sunburn', 1016, '2007-02-26', 'http://userserve-ak.last.fm/serve/126/81053037.jpg', 3),
(2534, 'Sing for Absolution', 1016, '2004-07-20', 'http://userserve-ak.last.fm/serve/126/46323859.jpg', 10),
(2535, 'Absolution Tour', 1016, '2005-12-12', 'http://userserve-ak.last.fm/serve/126/77693814.png', 5),
(2536, 'Inspirations, Part II', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/3738050.jpg', 9),
(2537, 'In Your World / Dead Star', 1016, '2002-06-20', 'http://userserve-ak.last.fm/serve/126/67725904.jpg', 3),
(2538, 'Absolution + Bonus Dvd', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/73924834.jpg', 4),
(2539, 'Hullabaloo CD1', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/31320775.jpg', 5),
(2540, 'Hullaballoo Soundtrack', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/10068529.jpg', 2),
(2541, 'Stockholm Syndrome', 1016, '2006-05-29', 'http://userserve-ak.last.fm/serve/126/54135735.png', 4),
(2542, 'Eurocks 2002', 1016, '2001-11-30', 'http://userserve-ak.last.fm/serve/126/4987454.jpg', 9),
(2543, 'Hullabaloo Soundtrack (disc 1)', 1016, '2002-06-26', 'http://userserve-ak.last.fm/serve/126/87397647.jpg', 5),
(2544, 'Arcana', 1016, '1997-03-18', 'http://userserve-ak.last.fm/serve/126/11290213.jpg', 3.25),
(2545, 'Hullabaloo Soundtrack (disc 2)', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/87397657.jpg', 6),
(2546, 'Dear Star/ In Your World', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/9749269.jpg', 10),
(2547, 'Hyper Music', 1016, '2001-11-21', 'http://userserve-ak.last.fm/serve/126/81332099.png', 10),
(2548, 'Feeling Good', 1016, '2008-03-07', 'http://userserve-ak.last.fm/serve/126/78351456.jpg', 10),
(2549, 'Unintended, Pt. 2', 1016, NULL, 'http://images.amazon.com/images/P/B00004U85N.01._SCMZZZZZZZ_.jpg', 9),
(2550, 'Dead Star', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/16596127.jpg', 7),
(2551, 'Showbiz (bonus disc)', 1016, NULL, 'http://images.amazon.com/images/P/B00001SIES.01.MZZZZZZZ.jpg', 4),
(2552, 'Unintended 1', 1016, '2000-05-30', 'http://userserve-ak.last.fm/serve/126/53809605.jpg', 3),
(2553, 'Inspirations, Part I', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/3568808.jpg', 5),
(2554, 'Born to Die', 1016, '2012-01-31', 'http://userserve-ak.last.fm/serve/126/86257403.png', 10),
(2555, 'Born To Die - The Paradise Edition', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/82268821.png', 6),
(2556, 'Ride', NULL, '2012-11-19', 'http://userserve-ak.last.fm/serve/126/82281009.png', 4),
(2557, 'Paradise', 1076, '2012-11-13', 'http://userserve-ak.last.fm/serve/126/82781185.png', 4),
(2558, 'Blue Velvet', 1078, '2012-09-25', 'http://userserve-ak.last.fm/serve/126/82469919.png', 9),
(2559, 'Blue Jeans Remixes', 1016, '2012-05-01', 'http://userserve-ak.last.fm/serve/126/77364630.png', 10),
(2560, 'Video Games Remixes', 1016, '2012-02-28', 'http://userserve-ak.last.fm/serve/126/74992678.png', 8),
(2561, 'Summertime Sadness (Cedric Gervais Remix)', 1016, '2013-02-15', 'http://userserve-ak.last.fm/serve/126/87581275.jpg', 4),
(2562, 'Summertime Sadness (Nick Warren Remixes)', 1016, NULL, 'http://userserve-ak.last.fm/serve/126/87391839.jpg', 5),
(2565, 'cool', 1050, '1990-05-18', 'http://us.123rf.com/400wm/400/400/lodka/lodka1106/lodka110600034/9716507-orange-fun-sun-with-a-pretty-smile.jpg', 7),
(2566, 'alternative', 927, '2012-01-01', 'http://goo.gl/u2p0b', 0),
(2567, 'alternative', 927, '2012-01-01', 'http://goo.gl/u2p0b', 0),
(2568, 'rock', 926, '1969-08-21', 'http://upload.wikimedia.org/wikipedia/en/a/a8/Creamwheelsoffire.jpeg', 0),
(2569, 'rock', 926, '1969-08-21', 'http://upload.wikimedia.org/wikipedia/en/a/a8/Creamwheelsoffire.jpeg', 0),
(2570, 'rock', 926, '1969-08-21', 'http://upload.wikimedia.org/wikipedia/en/a/a8/Creamwheelsoffire.jpeg', 0),
(2571, 'dance', 1003, '2014-02-01', 'http://goo.gl/u2p0b', 0);

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE IF NOT EXISTS `artist` (
  `ArtistID` int(11) NOT NULL AUTO_INCREMENT,
  `ArtistName` varchar(100) NOT NULL,
  PRIMARY KEY (`ArtistID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`ArtistID`, `ArtistName`) VALUES
(60, 'Coldplay'),
(61, 'Radiohead'),
(62, 'Rihanna'),
(63, 'Muse'),
(64, 'Lana Del Rey'),
(65, 'Test McSauce'),
(66, 'Cream'),
(67, 'Peter Piper');

-- --------------------------------------------------------

--
-- Table structure for table `artist_album`
--

CREATE TABLE IF NOT EXISTS `artist_album` (
  `ArtistID` int(11) NOT NULL,
  `AlbumID` int(11) NOT NULL,
  KEY `AlbumID` (`AlbumID`),
  KEY `ArtistID` (`ArtistID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artist_album`
--

INSERT INTO `artist_album` (`ArtistID`, `AlbumID`) VALUES
(60, 2354),
(60, 2355),
(60, 2356),
(60, 2357),
(60, 2358),
(60, 2359),
(60, 2360),
(60, 2361),
(60, 2362),
(60, 2363),
(60, 2364),
(60, 2365),
(60, 2366),
(60, 2367),
(60, 2368),
(60, 2369),
(60, 2370),
(60, 2371),
(60, 2372),
(60, 2373),
(60, 2374),
(60, 2375),
(60, 2376),
(60, 2377),
(60, 2378),
(60, 2379),
(60, 2380),
(60, 2381),
(60, 2382),
(60, 2383),
(60, 2384),
(60, 2385),
(60, 2386),
(60, 2387),
(60, 2388),
(60, 2389),
(60, 2390),
(60, 2391),
(60, 2392),
(60, 2393),
(60, 2394),
(60, 2395),
(60, 2396),
(60, 2397),
(60, 2398),
(60, 2399),
(60, 2400),
(60, 2401),
(60, 2403),
(61, 2404),
(61, 2405),
(61, 2406),
(61, 2407),
(61, 2408),
(61, 2409),
(61, 2410),
(61, 2411),
(61, 2412),
(61, 2413),
(61, 2414),
(61, 2415),
(61, 2416),
(61, 2417),
(61, 2418),
(61, 2419),
(61, 2420),
(61, 2421),
(61, 2422),
(61, 2423),
(61, 2424),
(61, 2425),
(61, 2426),
(61, 2427),
(61, 2428),
(61, 2429),
(61, 2430),
(61, 2431),
(61, 2432),
(61, 2433),
(61, 2434),
(61, 2435),
(61, 2436),
(61, 2437),
(61, 2438),
(61, 2439),
(61, 2440),
(61, 2441),
(61, 2442),
(61, 2443),
(61, 2444),
(61, 2445),
(61, 2446),
(61, 2447),
(61, 2448),
(61, 2449),
(61, 2450),
(61, 2451),
(61, 2452),
(61, 2453),
(62, 2454),
(62, 2455),
(62, 2456),
(62, 2457),
(62, 2458),
(62, 2459),
(62, 2460),
(62, 2461),
(62, 2462),
(62, 2463),
(62, 2464),
(62, 2465),
(62, 2466),
(62, 2467),
(62, 2468),
(62, 2469),
(62, 2470),
(62, 2471),
(62, 2472),
(62, 2473),
(62, 2474),
(62, 2475),
(62, 2476),
(62, 2477),
(62, 2478),
(62, 2479),
(62, 2480),
(62, 2481),
(62, 2482),
(62, 2483),
(62, 2484),
(62, 2485),
(62, 2486),
(62, 2487),
(62, 2488),
(62, 2489),
(62, 2490),
(62, 2491),
(62, 2492),
(62, 2493),
(62, 2494),
(62, 2495),
(62, 2496),
(62, 2497),
(62, 2498),
(62, 2499),
(62, 2500),
(62, 2501),
(62, 2502),
(62, 2503),
(63, 2504),
(63, 2505),
(63, 2506),
(63, 2507),
(63, 2508),
(63, 2509),
(63, 2510),
(63, 2511),
(63, 2512),
(63, 2513),
(63, 2514),
(63, 2515),
(63, 2516),
(63, 2517),
(63, 2518),
(63, 2519),
(63, 2520),
(63, 2521),
(63, 2522),
(63, 2523),
(63, 2524),
(63, 2525),
(63, 2526),
(63, 2527),
(63, 2528),
(63, 2529),
(63, 2530),
(63, 2531),
(63, 2532),
(63, 2533),
(63, 2534),
(63, 2535),
(63, 2536),
(63, 2537),
(63, 2538),
(63, 2539),
(63, 2540),
(63, 2541),
(63, 2542),
(63, 2543),
(63, 2544),
(63, 2545),
(63, 2546),
(63, 2547),
(63, 2548),
(63, 2549),
(63, 2550),
(63, 2551),
(63, 2552),
(63, 2553),
(64, 2554),
(64, 2555),
(64, 2556),
(64, 2557),
(64, 2558),
(64, 2559),
(64, 2560),
(64, 2561),
(64, 2562),
(62, 2565),
(65, 2566),
(65, 2566),
(66, 2568),
(66, 2568),
(66, 2568),
(65, 2571);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `GenreID` int(11) NOT NULL AUTO_INCREMENT,
  `GenreName` varchar(100) NOT NULL,
  PRIMARY KEY (`GenreID`),
  UNIQUE KEY `GenreName` (`GenreName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1081 ;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`GenreID`, `GenreName`) VALUES
(927, 'alternative'),
(928, 'alternative rock'),
(959, 'britpop'),
(951, 'chillout'),
(1028, 'club'),
(935, 'coldplay'),
(1050, 'cool'),
(1003, 'dance'),
(948, 'electronic'),
(976, 'experimental'),
(1076, 'indie'),
(982, 'indie rock'),
(1059, 'joya'),
(1075, 'lana del rey'),
(1000, 'love it'),
(1078, 'melancholy'),
(947, 'piano'),
(1001, 'pop'),
(989, 'radiohead'),
(1033, 'remix'),
(1021, 'rhythm & blues'),
(1024, 'rihanna'),
(1007, 'rnb'),
(926, 'rock'),
(1016, 'take a bow'),
(1080, 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE IF NOT EXISTS `ratings` (
  `UserID` int(11) NOT NULL,
  `TrackID` int(11) NOT NULL,
  `Rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE IF NOT EXISTS `track` (
  `TrackID` int(11) NOT NULL AUTO_INCREMENT,
  `AlbumID` int(11) NOT NULL,
  `TrackName` varchar(100) NOT NULL,
  `TrackDuration` int(11) NOT NULL,
  `TrackURL` text,
  `TrackRating` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`TrackID`),
  KEY `AlbumID` (`AlbumID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2641 ;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`TrackID`, `AlbumID`, `TrackName`, `TrackDuration`, `TrackURL`, `TrackRating`) VALUES
(2467, 2354, 'Mylo Xyloto', 42, NULL, 0),
(2468, 2354, 'Hurts Like Heaven', 242, NULL, 0),
(2469, 2354, 'Paradise', 278, NULL, 0),
(2470, 2354, 'Charlie Brown', 285, NULL, 0),
(2471, 2355, 'Politik', 317, NULL, 9.5),
(2472, 2356, 'Don''t Panic', 137, NULL, 0),
(2473, 2357, 'Life in Technicolor', 148, NULL, 0),
(2474, 2359, 'Square One', 286, NULL, 0),
(2475, 2360, 'Viva la Vida', 240, NULL, 0),
(2476, 2361, 'Every Teardrop Is a Waterfall', 249, NULL, 0),
(2477, 2361, 'Major Minus', 210, NULL, 0),
(2478, 2362, 'Christmas Lights', 245, NULL, 0),
(2479, 2364, 'Life in Technicolor II', 244, NULL, 0),
(2480, 2365, 'Mylo Xyloto (Live)', 57, NULL, 0),
(2481, 2366, 'Politik (Live In Sydney)', 394, NULL, 0),
(2482, 2367, 'Lost!', 234, NULL, 0),
(2483, 2369, 'Fix You', 295, NULL, 0),
(2484, 2370, 'Speed of Sound', 288, NULL, 0),
(2485, 2371, 'Clocks', 307, NULL, 10),
(2486, 2372, 'The Scientist', 306, NULL, 0),
(2487, 2373, 'Yellow', 270, NULL, 0),
(2488, 2374, 'Have Yourself a Merry Little Christmas', 139, NULL, 0),
(2489, 2374, 'Yellow (The Alpha remix)', 314, NULL, 0),
(2490, 2375, 'In My Place', 227, NULL, 0),
(2491, 2376, 'Shiver', 303, NULL, 0),
(2492, 2377, 'Dont Panic (Blue Room version)', 0, NULL, 0),
(2493, 2377, 'Careful Where You Stand', 284, NULL, 0),
(2494, 2378, 'Brothers & Sisters', 242, NULL, 9),
(2495, 2379, 'Life in Technicolor II', 244, NULL, 0),
(2496, 2380, 'Violet Hill', 221, NULL, 0),
(2497, 2381, 'Talk (Junkie XL Remix)', 703, NULL, 0),
(2498, 2382, 'Don''t Panic', 137, NULL, 0),
(2499, 2386, 'Strawberry Swing', 248, NULL, 0),
(2500, 2387, 'Bigger Stronger', 288, NULL, 0),
(2501, 2387, 'Don''t Panic', 137, NULL, 0),
(2502, 2388, 'God Put a Smile Upon Your Face', 297, NULL, 0),
(2503, 2389, 'Trouble', 269, NULL, 0),
(2504, 2390, 'Politik', 317, NULL, 0),
(2505, 2392, 'Brothers & Sisters', 242, NULL, 8),
(2506, 2398, 'The Hardest Part', 261, NULL, 0),
(2508, 2403, 'One I Love', 273, NULL, 0),
(2509, 2404, 'Airbag', 285, NULL, 0),
(2510, 2405, 'Everything in Its Right Place', 252, NULL, 0),
(2511, 2406, 'Planet Telex', 259, NULL, 0),
(2512, 2407, '15 Step', 236, NULL, 0),
(2513, 2408, 'Bloom', 314, NULL, 0),
(2514, 2409, 'You', 209, NULL, 0),
(2515, 2410, 'Just', 232, NULL, 0),
(2516, 2411, '2 + 2 = 5', 200, NULL, 0),
(2517, 2412, 'Packt Like Sardines In A Crushed Tin Box', 238, NULL, 6),
(2518, 2412, 'Pyramid Song', 291, NULL, 6),
(2519, 2414, 'I Might Be Wrong', 291, NULL, 0),
(2520, 2415, 'My Iron Lung', 276, NULL, 0),
(2521, 2422, 'Karma Police', 261, NULL, 0),
(2522, 2424, 'Fake Plastic Trees', 291, NULL, 0),
(2523, 2426, 'Stop Whispering (US Version)', 250, NULL, 0),
(2524, 2426, 'Thinking About You', 161, NULL, 0),
(2525, 2427, 'Street Spirit (Fade Out)', 252, NULL, 0),
(2526, 2428, 'High and Dry', 258, NULL, 0),
(2527, 2432, 'Airbag', 285, NULL, 5),
(2528, 2433, 'Knives Out', 255, NULL, 0),
(2529, 2435, 'Pyramid Song', 291, NULL, 0),
(2530, 2437, 'No Surprises', 229, NULL, 0),
(2531, 2437, 'Airbag (Live In Berlin)', 288, NULL, 0),
(2532, 2438, 'Go to Sleep', 202, NULL, 0),
(2533, 2441, 'Paranoid Android', 384, NULL, 0),
(2534, 2444, 'Just', 232, NULL, 0),
(2535, 2445, 'Airbag', 285, NULL, 4.5),
(2536, 2446, 'Pyramid Song', 291, NULL, 0),
(2537, 2447, 'Prove Yourself', 145, NULL, 0),
(2538, 2450, 'Lozenge Of Love', 134, NULL, 0),
(2539, 2452, '2+2=5 (The Lukewarm.)', 199, NULL, 0),
(2540, 2453, 'Creep', 236, NULL, 0),
(2541, 2454, 'You Da One (Album Version (Explicit))', 200, NULL, 0),
(2542, 2454, 'Where Have You Been', 243, NULL, 0),
(2543, 2454, 'We Found Love', 214, NULL, 0),
(2544, 2455, 'S&M', 244, NULL, 0),
(2545, 2455, 'What''s My Name?', 263, NULL, 0),
(2546, 2456, 'Diamonds (Dave Aude 100 Edit)', 218, NULL, 0),
(2547, 2457, 'Mad House', 94, NULL, 0),
(2548, 2458, 'Umbrella', 276, NULL, 0),
(2549, 2458, 'Push Up on Me', 195, NULL, 0),
(2550, 2460, 'Umbrella', 276, NULL, 0),
(2551, 2461, 'Phresh Out The Runway (Album Version (Explicit))', 222, NULL, 0),
(2552, 2462, 'SOS', 239, NULL, 9.5),
(2553, 2464, 'Pon de Replay', 246, NULL, 0),
(2554, 2466, 'Only Girl (In the World)', 235, NULL, 0),
(2555, 2467, 'Russian Roulette', 228, NULL, 0),
(2556, 2469, 'Where Have You Been (The Calvin Harris Extended Remix)', 361, NULL, 0),
(2557, 2470, 'Take A Bow (Main)', 228, NULL, 0),
(2558, 2470, 'Don''t Stop The Music (Solitaire''s More Drama Remix)', 487, NULL, 0),
(2559, 2471, 'Umbrella (Seamus Haji & Paul Emanuel Radio Edit)', 238, NULL, 0),
(2560, 2473, 'Disturbia', 236, NULL, 0),
(2561, 2474, 'You Da One (Dave Aude Radio)', 229, NULL, 0),
(2562, 2475, 'Mad House (Chew Fu Straight Jacket Fix)', 133, NULL, 0),
(2563, 2475, 'Russian Roulette (Chew Fu Black Russian Fix)', 356, NULL, 0),
(2564, 2477, 'Umbrella (Jody den Broeder Lush Club Remix)', 553, NULL, 0),
(2565, 2479, 'Unfaithful', 226, NULL, 0),
(2566, 2479, 'Unfaithful (Tony Moran Radio Mix)', 256, NULL, 0),
(2567, 2482, 'Rude Boy', 223, NULL, 0),
(2568, 2484, 'Pon de Replay (Radio Edit)', 213, NULL, 0),
(2569, 2486, 'Don''t Stop The Music (Jody den Broeder Big Room Mix)', 635, NULL, 0),
(2570, 2488, 'SOS (Radio Edit)', 240, NULL, 0),
(2571, 2489, 'Shut Up and Drive (The Wideboys Club Mix)', 396, NULL, 0),
(2572, 2494, 'We Ride (No Hi Hat)', 236, NULL, 0),
(2573, 2496, 'If It''s Lovin'' That You Want (Remix (Radio Edit))', 230, NULL, 0),
(2574, 2503, 'Disturbia (Jody den Broeder Remix)', 298, NULL, 0),
(2575, 2503, 'Disturbia (Craig C''s Master Vocal Mix)', 559, NULL, 0),
(2576, 2504, 'Take a Bow', 275, NULL, 1),
(2577, 2505, 'Uprising', 215, NULL, 0),
(2578, 2506, 'Intro', 22, NULL, 8.5),
(2579, 2507, 'New Born', 363, NULL, 0),
(2580, 2508, 'Sunburn', 273, NULL, 0),
(2581, 2509, 'Supermassive Black Hole', 210, NULL, 0),
(2582, 2510, 'Forced In', 256, NULL, 0),
(2583, 2511, 'Intro', 22, NULL, 0),
(2584, 2512, 'Introduction', 121, NULL, 0),
(2585, 2513, 'Feeling Good', 197, NULL, 0),
(2586, 2514, 'Knights of Cydonia', 367, NULL, 0),
(2587, 2515, 'Unintended', 235, NULL, 0),
(2588, 2516, 'Hysteria', 227, NULL, 0),
(2589, 2517, 'Starlight', 240, NULL, 0),
(2590, 2519, 'Dead Star', 248, NULL, 0),
(2591, 2520, 'Time Is Running Out', 236, NULL, 0),
(2592, 2521, 'Muscle Museum (Radio Edit)', 236, NULL, 0),
(2593, 2521, 'Overdue', 145, NULL, 0),
(2594, 2522, 'Plug In Baby', 218, NULL, 0),
(2595, 2524, 'New Born', 363, NULL, 0),
(2596, 2525, 'Invincible', 300, NULL, 0),
(2597, 2526, 'Bliss', 338, NULL, 9),
(2598, 2527, 'Butterflies and Hurricanes (full length guitar remix)', 302, NULL, 10),
(2599, 2528, 'Map of the Problematique', 258, NULL, 0),
(2600, 2529, 'Host', 256, NULL, 0),
(2601, 2530, 'Cave', 286, NULL, 0),
(2602, 2531, 'Uno (Radio Edit)', 181, NULL, 0),
(2603, 2531, 'Pink Ego Box', 211, NULL, 0),
(2604, 2532, 'Muscle Museum (Radio Edit)', 236, NULL, 0),
(2605, 2533, 'Sunburn (Edit)', 213, NULL, 0),
(2606, 2534, 'Sing For Absolution [Full Length US Remix]', 301, NULL, 0),
(2607, 2535, 'Hysteria', 227, NULL, 5),
(2608, 2536, 'Muscle Museum (1)', 238, NULL, 0),
(2609, 2536, 'Feeling Good', 197, NULL, 0),
(2610, 2537, 'In Your World', 149, NULL, 0),
(2611, 2541, 'Stockholm Syndrome', 297, NULL, 0),
(2612, 2542, 'Space Dementia', 349, NULL, 0),
(2613, 2543, 'Forced In', 256, NULL, 0),
(2614, 2544, 'Sublime', 255, NULL, 1),
(2615, 2544, 'Luster', 181, NULL, 1),
(2616, 2544, 'Believe', 144, NULL, 5),
(2617, 2544, 'Faces', 208, NULL, 6),
(2618, 2547, 'Hyper Music', 203, NULL, 0),
(2619, 2548, 'Feeling Good [HAARP]', 219, NULL, 10),
(2620, 2552, 'Unintended', 235, NULL, 0),
(2621, 2553, 'Spiral Static', 284, NULL, 0),
(2622, 2554, 'Born to Die', 286, NULL, 10),
(2623, 2556, 'Ride (SOHN Remix)', 313, NULL, 0),
(2624, 2556, 'Ride (MJ Cole Remix)', 356, NULL, 0),
(2625, 2556, 'Ride (Eli Escobar Remix)', 473, NULL, 0),
(2626, 2556, 'Ride (14th Remix)', 223, NULL, 0),
(2627, 2556, 'Ride (Wes James Remix)', 261, NULL, 0),
(2628, 2556, 'Ride (James Lavelle Remix - Lyla''s Surprise)', 495, NULL, 0),
(2629, 2557, 'Ride', 289, NULL, 0),
(2630, 2557, 'American', 249, NULL, 0),
(2631, 2557, 'Cola', 261, NULL, 0),
(2632, 2558, 'Blue Velvet', 159, NULL, 9),
(2633, 2559, 'Blue Jeans (Smims & Belle Remix)', 182, NULL, 10),
(2634, 2560, 'Video Games (Club Clique For The Bad Girls Remix)', 298, NULL, 0),
(2635, 2561, 'Summertime Sadness (Cedric Gervais Vocal Down Mix)', 414, NULL, 0),
(2640, 2565, 'test track', 4545, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Password` text NOT NULL,
  `UserName` text NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Password`, `UserName`, `admin`) VALUES
(9, '83f9a48b249a84010cde40ac3a1bd0bfd8e5ec04b3254016937563dd2d05651dbdf1dd8a427619e85aa6cff5f0ea9ce1a51fa0975ca6fc14d2bcc3db78bdeb4c', '098f6bcd4621d373cade4e832627b4f6', 1),
(10, 'fc8c9195e74de9ac2376c1879b5499c468fc5b6889f522668a156e31383b450757c00d0f5aeddc1a4dfb38d41241b833f5de521c643a58a55128e25104379bca', 'a92ac147c03b4c222cab4f9ea0440075', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`GenreID`) REFERENCES `genre` (`GenreID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `artist_album`
--
ALTER TABLE `artist_album`
  ADD CONSTRAINT `artist_album_ibfk_3` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`ArtistID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `artist_album_ibfk_4` FOREIGN KEY (`AlbumID`) REFERENCES `album` (`AlbumID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_2` FOREIGN KEY (`AlbumID`) REFERENCES `album` (`AlbumID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
