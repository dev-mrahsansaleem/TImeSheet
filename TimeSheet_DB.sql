create DATABASE TIMESHEET_DB;


/* tables */
create table tblLookUps(
ID int,
name varchar(20),
cateegory varchar(20), 
primary key(ID)
);

create table tblProjects(
ID int,
typeID int,
name varchar(50),
description varchar(500),
primary key(ID),
creationDate datetime,
createdByID nvarchar(128),
updationDate datetime,
updatedByID nvarchar(128),
FOREIGN KEY (typeID) REFERENCES tblLookUps(ID),
);


create table tblProjectsAndUsers(
userID nvarchar(128),
projectID int,
statusID int,
primary key(userID,projectID),
creationDate datetime,
createdByID nvarchar(128),
updationDate datetime,
updatedByID nvarchar(128),
FOREIGN KEY (userID) REFERENCES AspNetUsers(Id),
FOREIGN KEY (projectID) REFERENCES tblProjects(ID),
FOREIGN KEY (statusID) REFERENCES tblLookUps(ID),
);

create table tblSheets(
ID int,
userID nvarchar(128),
weekNo varchar(20),
primary key(ID),
creationDate datetime,
createdByID nvarchar(128),
updationDate datetime,
updatedByID nvarchar(128),
FOREIGN KEY (userID) REFERENCES AspNetUsers(Id),
);

create table tblSheetStatus(
ID int,
sheetID int,
statusID int,
primary key(ID),
creationDate datetime,
createdByID nvarchar(128),
updationDate datetime,
updatedByID nvarchar(128),
FOREIGN KEY (sheetID) REFERENCES tblSheets(ID),
FOREIGN KEY (statusID) REFERENCES tblLookUps(ID),
);

create table tblTasks(
ID int,
sheetID int,
parentOF int,
typeID int,
Title varchar(50),
description varchar(200),
hours int,
primary key(ID),
creationDate datetime,
createdByID nvarchar(128),
updationDate datetime,
updatedByID nvarchar(128),
FOREIGN KEY (sheetID) REFERENCES tblSheets(ID),
FOREIGN KEY (parentOF) REFERENCES tblTasks(ID),
FOREIGN KEY (typeID) REFERENCES tblLookUps(ID),
);

create table tblTaskStatus(
ID int,
taskID int,
statusID int,
primary key(ID),
creationDate datetime,
createdByID nvarchar(128),
updationDate datetime,
updatedByID nvarchar(128),
FOREIGN KEY (taskID) REFERENCES tblTasks(ID),
FOREIGN KEY (statusID) REFERENCES tblLookUps(ID),
);