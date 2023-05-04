CREATE TABLE ClassList (
    CourseNo INTEGER UNIQUE NOT NULL,
    CourseName VARCHAR NOT NULL,
    InstNo INTEGER UNIQUE NOT NULL
);

CREATE TABLE Student (
    StudentNo INTEGER UNIQUE NOT NULL,
    StudentName VARCHAR NOT NULL,
    Major CHAR(2) CHECK (Major IN ('IS', 'CS')),
    Grade CHAR(1) CHECK (Grade IN ('A', 'B', 'C', 'D'))
);

CREATE TABLE StudentsList (
    CourseNo INTEGER,
    StudentNo INTEGER,
    PRIMARY KEY (CourseNo, StudentNo),
    CONSTRAINT fkCourseNo FOREIGN KEY (CourseNo) REFERENCES ClassList(CourseNo),
    CONSTRAINT fkStudentNo FOREIGN KEY (StudentNo) REFERENCES Student(StudentNo)
);

CREATE TABLE Instructor (
    InstNo INTEGER ,
    InstName VARCHAR NOT NULL,
    InstLoc VARCHAR NOT NULL,
    CONSTRAINT pkInstNo PRIMARY KEY (InstNo)
);

INSERT INTO ClassList VALUES(1122,'Java',999);
INSERT INTO ClassList VALUES(3344,'Linux',888);
INSERT INTO ClassList VALUES(5566,'Database',777);
INSERT INTO ClassList VALUES(7788,'Web Dev',666);

INSERT INTO Student VALUES (111,'Bonita Li', 'CS', 'B');
INSERT INTO Student VALUES (222,'Foo Bar', 'IS', 'A');
INSERT INTO Student VALUES (333,'Poo Doo', 'CS', 'D');
INSERT INTO Student VALUES (444,'Water Cup', 'IS', 'C');

INSERT INTO StudentsList VALUES(1122, 111);
INSERT INTO StudentsList VALUES(3344, 222);
INSERT INTO StudentsList VALUES(5566, 333);
INSERT INTO StudentsList VALUES(7788, 444);

INSERT INTO Instructor VALUES (999, 'Trudy Tetty', 'Oakville');
INSERT INTO Instructor VALUES (888, 'Sefton Meredith', 'Brampton');
INSERT INTO Instructor VALUES (777, 'Charla Rayner', 'Mississauga');
INSERT INTO Instructor VALUES (666, 'Eugene Mabelle', 'Toronto');

UPDATE Student
SET StudentName = 'Li'
WHERE StudentName != 'Bonita Li';

DELETE FROM Student
WHERE Grade = 'A';
