-- Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

-- Insert data into students table
INSERT INTO students (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

-- Create courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Insert data into courses table
INSERT INTO courses (course_id, student_id, course_name) VALUES
(101, 1, 'Math'),
(102, 2, 'Science'),
(103, 1, 'English'),
(104, 3, 'History');

-- Inner Join: Returns rows where there is a match in both tables.
SELECT students.student_name, courses.course_name
FROM students
INNER JOIN courses ON students.student_id = courses.student_id;
-- Result:
-- | student_name | course_name |
-- |--------------|-------------|
-- | Alice        | Math        |
-- | Alice        | English     |
-- | Bob          | Science     |
-- | Charlie      | History     |

-- Left Join: Returns all rows from the left table (students), with matching rows from the right table (courses). If no match, NULL is returned.
SELECT students.student_name, courses.course_name
FROM students
LEFT JOIN courses ON students.student_id = courses.student_id;
-- Result:
-- | student_name | course_name |
-- |--------------|-------------|
-- | Alice        | Math        |
-- | Alice        | English     |
-- | Bob          | Science     |
-- | Charlie      | History     |
-- | David        | NULL        |

-- Right Join: Returns all rows from the right table (courses), with matching rows from the left table (students). If no match, NULL is returned.
SELECT students.student_name, courses.course_name
FROM students
RIGHT JOIN courses ON students.student_id = courses.student_id;
-- Result:
-- | student_name | course_name |
-- |--------------|-------------|
-- | Alice        | Math        |
-- | Bob          | Science     |
-- | Alice        | English     |
-- | Charlie      | History     |

-- Full Outer Join: Returns all rows when there is a match in either table. If no match, NULLs are returned for non-matching side.
SELECT students.student_name, courses.course_name
FROM students
LEFT JOIN courses ON students.student_id = courses.student_id
UNION
SELECT students.student_name, courses.course_name
FROM students
RIGHT JOIN courses ON students.student_id = courses.student_id;
-- Result:
-- | student_name | course_name |
-- |--------------|-------------|
-- | Alice        | Math        |
-- | Alice        | English     |
-- | Bob          | Science     |
-- | Charlie      | History     |
-- | David        | NULL        |

-- Cross Join: Returns the Cartesian product of the two tables.
SELECT students.student_name, courses.course_name
FROM students
CROSS JOIN courses;
-- Result:
-- | student_name | course_name |
-- |--------------|-------------|
-- | Alice        | Math        |
-- | Alice        | Science     |
-- | Alice        | English     |
-- | Alice        | History     |
-- | Bob          | Math        |
-- | Bob          | Science     |
-- | Bob          | English     |
-- | Bob          | History     |
-- | Charlie      | Math        |
-- | Charlie      | Science     |
-- | Charlie      | English     |
-- | Charlie      | History     |
-- | David        | Math        |
-- | David        | Science     |
-- | David        | English     |
-- | David        | History     |

-- Self Join: Joining the table with itself to find pairs of students.
SELECT a.student_name AS student1, b.student_name AS student2
FROM students a, students b
WHERE a.student_id < b.student_id;
-- Result:
-- | student1 | student2 |
-- |----------|----------|
-- | Alice    | Bob      |
-- | Alice    | Charlie  |
-- | Alice    | David    |
-- | Bob      | Charlie  |
-- | Bob      | David    |
-- | Charlie  | David    |
