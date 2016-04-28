drop database if exists Shop;
create database Shop;
use Shop;


DELIMITER $$

DROP PROCEDURE IF EXISTS `login`$$
CREATE DEFINER= `root`@`localhost` PROCEDURE `login`(in usernamein varchar(30), in passwordin varchar(32))
BEGIN 
     SELECT * FROM Member WHERE userName = usernamein AND password = passwordin;
END$$

DELIMITER ; 

/* MEMBER TABLE */


create table member(
memberId int(20) not null AUTO_INCREMENT,
userName varchar(20) not null,
password varchar(32) not null,
firstName varchar(20) not null,
lastName varchar(20) not null,
email varchar(40) not null,
memberImage LONGBLOB,
securityQuestionAnswer varchar(500) not null,
isAdmin boolean,
primary key(memberId))ENGINE=INNODB;

Insert into `member`(`memberId`, `firstName`, `lastName`,`userName`, `password` ,`email` ,`memberImageUrl`,`securityQuestionAnswer`,`isAdmin`) values
(1, 'Bob', 'McGinty','Bob123', '5f4dcc3b5aa765d61d8327deb882cf99', 'ash@yahoo.net', 'Libraries/Pictures/holiday.jpg','spot',true),
(3, 'john', 'Rock','john1', '5f4dcc3b5aa765d61d8327deb882cf99','ash@hotmail.com', 'Libraries/Pictures/holiday.jpg','twinkle',false),
(4, 'aisling', 'stafford','ashstaff', '5f4dcc3b5aa765d61d8327deb882cf99','ashs@yahoo.com', 'Libraries/Pictures/holiday.jpg','reilly',true);


/* PRODUCTS TABLE */

create table product(
productId int(20) not null  AUTO_INCREMENT,
productImageUrl varchar(500),
productName varchar(100) not null,
productPrice decimal(20) not null,
quantityInStock int(50) not null,
category varchar(20) not null, 
primary key(productId));

Insert into `product`(`productId`, `productImageUrl`, `productName`, `productPrice`,`quantityInStock`,`category`) values
(1,'images/IMG_starwars1.jpg','STAR WARS DROIDS YOURE LOOKING FOR GIRLS T-SHIRT',20.00,2,'Star Wars'),
(2,'images/IMG_starwars2.jpg','STAR WARS R2-D2 MEDIUM SLOUCH BACKPACK',25.00,5,'Star Wars'),
(3,'images/IMG_starwars3.jpg','FUNKO STAR WARS C-3PO LIMITED EDITION VINYL FIGURE',50.00,10,'Star Wars'),
(4,'images/IMG_starwars4.jpg','STAR WARS COMIC COVER T-SHIRT',20.00,13,'Star Wars'),
(5,'images/IMG_starwars5.jpg','STAR WARS R2-D2 PATENT DOME BAG',50.00,12,'Star Wars'),

(6,'images/IMG_doctorwho1.jpg','DOCTOR WHO TARDIS HOODY',30.00,4, 'Doctor Who'),
(7,'images/IMG_doctorwho2.jpg','FOURTH DOCTOR STRIPED GIRLS CARDIGAN',40.00,20, 'Doctor Who'),
(8,'images/IMG_doctorwho3.jpg','DOCTOR WHO TRUST ME IM THE DOCTOR T-SHIRT',25.00,60, 'Doctor Who'),
(9,'images/IMG_doctorwho4.jpg','DOCTOR WHO KEEP CALM ALLONS-Y T-SHIRT',20.00,30, 'Doctor Who'),
(10,'images/IMG_doctorwho5.jpg','FUNKO DOCTOR WHO POCKET POP! ELEVENTH DOCTOR KEY CHAIN',05.00,50, 'Doctor Who'),

(11,'images/IMG_marvel3.jpg','MARVEL AVENGERS: AGE OF ULTRON CAPTAIN AMERICA T-SHIRT',20.00,50, 'Marvel'),
(12,'images/IMG_marvel4.jpg','MARVEL BLACK WIDOW GIRLS COSTUME T-SHIRT',22.00,38, 'Marvel'),
(13,'images/IMG_marvel5.jpg','MARVEL COMIC PANELS GIRLS PULLOVER TOP',25.00,40, 'Marvel'),
(14,'images/IMG_marvel1.jpg','MARVEL GUARDIANS OF THE GALAXY ROCKET RACCOON KEY CHAIN',5.00,20,'Marvel'),
(15,'images/IMG_marvel2.jpg','MARVEL AVENGERS ASSEMBLE CAPTAIN AMERICA SHIELD WOVEN TAPESTRY THROW',30.00,20, 'Marvel'),

