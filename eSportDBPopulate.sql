-- equipmentType table
INSERT into equipment_Type(equipmentType) 
VALUES 
("Headset"),
("Microphone"),
("PC"),
("Monitor"),
("Chair"),
("Keyboard"),
("Mouse"),
("Mousepad");

-- changes deptDesc data type
alter table department
modify deptDesc varchar(500);

-- Department table
INSERT into department(deptName, deptDesc)
VALUES
("Marketing", "Traditional marketing and advertisement"),
("Finance", "Traditional finance"),
("Accounting", "Traditional accounting"),
("eSports", "Athletes and coaches involved in gaming leagues and tournaments"),
("Content", "Contracted ambassadors that produce social media content (i.e. Twitch streaming)"),
("CEO", "Oversees entire organization"),
("CMO", "Oversees marketing and content departments"),
("CFO", "Oversees finance and accounting departments"),
("COO", "Oversees warehouse and eSports departments"),
("Warehouse", "Manages retrieval and merchandise shipments");

-- Merch_Type table
INSERT Into Merch_Type (MerchType)
VALUES
("Jacket"),
("Sweatpants"),
("Sweatshirt"),
("Jersey"),
("Hat"),
("FannyPack"),
("Magnet"),
("Tumbler"),
("Sweatshirt"),
("Book"),
("Stuffed Animal"),
("Tshirt");

-- Building_Type table
INSERT into Building_Type(buildingType) 
VALUES ("Office"), ("Arena"), ("Warehouse");

-- changes data type for contractDeal
alter table Sponsorship
modify contractDeal DECIMAL(10,2);

-- Sponsorship table
INSERT into Sponsorship(companyName,contractStart,contractEnd,contractDeal)
VALUES
("G-Fuel", "2020-01-25", "2025-01-25", 13600473.00),
("Logitech", "2020-03-09", "2025-03-09", 34878273.00),
("Intel", "2020-08-13", "2025-08-13", 21578148.00),
("HyperX", "2020-09-17", "2025-09-17", 16719976.00),
("Twitch", "2020-12-06", "2025-12-06", 19133838.00),
("Red Bull", "2021-04-05", "2026-04-05", 20000000.00),
("Razer", "2021-05-29", "2026-05-29", 15467093.00),
("Honda", "2021-08-02", "2026-08-02", 14912645.00),
("SecretLab", "2021-09-20", "2026-09-20", 12731322.00),
("Alienware", "2022-03-05", "2027-03-05", 19759925.00),
("Coca-Cola", "2022-03-18", "2027-03-18", 19197707.00),
("HP", "2022-08-10", "2027-08-10", 19740176.00);

-- changes cAddress data type
alter table Customer
modify cAddress varchar(100);

-- Customer table
INSERT into Customer (cusFirst,cusLast,cAddress,cCity,cState,cZip,cPhone,cEmail)
VALUES
("Mike","Rotch","51 Curve St","Needham","MA","02491","6176781781","shraykphive@gmail.com"),
("Don","Glover","94 Canterbury Street","Delray Beach","FL","33445","8772414761","theemail@gmail.com"),
("Richard","Johnson","132 Bishop Street","Anchorage","AK","99504","7814440978","dickjohn@gmail.com"),
("Misha","Vasiljuk","4455 Ashton Lane","Briggs","TX","78608","2547176760","vladshootin@gmail.com"),
("Mihailos","Vaselene","4588 Village View Drive","Fort Myers","FL","33901","4072769518","okokokok@gmail.com"),
("Goldlewis","Dickinson","3534 Woodland Terrace","Sacramento","CA","95815","9169250865","thunderbird@gmail.com"),
("Sol","Badguy","4751 Winifred Way", "Anderson","IN","46016","2604502294","junkdog@gmail.com"),
("Kabir","Bardai","554 Heritage Road","Fresno","CA","93721","2093639678","kbardai@unh.edu"),
("Tim","Murphy","52 Curve Street","Wellesely","MA","02496","6174248131","tmurphy@unh.edu"),
("Ian","Mackey","1039 Bailey Drive","Iowa City","IA","52240","3193583237","imackey@hotmail.com"),
("Von","Lindenthal","160 Ash Street","Dallas","TX","75207","9728272077","vonnyvon@gmail.com"),
("Christina","Kennedy","2165 Amethyst Drive","Adrian","MI","49221","2145625550","bibble@gmail.com");

