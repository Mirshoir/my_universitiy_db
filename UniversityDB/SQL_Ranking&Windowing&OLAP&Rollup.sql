CREATE TABLE student_gpa (
				id VARCHAR(20),
				GPA DECIMAL(5,2)
);

INSERT INTO student_gpa (id, GPA)
	SELECT s.id, SUM(t.score * c.credits) / SUM(c.credits)
	FROM student AS s
		INNER JOIN takes AS t ON s.id = t.id
		INNER JOIN course AS c ON t.course_id = c.course_id
	GROUP BY s.id;

SELECT *
FROM student_gpa;

SELECT student_gpa.ID, student_gpa.gpa,
						RANK() OVER (PARTITION BY student_gpa.ID ORDER BY student_gpa.gpa DESC) AS s_rank
FROM student_gpa JOIN student 
						ON student_gpa.id = student.id
WHERE student.dept_name = 'comp. sci.'
GROUP BY student_gpa.ID, student_gpa.gpa;

select ID, gpa, (1+(select COUNT(*)
					from student_gpa as B
					where B.GPA > A.gpa)) as s_rank
from student_gpa as A
order by s_rank;

select student.id, dept_name,
		RANK() over(partition by dept_name order by student_gpa.GPA desc) as dept_rank
from student_gpa join student
		on student.id=student_gpa.id
group by dept_name, student.id, student_gpa.GPA;

select id,
		ntile(4) over(order by student_gpa.gpa desc) as quartile
from student_gpa

select ID, course_id, score,
							avg(score) over() as Avg_all
from takes
where ID = 239;

SELECT S.year, S.courses,
			CASE WHEN COUNT(*) < 3 THEN NULL
            ELSE AVG(s)
			END AS SimpleMovingAverage
FROM course_year AS S
	OUTER APPLY (SELECT TOP(3) courses, 
			FROM course_year
			 WHERE year < S.year
			 ORDER BY [year] DESC) AS D(s)
GROUP BY S.year, S.courses
ORDER BY S.year;

create table sport_dress
			(item varchar(20),
			color varchar(20),
			size varchar(10),
			quantity int);

select *
from sport_dress

select item, color, size, quantity,
							sum(quantity)
from sport_dress
group by cube(item, color, size, quantity)

SELECT item, [dark] AS Dark, [White] AS white,
[yellow] as yellow, [red] as red
FROM
	(SELECT item, color, quantity
	 FROM sport_dress
	) AS ps
	 PIVOT
	(SUM (quantity)
	 FOR color IN ( [dark], [white], [yellow],
[red])
)AS pvt

select item, color, size, sum(quantity)
from sport_dress
group by item, color, size with rollup;