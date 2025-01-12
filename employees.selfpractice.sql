create database self_practice;
use self_practice;
create table students
(id int not null primary key,
student_name varchar(50),
course varchar(80));


Alter table students
modify column id varchar(50);

insert into students
values
('A01','Himanshu_chaudhary','Btech'),
('A02','Mohan','Bcom'),
('A03','Ram','BA'),
('A04','Shyam','MA'),
('A05','Ramesh','LLB'),
('A06','Suresh','Msc'),
('A07','Mukesh','Mcom'),
('A08','Naveen','BA'),
('A09','Manish','MBA'),
('A10','Yukti','MCA'),
('A11','Ashika','B.Pharma'),
('A12','Akriti','D.pharma'),
('A13','Poonam','FashionDesign'),
('A14','Samma','MBA'),
('A15','Rita','LLB'),
('A16','Pari','Bcom'),
('A17','Shanaya','Fashion'),
('A18','Asha','Parlour'),
('A19','Babli','Parlour'),
('A20','Minakshi','BBA'),
('A21','Sohan','Bsc');

select * from students;