-- Vendor table
Insert Into Vendor (vendorName,vAddress,vCity,vState,vZip,vContactFirst,vContactLast,vContactNum,vContactEmail)
VALUES
("Happy","1150 Douglas Pike","Smithfield","RI","02917","Frank","Stephens","9143854900","fstephens@gmail.com"),
("Apple","50 Santiorium Road","Pomona","NY","19064","Steve","Adams","8454995670","sadams@gmail.com"),
("Cat","131 Aviation Way","Los Angeles","CA","90071","Bob","Hill","8123334030","bhill@yahoo. com"),
("Orange","3041 Duff Avenue","Brattleberro","VT","05301","Jill","Dill","9143808990","jfill@yahoo.com"),
("Coffee","4801 Chatham Way","Washington","MD","20200","Adam","Ryans","2405284020","aryan@hushmail.me"),
("Water","4129 Cessna Drive","Plymouth","ID","46523","Alex","Varin","2603504185","avarin@optonline.net"),
("Watch","50 Reya Drive","Malbury","MA","90394","Maeve","Ross","3178304899","mross12@yahoo.com"),
("Tank","3625 Station Street","Austin","TX","78756","Paige","Frank","5122083313","1Paigef@gmail.com"),
("Blue","38 Newbury Street","Boston","MA ","29844","Nick","Whalen","6822011495","nwhalen34@gmail.com"),
("Providence","13 Alice Drive","Danbury","CT","90403","Sam","Brian","9123408530","Samuel34@yahoo.com"),
("League","348 Sherwood Avenue","Nanuet","NY","10954","Kayla","Fraiser","9014832911","3748Fraiser@hushmail.me"),
("Legend","69 Ashwood Drive","Kalamazoo","MI","48990","Amanda","Stein","2403924902","astein@gmail.com");

-- Building table
INSERT into building(buildingName, bAddress, bCity, bState, bZip, buildingTypeID)
VALUES ("BryantESports HQ", "235 Promenade Street", "Providence", "RI", "02908", 1),
("BryantESports Arena", "1 La Salle Square", "Providence", "RI", "02903", 2),
("BryantESports Warehouse", "1 Weingeroff Boulevard", "Cranston", "RI", "02910", 3);

-- changes reportsTo to allow null
alter table employee
modify column reportsTo INT NULL;

-- changes buildingID to allow null
alter table employee
modify column buildingID INT NULL;

-- C-Suite into Employee table
INSERT into employee(empFirst, empLast, joinDate, exitDate, salary, eAddress, eCity, eState, eZIP, deptID, reportsTo, buildingID)
VALUES
("Mark", "Hoye", "2020-01-01", NULL, 761483, "4469 Winding Way", "East Providence", "RI", "02914", 6, NULL, 1);

INSERT into employee(empFirst, empLast, joinDate, exitDate, salary, eAddress, eCity, eState, eZIP, deptID, reportsTo, buildingID)
VALUES
("Amanda", "Cesario", "2020-01-01", NULL, 392664, "2549 Diamond Cove", "Woonsocket", "RI", "02895", 8, 1 ,1),
("Samuel", "Louback", "2020-01-01", NULL, 380845, "3532 Crummit Lane", "Providence", "RI", "02908", 7, 1, 1),
("Janaye", "Ferrante", "2020-01-01", NULL, 403267, "2603 Valley View Drive", "Cambridge", "MA", "02141", 9, 1, 1);

