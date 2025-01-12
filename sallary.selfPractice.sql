use self_practice;

create table sallary
(employee_id varchar(50) not null,
department varchar(50),
sellary int,
foreign key(employee_id) references students(id)
);

insert into sallary
values
('A01','Software engineering',130000),
('A02','HR',70000),
('A03','Testing',50000),
('A04','Development',68000),
('A05','Deployment',56000),
('A06','Quality control',45000),
('A07','Production',34000),
('A08','Quality Assurance',45000),
('A09','PPC',35000),
('A10','Stamping',34000),
('A11','Designing',56000),
('A12','HR',46000),
('A13','stamping',78000),
('A14','Software engineering',89000),
('A15','Development',87000),
('A16','Teaching',67000),
('A17','PPC',32000),
('A18','Annealing',22000),
('A19','Testing',43000),
('A20','HR',44000),
('A21','Deployment',68000);

select * from sallary;



