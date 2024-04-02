create database ENTERTAINING_TV_CHANNEL;

use ENTERTAINING_TV_CHANNEL;

CREATE TABLE EMPLOYEE (
    Empl_ID varchar(10) NOT NULL,  
    First_name varchar(20),
    Last_name varchar(20),
    Dob date,
    Gender varchar(10),
    EmployeeType varchar(20),
    Email varchar(50) unique,
    No varchar(10),
    Street varchar(20),
    City varchar(20),
    Leads_By varchar(10),
    PRIMARY KEY (Empl_ID)
);

CREATE TABLE CONTACT_NUMBERS_OF_EMPLOYEE (
    Empl_ID varchar(10) NOT NULL,
    Mobile_No VARCHAR(20) NOT NULL unique,
    primary key (Empl_ID,Mobile_No),
    CONSTRAINT fk_empl_mobile FOREIGN KEY (Empl_ID) REFERENCES EMPLOYEE(Empl_ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE JUDGER (
    Judger_ID varchar(10) NOT NULL,
    First_name varchar(20),
    Last_name varchar(20),
    Email varchar(50) unique,
    Dob date,
    Cost float,
    Gender varchar(10),
    PRIMARY KEY (Judger_ID)
);

CREATE TABLE CONTACT_NUMBERS_OF_JUDGER (
    Judger_ID varchar(10) NOT NULL,
    Contact_Number VARCHAR(20) NOT NULL,
    primary key (Judger_ID,Contact_number),
    CONSTRAINT fk_judger_mobile FOREIGN KEY (Judger_ID) REFERENCES JUDGER(Judger_ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE COMPETITOR (
    Com_ID varchar(10) NOT NULL,
    First_name varchar(20),
    Last_name varchar(20),
    Email varchar(50) unique,
    NIC varchar(15) unique,
    Gender varchar(10),
    No varchar(10),
    Street varchar(20),
    City varchar(20),
    PRIMARY KEY (Com_ID)
);

CREATE TABLE CONTACT_NUMBERS_OF_COMPETITOR (
    Com_ID varchar(10) NOT NULL,
    Contact_Number VARCHAR(20) NOT NULL UNIQUE,
    primary key(Com_ID,Contact_number),
    CONSTRAINT fk_competitor_mobile FOREIGN KEY (Com_ID) REFERENCES COMPETITOR(Com_ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE REALITY_SHOW (
    Program_ID varchar(10) NOT NULL,
    Name varchar(20),
    Type varchar(10),
    Broadcast_Date date,
    Broadcast_Time time,
    Round varchar(10),
    Hosted_By varchar(10),
    PRIMARY KEY (Program_ID),
    CONSTRAINT fk_host foreign key (Hosted_By) references employee(Empl_ID)
    ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE JUDGERS_OF_REALITYSHOW(     
JudgerID varchar(10) NOT NULL, 
ShowID varchar(10) NOT NULL,    
PRIMARY KEY (JudgerID, ShowID),     
CONSTRAINT fk_realityshow1 FOREIGN KEY (JudgerID) REFERENCES JUDGER(Judger_ID)
ON DELETE CASCADE ON UPDATE CASCADE,     
CONSTRAINT fk_judger FOREIGN KEY (ShowID) REFERENCES REALITY_SHOW(Program_ID)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE COMPETITORS_OF_REALITYSHOW(     
Com_ID varchar(10) NOT NULL, 
ShowID varchar(10) NOT NULL,    
PRIMARY KEY (Com_ID, ShowID),     
CONSTRAINT fk_realityshow2 FOREIGN KEY (Com_ID) REFERENCES COMPETITOR(Com_ID)
ON DELETE CASCADE ON UPDATE CASCADE,     
CONSTRAINT fk_competitor FOREIGN KEY (ShowID) REFERENCES REALITY_SHOW(Program_ID)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ADVERTIESMENT (
    Ad_ID varchar(10) NOT NULL,
    Ad_Name varchar(50),
    Ad_Type varchar(50),
    Income float,
    Duration varchar(10),
    Checked_By varchar(10),
    PRIMARY KEY (Ad_ID),
    CONSTRAINT fk_ad_empl foreign key (Checked_By) references employee(Empl_ID)
    ON DELETE SET NULL ON UPDATE CASCADE
);


CREATE TABLE ADVERTIESMENTS_OF_REALITYSHOW (
    Program_ID varchar(10) NOT NULL,
    Ad_ID varchar(10) NOT NULL,
    primary key(Program_ID, Ad_ID),
    CONSTRAINT fk_prog_realityshow FOREIGN KEY (Program_ID) REFERENCES REALITY_SHOW(Program_ID)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_ad_realityshow FOREIGN KEY (Ad_ID) REFERENCES ADVERTIESMENT(Ad_ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TV_SERIE (
    Show_ID varchar(10) NOT NULL,
    Name varchar(50),
    Language varchar(50),
    Season int,
    Episode int,
    Duration varchar(10),
    Broadcast_Date date,
    Broadcast_Time time,
    Broadcasts_By varchar(10),
    PRIMARY KEY (Show_ID),
    CONSTRAINT fk_tvserie_broadcast foreign key(Broadcasts_By) references employee(Empl_ID)
    ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE ADVERTIESMENTS_OF_TVSERIE (
    Show_ID varchar(10) NOT NULL,
    Ad_ID varchar(10) NOT NULL,
    primary key(Show_ID,Ad_ID),
    CONSTRAINT fk_ad_tvserie_id FOREIGN KEY (Show_ID) REFERENCES TV_SERIE(Show_ID)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_ad_tvserie_adid FOREIGN KEY (Ad_ID) REFERENCES ADVERTIESMENT(Ad_ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE GENRE_OF_TVSERIE (
    Show_ID varchar(10) NOT NULL,
    Genre varchar(20) NOT NULL,
    primary key(Show_ID,Genre),
    CONSTRAINT fk_genre_tv FOREIGN KEY (Show_ID) REFERENCES TV_SERIE(Show_ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE MOVIE (
    Show_ID varchar(10) NOT NULL,
    Name varchar(50),
    Language varchar(50),
    Duration varchar(10),
    Broadcast_Date date,
    Broadcast_Time time,
    Broadcasts_By varchar(10),
    PRIMARY KEY (Show_ID),
    CONSTRAINT fk_empl_movie foreign key(Broadcasts_By) references employee(Empl_ID)
    ON DELETE SET NULL ON UPDATE CASCADE
);


CREATE TABLE ADVERTIESMENTS_OF_MOVIE (
    Show_ID varchar(10) NOT NULL,
    Ad_ID varchar(10) NOT NULL,
    primary key(Show_ID,Ad_ID),
    CONSTRAINT fk_movie_ad FOREIGN KEY (Show_ID) REFERENCES MOVIE(Show_ID)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_ad_movie FOREIGN KEY (Ad_ID) REFERENCES ADVERTIESMENT(Ad_ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE GENRE_OF_MOVIE (
    Show_ID varchar(10) NOT NULL,
    Genre varchar(20)NOT NULL,
    primary key(Show_ID,Genre),
    CONSTRAINT fk_genre_movie FOREIGN KEY (Show_ID) REFERENCES MOVIE(Show_ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE SPONSER (
    Sponser_ID varchar(10) NOT NULL,
    First_name varchar(20),
    Last_name varchar(20),
    Company_name varchar(30),
    Company_email varchar(50),
    No varchar(10),
    Street varchar(20),
    City varchar(20),
    PRIMARY KEY (Sponser_ID)
);

CREATE TABLE CONTACT_NUMBERS_OF_SPONSER (
    Sponser_ID varchar(10) NOT NULL,
    Contact_Number VARCHAR(20) NOT NULL UNIQUE,
    primary key(Sponser_ID,Contact_number),
    CONSTRAINT fk_sponser_mobile FOREIGN KEY (Sponser_ID) REFERENCES SPONSER(Sponser_ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE SPONSER_OF_ADVERTIESMENTS (
    Sponser_ID varchar(10) NOT NULL,
    Ad_ID varchar(10) NOT NULL,
    primary key(Sponser_ID,Ad_ID),
    CONSTRAINT fk_sponser FOREIGN KEY (Sponser_ID) REFERENCES SPONSER(Sponser_ID)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_ad FOREIGN KEY (Ad_ID) REFERENCES ADVERTIESMENT(Ad_ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ANNUAL_BONUS (
    Empl_ID varchar(10)NOT NULL,
    Date date NOT NULL,
    Value varchar(20),
    PRIMARY KEY (Empl_ID,Date),
    CONSTRAINT fk_empl_bonus FOREIGN KEY (Empl_ID) REFERENCES EMPLOYEE(Empl_ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DEPENDENT (
    Empl_ID varchar(10) NOT NULL,
    DOB date,
    F_Name varchar(20)NOT NULL,
    L_Name varchar(20),
    Relation varchar(20) NOT NULL,
    PRIMARY KEY (Empl_ID,F_Name,Relation),
    CONSTRAINT fk_empl_depe FOREIGN KEY (Empl_ID) REFERENCES EMPLOYEE(Empl_ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO EMPLOYEE (Empl_ID, First_name, Last_name, Dob, Gender, EmployeeType, Email, No, Street, City,Leads_By)
VALUES
    ('E001', 'Saman', 'Kumara', '1990-05-15', 'Male', 'Manager', 'samank@email.com', '45', 'Main St', 'Colombo',null),
    ('E002', 'Rankoth', 'Udawalpola', '1980-05-19', 'Male', 'Program Director', 'Rdwlpla@gmail.com', '267', 'Naulla Rd', 'Colombo', 'E001'),
    ('E003', 'Nisansala', 'Galahena', '1991-08-15', 'Female', 'Presenter', 'nisansg@email.com', '65', 'KalawanaSt', 'Biyagama','E001'),
    ('E004', 'Sarith', 'Eheliyagoda', '1997-07-14', 'Male', 'Producer', 'srith97@gmail.com', '384', 'Egoda Rd', 'Colombo','E006'),
    ('E005', 'Kumari', 'Gunawardhana', '1990-05-15', 'Female', 'Presenter', 'kumariG@gail.com', '47', 'Negombo Rd', 'Colombo','E003'),
    ('E006', 'Saman', 'Kumara', '1998-08-15', 'Male', 'Producer', 'samanka@email.com', '48', 'Main St', 'Biyagama','E001'),
    ('E007', 'Sadamal', 'Kavinda', '1995-12-10', 'Male', 'Program Director', 'sadamalk@email.com', '54', 'Kothalwala Rd', 'Rathmalana','E002');
    
UPDATE EMPLOYEE 
SET First_name = 'Kamal' where empl_ID = 'E001';
UPDATE EMPLOYEE 
SET dob = '1995-12-10' where empl_ID = 'E002';
DELETE FROM EMPLOYEE 
WHERE empl_ID = 'E007';

    
INSERT INTO JUDGER (Judger_ID, First_name, Last_name, Email, Dob, Cost, Gender)
VALUES
    ('J001', 'Athula', 'Adhikari', 'Athulaadhikariofficial@email.com', '1978-09-20', 100000.00, 'Male'),
    ('J002', 'Bathiya', 'Jayakody', 'bathiya@musician.lk', '1973-06-04', 110000.00, 'Male'),
    ('J003', 'Sanuka', 'Wickramasinghe', 'sanuka@musician.lk', '1987-12-22', 95000.00, 'Male'),
    ('J004', 'Umaria', 'Sinhawansa', 'umaria@musician.lk', '1985-11-30', 90000.00, 'Female'),
    ('J005', 'Billy', 'Fernando', 'billy@musician.lk', '1970-08-15', 98000.00, 'Male'),
    ('J006', 'Jagath', 'Weerasinghe', 'JWeerasinghe@gmail.com', '1982-03-14', 85000.00, 'Male'),
    ('J007', 'Senanayake', 'Weraliyadde', 'Weraliyadde@gmail.com', '1990-05-24', 85000.00, 'Male');

UPDATE JUDGER 
SET Email = 'Athulaadhikari@email.com' where Judger_ID = 'J001';
UPDATE JUDGER 
SET dob = '1997-02-10' where Judger_ID = 'J003';
DELETE FROM JUDGER 
WHERE Judger_ID = 'J007';

INSERT INTO COMPETITOR (Com_ID, First_name, Last_name, Email, NIC, Gender, No, Street, City)
VALUES
    ('C001', 'Supun', 'Avishka', 'supunAvi@gmail.com', '98564798875V', 'Male', '84', 'Awissawella Rd', 'Kaduwela'),
    ('C002', 'Nimasha', 'Silva', 'nimashaSilva@gmail.com', '97645321789V', 'Female', '56', 'Galle Rd', 'Colombo'),
	('C003', 'Kasun', 'Fernando', 'kasunFernando@gmail.com', '90234678123V', 'Male', '72', 'Main St', 'Kandy'),
	('C004', 'Sithara', 'Perera', 'sitharaPerera@gmail.com', '85879634127V', 'Female', '38', 'Negombo Rd', 'Negombo'),
	('C005', 'Ajith', 'Ratnayake', 'ajithRatnayake@gmail.com', '77341256980V', 'Male', '45', 'Havelock Rd', 'Jaffna'),
	('C006', 'Dilani', 'Fernando', 'dilaniFernando@gmail.com', '64129785324V', 'Female', '61', 'Gampaha Rd', 'Gampaha'),
    ('C007', 'Dilan', 'Perera', 'dilanperera@gmail.com', '64129785344V', 'Male', '34', 'Ragama Rd', 'Mahabage');

UPDATE COMPETITOR
SET City = 'Kandy' WHERE COM_ID = 'C007';
UPDATE COMPETITOR
SET First_name = 'Dilhani' WHERE NIC = '64129785324V';
DELETE FROM COMPETITOR
WHERE Com_ID = 'C007';


INSERT INTO REALITY_SHOW (Program_ID, Name, Type, Broadcast_Date, Broadcast_Time, Round, Hosted_By)
VALUES
    ('RS001', 'Talent Hunt', 'Music', '2023-09-15', '20:00:00', '04', 'E003'),
    ('RS002', 'Dance Off', 'Dance', '2023-05-10', '19:30:00', '01', 'E005'),
    ('RS003', 'Art Expo', 'Art', '2023-01-25', '20:00:00', '02', 'E005'),
	('RS004', 'Fashion Show', 'Fashion', '2023-04-18', '19:30:00', '03', 'E005'),
	('RS005', 'Comedy Night', 'Comedy', '2023-03-30', '20:00:00', '05', 'E003'),
	('RS006', 'Film Festival', 'Film', '2023-08-22', '19:30:00', '06', 'E003'),
    ('RS007', 'House Wife', 'Family', '2023-03-20', '20:00:00', '01', 'E004');

UPDATE REALITY_SHOW SET Broadcast_Date = '2023-05-15' WHERE Program_ID IN ('RS002');
UPDATE REALITY_SHOW SET Round = '01' WHERE Program_ID IN ('RS005');
DELETE FROM REALITY_SHOW WHERE Program_ID = 'RS007';

INSERT INTO ADVERTIESMENT (Ad_ID, Ad_Name, Ad_Type, Income, Duration, Checked_By)
VALUES
    ('A001', 'Cream Cracker Space', 'Commercial', 5000.00, '30 seconds', 'E002'),
    ('A002', 'Keels', 'Promotion', 3000.00, '45 seconds', 'E002'),
    ('A003', 'Sri Lankan Airlines', 'Promotion', 4500.00, '40 seconds', 'E001'),
	('A004', 'Sunshine Laundry', 'Commercial', 5500.00, '35 seconds', 'E001'),
	('A005', 'Ceylon Tea', 'Promotion', 4000.00, '50 seconds', 'E001'),
	('A006', 'Singer', 'Commercial', 6500.00, '35 seconds', 'E002'),
	('A007', 'Watawala Tea', 'Promotion', 4000.00, '50 seconds', 'E001'),
	('A008', 'Lanka Mobile', 'Commercial', 4800.00, '25 seconds', 'E002');

UPDATE ADVERTIESMENT SET Ad_Name = 'Keels Bonus' WHERE Ad_ID IN ('A002');
UPDATE ADVERTIESMENT SET Income = '6500.00' WHERE Ad_ID IN ('A004');
DELETE FROM ADVERTIESMENT WHERE Ad_ID = 'A008';

INSERT INTO TV_SERIE (Show_ID, Name, Language, Season, Episode, Duration, Broadcast_Date, Broadcast_Time, Broadcasts_By)
VALUES
    ('TS001', 'Prison Break', 'English', 2, 8, '40 minutes', '2023-07-10', '21:00:00', 'E004'),
    ('TS002', 'Loop', 'Spanish', 1, 12, '25 minutes', '2023-06-18', '19:30:00', 'E006'),
    ('TS003', 'Sci-Fi Odyssey', 'Japanese', 1, 14, '55 minutes', '2023-06-30', '18:20:00', 'E006'),
    ('TS004', 'Detective Chronicles', 'German', 2, 15, '50 minutes', '2023-07-25', '22:30:00', 'E006'),
    ('TS005', 'Prison Break', 'English', 2, 9, '40 minutes', '2023-07-17', '21:00:00', 'E004'),
    ('TS006', 'Loop', 'Spanish', 1, 13, '25 minutes', '2023-06-25', '19:30:00', 'E004'),
    ('TS007', 'Sci-Fi Odyssey', 'Japanese', 1, 15, '55 minutes', '2023-07-07', '18:20:00', 'E006');
    
UPDATE TV_SERIE SET Language = 'English Dubbed' WHERE Show_ID = 'TS002';
UPDATE TV_SERIE SET Duration = '50 minutes' WHERE Show_ID IN ('TS007');
DELETE FROM TV_SERIE WHERE Show_ID = 'TS004';

INSERT INTO MOVIE (Show_ID, Name, Language, Duration, Broadcast_Date, Broadcast_Time, Broadcasts_By)
VALUES
    ('M001', 'The Matrix', 'English', '2h 30m', '2023-09-15', '19:00:00', 'E004'),
    ('M002', 'Inception', 'English', '2h 28m', '2023-09-16', '20:30:00', 'E006'),
    ('M003', 'Avatar', 'English', '2h 42m', '2023-09-17', '18:45:00', 'E004'),
    ('M004', 'Pulp Fiction', 'English', '2h 34m', '2023-09-18', '21:15:00', 'E004'),
    ('M005', 'Bad Boys', 'English', '2h 38m', '2023-09-08', '21:15:00', 'E004'),
    ('M006', 'Rush Hour 01', 'English', '2h 15m', '2023-07-18', '21:15:00', 'E006'),
    ('M007', 'The Shawshank Redemption', 'English', '2h 22m', '2023-09-19', '17:30:00', 'E006');

UPDATE MOVIE SET Duration = '2h 25m', Broadcast_Time = '21:00:00' WHERE Show_ID = 'M002';
UPDATE MOVIE SET Language = 'Spanish' WHERE Show_ID = 'M004';
DELETE FROM MOVIE WHERE Show_ID = 'M005';

INSERT INTO SPONSER (Sponser_ID, First_name, Last_name, Company_name, Company_email, No, Street, City)
VALUES
    ('S001','John', 'Doe', 'Sunshine Corporation', 'sunshine@abccorp.com', '45', 'Market St', 'Colombo'),
    ('S002','Jane', 'Smith', 'LankaTech Solutions', 'info@lankatech.lk', '28', 'Tech Park Rd', 'Colombo'),
	('S003','Mike', 'Jones','IslandFoods Ltd', 'info@islandfoods.lk', '36', 'Food Street', 'Kandy'),
	('S004','Peter', 'Brown','Ceylon Builders Pvt Ltd', 'info@ceylonbuilders.com', '53', 'Construction Ave', 'Negombo'),
	('S005','Mary', 'Williams','GreenVista Plc', 'info@greenvista.lk', '41', 'Plantation Rd', 'Nuwara Eliya'),
	('S006','David', 'Green','Oceanic Ventures Pvt Ltd', 'info@oceanicventures.lk', '29', 'Marine Blvd', 'Galle'),
	('S007','Will', 'Robinson','Highlands Pharma Ltd', 'info@highlandspharma.lk', '32', 'Medical Lane', 'Kandy');

UPDATE SPONSER SET First_name = 'Michelle', Last_name = 'Babara' WHERE Sponser_ID = 'S003';
UPDATE SPONSER SET Company_name = 'GreenTech Solutions', Company_email = 'info@greentech.lk' WHERE Sponser_ID = 'S005';
DELETE FROM SPONSER WHERE Sponser_ID = 'S007';

INSERT INTO ANNUAL_BONUS (Empl_ID, Date, Value)
VALUES
    ('E001', '2022-12-31', '10000.00'),
    ('E002', '2022-12-31', '17500.00'),
    ('E003', '2022-08-31', '20000.00'),
    ('E004', '2022-12-11', '18500.00'),
    ('E005', '2022-10-26', '10000.00'),
    ('E006', '2022-03-04', '10000.00');

UPDATE ANNUAL_BONUS SET Value = '12000.00' WHERE Empl_ID = 'E001' AND Date = '2022-12-31';
UPDATE ANNUAL_BONUS SET Value = '11000.00' WHERE Empl_ID = 'E006' AND Date = '2022-03-04';
DELETE FROM ANNUAL_BONUS WHERE Empl_ID = 'E006' AND Date = '2022-10-26';

INSERT INTO DEPENDENT (Empl_ID, DOB, F_Name, L_Name, Relation)
VALUES
    ('E001', '2005-03-02', 'Kamala', 'Perera', 'Wife'),
    ('E001', '2010-08-15', 'Sapumal', 'Nithila', 'Son'),
    ('E002', '2007-03-07', 'Avishka', 'Perera', 'Daughter'),
    ('E002', '2020-04-15', 'Ananda', 'Nithila', 'Son'),
    ('E004', '2008-06-02', 'Krishu', 'Punsisi', 'Daughter'),
    ('E006', '2010-08-15', 'Sadaruwan', 'Pasindu', 'Son');
    
UPDATE DEPENDENT SET DOB = '2005-04-02' WHERE Empl_ID = 'E001' AND F_Name = 'Subodha' AND Relation = 'Daughter';
UPDATE DEPENDENT SET L_Name = 'Punsari' WHERE Empl_ID = 'E004' AND F_Name = 'Krishu' AND Relation = 'Daughter';
DELETE FROM DEPENDENT WHERE Empl_ID = 'E002' AND F_Name = 'Avishka' AND Relation = 'Daughter';
    
INSERT INTO CONTACT_NUMBERS_OF_EMPLOYEE (Empl_ID, Mobile_No)
VALUES
    ('E001', '0715688569'),
    ('E002', '0745689534'),
    ('E002', '0766496215'),
    ('E003', '0745836619'),
    ('E004', '0751586267'),
    ('E004', '0745652634'),
    ('E005', '0762911394'),
    ('E006', '0762546626');

UPDATE CONTACT_NUMBERS_OF_EMPLOYEE SET Mobile_No = '0766496216' WHERE Empl_ID = 'E002' AND Mobile_No = '0766496215';
UPDATE CONTACT_NUMBERS_OF_EMPLOYEE SET Mobile_No = '0748452634' WHERE Empl_ID = 'E004' AND Mobile_No = '0745652634';
DELETE FROM CONTACT_NUMBERS_OF_EMPLOYEE WHERE Empl_ID = 'E005' AND Mobile_No = '0762911394';


INSERT INTO CONTACT_NUMBERS_OF_JUDGER (Judger_ID, Contact_Number)
VALUES
    ('J001', '0715688597'),
    ('J002', '0745689534'),
    ('J002', '0766441215'),
    ('J003', '0745848619'),
    ('J004', '0751626267'),
    ('J004', '0745651874'),
    ('J005', '0762918794'),
    ('J006', '0762487626');
    
UPDATE CONTACT_NUMBERS_OF_JUDGER SET Contact_Number = '0766441216' WHERE Judger_ID = 'J002' AND Contact_Number = '0766441215';
UPDATE CONTACT_NUMBERS_OF_JUDGER SET Contact_Number = '0766452577' WHERE Judger_ID = 'J004' AND Contact_Number = '0745651874';
DELETE FROM CONTACT_NUMBERS_OF_JUDGER WHERE Judger_ID = 'J006' AND Contact_Number = '0751626267';

INSERT INTO CONTACT_NUMBERS_OF_COMPETITOR (Com_ID, Contact_Number)
VALUES
    ('C001', '0715627957'),
    ('C002', '0745674564'),
    ('C002', '0766459715'),
    ('C003', '0745848719'),
    ('C004', '0751489467'),
    ('C004', '0745648784'),
    ('C005', '0762917894'),
    ('C006', '0762484786');
    
UPDATE CONTACT_NUMBERS_OF_COMPETITOR SET Contact_Number = '0766459716' WHERE Com_ID = 'C002' AND Contact_Number = '0766459715';
UPDATE CONTACT_NUMBERS_OF_COMPETITOR SET Contact_Number = '0766472716' WHERE Com_ID = 'C006' AND Contact_Number = '0762484786';
DELETE FROM CONTACT_NUMBERS_OF_COMPETITOR WHERE Com_ID = 'C004' AND Contact_Number = '0751489467';
    
INSERT INTO CONTACT_NUMBERS_OF_SPONSER (Sponser_ID, Contact_Number)
VALUES
    ('S001', '0715628797'),
    ('S001', '0745618534'),
    ('S002', '0766440575'),
    ('S003', '0745187619'),
    ('S004', '0751626054'),
    ('S004', '0745651654'),
    ('S005', '0762941894'),
    ('S006', '0762487488');

UPDATE CONTACT_NUMBERS_OF_SPONSER SET Contact_Number = '0751626055' WHERE Sponser_ID = 'S004' AND Contact_Number = '0751626054';
UPDATE CONTACT_NUMBERS_OF_SPONSER SET Contact_Number = '0751973055' WHERE Sponser_ID = 'S001' AND Contact_Number = '0751626054';
DELETE FROM CONTACT_NUMBERS_OF_SPONSER WHERE Sponser_ID = 'S004' AND Contact_Number = '0745187619';

INSERT INTO ADVERTIESMENTS_OF_REALITYSHOW (Program_ID, Ad_ID)
VALUES
    ('RS001', 'A001'),
    ('RS002', 'A002'),
    ('RS003', 'A003'),
    ('RS004', 'A004'),
    ('RS005', 'A005'),
    ('RS001', 'A002'),
    ('RS002', 'A003'),
    ('RS003', 'A004'),
    ('RS004', 'A005'),
    ('RS005', 'A001');

UPDATE ADVERTIESMENTS_OF_REALITYSHOW SET Ad_ID = 'A006' WHERE Program_ID = 'RS002' AND Ad_ID = 'A002';
UPDATE ADVERTIESMENTS_OF_REALITYSHOW SET Ad_ID = 'A005' WHERE Program_ID = 'RS003' AND Ad_ID = 'A004';
DELETE FROM ADVERTIESMENTS_OF_REALITYSHOW WHERE Program_ID = 'RS003' AND Ad_ID = 'A003';

INSERT INTO ADVERTIESMENTS_OF_MOVIE (Show_ID, Ad_ID)
VALUES
    ('M001', 'A001'),
    ('M002', 'A002'),
    ('M003', 'A003'),
    ('M004', 'A004'),
    ('M004', 'A005'),
    ('M001', 'A003'),
    ('M002', 'A004'),
    ('M003', 'A005'),
    ('M004', 'A001');

UPDATE ADVERTIESMENTS_OF_MOVIE SET Ad_ID = 'A006' WHERE Show_ID = 'M004' AND Ad_ID = 'A004';
UPDATE ADVERTIESMENTS_OF_MOVIE SET Ad_ID = 'A002' WHERE Show_ID = 'M004' AND Ad_ID = 'A001';
DELETE FROM ADVERTIESMENTS_OF_MOVIE WHERE Show_ID = 'M004' AND Ad_ID = 'A001';

INSERT INTO ADVERTIESMENTS_OF_TVSERIE (Show_ID, Ad_ID)
VALUES
    ('TS001', 'A001'),
    ('TS002', 'A002'),
    ('TS003', 'A003'),
    ('TS002', 'A004'),
    ('TS005', 'A005'),
    ('TS001', 'A004'),
    ('TS002', 'A005'),
    ('TS003', 'A001'),
    ('TS003', 'A002'),
    ('TS005', 'A003');

UPDATE ADVERTIESMENTS_OF_TVSERIE SET Ad_ID = 'A006' WHERE Show_ID = 'TS004' AND Ad_ID = 'A004';
UPDATE ADVERTIESMENTS_OF_TVSERIE SET Ad_ID = 'A005' WHERE Show_ID = 'TS004' AND Ad_ID = 'A002';
DELETE FROM ADVERTIESMENTS_OF_TVSERIE WHERE Show_ID = 'TS001' AND Ad_ID = 'A001';

INSERT INTO SPONSER_OF_ADVERTIESMENTS (Sponser_ID, Ad_ID)
VALUES
    ('S001', 'A001'),
    ('S002', 'A002'),
    ('S002', 'A003'),
    ('S004', 'A004'),
    ('S005', 'A005'),
    ('S001', 'A002'),
    ('S003', 'A004'),
    ('S004', 'A005'),
    ('S005', 'A004'),
    ('S006', 'A006');
    
UPDATE SPONSER_OF_ADVERTIESMENTS SET Ad_ID = 'A006' WHERE Sponser_ID = 'S005' AND Ad_ID = 'A004';
UPDATE SPONSER_OF_ADVERTIESMENTS SET Ad_ID = 'A005' WHERE Sponser_ID = 'S003' AND Ad_ID = 'A004';
DELETE FROM SPONSER_OF_ADVERTIESMENTS WHERE Sponser_ID = 'S001' AND Ad_ID = 'A001';

INSERT INTO JUDGERS_OF_REALITYSHOW (JudgerID, ShowID)
VALUES
    ('J001', 'RS001'),
    ('J002', 'RS001'),
    ('J003', 'RS001'),
    ('J004', 'RS002'),
    ('J005', 'RS002'),
    ('J001', 'RS002'),
    ('J002', 'RS003'),
    ('J003', 'RS002'),
    ('J004', 'RS004'),
    ('J001', 'RS005'),
    ('J002', 'RS005'),
    ('J003', 'RS004'),
    ('J005', 'RS003');
    
UPDATE JUDGERS_OF_REALITYSHOW SET JudgerID = 'J006' WHERE ShowID = 'RS003' AND JudgerID = 'J003';
UPDATE JUDGERS_OF_REALITYSHOW SET ShowID = 'RS004' WHERE ShowID = 'J004' AND JudgerID = 'J004';
DELETE FROM JUDGERS_OF_REALITYSHOW WHERE ShowID = 'RS005' AND JudgerID = 'J001';
    
INSERT INTO COMPETITORS_OF_REALITYSHOW (Com_ID, ShowID)
VALUES
    ('C001', 'RS001'),
    ('C001', 'RS005'),
    ('C002', 'RS001'),
    ('C003', 'RS002'),
    ('C004', 'RS002'),
    ('C001', 'RS002'),
    ('C001', 'RS003'),
    ('C002', 'RS004'),
    ('C003', 'RS005'),
    ('C004', 'RS001'),
    ('C005', 'RS002');

UPDATE COMPETITORS_OF_REALITYSHOW SET ShowID = 'RS004' WHERE ShowID = 'RS005' AND Com_ID = 'C001';
UPDATE COMPETITORS_OF_REALITYSHOW SET ShowID = 'RS004' WHERE ShowID = 'RS003' AND Com_ID = 'C005';
DELETE FROM COMPETITORS_OF_REALITYSHOW WHERE ShowID = 'RS002' AND Com_ID = 'C003';
    
INSERT INTO GENRE_OF_MOVIE (Show_ID, Genre)
VALUES
    ('M001', 'Action'),
    ('M001', 'SiFi'),
    ('M002', 'Science Fiction'),
    ('M003', 'Adventure'),
    ('M003', 'Action'),
    ('M004', 'Crime'),
    ('M007', 'Drama');

UPDATE GENRE_OF_MOVIE SET Genre = 'Adventure' WHERE Show_ID = 'M001' AND Genre = 'Action';
UPDATE GENRE_OF_MOVIE SET Genre = 'Drama' WHERE Show_ID = 'M004' AND Genre = 'Crime';
DELETE FROM GENRE_OF_MOVIE WHERE Show_ID = 'M002' AND Genre = 'Science Fiction';
    
INSERT INTO GENRE_OF_TVSERIE (Show_ID, Genre)
VALUES
    ('TS001', 'Action'),
    ('TS002', 'Mystery'),
    ('TS003', 'Science Fiction'),
    ('TS001', 'Crime'),
    ('TS005', 'Action'),
    ('TS006', 'Mystery'),
    ('TS007', 'Science Fiction');
    
UPDATE GENRE_OF_TVSERIE SET Genre = 'Drama' WHERE Show_ID = 'TS002' AND Genre = 'Mystery';
UPDATE GENRE_OF_TVSERIE SET Genre = 'SiFi' WHERE Show_ID = 'TS006' AND Genre = 'Mystery';
DELETE FROM GENRE_OF_TVSERIE WHERE Show_ID = 'TS004' AND Genre = 'Action';
    
/*
show create table EMPLOYEE;
show create table CONTACT_NUMBERS_OF_EMPLOYEE;
show create table JUDGER;
show create table CONTACT_NUMBERS_OF_JUDGER;
show create table COMPETITOR;
show create table CONTACT_NUMBERS_OF_COMPETITOR;
show create table REALITY_SHOW;
show create table JUDGERS_OF_REALITYSHOW;
show create table COMPETITORS_OF_REALITYSHOW;
show create table ADVERTIESMENT;
show create table ADVERTIESMENTS_OF_REALITYSHOW;
show create table TV_SERIE;
show create table ADVERTIESMENTS_OF_TVSERIE;
show create table GENRE_OF_TVSERIE;
show create table MOVIE;
show create table ADVERTIESMENTS_OF_MOVIE;
show create table GENRE_OF_MOVIE;
show create table SPONSER;
show create table CONTACT_NUMBERS_OF_SPONSER;
show create table SPONSER_OF_ADVERTIESMENTS;
show create table ANNUAL_BONUS;
show create table DEPENDENT;
*/

###################
## Simple Queries##
###################

#1
select * from EMPLOYEE;
#2
select First_name, Last_name from EMPLOYEE;
#3
select * from EMPLOYEE cross join CONTACT_NUMBERS_OF_EMPLOYEE;
#4
create view employee_details as
select First_name, Last_name, Gender,No,street,city from EMPLOYEE;
select * from employee_details;
#5
alter table employee
rename column employeeType to EmplType;
#6
select round(avg(Cost)) as Average_Cost_Rupees from JUDGER;
#7
select * from EMPLOYEE where Last_name like 'G%';

###################
##Complex Queries##
###################

#UNION OPERATION
(select C.com_ID, C.First_name, C.Last_name,CR.ShowID from COMPETITOR as C inner join  COMPETITORS_OF_REALITYSHOW as CR on C.Com_ID = CR.Com_ID where CR.ShowID = 'RS001')
UNION
(select C.com_ID, C.First_name, C.Last_name,CR.ShowID from COMPETITOR as C inner join COMPETITORS_OF_REALITYSHOW as CR on C.Com_ID = CR.Com_ID where CR.ShowID = 'RS003');

/*
(select CR.ShowID,C.com_ID, C.First_name, C.Last_name from COMPETITOR as C
inner join 
COMPETITORS_OF_REALITYSHOW as CR on C.Com_ID = CR.Com_ID where CR.ShowID = 'RS001')
INTERSECT
(select CR.ShowID,C.com_ID, C.First_name, C.Last_name from COMPETITOR as C
inner join 
COMPETITORS_OF_REALITYSHOW as CR on C.Com_ID = CR.Com_ID where CR.ShowID = 'RS005');
*/

#INTERSECT OPERATION
SELECT CR1.ShowID, CR1.Com_ID, CR1.First_name, CR1.Last_name FROM 
(SELECT CR.ShowID, C.Com_ID, C.First_name, C.Last_name FROM COMPETITOR AS C INNER JOIN COMPETITORS_OF_REALITYSHOW AS CR ON C.Com_ID = CR.Com_ID WHERE CR.ShowID = 'RS001') 
AS CR1 INNER JOIN 
(SELECT CR.ShowID, C.Com_ID, C.First_name, C.Last_name FROM COMPETITOR AS C INNER JOIN COMPETITORS_OF_REALITYSHOW AS CR ON C.Com_ID = CR.Com_ID WHERE CR.ShowID = 'RS003') 
AS CR5 ON CR1.Com_ID = CR5.Com_ID;

/*
Select * From Employee 
except 
select * from employee where emplType = 'Manager';
*/
#SET DIFFERENCE OPERATION
SELECT E.* FROM Employee E inner join Employee M ON E.Empl_ID = M.Empl_ID AND M.EmplType = 'Manager';


##############
##JOIN TYPES##
##############

#INNER JOIN
create view uv1 as select R.name, E.First_name, E.Last_name, R.Broadcast_Time from REALITY_SHOW as R inner join Employee as E on E.Empl_ID = R.Hosted_By where R.Broadcast_Time > '19:30:00';
select * from uv1;

#NATURAL JOIN
create view uv2 as select * from ADVERTIESMENT natural join SPONSER_OF_ADVERTIESMENTS;
select * from uv2;

#LEFT OUTER JOIN
create view uv3 as select E.Empl_ID,E.First_name,E.Last_name,D.F_name,D.L_name,D.Relation from EMPLOYEE as E left outer join DEPENDENT as D on E.Empl_ID = D.Empl_ID where gender like 'Male';
select * from uv3;

#RIGHT OUTER JOIN
create view uv4 as select E.Empl_ID,E.First_name,E.Last_name,M.Name from EMPLOYEE as E right outer join MOVIE as M on M.Broadcasts_By = E.empl_ID where M.Broadcast_Date > '2023-09-16';
select * from uv4;

#FULL OUTER JOIN
create view uv5 as select E.First_name, E.Last_name,E.dob, T.Show_ID,T.Name as SHOW_NAME from EMPLOYEE as E right join TV_SERIE as T on T.Broadcasts_By = E.empl_ID where E.dob > '1991-08-15';
create view uv6 as select E.First_name, E.Last_name,E.dob, T.Show_ID,T.Name as SHOW_NAME from EMPLOYEE as E left join TV_SERIE as T on T.Broadcasts_By = E.empl_ID where E.dob > '1991-08-15';
(select * from uv5) UNION (select * from uv6);

#OUTER UNION
create view uv7 as select E.First_name, E.Last_name,AB.Date,AB.Value from Employee as E right outer join ANNUAL_BONUS as AB on AB.Empl_ID = E.Empl_ID where AB.Value > '17500.00';
create view uv8 as select E.First_name, E.Last_name,AB.Date,AB.Value from Employee as E left outer join ANNUAL_BONUS as AB on AB.Empl_ID = E.Empl_ID where AB.Value > '17500.00';
(select * from uv7) UNION ALL(select * from uv8);



##NESTED QUERIES

#01
select * from EMPLOYEE where Empl_ID in (
    select Empl_ID from DEPENDENT as D where D.Relation = 'Son'
);
#02
select * from EMPLOYEE where Empl_ID not in (
    select Empl_ID from EMPLOYEE where city = 'colombo'
);
#03
SELECT R.Name AS Reality_Show, JS.First_name, JS.Last_name FROM REALITY_SHOW as R INNER JOIN 
(SELECT JR.ShowID, J.First_name, J.Last_name FROM JUDGERS_OF_REALITYSHOW as JR INNER JOIN JUDGER as J ON JR.JudgerID = J.Judger_ID) 
AS JS ON R.Program_ID = JS.ShowID WHERE R.Hosted_By = 'E003';


##########
##TUNING##
##########
#difference Operation
SELECT E.* FROM Employee E inner join Employee M ON E.Empl_ID = M.Empl_ID AND M.EmplType = 'Manager';
explain(SELECT E.* FROM Employee E inner join Employee M ON E.Empl_ID = M.Empl_ID AND M.EmplType = 'Manager');
create index created_index_manager using BTREE on employee(emplType);
explain(SELECT E.* FROM Employee E inner join Employee M ON E.Empl_ID = M.Empl_ID AND M.EmplType = 'Manager');
drop index created_index_manager on employee;


#inner join Operation
# create view uv1 as select R.name, E.First_name, E.Last_name from REALITY_SHOW as R inner join Employee as E on E.Empl_ID = R.Hosted_By;
select * from uv1;
explain(select R.name, E.First_name, E.Last_name, R.Broadcast_Time from REALITY_SHOW as R inner join Employee as E on E.Empl_ID = R.Hosted_By where R.Broadcast_Time > '19:30:00');
CREATE INDEX idx_Broadcast_time ON REALITY_SHOW(Broadcast_Time);
explain(select R.name, E.First_name, E.Last_name, R.Broadcast_Time from REALITY_SHOW as R inner join Employee as E on E.Empl_ID = R.Hosted_By where R.Broadcast_Time > '19:30:00');
drop index idx_Broadcast_time on REALITY_SHOW;


#left outer join
#create view uv3 as select E.Empl_ID,E.First_name,E.Last_name,D.F_name,D.L_name,D.Relation from EMPLOYEE as E left outer join DEPENDENT as D on E.Empl_ID = D.Empl_ID where gender like 'Male';
select * from uv3;
explain(select E.Empl_ID,E.First_name,E.Last_name,D.F_name,D.L_name,D.Relation from EMPLOYEE as E left outer join DEPENDENT as D on E.Empl_ID = D.Empl_ID where gender like 'Male');
CREATE INDEX idx_Gender_EMPLOYEE ON EMPLOYEE(Gender);
explain(select E.Empl_ID,E.First_name,E.Last_name,D.F_name,D.L_name,D.Relation from EMPLOYEE as E left outer join DEPENDENT as D on E.Empl_ID = D.Empl_ID where gender like 'Male');
drop index idx_Gender_EMPLOYEE on employee;


#right outer join
#create view uv4 as select E.Empl_ID,E.First_name,E.Last_name,M.Name from EMPLOYEE as E right outer join MOVIE as M on M.Broadcasts_By = E.empl_ID;
select * from uv4;
explain(select E.Empl_ID,E.First_name,E.Last_name,M.Name from EMPLOYEE as E right outer join MOVIE as M on M.Broadcasts_By = E.empl_ID where M.Broadcast_Date > '2023-09-16');
CREATE INDEX idx_Broadcasts_Date_MOVIE ON MOVIE(Broadcast_date);
explain(select E.Empl_ID,E.First_name,E.Last_name,M.Name from EMPLOYEE as E right outer join MOVIE as M on M.Broadcasts_By = E.empl_ID where M.Broadcast_Date > '2023-09-16');
drop index idx_Broadcasts_Date_MOVIE on MOVIE;


#full outer join
#create view uv5 as select E.First_name, E.Last_name,E.dob, T.Show_ID,T.Name as SHOW_NAME from EMPLOYEE as E right join TV_SERIE as T on T.Broadcasts_By = E.empl_ID where E.dob > '1991-08-15';
#create view uv6 as select E.First_name, E.Last_name,E.dob, T.Show_ID,T.Name as SHOW_NAME from EMPLOYEE as E left join TV_SERIE as T on T.Broadcasts_By = E.empl_ID where E.dob > '1991-08-15';
(select * from uv5) UNION (select * from uv6);
explain((select * from uv5) UNION (select * from uv6));
create index idx_dob on EMPLOYEE(dob);
explain((select * from uv5) UNION (select * from uv6));
drop index idx_dob on EMPLOYEE;


#outer union 
#create view uv7 as select E.First_name, E.Last_name,AB.Date,AB.Value from Employee as E right outer join ANNUAL_BONUS as AB on AB.Empl_ID = E.Empl_ID where AB.Value > '17500.00';
#create view uv8 as select E.First_name, E.Last_name,AB.Date,AB.Value from Employee as E left outer join ANNUAL_BONUS as AB on AB.Empl_ID = E.Empl_ID where AB.Value > '17500.00';
(select * from uv7) UNION ALL(select * from uv8);
explain((select * from uv7) UNION ALL(select * from uv8));
CREATE INDEX idx_Anual_bounus on ANNUAL_BONUS(value);
explain((select * from uv7) UNION ALL(select * from uv8));
drop index idx_Anual_bounus on ANNUAL_BONUS;


#nested query 01
select * from EMPLOYEE where Empl_ID in (select Empl_ID from DEPENDENT as D where D.Relation = 'Son');
explain(select * from EMPLOYEE where Empl_ID in (select Empl_ID from DEPENDENT as D where D.Relation = 'Son'));
CREATE INDEX idx_Relation_DEPENDENT ON DEPENDENT(Relation);
explain(select * from EMPLOYEE where Empl_ID in (select Empl_ID from DEPENDENT as D where D.Relation = 'Son'));
drop index idx_Relation_DEPENDENT on DEPENDENT;


#nested query 02
select * from EMPLOYEE where Empl_ID not in (select Empl_ID from EMPLOYEE where city = 'colombo');
explain(select * from EMPLOYEE where Empl_ID not in (select Empl_ID from EMPLOYEE where city = 'colombo'));
CREATE INDEX idx_City_EMPLOYEE ON EMPLOYEE(City);
explain(select * from EMPLOYEE where Empl_ID not in (select Empl_ID from EMPLOYEE where city = 'colombo'));
drop index idx_City_EMPLOYEE on employee;

