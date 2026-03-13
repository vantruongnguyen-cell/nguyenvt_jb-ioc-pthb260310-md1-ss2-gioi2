-- Tao Schema
create schema elearning;

-- Tao bang students
create table elearning.student(
	student_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(100) not null unique
);

-- Tao bang instructors
create table elearning.instructor(
	instructor_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(100) not null unique
);

-- Tao bang courses
create table elearning.course(
	course_id serial primary key,
	course_name varchar(100) not null,
	instructor_id integer,
	foreign key (instructor_id) references elearning.instructor(instructor_id)
);

-- Tao bang enrollments
create table elearning.enrollment(
	enrollment serial primary key,
	student_id integer,
	course_id integer,
	foreign key (student_id) references elearning.student(student_id),
	foreign key (course_id) references elearning.course(course_id),
	enroll_date date not null
);

-- Tao bang assignments
create table elearning.assignment(
	assignment_id serial primary key,
	course_id integer,
	foreign key (course_id) references elearning.course(course_id),
	title varchar(100) not null,
	due_date date not null
);

-- Tao bang submissions
create table elearning.submission(
	submission_id serial primary key,
	assignment_id integer,
	student_id integer,
	foreign key (assignment_id) references elearning.assignment(assignment_id),
	foreign key (student_id) references elearning.student(student_id),
	submission_date date not null,
	grade decimal(5,2) check(grade >= 0 and grade <= 100)
);