-- Managers into Employee table
INSERT into employee(empFirst, empLast, joinDate, exitDate, salary, eAddress, eCity, eState, eZIP, deptID, reportsTo, buildingID)
VALUES
("Daniel", "Bailey", "2020-01-01", NULL, 125728, "256 Central Pike", "Scituate", "RI", "02857", 2, 2, 1),
("Vianne", "Shao", "2020-02-03", NULL, 147671, "244 Blackrock Road", "Coventry" ,"RI", "02816", 1, 3, 1),
("Thomas", "Clancy", "2020-02-03", NULL, 136373, "554 E Main Road", "Middletown", "RI", "02842", 4, 4, 2),
("Matthew", "Walsh", "2020-02-15", NULL, 147129, "6 Rose Circle", "Danvers", "MA", "01923", 3, 4, 2),
("Carter", "Santin", "2020-03-07", NULL, 129866, "1266 Broad Street", "Providence", "RI", "02905", 3, 2, 1),
("Chase", "Donnelly", "2020-05-27", NULL, 120327, "14 Woodridge Road", "Milford", "MA", "01757", 10, 4, 3);

-- General employees into Employee table
INSERT into employee(empFirst, empLast, joinDate, exitDate, salary, eAddress, eCity, eState, eZIP, deptID, reportsTo, buildingID)
VALUES
("Rachell", "Hofstetter", "2020-06-09", "2021-06-08", 98639, "4 Linda Road", "Collierville", "TN", "38017", 5, 6, NULL),
("Jeremy", "Wang", "2020-06-30", NULL, 80285, "52 Cobblestone Avenue", "Los Banos", "CA", "93635", 5, 6, NULL),
("Michelle", "Glinski", "2020-07-15", NULL, 73732, "31 Remington Farm Drive", "Coventry", "RI", "02816", 1, 6, 1),
("Cole", "Dormady", "2020-07-29", NULL, 78448, "24 Sweetwater Drive", "Coventry", "RI", "02816", 3, 9, 1),
("Marcus", "Jobs", "2020-08-14", NULL, 68575, "1301 Atwood Avenue", "Johnston", "RI", "02891", 1, 6, 1),
("Leah", "Brennan", "2020-09-14", NULL, 66566, "200 Heroux Boulevard", "Cumberland", "RI", "02864", 10, 10, 3),
("Peter", "Yiliang", "2020-10-10", NULL, 95270, "684 Ann Lane", "Fairfield", "CT", "06824", 5, 6, NULL),
("Felix", "Lengyel", "2020-10-12", NULL, 77798, "8202 Lawrence Street", "Indiana", "PA", "15701", 5, 6, NULL),
("Pamyla", "Haselton", "2020-10-23", NULL, 91185, "715 S Main Street", "Attleboro", "MA", "02703", 1, 6, 1),
("Adam", "Gawreluk", "2021-02-15", NULL, 67058, "70 Helen Lane", "Melrose", "MA", "02176", 4, 8, 2),
("Kelly", "Robin", "2021-02-16", "2022-03-30", 71995, "731 Central Avenue", "Johnston", "RI", "02919", 2, 5, 1),
("Albert", "Zheng", "2021-03-01", NULL, 92134, "876 Sycamore Street", "Hoffman Estates", "IL", "60169", 5, 6, NULL),
("Aidan", "Gallagher", "2021-03-04", NULL, 77781, "2 Whipple Street", "Coventry", "RI", "02816", 4, 7, 2),
("Tobias", "Cow", "2021-04-17", NULL, 68343, "70 Tiffany Street", "Attleboro", "MA", "02703", 10, 10, 3),
("Drew", "DiFilippo", "2021-05-15", NULL, 85907, "104 Rocky River Street", "Warwick", "RI", "02886", 4, 8, 2),
("Peter", "Holden", "2021-05-20", NULL, 74979, "47 Eben Street", "Milford", "MA", "01757", 2, 5, 1),
("Alexander", "Bean", "2021-06-06", NULL, 95260, "2052 Melm Street", "Providence", "RI", "02908", 4, 8, 2),
("Imane", "Anys", "2021-07-03", NULL, 83804, "4766 Stone Lane", "West Chester", "PA", "19382", 5, 6, NULL),
("Kyedae", "Shmkyo", "2021-07-15", NULL, 98873, "1393 Delaware Avenue", "San Francisco", "CA", "94108", 5, 6, NULL),
("Dantes", "Doenael", "2021-07-28", NULL, 92824, "9366 West Lane", "Tualatin", "OR", "97062", 5, 6, NULL),
("Mikaela", "Dannemiller", "2021-08-04", NULL, 94058, "473 Front Street", "Woonsocket", "RI", "02895", 3, 9, 1),
("Julian", "Farokhian", "2021-08-14", NULL, 84618, "9647 Arrowhead Street", "Meriden", "CT", "06450", 5, 6, NULL),
("Noah", "Marshall", "2021-08-14", NULL, 62714, "114 Clark Street", "New Bedford", "MA", "02740", 4, 7, 2),
("Adam", "Newhall", "2021-08-26", NULL, 76668, "714 Metacom Avenue", "Bristol", "RI", "02809", 4, 7, 2),
("Alyssa", "Gee", "2021-08-31", NULL, 95644, "123 Bryant Avenue", "Smithfield", "RI", "02917", 4, 8, 2),
("Jackson", "Burns", "2021-09-21", NULL, 71752, "128 Dodge Street", "Providence", "RI", "02907", 4, 7, 2),
("Tiffany", "Leung", "2021-10-21", NULL, 73787, "3147 Flat River Road", "Coventry", "RI", "02816", 3, 9, 1),
("Steven", "Zuckerberg", "2021-11-14", "2022-12-03", 84767, "6 West Street", "Westerly", "RI", "02891", 1, 6, 1),
("Jodi", "Lee", "2021-12-05", "2022-07-15", 80505, "122 North Helen Road", "Clover", "SC", "29710", 5, 6, NULL),
("Tyler", "Steinkamp", "2021-12-13", NULL, 82841, "25 Holly Avenue", "Green Cove Springs", "FL", "32043", 5, 6, NULL),
("Frederick", "Otte", "2022-01-04", NULL, 88570, "244 Bowen Street", "Providence", "RI", "02906", 2, 5, 1),
("Joseph", "Harrison", "2022-02-15", NULL, 92771, "24 Mica Avenue", "Cranston", "RI", "02920", 2, 5, 1),
("Steve", "Mushorn", "2022-03-15", NULL, 98627, "7 Bowling Lane", "Bradford", "RI", "02808", 10, 10, 3),
("Aidan", "Travkovenko", "2022-05-15", NULL, 92243, "224 Pocasset Avenue", "Providence", "RI", "02909", 4, 7, 2),
("Keiko", "Chan", "2022-06-03", NULL, 82383, "64 Westchester Drive", "Attleboro", "MA", "02703", 3, 9, 1),
("Christopher", "Bradbury", "2022-06-09", NULL, 60722, "715 Snake Hill Road", "North Scituate", "RI", "02857", 2, 5, 1),
("Zachary", "Cullison", "2022-06-17", NULL, 94191, "2058 Diamond Cove", "Newport", "RI", "02840", 4, 8, 2),
("Caitlin", "Jack", "2022-07-22", NULL, 75160, "636 Eddie Dowling Highway", "North Smithfield", "RI", "02896", 10, 10, 3),
("Hayden", "Smith", "2022-10-19", NULL, 81154, "63 Crapo Street", "New Bedford", "MA", "02740", 10, 10, 3),
("Michael", "Grzesiek", "2022-12-01", NULL, 77200, "88 S. Parker Street", "Bethel Park", "PA", "15102", 5, 6, NULL);

