Drop DATABASE IF exists project8386;
create database project8386;

use projectTeam8386;

/*  Tạo bảng postion(chức vụ)*/
Drop TABLE IF exists positions;
create table positions(position_id varchar(20) NOT NULL, position_name varchar(200), primary key (position_id));

/* Tạo bảng phòng ban*/
Drop TABLE IF exists departments;
create table departments(department_id varchar(20) NOT NULL, department_name varchar(200), primary key(department_id));

/* Tạo bảng quản lý nhân viên*/
Drop TABLE IF exists employees;
create table employees(employ_id varchar(20) NOT NULL, 
							   first_name varchar(100), last_name varchar(100), position_id varchar(20),
                               department_id varchar(20), birth_of_date date, age int,
                               gender tinyint, address varchar(250), employ_join_date date, manager_id varchar(20)  ,
                               primary key(employ_id),
                               CONSTRAINT fk_department foreign key(department_id) references departments(department_id),
                               CONSTRAINT fk_position foreign key(position_id) references positions(position_id) );


/* Tạo bảng kế toán lương nhân viên*/
Drop TABLE IF exists salary_employees;
create table salary_employees(employ_id varchar(20), salary_rage varchar(50), annual_income float, taxable float,insurance float,
								CONSTRAINT fk_employ1 foreign key(employ_id) references employees(employ_id));

/* Mở rộng chức năng: Bảng quản lý giờ chấm công ra vào hàng ngày của nhân viên*/
Drop TABLE IF exists manage_leaves;
create table manage_leaves(leave_id int not null auto_increment, leave_name text, day date, 
							primary key(leave_id));

Drop TABLE IF exists employee_leaves;
create table employee_leaves(id int not null auto_increment,employ_id varchar(20), leave_id int,
							 start_date_leave date, end_date_leave date,
                             primary key(id),
                             CONSTRAINT fk_employ2 foreign key(employ_id) references employees(employ_id),
                             CONSTRAINT fk_leave foreign key(leave_id) references manage_leaves(leave_id));


/* Tạo bảng user cho chức năng đăng nhập, đăng ký*/
Drop TABLE IF exists user; 
create table users(employ_id varchar(20), username varchar(150), password varchar(100),
                               CONSTRAINT fk_employ foreign key(employ_id) references employees(employ_id));

