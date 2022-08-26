CREATE DATABASE IF NOT EXISTS grubhub;

USE grubhub;

-- ALTER TABLE Customer MODIFY Address_Line_1 VARCHAR(255) NOT NULL;
-- ALTER TABLE Customer MODIFY Address_Line_2 VARCHAR(255) NOT NULL;
-- ALTER TABLE Customer MODIFY Phone_Number VARCHAR(20) DEFAULT NULL;

-- ALTER TABLE Resteraunt MODIFY Address_Line_1 VARCHAR(255) NOT NULL;
-- ALTER TABLE Resteraunt MODIFY Address_Line_2 VARCHAR(255) NOT NULL;
-- ALTER TABLE Resteraunt MODIFY Phone_Number VARCHAR(20) DEFAULT NULL;


CREATE TABLE IF NOT EXISTS Customer (
  Customer_ID INT NOT NULL auto_increment,
  First_Name VARCHAR(15) NOT NULL,
  Last_Name VARCHAR(15) NOT NULL,
  Address_Line_1 VARCHAR(10) NOT NULL,
  Address_Line_2 VARCHAR(10) DEFAULT NULL,
  Phone_Number VARCHAR(10) NOT NULL,
  Payment_ID VARCHAR(10) NOT NULL,
  PRIMARY KEY (Customer_ID)
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS Resteraunt (
  Resteraunt_ID INT NOT NULL auto_increment,
  Name VARCHAR(15) NOT NULL,
  Cuisine VARCHAR(15) NOT NULL,
  Payment_ID VARCHAR(10) NOT NULL,
  Address_Line_1 VARCHAR(10) NOT NULL,
  Address_Line_2 VARCHAR(10) DEFAULT NULL,
  Phone_Number VARCHAR(10) NOT NULL, 
  PRIMARY KEY (Resteraunt_ID)
)AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS Driver (
  Driver_ID INT NOT NULL auto_increment,
  Cust_ID INT DEFAULT NULL,
  Rest_ID INt DEFAULT NULL,
  First_Name VARCHAR(255) NOT NULL,
  Last_Name VARCHAR(255) NOT NULL,
  Phone_Number VARCHAR(20) NOT NULL,
  Licsence_Plate VARCHAR(20) NOT NULL,
  Drivers_License VARCHAR(20) NOT NULL,
  Payment_ID VARCHAR(15) NOT NULL,
  Drivers_Status VARCHAR(15) NOT NULL,
  Order_Date DATETIME DEFAULT NULL,
  Order_Status VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (Driver_ID),
  FOREIGN KEY (Cust_ID) REFERENCES Customer(Customer_ID),
  FOREIGN KEY (Rest_ID) REFERENCES Resteraunt(Resteraunt_ID)
)AUTO_INCREMENT=1;

INSERT INTO Customer (First_Name,Last_Name,Address_Line_1,Address_Line_2,Phone_Number,Payment_ID)
VALUES
("April", "Ludgate","123 S 55 Ave","Omaha, NE 68132","402-553-4397","23456"),
("April", "Ludgate","123 S 55 Ave","Omaha, NE 68132","402-553-4397","23456"),
("Leslie","Knope","4387 Waffles Drive","Pawnee, IN 46011","234-432-5437","98754"),
("Ron","Swanson","987 Bacon Avenue","Pawnee, IN 46011","456-987-3265","234789"),
("Andy","Dwyer","2468 The Pit","Pawnee, IN 46011",DEFAULT,"12390");

INSERT INTO Resteraunt (Name,Cuisine,Payment_ID,Address_Line_1,Address_Line_2,Phone_Number)
VALUES
("Paunch Burger","Fast food","4826","6872 Lard Lane","Pawnee, IN 46011","678-893-1568"),
("Paunch Burger","Fast food","4826","6872 Lard Lane","Pawnee, IN 46011","678-893-1568"),
("JJ's Diner","Breakfast","78623","23428 Main St.","Pawnee, IN 46011","456-987-3185"),
("Mulligan's","Steakhouse","48623","6876 Classy Rd.","Indianapolis, IN 46077","786-235-4862"),
("JJ's Diner","Breakfast","78623","23428 Main St."," Pawnee, IN 46011","456-987-3185");

INSERT INTO Driver (Cust_ID,Rest_ID,First_Name,Last_Name,Phone_Number,Licsence_Plate,Drivers_License,Payment_ID,Drivers_Status,Order_Date,Order_Status)
VALUES
(1,1,"Henry","Roth","(286) 937-2250","IUC989","C04790049","444862","active","2020-09-30 18:44:00","out"),
(2,2,"Charity","Osborne","(815) 605-0336","REW222","D89973937","959227","active","2020-09-30 22:44:00","placed"),
(3,3,"Fritz","Macias","(943) 893-6193","XUA177","U06119817","718371","active","2020-09-30 22:54:00","fulfilled"),
(4,4,"Brenden","Hill","(513) 284-9064","IOL455","X22173227","334452","active","2020-09-30 22:46:00","placed"),
(5,5,"Henry","Roth","(286) 937-2250","IUC989","C04790049","444862","active","2020-09-30 23:44:00","cancelled"),
(DEFAULT,DEFAULT,"Leah","Peters","(909) 477-8843","AJA879","V44276914","603268","inactive",DEFAULT,DEFAULT);