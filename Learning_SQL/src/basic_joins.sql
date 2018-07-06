/*
Database that holds the records of students, their papers and their grades.
*/

CREATE TABLE students (
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100)
);

CREATE TABLE papers(
	title VARCHAR (255),
	grade INT,
	student_id INT,
	FOREIGN KEY (student_id) REFERENCES students(id)
);

-----------------------------------------------------------------------

-----------------------------------------------------------------------

/*
1. Print the first name, paper title and corresponding grades 
of the students that have at least one paper.
*/
SELECT first_name, title, grade FROM students
JOIN papers
	ON students.id = papers.student_id;

-----------------------------------------------------------------------

-----------------------------------------------------------------------

/*
2. Print the first name, paper title and corresponding grades 
of all students (if a student has no paper, print NULL instead of the 
title and the grade).
*/
SELECT first_name, title, grade FROM students
LEFT JOIN papers
	ON students.id = papers.student_id;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

/*
3. Print the first name, paper title and corresponding grades 
of all students (if a student has no paper, print "MISSING" instead of the 
title and the "0" as the grade).
*/
SELECT first_name,
 	   IFNULL(title,"MISSING"),
 	   IFNULL(grade,0) 
	FROM students
LEFT JOIN papers
	ON students.id = papers.student_id;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

/*
4. Print for each student their first name and their average grade.
*/
SELECT first_name, AVG(IFNULL(grade,0)) AS average FROM students
LEFT JOIN papers
	ON students.id = papers.student_id
GROUP BY first_name;

-----------------------------------------------------------------------


-----------------------------------------------------------------------

/*
4. Print for each student their first name, their average grade and 
the passing status ("PASSING" if average >= 75, "NOT PASSING" else).
*/
SELECT first_name,
	   AVG(IFNULL(grade,0)) AS average,
	   CASE WHEN AVG(IFNULL(grade,0)) >= 75 THEN "PASSING"
	   ELSE "FAILING"
	   END AS "passing_status"
	   FROM students
LEFT JOIN papers
	ON students.id = papers.student_id
GROUP BY first_namesudo;