(16,'images/IMG_DC1.jpg','DC COMICS SUPERBOY HOODIE',40.00,2, 'DC'),
(17,'images/IMG_DC2.jpg','DC COMICS HARLEY QUINN CARDIGAN',44.00,15, 'DC'),
(18,'images/IMG_DC3.jpg','DC COMICS BATMAN VARSITY GIRLS PULLOVER TOP',28.00,11, 'DC'),
(19,'images/IMG_DC4.jpg','BATMAN: THE ANIMATED SERIES THE JOKER CREW PULLOVER',36.00,15, 'DC'),
(20,'images/IMG_DC5.jpg','DC COMICS BATMAN GUYS PAJAMA PANTS',15.00,2, 'DC'),

(21,'images/IMG_disney1.jpg','DISNEY VILLAINS CHARACTERS T-SHIRT',20.00,16, 'Disney'),
(22,'images/IMG_disney3.jpg','DISNEY TOY STORY WOODY POP ART T-SHIRT',21.00,20, 'Disney'),
(23,'images/IMG_disney4.jpg','DISNEY LILO & STITCH ALOHA GIRLS T-SHIRT',23.00,21, 'Disney'),
(24,'images/IMG_disney5.jpg','DISNEY BEAUTY AND THE BEAST BELLE & BEAST GIRLS PULLOVER TOP',35.00,25, 'Disney'),
(25,'images/IMG_disney2.jpg','DISNEY LILO & STITCH STITCH & SCRUMP FACES PILLOWCASE SET',12.00,20, 'Disney'),

(26,'images/IMG_TWD1.jpg','THE WALKING DEAD DARYL DIXON PORTRAIT BANNER',13.00,23, 'The Walking Dead'),
(27,'images/IMG_TWD2.jpg','THE WALKING DEAD DARYL ARROW HEART GIRLS T-SHIRT',25.00,25, 'The Walking Dead'),
(28,'images/IMG_TWD3.jpg','THE WALKING DEAD DARYL RIOT T-SHIRT',20.00,21, 'The Walking Dead'),
(29,'images/IMG_TWD4.jpg','FUNKO THE WALKING DEAD POP! MICHONNE VINYL FIGURE',10.00,32, 'The Walking Dead'),
(30,'images/IMG_TWD5.jpg','THE WALKING DEAD CHIBI CHARACTERS NO-SHOW SOCKS',11.00,28, 'The Walking Dead'),

(31,'images/IMG_GOT1.jpg','GAME OF THRONES 4-PIECE HOLIDAY ORNAMENT SET',18.00,21, 'Game of Thrones'),
(32,'images/IMG_GOT2.jpg','GAME OF THRONES TARGARYEN BANNER T-SHIRT',20.00,12, 'Game of Thrones'),
(33,'images/IMG_GOT3.jpg','GAME OF THRONES THE NORTH REMEMBERS T-SHIRT',20.00,23, 'Game of Thrones'),
(34,'images/IMG_GOT4.jpg','GAME OF THRONES: A POP-UP GUIDE TO WESTEROS BOOK',50.00,27, 'Game of Thrones'),
(35,'images/IMG_GOT5.jpg','GAME OF THRONES LANNISTER BANNER',15.00,27, 'Game of Thrones'),

(36,'images/IMG_HP3.jpg','FUNKO HARRY POTTER POP! DRACO MALFOY (QUIDDITCH) VINYL FIGURE',12.00,20, 'Harry Potter'),
(37,'images/IMG_HP4.jpg','HARRY POTTER RAVENCLAW GIRLS CARDIGAN',45.00,12, 'Harry Potter'),
(38,'images/IMG_HP1.jpg','HARRY POTTER HOGWARTS GUYS PAJAMA PANTS',15.00,19, 'Harry Potter'),
(39,'images/IMG_HP2.jpg','HARRY POTTER GRYFFINDOR GUYS PAJAMA PANTS',16.00,19, 'Harry Potter'),
(40,'images/IMG_HP5.jpg','FUNKO HARRY POTTER POP! HARRY POTTER (TRIWIZARD TOURNAMENT) VINYL FIGURE',10.00,29, 'Harry Potter'),

(41,'images/IMG_HG1.jpg','THE HUNGER GAMES: MOCKINGJAY GRAFFITI GIRLS V-NECK T-SHIRT',12.00,21, 'The Hunger Games'),
(42,'images/IMG_HG2.jpg','THE HUNGER GAMES MOCKINGJAY PIN',12.00,10, 'The Hunger Games'),
(43,'images/IMG_HG3.jpg','THE HUNGER GAMES: MOCKINGJAY PART 2 REVOLUTION T-SHIRT',20.00,25, 'The Hunger Games'),
(44,'images/IMG_HG4.jpg','THE HUNGER GAMES: MOCKINGJAY FLEECE THROW',18.00,17, 'The Hunger Games'),
(45,'images/IMG_HG5.jpg','THE HUNGER GAMES: MOCKINGJAY REVOLUTION GIRLS T-SHIRT',19.00,37, 'The Hunger Games'),

