set search_path to elearning;
create table Students
(
    student_id serial primary key,
    first_name varchar(50) not null,
    last_name  varchar(50) not null,
    email      text unique not null
);
create table Instructors
(
    instructor_id serial primary key,
    first_name    varchar(50) not null,
    last_name     varchar(50) not null,
    email         text unique not null
);
create table Courses
(
    course_id     serial,
    course_name   varchar(100) not null,
    instructor_id int,
    constraint pk1 primary key (course_id),
    constraint fk1 foreign key (instructor_id) references Instructors (instructor_id)
);
create table Enrollments
(
    enrollment_id serial,
    student_id    int,
    course_id     int,
    enroll_date   date not null,
    constraint pk2 primary key (enrollment_id, student_id, course_id),
    constraint fk2 foreign key (student_id) references Students (student_id),
    constraint fk3 foreign key (course_id) references Courses (course_id)
);
create table Assignments
(
    assignment_id serial,
    course_id     int,
    title         varchar(100) not null,
    due_date      date         not null,
    constraint pk3 primary key (assignment_id),
    constraint fk4 foreign key (course_id) references Courses (course_id)
);
create table Submissions
(
    submission_id   serial,
    assignment_id   int,
    student_id      int,
    submission_date date not null,
    grade           float,
    constraint pk4 primary key (submission_id),
    constraint fk5 foreign key (assignment_id) references Assignments (assignment_id),
    constraint fk6 foreign key (submission_id) references Students (student_id),
    constraint chk1 check ( 0 <= grade and grade <= 100 )
);