-- Inserting two sample courses into the course table
INSERT INTO course (crn, course_department, course_name, semester, semester_year)
VALUES (101, 'CEA', 'Theory of Computation', 'Fall', 2022),
       (102, 'CEA', 'Database Systems', 'Spring', 2023);

-- Inserting sample values into categories table
INSERT INTO categories (crn, course_participation, course_hw, test, project)
VALUES (101, 40, 20, 30, 10),
       (102, 35, 15, 25, 25);

-- Inserting sample values into student table with NULL for grade
INSERT INTO student (student_id, crn, f_name, l_name, major, grade)
VALUES (029290, 101, "Taiwo", "Oriowo", "Computer Science", 100.00),
       (029291, 101, "Farouk", "Balogun", "Computer Science", 100.00),
       (029292, 101, "Chinonso", "Okafor", "Computer Science", 100.00),
       (029293, 101, "Jody", "Quant", "Computer Engineering", 100.00),
       (029291, 102, "Farouk", "Balogun", "Computer Science", 100.00),
       (029292, 102, "Chinonso", "Okafor", "Computer Science", 100.00),
       (029294, 102, "Mike", "Jacques", "Mathematics", 100.00),
       (029295, 102, "John", "Doe", "Computer Engineering", 100.00);


-- Inserting sample values into participation table
INSERT INTO participation (student_id, crn, student_participation, total_participation)
VALUES (029290, 101, 10, 10),
       (029291, 101, 9, 10),
       (029292, 101, 9, 10),
       (029293, 101, 8, 10),
       (029291, 102, 9, 10),
       (029292, 102, 10, 10),
       (029294, 102, 8, 10),
       (029295, 102, 7, 10);

-- Inserting sample values into homework table
INSERT INTO homework (hw_id, student_id, crn, hw_score, max_score)
VALUES (1, 029290, 101, 18, 20),
       (1, 029291, 101, 19, 20),
       (1, 029292, 101, 20, 20),
       (1, 029293, 101, 19, 20),
       (2, 029290, 101, 20, 20),
       (2, 029291, 101, 19, 20),
       (2, 029292, 101, 17, 20),
       (2, 029293, 101, 19, 20),
       (1, 029291, 102, 18, 20),
       (1, 029292, 102, 19, 20),
       (1, 029294, 102, 20, 20),
       (1, 029295, 102, 19, 20),
       (2, 029291, 102, 20, 20),
       (2, 029292, 102, 19, 20),
       (2, 029294, 102, 20, 20),
       (2, 029295, 102, 19, 20);

-- Inserting sample values into test table
INSERT INTO test (test_id, student_id, crn, test_score, max_score)
VALUES (1, 029290, 101, 20, 20),
       (1, 029291, 101, 19, 20),
       (1, 029292, 101, 20, 20),
       (1, 029293, 101, 19, 20),
       (2, 029290, 101, 20, 20),
       (2, 029291, 101, 20, 20),
       (2, 029292, 101, 20, 20),
       (2, 029293, 101, 19, 20),
       (1, 029291, 102, 20, 20),
       (1, 029292, 102, 19, 20),
       (1, 029294, 102, 20, 20),
       (1, 029295, 102, 19, 20);

-- Inserting sample values into project table
INSERT INTO project (project_id, student_id, crn, project_score, max_score)
VALUES (1, 029290, 101, 30, 40),
       (1, 029291, 101, 39, 40),
       (1, 029292, 101, 30, 40),
       (1, 029293, 101, 39, 40),
       (1, 029291, 102, 30, 40),
       (1, 029292, 102, 39, 40),
       (1, 029294, 102, 30, 40),
       (1, 029295, 102, 39, 40);