(46,'images/IMG_pokemon1.jpg','POKEMON EEVEE EVOLUTION CHARACTERS GIRLS RAGLAN',25.00,22,'Pokemon'),
(47,'images/IMG_pokemon2.jpg','POKEMON TRAINER POKEBALL EMBROIDERED BEANIE',11.00,50,'Pokemon'),
(48,'images/IMG_pokemon3.jpg','POKEMON STARTERS GUYS PAJAMA PANTS',16.00,10,'Pokemon'),
(49,'images/IMG_pokemon4.jpg','POKEMON TCG XY-BREAK POINT WAVE SLASHER THEME DECK',20.00,15,'Pokemon'),
(50,'images/IMG_pokemon5.jpg','POKEMON PIKACHU 8" PLUSH',15.00,19,'Pokemon'),

(51,'images/IMG_supern1.jpg','FUNKO SUPERNATURAL POP! TELEVISION SAM VINYL FIGURE',10.00,20,'Supernatural'),
(52,'images/IMG_supern2.jpg','SUPERNATURAL SAM & DEAN BODY PILLOW',35.00,45,'Supernatural'),
(53,'images/IMG_supern3.jpg','SUPERNATURAL THE ROAD SO FAR IPHONE 6 CASE',10.00,30,'Supernatural'),
(54,'images/IMG_supern4.jpg','SUPERNATURAL CASTIEL GUYS PAJAMA PANTS',16.00,23,'Supernatural'),
(55,'images/IMG_supern5.jpg','FUNKO SUPERNATURAL POCKET POP! SAM KEY CHAIN',050.00,19,'Supernatural');





/* SALES RECEIPT TABLE */

create table salesReceipt(
receiptId int (20) not null AUTO_INCREMENT,
dateOrdered date,
totalPrice double(20,2) not null,
memberId int(20) not null,
paymentType varchar(30) not null,
primary key(receiptId),
foreign key(memberId) references member(memberId)on delete cascade on update cascade) ENGINE=INNODB;


insert into `salesReceipt` (`receiptId`, `dateOrdered`, `totalPrice`, `memberId`, `paymentType`) values
(1, '2015-05-23', 120.00, 1, 'card'),
(2, '2013-04-02', 60.00, 3, 'card'),
(3, '2014-02-08', 70.00, 4,'card');





/* ORDER ITEM TABLE */

create table orderItem(
productId int(7) not null,
receiptId int(7) not null,
price double(20,2) not null,
quantity int(7) not null,
primary key(productId,receiptId),
foreign key(productId) references product(productId)on delete cascade on update cascade, 
foreign key(receiptId) references salesReceipt(receiptId)on delete cascade on update cascade) ENGINE=INNODB;


insert into `orderItem` (`productId`, `receiptId`, `price`, `quantity`) values
(18, 1, 21.00, 5),
(10, 3, 22.00, 10),
(28, 3, 50.00, 3),
(28, 1, 50.00, 3),
(10, 2, 100.00, 6);


/* ADMINLOG TABLE */

CREATE TABLE adminLog(
messageId INT(20) AUTO_INCREMENT,
message VARCHAR(20),
messageTime TIMESTAMP,
details varchar (50) NOT NULL,
PRIMARY KEY(messageId));

/* TRIGGERS */

DROP TRIGGER IF EXISTS `AdminChangesMemberDelete`;
CREATE TRIGGER `AdminChangesMemberDelete` AFTER DELETE ON member
FOR EACH ROW
INSERT INTO adminlog Values(messageId,'Member Deleted', CURRENT_TIMESTAMP,old.userName);

DROP TRIGGER IF EXISTS `AdminChangesProductDelete`;
CREATE TRIGGER `AdminChangesProductDelete` AFTER DELETE ON product
FOR EACH ROW
INSERT INTO adminlog Values(messageId,'Product Deleted', CURRENT_TIMESTAMP,old.productName);

DROP TRIGGER IF EXISTS `AdminChangesProductEdit`;
CREATE TRIGGER `AdminChangesProductEdit` AFTER UPDATE ON product
FOR EACH ROW
INSERT INTO adminlog Values(messageId,'Product Edited',CURRENT_TIMESTAMP,old.productId);

DROP TRIGGER IF EXISTS `AdminChangesAddAdmin`;
CREATE TRIGGER `AdminChangesAddAdmin` AFTER UPDATE ON member
FOR EACH ROW
INSERT INTO adminlog Values(messageId,'Admin Added', CURRENT_TIMESTAMP,old.email);


/* ADDRESS TABLE */

CREATE TABLE address(
addressId int(20) not null AUTO_INCREMENT,
memberId int(20) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50),
city varchar(25) not null,
country varchar(30) not null,
primary key(addressId),
foreign key(memberId) references member(memberId)on delete cascade on update cascade)ENGINE=INNODB;

insert into `address` (`addressId`, `memberId`, `addressLine1`, `addressLine2`,`city`, `country`) values
(1, 3, '20 harvest way', 'dublin rd','Dundalk','Ireland'),
(2, 3, '5 wheaton hall', 'chord rd','Drogheda','Ireland'),
(3, 4, '56 rosevale', 'dublin rd','Drogheda','Ireland');

