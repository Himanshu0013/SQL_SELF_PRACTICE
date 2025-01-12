use Self_practice;
create table city
(city_id varchar(50) not null,
city varchar(80),
foreign key(city_id) references students(id)
);

insert into city
values
('A01','Mathura'),
('A02','Aligarh'),
('A03','Hathras'),
('A04','Agra'),
('A05','Delhi'),
('A06','Noida'),
('A06','Noida'),
('A07','Gurgoan'),
('A08','Gaziabad'),
('A09','Faridabad'),
('A10','Mursan'),
('A11','Eglass'),
('A12','Bajna'),
('A13','Naujheel'),
('A14','Meerut'),
('A15','Bhiwadi'),
('A16','Palwal'),
('A17','Koshi'),
('A18','Chhata'),
('A19','Kanpur'),
('A20','Kashganj'),
('A21','Chennai');

select * from city;

