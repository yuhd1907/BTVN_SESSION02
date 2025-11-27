create database UniversityDB;
create schema if not exists university;
set search_path to university;

create table if not exists Students
(
    student_id serial primary key,
    first_name varchar(50) not null,
    last_name  varchar(50) not null,
    birth_date date,
    email      text        not null
);

create table if not exists Courses
(
    course_id   serial primary key,
    course_name varchar(100) not null,
    credits     int
);

create table if not exists Enrollments
(
    enrollment_id serial primary key,
    student_id    int references Students (student_id),
    course_id     int references Courses (course_id),
    enroll_date   date
);
