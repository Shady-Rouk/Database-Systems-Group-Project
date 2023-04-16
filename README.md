# Database-Systems-Group-Project

## ER Diagram for a Professor Gradebook Database
![ER Diagram](https://raw.githubusercontent.com/Shady-Rouk/Database-Systems-Group-Project/main/Database%20Systems%20ERD.jpeg)
<!--Our ER Diagram-->


The given SQL code contains queries that create tables to store information about courses, students, and their grades. The schema contains seven key tables:

The course table stores information about courses, including the CRN (a unique identifier for each course), the course department, the course name, the semester, and the semester year.

The categories table stores information about the weight of each category (course participation, homework, test, and project) for each course, identified by the course CRN.

The student table stores information about students, including their student ID (a unique identifier for each student), the CRN of the course they are enrolled in, their first name, last name, major, and current grade in the course. This grade is initially 100 at the start of the class

The participation table stores information about each student's participation score and total participation points for each course.

The homework table stores information about each student's homework scores for each course.

The test table stores information about each student's test for each course.

The project table stores information about each student's test for each course.

The student_total_grade table is just a minor table used in calculating the student grade for students in a course


## THIS IS THE ORDER IN WHICH THE PAGES SHOULD BE RUN.
1. Run the code in create_queries.sql to create the tables that would be used.
2. Then run the codes in insert_queries.sql to insert values to the created tables.
3. Finally run the code in task_qeries.sql to perform individual tasks .


## Task 4:
This query just gets the maximum, minimum and average scores of all student in a particular course (102) and a particular homework (1)

## Task 5:
This query retrieves the student_id, first name (f_name), and last name (l_name) for all students enrolled in a specific course (102).

## Task 6:
This query retrieves the details and homework score for all students enrolled in a specific course (102). It orders the results by student_id to group all of a student's scores together.

## Task 7:
This query inserts a new homework and scores for all students in a particular course (101). Note that all hw_id are same as it is the same homework.

## Task 8:
The first query retrieves all rows from the "categories" table to display the values before they are updated. The second query updates the values in the "categories" table for a specific course (102), changing the percentage weight assigned to each category. In this case, the weight assigned to "course_participation" is changed to 20%, the weight assigned to "course_hw" is changed to 30%, the weight assigned to "test" is changed to 30%, and the weight assigned to "project" is changed to 20%.

## Task 9:
This query updates the "hw_score" field in the "homework" table, increasing the score by 2 points for all rows where the "hw_id" field is 1 and the "crn" field is 10. This effectively adds 2 points to all students' scores for the homework assignment in the course.

## Task 10:
The first query retrieves the homework scores for a specific student, in a specific course, and for a specific homework assignment. The second query updates the "hw_score" field in the "homework" table, adding 2 points to the score for all rows where the "crn" field is 102, the "hw_id" field is 3, and the "student_id" field matches a row in the "student" table where the student's last name contains a "Q".

## Task 11:
The query inserts a new row into the "student_total_grade" table for the specified student and course. student_total_grade is just a table that allows us smoothy calculate the grade of students in differnet courses while storing essential values. We will be caluclating the grad eof student with student_id 029291 and course 101. We calculate the scores based on the percentages in the different categories, updating it in the student_grade_table for each category and finally in the student table for the student(crn = 101, student_id = 029291)


## Task 12
Just like in task 11, this query updates new row into the "student_total_grade" table for the specified student and course. student_total_grade is just a table that allows us smoothy calculate the grade of students in differnet courses while storing essential values. We will be caluclating the grade of student with student_id 029291 and course 101. We calculate the scores based on the percentages in the different categories, updating it in the student_grade_table for each category and finally in the student table for the student(crn = 101, student_id = 029291). We drop the lowest assignment for the student in the course
