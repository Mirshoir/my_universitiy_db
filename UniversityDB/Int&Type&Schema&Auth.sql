name varchar(20) not null
budget numeric(12,2) not null

create table course
		(course_id varchar(8),
		title varchar(50),
		dept_name varchar(20),
		credits numeric(2,0) check(credits > 0),
		primary key(course_id),
		foreign key(dept_name) references department
		on delete cascade
		on update cascade
);

CREATE TYPE Dollar FROM numeric(12,2) NOT NULL;

create table dept1
(dept_name varchar(20),
building varchar(15),
budget Dollar);

select *
from dept1

CREATE TYPE score AS TABLE
		(
		score INT,
		CHECK(score > 0 AND score < 100
		);

select *
from student with(index(studentid_index))
where ID = '10481'

revoke select on student from admin_1

CREATE ROLE leave_control AUTHORIZATION kim;

grant select on instrcutor to leave_control

create view cs_instructor as
		(select *
		from instructor
		where dept_name = 'Comp.Sci.');

		grant select on cs_instructor to kim

grant select on department to kim with grant option;

revoke select on department from kim cascade;