-- Change data type for salary in employee table
alter table employee
modify salary DECIMAL(10,2);

-- Change gameDesc length in Video_Game table
alter table video_Game
modify gameDesc VARCHAR(500);

-- Video_Game table
INSERT INTO Video_Game(gameName, gameDesc) VALUES
("Overwatch 2", "An objective-based team game set in the future where both teams with five unique heroes brawl"),
("League of Legends", "Team-based strategy game where two teams of five powerful champions face off to destroy the other's base"),
("Valorant", "A tactical shooting game involving two teams with 5 players in each team"),
("Tom Clancy's: Raindow Six Siege", "A high-precision, tactical shooter that prioritises careful planning teamwork and finely tuned tactical play"),
("Call of Duty", "A first-person shooter objective-based game"),
("Rocket League", "A fantastical sport-based video game where rocket-powered cars play soccer"),
("Apex Legends", "An online multiplayer battle royale game featuring squads of three players using pre-made characters with distinctive abilities called 'Legends'");

-- League table
INSERT INTO League(leagueName, leagueAbv, gameID) VALUES
("Apex Legends Global Series", "ALGS", 7),
("Overwatch League", "OWL", 1),
("Call of Duty League", "CDL",5),
("League Championship Series", "LCS", 2),
("Rocket League Championship Series", "RLCS", 6),
("Valorant Champions Tour", "VCT", 3),
("Tom Clancy's: Rainbow Six Pro League", "R6PL", 4);

