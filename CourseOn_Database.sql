
drop database if exists courseOn;

create database courseOn;

use courseOn;

create table if not exists Course (
crn_pk int check (crn_pk between 100000 and 999999),
course_name varchar(50),
credit int check (credit between 0 and 4),

primary key (crn_pk)
);

create table if not exists Semester (
school_year ENUM('Year 1', 'Year 2', 'Year 3', 'Year 4', 'Year 5'),
course_id int,
season ENUM('Fall', 'Spring','Summer 1', 'Summer 2'),

primary key(season, school_year),

CONSTRAINT course_fk
FOREIGN KEY(course_id) REFERENCES Course(crn_pk)
);

create table if not exists User_Schedule(
schedule_id int auto_increment,
schedule_name varchar(50), #default CONCAT('Schedue', cast(schedule_id as varchar),
email varchar(50),
school_year varchar(50),
season ENUM('Fall', 'Spring','Summer 1', 'Summer 2'), 

primary key(schedule_id),

CONSTRAINT semester_fk
FOREIGN KEY(season, school_year) REFERENCES Semester(season, school_year),

CONSTRAINT user_fk
FOREIGN KEY(email) REFERENCES Users(email)
);

create table if not exists Users(

user_name varchar(50),
major varchar(50),
email varchar(50) not null,
start_year int,
grad_year int,


primary key (email)
);




