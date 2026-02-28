CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    join_date DATE
);
CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    salary DECIMAL(10,2)
);
CREATE TABLE courses (
    course_id NUMBER PRIMARY KEY,
    title VARCHAR2(150) NOT NULL,
    course_level VARCHAR2(50),
    category VARCHAR2(100),
    instructor_id NUMBER,
    foreign key (instructor_id) REFERENCES instructors(instructor_id)
);
CREATE TABLE modules (
    module_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    order_no INT,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
CREATE TABLE lessons (
    lesson_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    duration INT,  
    type VARCHAR(50),
    module_id INT,
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    enroll_date DATE,
    status VARCHAR(50),
    course_id INT,
    student_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    amount DECIMAL(10,2),
    status VARCHAR(20) CHECK (status IN ('paid','refunded','failed')),
    payment_date DATE,
    enrollment_id INT,
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id)
);


CREATE TABLE assessments (
    assessment_id INT PRIMARY KEY,
    type VARCHAR(50),
    total_marks INT,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


CREATE TABLE assessment_scores (
    score_id INT PRIMARY KEY,
    marks INT,
    attempt_no INT,
    assessment_id INT,
    student_id INT,
    FOREIGN KEY (assessment_id) REFERENCES assessments(assessment_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    CHECK (marks >= 0)
);
CREATE TABLE certificates (
    cert_id INT PRIMARY KEY,
    issue_date DATE,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
INSERT INTO students VALUES (1,'Rahul Kumar','rahul1@gmail.com','9000000001',DATE '2024-01-01');
INSERT INTO students VALUES (2,'Anita Sharma','anita2@gmail.com','9000000002',DATE '2024-01-05');
INSERT INTO students VALUES (3,'Vikram Singh','vikram3@gmail.com','9000000003',DATE '2024-01-10');
INSERT INTO students VALUES (4,'Neha Verma','neha4@gmail.com','9000000004',DATE '2024-01-15');
INSERT INTO students VALUES (5,'Arjun Rao','arjun5@gmail.com','9000000005',DATE '2024-01-20');
INSERT INTO students VALUES (6,'Sneha Iyer','sneha6@gmail.com','9000000006',DATE '2024-02-01');
INSERT INTO students VALUES (7,'Kiran Patel','kiran7@gmail.com','9000000007',DATE '2024-02-05');
INSERT INTO students VALUES (8,'Pooja Nair','pooja8@gmail.com','9000000008',DATE '2024-02-10');
INSERT INTO students VALUES (9,'Rohit Das','rohit9@gmail.com','9000000009',DATE '2024-02-15');
INSERT INTO students VALUES (10,'Meera Joshi','meera10@gmail.com','9000000010',DATE '2024-02-20');
INSERT INTO students VALUES (11,'Aman Gupta','aman11@gmail.com','9000000011',DATE '2024-03-01');
INSERT INTO students VALUES (12,'Divya Roy','divya12@gmail.com','9000000012',DATE '2024-03-05');
INSERT INTO students VALUES (13,'Sanjay Kumar','sanjay13@gmail.com','9000000013',DATE '2024-03-10');
INSERT INTO students VALUES (14,'Lakshmi Devi','lakshmi14@gmail.com','9000000014',DATE '2024-03-15');
INSERT INTO students VALUES (15,'Harish Babu','harish15@gmail.com','9000000015',DATE '2024-03-20');
INSERT INTO students VALUES (16,'Nisha Reddy','nisha16@gmail.com','9000000016',DATE '2024-04-01');
INSERT INTO students VALUES (17,'Karthik Raj','karthik17@gmail.com','9000000017',DATE '2024-04-05');
INSERT INTO students VALUES (18,'Monika Shah','monika18@gmail.com','9000000018',DATE '2024-04-10');
INSERT INTO students VALUES (19,'Deepak Yadav','deepak19@gmail.com','9000000019',DATE '2024-04-15');
INSERT INTO students VALUES (20,'Priyanka Sen','priyanka20@gmail.com','9000000020',DATE '2024-04-20');
SELECT * FROM students;

INSERT INTO instructors VALUES (101,'Suresh Reddy','Web Development',55000);
INSERT INTO instructors VALUES (102,'Priya Menon','UI/UX',60000);
INSERT INTO instructors VALUES (103,'Ramesh Gupta','Data Science',70000);
INSERT INTO instructors VALUES (104,'Anjali Kapoor','Cyber Security',65000);
INSERT INTO instructors VALUES (105,'Vikas Sharma','Cloud Computing',72000);
INSERT INTO instructors VALUES (106,'Manoj Kumar','Python',58000);
INSERT INTO instructors VALUES (107,'Swati Jain','Java',60000);
INSERT INTO instructors VALUES (108,'Tarun Mehta','AI',80000);
INSERT INTO instructors VALUES (109,'Rekha Nair','Machine Learning',75000);
INSERT INTO instructors VALUES (110,'Ajay Singh','DevOps',73000);
INSERT INTO instructors VALUES (111,'Bhavna Rao','ReactJS',62000);
INSERT INTO instructors VALUES (112,'Kunal Shah','NodeJS',61000);
INSERT INTO instructors VALUES (113,'Ritu Das','SQL',57000);
INSERT INTO instructors VALUES (114,'Siddharth Roy','Testing',54000);
INSERT INTO instructors VALUES (115,'Varsha Iyer','Networking',63000);
INSERT INTO instructors VALUES (116,'Arvind Patel','Blockchain',82000);
INSERT INTO instructors VALUES (117,'Neeraj Yadav','Big Data',76000);
INSERT INTO instructors VALUES (118,'Pallavi Sen','UI Research',59000);
INSERT INTO instructors VALUES (119,'Harsha Kumar','Android Dev',68000);
INSERT INTO instructors VALUES (120,'Komal Verma','iOS Dev',69000);
SELECT * FROM instructors;

INSERT INTO courses VALUES (201,'Full Stack Web','Advanced','Certification',101);
INSERT INTO courses VALUES (202,'UI Design Basics','Beginner','Design',102);
INSERT INTO courses VALUES (203,'Python Programming','Intermediate','Programming',106);
INSERT INTO courses VALUES (204,'Data Science Bootcamp','Advanced','Certification',103);
INSERT INTO courses VALUES (205,'Cyber Security Fundamentals','Intermediate','Security',104);
INSERT INTO courses VALUES (206,'Cloud AWS','Advanced','Certification',105);
INSERT INTO courses VALUES (207,'Java Masterclass','Intermediate','Programming',107);
INSERT INTO courses VALUES (208,'AI Basics','Beginner','AI',108);
INSERT INTO courses VALUES (209,'Machine Learning Pro','Advanced','Certification',109);
INSERT INTO courses VALUES (210,'DevOps Complete','Advanced','Certification',110);
INSERT INTO courses VALUES (211,'ReactJS','Intermediate','Programming',111);
INSERT INTO courses VALUES (212,'NodeJS','Intermediate','Programming',112);
INSERT INTO courses VALUES (213,'SQL Basics','Beginner','Database',113);
INSERT INTO courses VALUES (214,'Software Testing','Beginner','Testing',114);
INSERT INTO courses VALUES (215,'Networking','Intermediate','Infrastructure',115);
INSERT INTO courses VALUES (216,'Blockchain Intro','Advanced','Certification',116);
INSERT INTO courses VALUES (217,'Big Data Hadoop','Advanced','Certification',117);
INSERT INTO courses VALUES (218,'UX Research','Intermediate','Design',118);
INSERT INTO courses VALUES (219,'Android Dev','Intermediate','Mobile',119);
INSERT INTO courses VALUES (220,'iOS Development','Intermediate','Mobile',120);
SELECT * FROM courses;

INSERT INTO modules VALUES (301,'HTML Basics',1,201);
INSERT INTO modules VALUES (302,'CSS Styling',2,201);
INSERT INTO modules VALUES (303,'Figma Intro',1,202);
INSERT INTO modules VALUES (304,'Advanced Python',1,203);
INSERT INTO modules VALUES (305,'ML Concepts',1,204);
INSERT INTO modules VALUES (306,'Security Threats',1,205);
INSERT INTO modules VALUES (307,'AWS Setup',1,206);
INSERT INTO modules VALUES (308,'Java OOP',1,207);
INSERT INTO modules VALUES (309,'AI Intro',1,208);
INSERT INTO modules VALUES (310,'ML Algorithms',1,209);
INSERT INTO modules VALUES (311,'CI/CD',1,210);
INSERT INTO modules VALUES (312,'React Components',1,211);
INSERT INTO modules VALUES (313,'ExpressJS',1,212);
INSERT INTO modules VALUES (314,'SQL Queries',1,213);
INSERT INTO modules VALUES (315,'Manual Testing',1,214);
INSERT INTO modules VALUES (316,'Network Basics',1,215);
INSERT INTO modules VALUES (317,'Blockchain Core',1,216);
INSERT INTO modules VALUES (318,'Hadoop Intro',1,217);
INSERT INTO modules VALUES (319,'User Research',1,218);
INSERT INTO modules VALUES (320,'Android UI',1,219);
SELECT * FROM modules;

INSERT INTO lessons VALUES (401,'HTML Tags',60,'Recorded',301);
INSERT INTO lessons VALUES (402,'CSS Flexbox',45,'Live',302);
INSERT INTO lessons VALUES (403,'Wireframing',50,'Recorded',303);
INSERT INTO lessons VALUES (404,'Loops in Python',55,'Live',304);
INSERT INTO lessons VALUES (405,'Regression',60,'Recorded',305);
INSERT INTO lessons VALUES (406,'Malware Types',40,'Recorded',306);
INSERT INTO lessons VALUES (407,'EC2 Setup',70,'Live',307);
INSERT INTO lessons VALUES (408,'Java Classes',50,'Recorded',308);
INSERT INTO lessons VALUES (409,'AI Applications',60,'Recorded',309);
INSERT INTO lessons VALUES (410,'Decision Trees',65,'Live',310);
INSERT INTO lessons VALUES (411,'Pipeline Setup',75,'Live',311);
INSERT INTO lessons VALUES (412,'Hooks in React',60,'Recorded',312);
INSERT INTO lessons VALUES (413,'Routing',45,'Recorded',313);
INSERT INTO lessons VALUES (414,'Select Statement',50,'Live',314);
INSERT INTO lessons VALUES (415,'Test Cases',40,'Recorded',315);
INSERT INTO lessons VALUES (416,'OSI Model',55,'Recorded',316);
INSERT INTO lessons VALUES (417,'Smart Contracts',65,'Live',317);
INSERT INTO lessons VALUES (418,'MapReduce',70,'Recorded',318);
INSERT INTO lessons VALUES (419,'User Interviews',50,'Live',319);
INSERT INTO lessons VALUES (420,'Activities',60,'Recorded',320);
SELECT * FROM lessons;

INSERT INTO enrollments VALUES (501,DATE '2024-02-01','Active',201,1);
INSERT INTO enrollments VALUES (502,DATE '2024-02-02','Active',202,2);
INSERT INTO enrollments VALUES (503,DATE '2024-02-03','Completed',203,3);
INSERT INTO enrollments VALUES (504,DATE '2024-02-04','Active',204,4);
INSERT INTO enrollments VALUES (505,DATE '2024-02-05','Active',205,5);
INSERT INTO enrollments VALUES (506,DATE '2024-02-06','Completed',206,6);
INSERT INTO enrollments VALUES (507,DATE '2024-02-07','Active',207,7);
INSERT INTO enrollments VALUES (508,DATE '2024-02-08','Active',208,8);
INSERT INTO enrollments VALUES (509,DATE '2024-02-09','Completed',209,9);
INSERT INTO enrollments VALUES (510,DATE '2024-02-10','Active',210,10);
INSERT INTO enrollments VALUES (511,DATE '2024-02-11','Active',211,11);
INSERT INTO enrollments VALUES (512,DATE '2024-02-12','Completed',212,12);
INSERT INTO enrollments VALUES (513,DATE '2024-02-13','Active',213,13);
INSERT INTO enrollments VALUES (514,DATE '2024-02-14','Active',214,14);
INSERT INTO enrollments VALUES (515,DATE '2024-02-15','Completed',215,15);
INSERT INTO enrollments VALUES (516,DATE '2024-02-16','Active',216,16);
INSERT INTO enrollments VALUES (517,DATE '2024-02-17','Active',217,17);
INSERT INTO enrollments VALUES (518,DATE '2024-02-18','Completed',218,18);
INSERT INTO enrollments VALUES (519,DATE '2024-02-19','Active',219,19);
INSERT INTO enrollments VALUES (520,DATE '2024-02-20','Active',220,20);
SELECT * FROM enrollments;

INSERT INTO payments VALUES (601,15000,'paid',DATE '2024-02-01',501);
INSERT INTO payments VALUES (602,10000,'paid',DATE '2024-02-02',502);
INSERT INTO payments VALUES (603,12000,'paid',DATE '2024-02-03',503);
INSERT INTO payments VALUES (604,18000,'paid',DATE '2024-02-04',504);
INSERT INTO payments VALUES (605,14000,'paid',DATE '2024-02-05',505);
INSERT INTO payments VALUES (606,20000,'paid',DATE '2024-02-06',506);
INSERT INTO payments VALUES (607,13000,'paid',DATE '2024-02-07',507);
INSERT INTO payments VALUES (608,11000,'paid',DATE '2024-02-08',508);
INSERT INTO payments VALUES (609,17000,'paid',DATE '2024-02-09',509);
INSERT INTO payments VALUES (610,16000,'paid',DATE '2024-02-10',510);
INSERT INTO payments VALUES (611,12500,'paid',DATE '2024-02-11',511);
INSERT INTO payments VALUES (612,11500,'paid',DATE '2024-02-12',512);
INSERT INTO payments VALUES (613,9000,'paid',DATE '2024-02-13',513);
INSERT INTO payments VALUES (614,9500,'paid',DATE '2024-02-14',514);
INSERT INTO payments VALUES (615,10500,'paid',DATE '2024-02-15',515);
INSERT INTO payments VALUES (616,22000,'paid',DATE '2024-02-16',516);
INSERT INTO payments VALUES (617,21000,'paid',DATE '2024-02-17',517);
INSERT INTO payments VALUES (618,10000,'paid',DATE '2024-02-18',518);
INSERT INTO payments VALUES (619,14000,'paid',DATE '2024-02-19',519);
INSERT INTO payments VALUES (620,15000,'paid',DATE '2024-02-20',520);
SELECT * FROM payments;

INSERT INTO assessments VALUES (701,'Quiz',100,201);
INSERT INTO assessments VALUES (702,'Assignment',100,202);
INSERT INTO assessments VALUES (703,'Quiz',100,203);
INSERT INTO assessments VALUES (704,'Quiz',100,204);
INSERT INTO assessments VALUES (705,'Assignment',100,205);
INSERT INTO assessments VALUES (706,'Quiz',100,206);
INSERT INTO assessments VALUES (707,'Quiz',100,207);
INSERT INTO assessments VALUES (708,'Assignment',100,208);
INSERT INTO assessments VALUES (709,'Quiz',100,209);
INSERT INTO assessments VALUES (710,'Assignment',100,210);
INSERT INTO assessments VALUES (711,'Quiz',100,211);
INSERT INTO assessments VALUES (712,'Assignment',100,212);
INSERT INTO assessments VALUES (713,'Quiz',100,213);
INSERT INTO assessments VALUES (714,'Assignment',100,214);
INSERT INTO assessments VALUES (715,'Quiz',100,215);
INSERT INTO assessments VALUES (716,'Assignment',100,216);
INSERT INTO assessments VALUES (717,'Quiz',100,217);
INSERT INTO assessments VALUES (718,'Assignment',100,218);
INSERT INTO assessments VALUES (719,'Quiz',100,219);
INSERT INTO assessments VALUES (720,'Assignment',100,220);
SELECT * FROM assessments

INSERT INTO assessment_scores VALUES (801,85,1,701,1);
INSERT INTO assessment_scores VALUES (802,78,1,702,2);
INSERT INTO assessment_scores VALUES (803,90,1,703,3);
INSERT INTO assessment_scores VALUES (804,88,1,704,4);
INSERT INTO assessment_scores VALUES (805,67,1,705,5);
INSERT INTO assessment_scores VALUES (806,92,1,706,6);
INSERT INTO assessment_scores VALUES (807,75,1,707,7);
INSERT INTO assessment_scores VALUES (808,80,1,708,8);
INSERT INTO assessment_scores VALUES (809,89,1,709,9);
INSERT INTO assessment_scores VALUES (810,76,1,710,10);
INSERT INTO assessment_scores VALUES (811,84,1,711,11);
INSERT INTO assessment_scores VALUES (812,73,1,712,12);
INSERT INTO assessment_scores VALUES (813,69,1,713,13);
INSERT INTO assessment_scores VALUES (814,91,1,714,14);
INSERT INTO assessment_scores VALUES (815,77,1,715,15);
INSERT INTO assessment_scores VALUES (816,93,1,716,16);
INSERT INTO assessment_scores VALUES (817,88,1,717,17);
INSERT INTO assessment_scores VALUES (818,74,1,718,18);
INSERT INTO assessment_scores VALUES (819,81,1,719,19);
INSERT INTO assessment_scores VALUES (820,86,1,720,20);
SELECT * FROM assessment_scores;

INSERT INTO certificates VALUES (901,DATE '2024-05-01',3,203);
INSERT INTO certificates VALUES (902,DATE '2024-05-02',6,206);
INSERT INTO certificates VALUES (903,DATE '2024-05-03',9,209);
INSERT INTO certificates VALUES (904,DATE '2024-05-04',12,212);
INSERT INTO certificates VALUES (905,DATE '2024-05-05',15,215);
INSERT INTO certificates VALUES (906,DATE '2024-05-06',18,218);
INSERT INTO certificates VALUES (907,DATE '2024-05-07',1,201);
INSERT INTO certificates VALUES (908,DATE '2024-05-08',2,202);
INSERT INTO certificates VALUES (909,DATE '2024-05-09',4,204);
INSERT INTO certificates VALUES (910,DATE '2024-05-10',5,205);
INSERT INTO certificates VALUES (911,DATE '2024-05-11',7,207);
INSERT INTO certificates VALUES (912,DATE '2024-05-12',8,208);
INSERT INTO certificates VALUES (913,DATE '2024-05-13',10,210);
INSERT INTO certificates VALUES (914,DATE '2024-05-14',11,211);
INSERT INTO certificates VALUES (915,DATE '2024-05-15',13,213);
INSERT INTO certificates VALUES (916,DATE '2024-05-16',14,214);
INSERT INTO certificates VALUES (917,DATE '2024-05-17',16,216);
INSERT INTO certificates VALUES (918,DATE '2024-05-18',17,217);
INSERT INTO certificates VALUES (919,DATE '2024-05-19',19,219);
INSERT INTO certificates VALUES (920,DATE '2024-05-20',20,220);
SELECT * FROM certificates;

SELECT *
FROM students
where join_date BETWEEN DATE '2024-01-01' AND DATE '2024-12-31';

SELECT *
FROM courses
WHERE course_level = 'Advanced';

alter TABLE assessment_scores
ADD result VARCHAR2(10);
UPDATE assessment_scores
SET marks = 30
WHERE score_id IN (805, 812, 818);

SELECT student_id
FROM assessment_scores
WHERE marks < 40;

SELECT student_id
FROM enrollments
GROUP by student_id
HAVING count(*) > 3;

INSERT INTO enrollments VALUES (521, DATE '2024-03-01', 'Active', 202, 1);

INSERT INTO enrollments VALUES (522, DATE '2024-03-05', 'Active', 203, 1);

INSERT INTO enrollments VALUES (523, DATE '2024-03-10', 'Active', 204, 1);
SELECT student_id
FROM enrollments
GROUP BY student_id
HAVING COUNT(course_id) > 3;
SELECT *
FROM instructors
where instructor_id NOT IN
      (SELECT instructor_id FROM courses);

SELECT s.name, c.title, i.name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
JOIN instructors i ON c.instructor_id = i.instructor_id;
 
 SELECT student_id, marks
FROM assessment_scores
WHERE marks < (SELECT AVG(marks) FROM assessment_scores);
UPDATE courses
SET instructor_id = 101
WHERE title = 'UI Design Basics';

SELECT instructor_id
FROM courses
WHERE title IN ('Full Stack Web','UI Design Basics')
GROUP BY instructor_id
HAVING COUNT(*) = 2;

SELECT course_id
FROM enrollments
GROUP BY course_id
HAVING COUNT(CASE WHEN status = 'Dropped' THEN 1 END) 
       > 0.8 * COUNT(*);

SELECT * FROM enrollments WHERE course_id = 201;
UPDATE enrollments
SET status = 'Dropped'
WHERE course_id = 201
AND enrollment_id IN (501,521,522,523);

SELECT student_id
FROM enrollments
WHERE enrollment_id NOT IN
      (SELECT enrollment_id 
       FROM payments 
       WHERE status = 'failed');
    
    
SELECT student_id, AVG(marks) AS average_marks
FROM assessment_scores
GROUP BY student_id;

SELECT c.category, SUM(p.amount) AS total_revenue
FROM payments p
JOIN enrollments e ON p.enrollment_id = e.enrollment_id
JOIN courses c ON e.course_id = c.course_id
WHERE p.status = 'paid'
GROUP BY c.category;

SELECT TO_CHAR(enroll_date,'MM-YYYY') AS month,
       COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY TO_CHAR(enroll_date,'MM-YYYY');

SELECT instructor_id, COUNT(course_id) AS total_courses
FROM courses
GROUP BY instructor_id
ORDER BY total_courses DESC
FETCH FIRST 1 ROW ONLY;

SELECT *
FROM (
    SELECT instructor_id, COUNT(course_id) AS total_courses
    FROM courses
    GROUP BY instructor_id
    ORDER BY total_courses DESC
)
WHERE ROWNUM = 1;
SELECT a.course_id, AVG(s.marks) AS avg_marks
FROM assessment_scores s
JOIN assessments a ON s.assessment_id = a.assessment_id
GROUP BY a.course_id
HAVING AVG(s.marks) < 50;

SELECT COUNT(*) AS total_instructors,
       SUM(salary) AS total_salary
       
FROM instructors;
SELECT * FROM instructors
WHERE salary > (SELECT AVG(salary) 
FROM instructors);

SELECT student_id, AVG(marks) AS avg_marks
FROM assessment_scores
GROUP by student_id
HAVING AVG(marks) >
      (SELECT AVG(marks)
      FROM assessment_scores);
      
SELECT student_id
FROM enrollments e
join courses c ON e.course_id = c.course_id
GROUP by student_id
HAVING COUNT(DISTINCT c.category) = 1
   and MAX(c.category) = 'Certification';
 
   
  SELECT s.name,
       COUNT(e.course_id) AS total_courses,
       p.status
FROM students s
join enrollments e ON s.student_id = e.student_id
join payments p ON e.enrollment_id = p.enrollment_id
GROUP by s.name, p.status;








