-- Changing data types in Team table
alter table Team modify teamName VARCHAR(45) NULL;
alter table Team modify teamAbv VARCHAR(45) NULL;
alter table Team modify begDate DATE NULL;

-- Team table
INSERT INTO Team(leagueID, teamName, teamAbv, begDate, endDate) VALUES
(1, NULL, NULL, NULL, NULL),
(2,	NULL, NULL, NULL, NULL),
(3,	NULL, NULL, NULL, NULL),
(4, "Bryant Excelsior", "BRXL",'2020-09-06', NULL),
(5, NULL, NULL, NULL, NULL),
(6, NULL, NULL,	NULL, NULL),
(7,	"Bryant Rainbow", "BRR", '2020-09-20', NULL);

-- Coach table
INSERT INTO Coach(coachTag, employeeID, teamID) VALUES
("walshyz", 8, 4),
("TomClancy", 7, 7);

-- Player table
INSERT INTO Player (playerTag, contractStart, contractEnd, contractCost, employeeID, teamID) VALUES
("Shed", '2021-02-15', '2026-03-31', 132418, 20, 7),
("Snakes", '2021-03-04', '2025-12-20', 104690, 23, 7),
("wastingudp12", '2021-05-15', '2026-06-25', 162029, 25, 4),
("eeg", '2021-06-06', '2025-12-20', 44165, 27, 4),
("TSSMB0", '2021-08-14', '2025-12-20', 86640, 33, 7),
("mrmagicswheep", '2021-08-26', '2026-01-08', 33902, 34, 4),
("the8waffles", '2021-08-31', '2026-04-25', 179223, 35, 4),
("Skippy", '2021-09-21', '2025-12-21', 37159, 36, 7),
("Cheesy", '2022-05-15', '2026-11-19', 179970, 44, 7),
("Calzone", '2022-06-17', '2026-08-29', 110487, 47, 4);

-- Alter data type for contractCost to match employee salary
alter table player
modify contractCost DECIMAL(10,2);

-- Content_Creator table
INSERT into Content_Creator(creatorTag,employeeID)
VALUES
("Kyedae",29),
("DisguisedToast",12),
("BoxBox",22),
("QuarterJade",39),
("Shroud",50),
("Valkyrae",11),
("Doaenel",30),
("Tyler1",40),
("Tarzaned",32),
("Doublelift",17),
("xQc",18),
("Pokimane",28);

