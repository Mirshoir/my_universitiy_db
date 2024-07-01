select *
from student
join takes on student.ID = takes.ID

select *
from course
left join prereq on course.course_id = prereq.course_id

select *
from course
right join prereq on course.course_id = prereq.course_id

select *
from course
full join prereq on course.course_id = prereq.course_id

select *
from course
inner join prereq on course.course_id = prereq.course_id

select *
from course
left join prereq on course.course_id = prereq.course_id

select ID, name, dept_name
from instructor

create view faculty as
			select ID, name, dept_name
			from instructor

select *
from faculty

insert into faculty
		values('30765', 'Park', 'Comp.Sci.');

create view instructor_info as
select ID, name, building
from instructor, department
where instructor.dept_name = department.dept_name

insert into instructor_info
values('69987', 'Lee', 'Daeyang');

create force view view_name as 
		select column_name
		from table_name
		where condition

