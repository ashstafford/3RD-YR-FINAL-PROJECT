drop database if exists Shop;
create database Shop;
use Shop;

create table member(
memberId int(20) not null AUTO_INCREMENT,
firstName varchar(20) not null,
lastName varchar(20) not null,
userName varchar(20) not null,
password varchar(20) not null,
email varchar(40) not null,
memberImageUrl varchar(500) not null,
isAdmin boolean,
primary key(memberId))ENGINE=INNODB;

create table product(
productId int(20) not null,
productImageUrl varchar(500),
productName varchar(100) not null,
productPrice int(20) not null,
quantityInStock int(50) not null,
category varchar(20) not null, 
primary key(productId));

create table salesReceipt(
receiptId int (20) not null AUTO_INCREMENT,
dateOrdered date,
totalPrice double(20,2) not null,
memberId int(20) not null,
paymentType varchar(30) not null,
primary key(receiptId),
foreign key(memberId) references member(memberId)on delete cascade on update cascade) ENGINE=INNODB;

create table orderItem(
productId int(7) not null,
receiptId int(7) not null,
price double(20,2) not null,
quantity int(7) not null,
primary key(productId,receiptId),
foreign key(productId) references product(productId)on delete cascade on update cascade, 
foreign key(receiptId) references salesReceipt(receiptId)on delete cascade on update cascade) ENGINE=INNODB;

Insert into `product`(`productId`, `productImageUrl`, `productName`, `productPrice`,`quantityInStock`,`category`) values
(1,'IMG_starwars1.jpg','STAR WARS DROIDS YOURE LOOKING FOR GIRLS T-SHIRT',20.00,2,'Star Wars'),
(2,'IMG_starwars2.jpg','STAR WARS R2-D2 MEDIUM SLOUCH BACKPACK',25.00,5,'Star Wars'),
(3,'IMG_starwars3.jpg','FUNKO STAR WARS C-3PO LIMITED EDITION VINYL FIGURE',50.00,10,'Star Wars'),
(4,'IMG_starwars4.jpg','STAR WARS COMIC COVER T-SHIRT',20.00,13,'Star Wars'),

(5,'IMG_doctorwho1.jpg','DOCTOR WHO TARDIS HOODY',30.00,4, 'Doctor Who'),
(6,'IMG_doctorwho2.jpg','FOURTH DOCTOR STRIPED GIRLS CARDIGAN',40.00,20, 'Doctor Who'),
(7,'IMG_doctorwho3.jpg','DOCTOR WHO TRUST ME IM THE DOCTOR T-SHIRT',25.00,60, 'Doctor Who'),
(8,'IMG_doctorwho4.jpg','DOCTOR WHO KEEP CALM ALLONS-Y T-SHIRT',20.00,30, 'Doctor Who'),

(9,'IMG_marvel3.jpg','MARVEL AVENGERS: AGE OF ULTRON CAPTAIN AMERICA T-SHIRT',20.00,50, 'Marvel'),
(10,'IMG_marvel4.jpg','MARVEL BLACK WIDOW GIRLS COSTUME T-SHIRT',22.00,38, 'Marvel'),
(11,'IMG_marvel5.jpg','MARVEL COMIC PANELS GIRLS PULLOVER TOP',25.00,40, 'Marvel'),
(12,'IMG_marvel1.jpg','MARVEL GUARDIANS OF THE GALAXY ROCKET RACCOON KEY CHAIN',5.00,20,'Marvel'),

(13,'../images/IMG_DC1.jpg','DC COMICS SUPERBOY HOODIE',40.00,2, 'DC'),
(14,'IMG_DC2.jpg','DC COMICS HARLEY QUINN CARDIGAN',44.00,15, 'DC'),
(15,'IMG_DC3.jpg','DC COMICS BATMAN VARSITY GIRLS PULLOVER TOP',28.00,11, 'DC'),
(16,'IMG_DC4.jpg','BATMAN: THE ANIMATED SERIES THE JOKER CREW PULLOVER',36.00,15, 'DC'),

(17,'IMG_disney1.jpg','DISNEY VILLAINS CHARACTERS T-SHIRT',20.00,16, 'Disney'),
(18,'IMG_disney3.jpg','DISNEY TOY STORY WOODY POP ART T-SHIRT',21.00,20, 'Disney'),
(19,'IMG_disney4.jpg','DISNEY LILO & STITCH ALOHA GIRLS T-SHIRT',23.00,21, 'Disney'),
(20,'IMG_disney5.jpg','DISNEY BEAUTY AND THE BEAST BELLE & BEAST GIRLS PULLOVER TOP',35.00,25, 'Disney'),

(21,'IMG_TWD1.jpg','THE WALKING DEAD DARYL DIXON PORTRAIT BANNER',13.00,23, 'The Walking Dead'),
(22,'IMG_TWD2.jpg','THE WALKING DEAD DARYL ARROW HEART GIRLS T-SHIRT',25.00,25, 'The Walking Dead'),
(23,'IMG_TWD3.jpg','THE WALKING DEAD DARYL RIOT T-SHIRT',20.00,21, 'The Walking Dead'),
(24,'IMG_TWD4.jpg','FUNKO THE WALKING DEAD POP! MICHONNE VINYL FIGURE',10.00,32, 'The Walking Dead'),

(25,'IMG_GOT1.jpg','GAME OF THRONES 4-PIECE HOLIDAY ORNAMENT SET',18.00,21, 'Game of Thrones'),
(26,'IMG_GOT2.jpg','GAME OF THRONES TARGARYEN BANNER T-SHIRT',20.00,12, 'Game of Thrones'),
(27,'IMG_GOT3.jpg','GAME OF THRONES THE NORTH REMEMBERS T-SHIRT',20.00,23, 'Game of Thrones'),
(28,'IMG_GOT4.jpg','GAME OF THRONES: A POP-UP GUIDE TO WESTEROS BOOK',50.00,27, 'Game of Thrones');

Insert into `member`(`memberId`, `firstName`, `lastName`,`userName`, `password` ,`email` ,`memberImageUrl`, `isAdmin`) values
(1, 'Bob', 'McGinty', 'Bob123', 'password', 'ash@yahoo.net', 'IMG_TWD1.jpg','true'),
(3, 'john', 'Rock', 'john1', 'password','ash@hotmail.com', 'IMG_TWD1.jpg','false'),
(4, 'aisling', 'stafford','ashstaff', 'password','ashs@yahoo.com', 'IMG_TWD1.jpg','true');

insert into `salesReceipt` (`receiptId`, `dateOrdered`, `totalPrice`, `memberId`, `paymentType`) values
(1, 23-05-2015, 120.00, 1, 'card'),
(2, 04-02-2015, 60.00, 3, 'card'),
(3, 04-02-2014, 70.00, 4,'card');

insert into `orderItem` (`productId`, `receiptId`, `price`, `quantity`) values
(18, 1, 21.00, 5),
(10, 2, 22.00, 10),
(28, 3, 50.00, 3);

