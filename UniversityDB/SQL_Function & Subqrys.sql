	select avg(salary)
	from instructor
	where dept_name = 'comp.sci.'


select count(distinct ID)
from teaches
where semester = 'spring' and year = 2010;


select count(*)
from course;


select dept_name, avg(salary) as avg_salary
from instructor
group by dept_name;


select dept_name, avg(salary)
from instructor
group by dept_name
having avg(salary) > 42000


select sum(salary)
from instructor


select distinct course_id
from section
where semester = 'fall' and year = 2009
and
course_id in(
			  select course_id
			  from section
			  where semester = 'spring' and year = 2010)


select distinct course_id
from section
where semester = 'fall' and year = 2009
and
course_id not in(
			  select course_id
			  from section
			  where semester = 'spring' and year = 2010)


select count(distinct t1.id)
	from takes as t1 inner join  teaches as t2 on t1.course_id = t2.course_id
		and t1.sec_id = t2.sec_id
		and t1.semester = t2.semester
		and t1.year = t2.year
where t2.id = 14365


select distinct t.name
from instructor as t, instructor as s
where t.salary > s.salary and s.dept_name = 'comp.sci.'
order by name desc;
--the same with '>some' clause
select name
from instructor
where salary > some(select salary
					from instructor
					where dept_name = 'comp.sci.')
					order by name desc;


select name 
from instructor
where salary > all(
					select salary
					from instructor
					where dept_name = 'comp.sci.')


select course_id
from section as s
where semester = 'fall' and year = 2009
and
exists(
		select *
		from section as t
		 where semester = 'spring' and year = 2010 and s.course_id = t.course_id);


select distinct S.id, S.name
from student as S
where not exists(
				(select course_id
				from course
				where dept_name = 'comp.sci.')
				except(select T.course_id
						from takes as T
						where S.id = T.ID));



select dept_name, avg_salary
from (
		select dept_name, avg(salary)
		from instructor
		group by dept_name) as dept_avg(dept_name, avg_salary)
where avg_salary > 42000;


with max_budget(value) as 
					(select max(budget)
					from department)
select department.dept_name
from max_budget, department
where department.budget = max_budget.value;


with dept_total(dept_name, value) as
								(select dept_name, sum(salary)
								from instructor
								group by dept_name),
dept_total_avg(value) as
					(select avg(value)
					from dept_total)
select dept_name
from dept_total, dept_total_avg
where dept_total.value > dept_total_avg.value;


select dept_name,
				(select count(*)
				from instructor
				where department.dept_name = instructor.dept_name)
				as num_instructors
from department;