-- Table Creation Queries
CREATE TABLE course(
    crn INT PRIMARY KEY,
    course_department VARCHAR(250),
    course_name VARCHAR(250),
    semester VARCHAR(250),
    semester_year INT
);

CREATE TABLE categories(
    crn INT PRIMARY KEY,
    course_participation INT,
    course_hw INT,
    test INT,
    project INT
);

ALTER TABLE categories
ADD FOREIGN KEY (crn) REFERENCES course(crn);

CREATE TABLE student(
    student_id INT,
    crn INT,
    f_name VARCHAR(250),
    l_name VARCHAR(250),
    major VARCHAR(250),
    grade DECIMAL(5,2),
    PRIMARY KEY (student_id, crn)
);

ALTER TABLE student
ADD FOREIGN KEY (crn) REFERENCES course(crn);

CREATE TABLE participation(
    student_id INT,
    crn INT,
    student_participation INT,
    total_participation INT,
    PRIMARY KEY(student_id, crn)
);

ALTER TABLE participation
ADD FOREIGN KEY (crn) REFERENCES course(crn);
ALTER TABLE participation
ADD FOREIGN KEY (student_id) REFERENCES student(student_id);

CREATE TABLE homework(
    hw_id INT,
    student_id INT,
    crn INT,
    hw_score INT,
    max_score INT,
    PRIMARY KEY(hw_id, student_id, crn)
);

ALTER TABLE homework
ADD FOREIGN KEY (crn) REFERENCES course(crn);
ALTER TABLE homework
ADD FOREIGN KEY (student_id) REFERENCES student(student_id);

CREATE TABLE test(
    test_id INT,
    student_id INT,
    crn INT,
    test_score INT,
    max_score INT,
    PRIMARY KEY(test_id, student_id, crn)
);

ALTER TABLE test
ADD FOREIGN KEY (crn) REFERENCES course(crn);
ALTER TABLE test
ADD FOREIGN KEY (student_id) REFERENCES student(student_id);

CREATE TABLE project(
    project_id INT,
    student_id INT,
    crn INT,
    project_score INT,
    max_score INT,
    PRIMARY KEY(project_id, student_id, crn)
);

ALTER TABLE project
ADD FOREIGN KEY (crn) REFERENCES course(crn);
ALTER TABLE project
ADD FOREIGN KEY (student_id) REFERENCES student(student_id);

CREATE TABLE student_total_grade(
    student_id INT,
    crn INT,
    course_participation DECIMAL(5,2),
    course_hw DECIMAL(5,2),
    test DECIMAL(5,2),
    project DECIMAL(5,2),
    PRIMARY KEY (student_id, crn)
);
