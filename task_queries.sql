-- Task 4
-- Run to see homework table and scores
SELECT * FROM homework 
WHERE crn = 102
AND hw_id = 1;

-- Highest score for Homework hw_id = 4, CRN = 102
SELECT MAX(hw_score) FROM homework 
WHERE hw_id = 1
AND crn = 102;

-- Lowest score for Homework hw_id = 4, CRN = 102
SELECT MIN(hw_score) FROM homework 
WHERE hw_id = 1
AND crn = 102;

-- Average score for Homework hw_id = 4, CRN = 102
SELECT AVG(hw_score) FROM homework 
WHERE hw_id = 1
AND crn = 102;



-- Task 5
-- List all the students in a given course
SELECT student_id, f_name, l_name FROM student
WHERE crn = 102;



-- Task 6
-- List all of the students in a course and all of their scores on every assignment
SELECT student_id, crn, hw_id, hw_score FROM homework
WHERE crn = 102
ORDER BY student_id;



-- Task 7
-- Run to preview the homework table before adding an new homework
SELECT  DISTINCT hw_id, stu.student_id, f_name, l_name, hw.crn, hw_score, max_score
FROM homework AS hw JOIN student as stu ON stu.student_id = hw.student_id
WHERE hw.crn = 101
ORDER BY student_id;

-- Add an assignment to a course
INSERT INTO homework (hw_id, student_id, crn, hw_score, max_score)
VALUES (3, 029290, 101, 19, 20),
       (3, 029291, 101, 15, 20),
       (3, 029292, 101, 18, 20),
       (3, 029293, 101, 12, 20);



-- Task 8
-- Run to preview categories table
SELECT * FROM categories;

-- Change the percentages of the categories for a course
UPDATE categories
SET course_participation = 20, course_hw = 30, test = 30, project = 20
WHERE CRN = 102;



-- Task 9
-- Run to preview the homework table
SELECT * FROM homework 
WHERE crn = 101 and hw_id = 1
ORDER BY student_id;

-- Add 2 points to the score of each student on an assignment
UPDATE homework
SET hw_score = (hw_score + 2)
WHERE homework.hw_id = 1 AND homework.crn = 101;



-- Task 10
-- RUn to preview the homework and student joined table
SELECT  DISTINCT hw_id, stu.student_id, f_name, l_name, hw.crn, hw_score, max_score
FROM homework AS hw JOIN student as stu ON stu.student_id = hw.student_id
WHERE hw.crn = 102
AND hw_id = 1;

-- Add 2 points to students whose last name contains a 'Q'
UPDATE homework
SET hw_score = hw_score + 2
WHERE crn = 102
AND hw_id = 1
AND student_id IN (
    SELECT student_id FROM student WHERE LOWER(l_name) LIKE '%q%'
);



-- Task 11: Compute the grade for a student
-- Insert student id and crn into table to calculate grade
INSERT INTO student_total_grade(student_id, crn) VALUES(029291, 101);

--  Updates the student's total participation grade
UPDATE student_total_grade
SET course_participation = (
    SELECT (p.student_participation / p.total_participation) * c.course_participation
    FROM participation p
    JOIN categories c ON p.crn = c.crn
    WHERE p.student_id = 029291 AND p.crn = 101
)
WHERE student_id = 029291 AND crn = 101;

--  Updates the student's total hw grade
UPDATE student_total_grade
SET course_hw = (
    SELECT ((SUM(hw_score) / SUM(max_score)) * categories.course_hw)
    FROM homework
    INNER JOIN categories ON homework.crn = categories.crn
    WHERE homework.student_id = 029291 AND homework.crn = 101
    GROUP BY homework.student_id, homework.crn
)
WHERE student_id = 029291 AND crn = 101;

--  Updates the student's total test grade
UPDATE student_total_grade
SET test = (
    SELECT ((SUM(test_score) / SUM(max_score)) * categories.test)
    FROM test
    INNER JOIN categories ON test.crn = categories.crn
    WHERE test.student_id = 029291 AND test.crn = 101
    GROUP BY test.student_id, test.crn
)
WHERE student_id = 029291 AND crn = 101;

--  Updates the student's total project grade
UPDATE student_total_grade
SET project = (
    SELECT ((SUM(project_score) / SUM(max_score)) * categories.project)
    FROM project
    INNER JOIN categories ON project.crn = categories.crn
    WHERE project.student_id = 029291 AND project.crn = 101
    GROUP BY project.student_id, project.crn
)
WHERE student_id = 029291 AND crn = 101;

-- Updates the grade  field in the student database for the student
UPDATE student
SET grade = (
    SELECT SUM(course_participation + course_hw + test + project) FROM student_total_grade
    WHERE student_total_grade.student_id = 029291 AND student_total_grade.crn = 101
)
WHERE student.student_id = 029291 AND student.crn = 101;

-- View student table with new grade after computing and updating the value
SELECT * FROM student;



-- Task 12: Compute te grade for a student, where the lowest score for a given category is dropped.
-- Insert student id and crn into table to calculate grade
INSERT INTO student_total_grade(student_id, crn) VALUES(029291, 101);

--  Updates the student's total participation grade
UPDATE student_total_grade
SET course_participation = (
    SELECT (p.student_participation / p.total_participation) * c.course_participation
    FROM participation p
    JOIN categories c ON p.crn = c.crn
    WHERE p.student_id = 029291 AND p.crn = 101
)
WHERE student_id = 029291 AND crn = 101;


--  Updates the student's total hw grade
UPDATE student_total_grade
SET course_hw = (
    SELECT (((SUM(hw_score) - (SELECT MIN(hw_score) FROM homework WHERE crn = 101 AND student_id = 029291)) / (SUM(max_score) - 20)) * categories.course_hw)
    FROM homework
    INNER JOIN categories ON homework.crn = categories.crn
    WHERE homework.student_id = 029291 AND homework.crn = 101
    GROUP BY homework.student_id, homework.crn
)
WHERE student_id = 029291 AND crn = 101;

--  Updates the student's total test grade
UPDATE student_total_grade
SET test = (
    SELECT ((SUM(test_score) / SUM(max_score)) * categories.test)
    FROM test
    INNER JOIN categories ON test.crn = categories.crn
    WHERE test.student_id = 029291 AND test.crn = 101
    GROUP BY test.student_id, test.crn
)
WHERE student_id = 029291 AND crn = 101;

--  Updates the student's total project grade
UPDATE student_total_grade
SET project = (
    SELECT ((SUM(project_score) / SUM(max_score)) * categories.project)
    FROM project
    INNER JOIN categories ON project.crn = categories.crn
    WHERE project.student_id = 029291 AND project.crn = 101
    GROUP BY project.student_id, project.crn
)
WHERE student_id = 029291 AND crn = 101;

-- Updates the grade field in the student database for the student
UPDATE student
SET grade = (
    SELECT SUM(course_participation + course_hw + test + project) FROM student_total_grade
    WHERE student_total_grade.student_id = 029291 AND student_total_grade.crn = 101
)
WHERE student.student_id = 029291 AND student.crn = 101;

-- View student table with new grade after computing and updating the value
SELECT * FROM student;
