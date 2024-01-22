create database StudentsManager;


use StudentsManager;
-- Bảng Address (id, address)
-- Bảng Classes (id, name, language, description)
-- Bảng Students (id, fullname, address_id, age, phone (unique), classes_id)
-- Bảng Course (id, name, description)
-- Bảng Point(id, course_id, student_id, point)

create table Address(
                        id int NOT NULL PRIMARY KEY auto_increment,
                        address varchar(255)
);

create table Classes(
                        id int NOT NULL PRIMARY KEY auto_increment,
                        name varchar(255),
                        language varchar(255),
                        description varchar (255)
);

create table Students (
                          id int NOT NULL PRIMARY KEY auto_increment,
                          fullname varchar(255),
                          address_id int,
                          age int,
                          phone int UNIQUE,
                          classes_id int,
                          FOREIGN KEY (address_id) REFERENCES Address(id),
                          FOREIGN KEY (classes_id) REFERENCES Classes(id)
);

create table Course(
                       id int NOT NULL PRIMARY KEY auto_increment,
                       name varchar(255),
                       description varchar(255)
);

create table Point(
                      id int NOT NULL PRIMARY KEY auto_increment,
                      course_id int,
                      student_id int,
                      point int
);


-- Thêm 5 bản ghi trong bảng Address

insert into Address value (1,'Ha Noi');
insert into Address value (2,'Hue');
insert into Address value (3,'Hai Phong');
insert into Address value (4,'Da Nang');
insert into Address value (5,'TPHCM');
select * from Address;
-- Thêm 5 bản ghi trong bảng Classes
select * from Classes;
insert into Classes value (1,'Nguyen Van A', 'Java', 'NNJava');
insert into Classes value (2,'Nguyen Van B', 'PHP', 'NNPHP');
insert into Classes value (3,'Nguyen Van C', 'Python', 'NNPython');
insert into Classes value (4,'Nguyen Van D', 'C#', 'NNC#');
insert into Classes value (5,'Nguyen Van E', 'Java', 'NNJava');
select * from Classes;

-- Thêm 10 bản ghi trong bảng Student
select * from Students;
insert into Students value (1,'Nguyen Van A',1,20,0124567891,1);
insert into Students value (2,'Tran Van B',2,22,0124567892,2);
insert into Students value (3,'Nguyen Van C',3,24,0124567893,3);
insert into Students value (4,'Pham Van D',4,18,0124567894,4);
insert into Students value (5,'Nguyen Van E',5,21,0124567895,5);
insert into Students value (6,'Dinh Van F',1,17,0124567896,1);
insert into Students value (7,'Nguyen Van G',2,24,0124567897,2);
insert into Students value (8,'Ha Van H',5,25,0124567898,5);
insert into Students value (9,'Doan Van I',3,30,0124567899,3);
insert into Students value (10,'Nguyen Van K',4,15,01245678910,4);
select * from Students;

delete from Students
where id in (1,2,3,4,5,6,7,8,9,10);

-- Thêm 15 bản ghi trong bảng Point
select * from Point;
insert into Point values (1,1,1,100);
insert into Point values (2,2,2,90);
insert into Point values (3,3,3,60);
insert into Point values (4,4,4,70);
insert into Point values (5,5,5,100);
insert into Point values (6,6,6,30);
insert into Point values (7,7,7,40);
insert into Point values (8,8,8,50);
insert into Point values (9,9,9,70);
insert into Point values (10,10,10,70);
insert into Point values (11,11,11,70);
insert into Point values (12,12,12,10);
insert into Point values (13,13,13,20);
insert into Point values (14,14,14,90);
insert into Point values (15,15,15,80);
select * from Point;
insert into Course values (1,'Java', 'Java');
insert into Course values (2,'PHP', 'PHP');
insert into Course values (3,'JS', 'JS');
insert into Course values (4,'Python', 'Python');
insert into Course values (5,'C', 'C');
USE STUDENTSMANAGER;

-- Thêm 5 bản ghi trong bảng Course


-- Viết câu query thực hiện:
-- Tìm kiếm HV có họ Nguyen
-- Tìm kiếm HV có ten Anh
-- Tim kiem HV có độ tuổi tư 18-15
-- Tìm kiếm HV có id là 12 hoặc 13

use StudentsManager;
select * from Students
where fullname like '%Nguyen%';

select * from Students
where fullname like '%Anh%';

select * from Students
where age between 15 AND 18;

select * from Point
where id IN (12,13);

-- Thống kê số lượng học viên các lớp (count)
SELECT Classes.name AS Class_Name, COUNT(Students.id) AS Student_Count
FROM Classes
         LEFT JOIN Students ON Classes.id = Students.classes_id
GROUP BY Classes.id;
-- Thống kê số lượng học viên tại các tỉnh (count)
SELECT Address.address AS Province, COUNT(Students.id) AS Student_Count
FROM Address
         LEFT JOIN Students ON Address.id = Students.address_id
GROUP BY Address.id;
-- Tính điểm trung bình của các khóa học (avg)Point
SELECT Course.name AS Course_Name, AVG(Point.point) AS Average_Point
FROM Course
         LEFT JOIN Point ON Course.id = Point.course_id
GROUP BY Course.id, Course.name;

-- Điểm trung bình cao nhất
SELECT
    Course.id AS Course_ID,
    Course.name AS Course_Name,
    AVG(Point.point) AS Average_Point
FROM Course
         LEFT JOIN Point ON Course.id = Point.course_id
GROUP BY Course.id, Course.name
ORDER BY Average_Point DESC
    LIMIT 1;





