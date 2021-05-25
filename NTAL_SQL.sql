drop database Arawak;
create database Arawak;
USE Arawak;

create table users(
	UID integer(40) not null AUTO_INCREMENT,
    username varchar(30),
    fname varchar(30),
    lname varchar(30),
    upassword varchar(30),
    primary key (UID)
);

insert into users values (1, "userone", "userName", "userLast", "userPass");
insert into users values (2, "usertwo", "usertwoName", "usertwoLast", "usertwoPass");
insert into users values (3, "userthree", "userthreeName", "userthreeLast", "userthreePass");
insert into users values (4, "userfour", "userfourName", "userfourLast", "userfourPass");
insert into users values (5, "userfive", "userfiveName", "userfiveLast", "userfivePass");


update users set username = "updatedUser" where UID = 4;
delete from users where UID = 3;


create table user_profile(
	FUID integer(40) not null,
    posts int(255),
    messages int,
    friends int,
    primary key (FUID)
);

insert into user_profile values (1, 3, 76, 133);
insert into user_profile values (2, 6, 6, 1543);
insert into user_profile values (3, 3, 4, 6343);
insert into user_profile values (4, 7, 23, 53);
insert into user_profile values (5, 2, 8, 34);

update user_profile set posts = 0 where FUID = 3;
delete from user_profile where FUID = 5;

create table posts(
	PID integer(40) not null,
	UID integer(40) not null,
    title varchar(30),
    details varchar(30),
    tags varchar(30),
    likes int,
    primary key (PID, UID),
    foreign key (UID) references users (UID)
);

insert into posts values (1, 5, "FivePost", "this is a post one", "tag one", 5);
insert into posts values (2, 2, "TwoPost", "this is a post two", "tag two", 3);
insert into posts values (3, 2, "ThreePost", "this is a post three", "tag three", 5);
insert into posts values (4, 4, "FourPost", "this is a post four", "tag four", 4);
insert into posts values (5, 1, "FivePost", "this is a post five", "tag five", 2);

update posts set tags = "" where PID = 3;
delete from posts where PID = 2;

create table card(
	CAID integer(40) not null,
    company varchar(30),
    c_name varchar(30),
    c_number varchar(30),
    c_exp int,
    c_street varchar(30),
    c_city varchar(30),
    c_state varchar(30),
    c_zip varchar(30),
    primary key (CAID)
);

insert into card values (1, "mastercard", "personOne","5555123412341234", 0121, "123 Main St", "New York", "NY", "10065");
insert into card values (2, "visa", "personTwo", 4200123412341234, 0424, "1023 broad St", "Meza", "AZ", "20312");
insert into card values (3, "visa", "personThree", 4200123412341234, 0325, "123 Country St", "Akron", "OH", "43202");
insert into card values (4, "mastercard", "personFour", 5555123412341234, 0627, "9083 Portland St", "Baton Rouge", "LA", "12394");
insert into card values (5, "amex", "personFive", 3444123412341234, 0223, "23943 French Ave", "Orlando", "FL", "23423");

update card set company = "chase" where CAID = 2;
delete from card where CAID = 5;

create table location(
	LID integer(40) not null,
    longitude varchar(30) not null,
    latitude varchar(30) not null,
	primary key (LID)
);

insert into location values(1, "-1.232198743234",  "2.1234983277463");
insert into location values(2, "1.98348534345",  "-1.345543577463");
insert into location values(3, "1.232198743234",  "-1.1234983277463");
insert into location values(4, "-1.232198743234",  "1.234523452345");
insert into location values(5, "1.76545674567",  "1.9384583495434");

update location set longitude = 0 where LID = 3;
delete from location where LID = 2;

create table ads(
	AID integer(40) not null,
    company varchar(30),
    product varchar(30),
    primary key (AID)
);

insert into ads values (1, "google", "cloud service");
insert into ads values(2, "amazon", "route52");
insert into ads values (3, "facebook", "dating");
insert into ads values (4, "eBay", "headphones");

create table ad_page(
	AID integer(40) not null,
    UID integer(40) not null,
    company varchar(30),
    product varchar(30),
    primary key (UID, AID),
    foreign key (UID) references users (UID),
    foreign key (AID) references ads (AID)
);

insert into ad_page values (1, 4, "google", "cloud service");
insert into ad_page values (2, 2, "amazon", "route52");

create table product(
	PRID integer(40) not null,
    p_name varchar(30),
    p_category varchar(30),
    p_description varchar(30),
    p_price integer(30),
    p_rating integer(5),
    primary key (PRID)
);

insert into product values (1, "dumbells", "weights", "lifting equipment", 35, 4); 
insert into product values (2, "socks", "clothes", "apparel", 5, 3); 
insert into product values (3, "HDMI", "visual", "electronic", 25, 5); 

update product set p_price = 0 where PRID = 3;
delete from product where PRID = 2;

create table orders(
	UID integer(40) not null,
    PRID integer(40) not null,
    CAID integer(40) not null,
    order_date varchar(30),
    quantity integer(40),
    price integer,
    primary key (UID, PRID, CAID),
    foreign key (UID) references users (UID),
    foreign key (PRID) references product (PRID),
    foreign key (CAID) references card (CAID)
);

insert into orders values (1, 3, 1, "03/21/21", 2, 20);
insert into orders values (2, 1, 4, "01/19/20", 12, 75);
insert into orders values (4, 3, 2, "02/11/11", 2, 25);

update orders set quantity = 0 where PRID = 3;
delete from orders where PRID = 2;

create table cart(
	UID integer(40) not null,
    PRID integer(40) not null,
    price integer,
    quantity integer(40),
    primary key (UID, PRID),
    foreign key (UID) references users (UID),
    foreign key (PRID) references product (PRID)
    
);

insert into cart values (1, 1, 35, 3);
insert into cart values (1, 3, 15, 3);
insert into cart values (2, 1, 25, 3);

update cart set price = 0 where PRID = 3;
delete from cart where PRID = 2;

create table user_friends(
	UID integer(40) not null,
    FUID integer(40) not null,
    primary key (UID, FUID),
    foreign key (UID) references users (UID),
    foreign key (FUID) references user_profile (FUID)
);

insert into user_friends values (2, 1);
insert into user_friends values (4, 2);


create table user_location(
	UID integer(40) not null,
    LID integer(40) not null,
    primary key (UID, LID),
    foreign key (UID) references users (UID),
    foreign key (LID) references location (LID)
);

insert into user_location values (2, 4);
insert into user_location values (1, 3);



create table location_ads(
	AID integer(40) not null,
    LID integer(40) not null,
    primary key (AID, LID),
    foreign key (AID) references ads (AID),
    foreign key (LID) references location (LID)
);

insert into location_ads values (3, 1);
insert into location_ads values (1, 4);

create table user_card(
	UID integer(40) not null,
    CAID integer(40) not null,
    primary key (UID, CAID),
    foreign key (UID) references users (UID),
    foreign key (CAID) references card (CAID)
);

insert into user_card values (4, 2);
insert into user_card values (1, 3);





