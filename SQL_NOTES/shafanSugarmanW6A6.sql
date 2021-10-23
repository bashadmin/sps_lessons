-- This database is used to register new students into Cloud Academy
CREATE SCHEMA academyDB;

    CREATE TABLE academyDB.course_info (
        course_id INT AUTO_INCREMENT NOT NULL,
        course_name VARCHAR (500) NOT NULL,
        max_students INT NOT NULL,
        PRIMARY KEY ( course_id )
    );
    CREATE TABLE academyDB.student_info (
        student_id INT AUTO_INCREMENT NOT NULL,
        student_Fname VARCHAR (125) NOT NULL,
        student_Lname VARCHAR (125) NOT NULL,
        student_age INT check (student_age between 1 and 100) NOT NULL,
        PRIMARY KEY ( student_id)
    
    );

    CREATE TABLE academyDB.studentcourse (
        student_id INT NOT NULL,
        course_id INT NOT NULL,
        enrolled BOOLEAN NOT NULL
    );


INSERT INTO `academyDB`.`course_info` (course_name, max_students)
    VALUES('python', 20);
INSERT INTO `academyDB`.`course_info` (course_name, max_students)
    VALUES('linera algebra', 7);
INSERT INTO `academyDB`.`course_info` (course_name, max_students)
    VALUES('project management', 30);
INSERT INTO `academyDB`.`course_info` (course_name, max_students)
    VALUES('linux', 26);
INSERT INTO `academyDB`.`course_info` (course_name, max_students)
    VALUES('networking', 16);


INSERT INTO `academyDB`.`student_info` (student_Fname, student_Lname, student_age)
    VALUES('Sam', 'Sugarman', 6);

INSERT INTO `academyDB`.`student_info` (student_Fname, student_Lname, student_age)
    VALUES('Raya', 'Sugarman', 7);

INSERT INTO `academyDB`.`student_info` (student_Fname, student_Lname, student_age)
    VALUES('Kate', 'Sugarman', 4);

INSERT INTO `academyDB`.`student_info` (student_Fname, student_Lname, student_age)
    VALUES('Isaac', 'Sugarman', 4);

INSERT INTO `academyDB`.`student_info` (student_Fname, student_Lname, student_age)
    VALUES('Isla', 'Sugarman', 10);

INSERT INTO `academyDB`.`student_info` (student_Fname, student_Lname, student_age)
    VALUES('Jacob', 'Sugarman', 7);


INSERT INTO `academyDB`.`studentcourse` (
    student_id, 
    course_id, 
    enrolled
    )
    VALUES
    (1, 1,FALSE),
    (1, 2,TRUE),
    (1, 3,TRUE),
    (1, 4,TRUE),
    (1, 5,FALSE),
    (2, 1,FALSE),
    (2, 2,TRUE),
    (2, 3,FALSE),
    (2, 4,TRUE),
    (2, 5,FALSE),
    (3, 1,TRUE),
    (3, 2,TRUE),
    (3, 3,FALSE),
    (3, 4,TRUE),
    (3, 5,FALSE),
    (4, 1,TRUE),
    (4, 2,FALSE),
    (4, 3,FALSE),
    (4, 4,TRUE),
    (4, 5,TRUE),
    (5, 1,FALSE),
    (5, 2,TRUE),
    (5, 3,FALSE),
    (5, 4,TRUE),
    (5, 5,FALSE),
    (6, 1,TRUE),
    (6, 2,TRUE),
    (6, 3,FALSE),
    (6, 4,TRUE),
    (6, 5,TRUE);


select *
from academyDB.student_info, academyDB.course_info
INNER JOIN academyDB.studentcourse
WHERE academyDB.studentcourse.enrolled = 1