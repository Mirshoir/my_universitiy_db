select*
from student
where name like 'Shan%'

SELECT name, ASCII(name) as ASCCI_fristCharacter
from student

select CHAR(65) as NumberCodeToCharacter

select CHARINDEX('t', 'teacher') as MatchPosition

select 'Sejong' +'' + 'University'

select convert(int, 13.12)

select UPPER('student')

select lower('STUdent')

select len('student')

select DATETIME = '05/09/2022'

select LEFT('SQL Tutorial', 3) as ExtraString;

select LTRIM('  SQL Tutorial') as LeftTrimmedString;

select NCHAR(65) as NumberCodeToUnicode;

select PATINDEX('%sejong%', 'sejong.ac.kr');

select REPLACE('SQL Tutorial', 'T', 'M');

select REPLICATE('SQL Tutorial', 5);

select REVERSE('SQL Tutorial')

select RIGHT('SQL Tutorial', 3) AS ExtraString;

select SUBSTRING('SQL Tutorial', 1, 3) AS ExtraString;

select distinct name
from instructor
order by name

select distinct name
from instructor
order by name desc

select distinct dept_name, name
from instructor
order by dept_name, name desc

select name
from instructor
where salary between 90000 and 100000

(select course_id
from section
where semester = 'Fall' and year = 2009)
union
		(select course_id
		from section
		where semester = 'Spring' and year = 2010)


(select course_id
from section
where semester = 'Fall' and year = 2009)
except
		(select course_id
		from section
		where semester = 'Spring' and year = 2010)


select distinct T.salary
from instructor as T, instructor as S
where T.salary < S.salary


select salary
from instructor