-- Social_Media table
INSERT into Social_Media(mediaName,mediaAccount)
VALUES
("Instagram","bryantesports"),
("TikTok","bryantesports"),
("Twitter","bryant_esports"),
("Twitch","bryantesports"),
("Facebook","bryantesports");

-- Equipment table 
INSERT into equipment(equipmentDesc,equipmentTypeID,sponsorshipID)
VALUES
("HyperX Cloud II Pro Wired Gaming Headset",1,4),
("Logitech G Pro X",6,2),
("SecretLab Titan Evo 2022 Gaming Chair",5,9),
("Alienware AW2518H",4,10),
("Blue Yeti Microphone",2,NULL),
("Logitech G840",8,2),
("PC",3,12),
("HyperX Alloy FPS Pro",6,4),
("Razer DeathAdder Elite V2",7,7),
("Logitech G x Herman Miller Embody",5,NULL),
("LG 27GN950-B",4,NULL),
("Logitech G Pro X Wireless Headset",1,2);

-- Media_team table
INSERT into Media_Team(mediaID,employeeID)
VALUES
(1,6),
(2,13),
(3,38),
(4,15),
(5,19);


-- Merchandise table
INSERT into Merchandise(merchName,merchDesc, merchBuy,merchSell,qoh,merchtypeID)
VALUES
("Jacket","Bryant Esports Jacket","27.99","59.99","400","1"),
("Teddy Bear","Bryant Stuffed Bear","4.99",	"9.99",	"90","11"),
("T-Shirt","Racing Tshirt","15.99","20.99","600","12"),
("Sweatshirt","Bryant Customizable Sweatshirt","15.99","30.99","103","3"),
("Fannypack","Bryant Fannypack","2.99","17.99","500","6"),
("Sweatpants","Bryant Esports Sweatpants",	"15.99","39.99","901","2"),
("Tumblr","Bryant Esports Tumbler","8.99","19.99","165","8"),
("Magnet","Character magnet","0.89","2.99","257","7"),
("Book","Tell All Book","1.99","16.99","492","10"),
("Jersey","Adidas Pro Jersey","13.99","27.99","387","4"),
("Hat","Adidas Customizable Hat","6.99","12.99","597","5"),
("Sweatshirt","Oversized Adidas Gamer Sweatshirt","16.99","24.99","329","9");

-- Changed platformID to mediaID for consistency
alter table advertisement
rename column platformID to mediaID;

-- Advertisement table
INSERT into Advertisement(mediaID,sponsorshipID,contentCreatorID,merchID)
VALUES
(2,2,12,NULL),
(3,NULL,6,4),
(1,NULL,1,10),
(4,NULL,10,6),
(2,1,5,NULL);

-- Merch_Vendor table
Insert Into Merch_Vendor (merchID,vendorID,qtyOrdered,unitPrice,totalPrice)
VALUES
(1,2,300,20.99,6297),
(2,4,500,8.99,4495),
(3,6,100,30.99,3099),
(4,8,250,29.99,7497.50),
(5,10,90,9.99,899.10),
(6,12,200,17.99,3598),
(7,1,150,8.99,1348.50),
(8,3,384,28.99,1113.60),
(9,5,175,48.99,8573.25),
(10,7,250,38.99,9747.50),
(11,9,100,10.99,1099),
(12,11,450,5.99,2695.50);

-- Order_Detail table
INSERT into order_detail (qtyOrdered,customerID,merchID)
VALUES
(2,3,6),
(1,12,10),
(2,6,7),
(4,7,3),
(1,8,1);

-- Merch_for_Players table
INSERT into merch_for_players (merchID,playerID)
VALUES
(10,1),
(10,2),
(10,3),
(10,4),
(10,5),
(10,6),
(10,7),
(10,8),
(10,9),
(10,10);