CREATE DATABASE School

USE School

CREATE TABLE Students(
Id INT PRIMARY KEY,
FullName NVARCHAR(50) NOT NULL,
Point INT NOT NULL,
GroupId INT NOT NULL FOREIGN KEY (GroupId) REFERENCES Groups(Id)
);

CREATE TABLE Groups(
Id INT PRIMARY KEY,
No INT NOT NULL,
);

CREATE TABLE Exams(
Id INT PRIMARY KEY ,
SubjectName NVARCHAR(50) NOT NULL ,
StartDate DATETIME2 NOT NULL,
EndDate DATETIME2 NOT NULL,
);

CREATE TABLE StudentsExams(
StudentId INT NOT NULL FOREIGN KEY(StudentId) REFERENCES Students(Id),
ExamsId INT NOT NULL FOREIGN KEY(ExamsId) REFERENCES Exams(Id),
ResultPoint INT NOT NULL,
);

INSERT INTO Groups
VALUES
(1,328),
(2,340)

INSERT INTO Students
VALUES
(1,'Rza Mirzeyev',100,1),
(2,'Cavad Manafov',90,1),
(3,'Sabir Mirzeyev',80,2),
(4,'Sahin Bayramob',70,2)

INSERT INTO Exams 
VALUES
(1,'Riyaziyyat','2023-05-01','2023-05-03'),
(2,'Fizika','2023-05-05','2023-05-07')

INSERT INTO StudentsExams
VALUES
(1,1,85),
(1,2,80),
(2,1,90),
(2,2,75),
(3,1,70),
(4,2,65);

SELECT s.*,g.No
FROM Students s
INNER JOIN Groups g ON s.GroupId=g.Id

SELECT s.*,COUNT(se.ExamsId) AS ExamCount
FROM Students s
LEFT JOIN StudentsExams se ON s.Id=se.StudentId
GROUP BY s.Id;

SELECT e.*
FROM Exams e 
LEFT JOIN StudentsExams se ON e.Id=se.ExamsId
WHERE se.ExamsId IS NULL

SELECT e.SubjectName,e.StartDate,COUNT(se.StudentId) AS StudentCount
FROM Exams e
INNER JOIN StudentsExams se ON e.Id=se.ExamsId
WHERE e.StartDate

SELECT se.*,s.FullName,g.No
FROM StudentsExams se
INNER JOIN Students s ON se.StudentId=s.Id
INNER JOIN Groups g ON s.GroupId=g.Id

SELECT s.*,AVG(se.ResultPoint) AS AvarageResult
FROM Students s
LEFT JOIN StudentsExams se ON s.Id=se.StudentId
GROUP BY S.Id;
