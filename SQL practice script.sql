/*CREATE DATABASE myDB;
USE myDB;
DROP DATABASE myDB;

CREATE DATABASE myDB;
USE myDB;

ALTER DATABASE myDB read only = 1; 


CREATE TABLE employee (
employee_id INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
hourly_rate DECIMAL(5,2),
hire_date DATE
);
SELECT * FROM employee;

rename table employee to workers;
rename table workers to employees;

alter table employees
add phojne_number VARCHAR(50);

SELECT * FROM employees;


alter table employees
rename column phojne_number to email;

select * from employees;


alter table employees
modify column email VARCHAR(100);

ALTER TABLE employees
modify email varchar(100) 
after last_name;

select* from employees;

alter table employees
drop column email; 
select * from employees; 

insert into employees
values (1,"Eugene","Krabs",25.50,"2023-01-02");
select * from employees;
*/

/*
insert into employees
values  (2,"Squidward","Tentacles",15.00,"2023-01-03"),
		(3,"Spongbob", "Squarepants", 12.50,"2023-01-04"),
        (4,"Patrick","Star" , 12.50,"2023-01-05"),
        (5,"Sandy","Cheeks",17.25,"2023-01-06");
        select * from employees;
        */
  /*insert into employees(employee_id,first_name,last_name)
  values (6,"Sheldon","Plankton");
  select * from employees;
*/

/*
select first_name, last_name from employees;
*/

/*
select last_name, first_name from employees;
*/

/*
select * from employees where employee_id = 1;
*/

/*
select * from employees where first_name = "Spongbob";
*/
/*
select * from employees where hourly_rate >= 15;
*/
/*
select * from employees where hire_date <= "2023-01-03";
*/
/*

select * from employees where employee_id != 1;
*/
/*
select * from employees where hire_date is null;
*/

/*
SET SQL_SAFE_UPDATES = 0;
update employees
 set hourly_rate  = 10.50 ,
 hire_date = "2023-01-07"
 where employee_id = 6;

select * from employees;
*/
/*
set autocommit = off;
commit;*/
/*
delete from employees;
select * from employees;
*/
/*
rollback;
select * from employees;
commit;*/ 

/*
create Table test(
my_date  DATE,
my_Time  Time,
my_datetime  DATETIME
);

COMMIT;*/
/*
insert into test 
values (CURRENT_DATE() , CURRENT_TIME,NOW());
SELECT * FROM test;
*/
/*
drop table test;
*/

/*create table products(
product_id int,
product_name VARCHAR(25) UNIQUE,
PRICE DECIMAL(4,2)
); 
COMMIT;
*/
/*
ALTER TABLE products
add constraint
unique(product_name);
*/

/*

insert into products
values(100,"Hamberger",3.99),
	  (101,"fries",1.89),
	  (102,"soda",1.00),
	  (103,"ice cream" ,1.49);
     
      
      select* from products; 
*/

/*commit;
alter table products 
modify PRICE decimal(4, 2) not null;
*/
/*
INSERT INTO products 
values (104,"cookie",0);
*/


/*alter table employees 
add constraint chk_hourly_pay 
check (hourly_rate >=10.00)


select * from employees; */
/*commit;*/

/*
insert into employees
values (6,"Sheldon", "Plankton", 10.00,"2023-01-07");

/*commit;

alter table employees
drop check chk_hourly_pay;
*/
/*
insert into products 
values  (104,"straw",0.00),
		(105,"napkin",0.00),
		(106,"fork",0.00),
		(107,"spoon",0.00);
select * from products;

delete from products 
where product_id >= 104;

alter table products 
alter price set default 0;


insert into products(product_id, product_name) 
values  (104,"straw"),
		(105,"napkin"),
		(106,"fork"),
		(107,"spoon");
select * from products; 
*/

/*
CREATE TABLE transactions (
    transactions_id   INT,
    amount            DECIMAL(5,2),
    transaction_date  DATETIME DEFAULT CURRENT_TIMESTAMP
    );

insert into transactions (transactions_id, amount)
values(3,8.37);

SELECT * FROM transactions;

commit;
drop table transactions;
*/
/*
create table transactions(
transaction_id int primary key,
amount decimal(5,2)
);
select * from transactions;

insert into transactions
values(1003,4.49);
select * from transactions;

select amount
from transactions
where transaction_id = 1003;*/
/*
commit; 


drop table transactions;
*/
/*
create table transactions(
transaction_id int primary key auto_increment,
amount decimal (5,2)
);

select * from transactions;

insert into transactions (amount)
values (4.99);
select * from transactions;


alter table transactions 
auto_increment =1000;
select * from transactions;

delete from transactions;
select * from transactions;


insert into transactions(amount)
values (4.49);
select * from transactions;

commit;

*/
/*
create table customers(
customer_id int primary key auto_increment,
first_name varchar(50),
last_name varchar(50)
);

 insert into customers (first_name,last_name)
 values  ("Fred","Fish"),
		 ("Larry","Lobster"),
		 ("Bubble", "Bass");
         
 select * from customers;

commit; */
/*
drop table transactions;

create table transactions(
transaction_id int primary key auto_increment,
amount decimal(5,2),
customer_id int,
foreign key (customer_id) references customers(customer_id)
);
select * from transactions;

insert into transactions(amount,customer_id)
values  (4.99,3),
		(2.89,2),
		(3.38,3),
		(4.99,1);
        select* from transactions;
        
        
        insert into transactions (amount,customer_id)
        values (1.00,null);
        select * from transactions;


insert into customers(first_name,last_name)
values("Poppy","Puff");
select * from customers;

select *
from transactions inner join customers
on transactions.customer_id = customers.customer_id;

select   transaction_id,first_name,last_name
from transactions inner join customers
on transactions.customer_id = customers.customer_id;

select * 
from  transactions left join customers
on transactions.customer_id = customers.customer_id;


select count(amount) as count
from transactions;


select max(amount) as "todays max "
from transactions;

select min(amount) as minimum
from transactions; 

selecT AVG (amount) as average
from transactions;

select SUM(amount) as sum
from transactions;


SELECT CONCAT(first_name," ",last_name) AS full_name
from employees;

alter table employees 
add column job VARCHAR (25) AFTER hourly_rate;
select * from employees;


update employees
set job = "janitor "
where employee_id = 6;
select * from employees;


select * from employees 
where hire_date < "2023-01-4" AND job = "cook";

SELECT * FROM employees 
WHERE  job = "cook";

select * 
from employees
where job = "cook" or job = "cashier"; 


select * from employees
where not job = "manager";

select * from employees;

update employees
set job = "janitor "
where employee_id = 6;
select * from employees;


SET SQL_SAFE_UPDATES = 0;
commit;

update employees
set job = "asst. managerr "
where employee_id = 5;
select * from employees;

select * 
from employees
where job = "cook" or job = "cashier"; 
commit;

select * from employees;

SELECT *
FROM employees
WHERE job = 'cook' OR job = 'cashier';


SELECT *
FROM employees
WHERE LOWER(job) IN ('cook', 'cashier');

select * from employees; 



select * from employees
where job in ("cook", "cashier","janitor");

/* ISSUES FROM 1 HOUR 30 MIN IN */
/*
select * from employees where first_name = "s";
*/

select * FROM employees where first_name like "S%";

select * FROM employees where hire_date like "2023%";


select * from employees
where last_name like "%r";

select * FROM employees where first_name like "Sp%";
select * FROM employees where job like "_ook";

select * from employees
order by last_name desc;

select * from employees
order by first_name asc;

select * from employees
order by hire_date asc;

select * from employees
order by hire_date  desc;

select * from transactions
order by amount, customer_id;

select * from customers
limit 3;

select * from customers
order by last_name desc limit 1;

select * from customers
limit 2,1;


create table income (
income_name varchar(50),
amount int
);

insert into income(income_name,amount)
values  ("orders",100000.00),
		("merchandise",50000.00),
		("services",125000.00);

create table expenses(
expense_name varchar(50),
amount int
);

insert into expenses(expense_name,amount)
values  ("wages",-250000.00),
		("tax",-50000.00),
		("repairs",-15000.00);
        
        select * from income
        union 
        select * from expenses; 
        
        drop table income;
        drop table expenses; 


select * from employees; 

select first_name,last_name from employees
union 
select first_name,last_name from customers;

insert into customers
values(5,"Sheldon","Plankton");
select * from customers;

select first_name,last_name from employees
union all 
select first_name,last_name from customers;


delete from customers
where customer_id = 5;
select * from customers;

alter table customers
add referral_id int;
select * from customers;

update customers
set referral_id = 2
where customer_id = 4;
select * from customers; 

commit;


select a.customer_id,a.first_name,a.last_name,
CONCAT(b.first_name,b.last_name) AS "reffered by"
from customers as a 
inner join customers as b
on a.referral_id = b.customer_id;

alter table employees
add supervisor_id int;
select * from employees;


update employees
set supervisor_id = 1
where employee_id = 5;
select * from employees;

select * from employees as a 
inner join employees as b 
on a.supervisor_id = b.employee_id;

commit;

select a.first_name,a.last_name,
CONCAT(b.first_name," ", b.last_name) as "reports to"
from employees as a 
inner join employees as b 
on a.supervisor_id = b.employee_id;

select * from employees;


create view employee_attendance as 
select first_name, last_name
from employees; 


select * from employee_attendance;

select * from employee_attendance
order by last_name asc;

drop view employee_attendance;

alter table customers
add column email varchar(50);
select * from customers; 

update customers
set email = "FFish@gmail.com"
where customer_id =1;
select * from customers;

update customers
set email = "LLobster@gmail.com"
where customer_id =2;
select * from customers;

update customers
set email = "BBass@gmail.com"
where customer_id =3;
select * from customers;

update customers
set email = "PPuff@gmail.com"
where customer_id =4;
select * from customers;



create view customer_emails as 
select email
from customers;

select * from customer_emails;



insert into customers
values (5,"Pearl", "Krabs",null, "PKrabs@gmail.com");
select * from customers ; 


select * from customer_emails; 

show indexes from customers; 

create index last_name_idx
on customers(last_name);

show indexes from customers; 

select * from customers where last_name = "puff";

create index last_name_first_name_idx
on customers(last_name, first_name);


alter table customers 
drop index last_name_idx;


select first_name,Last_name,hourly_rate,(select avg(hourly_rate) from employees)
from employees;

select first_name,last_name,hourly_rate
from employees
where hourly_rate > 14.5;


select * from transactions;



select first_name,last_name from customers
where customer_id in
(select distinct customer_id
from transactions
where customer_id is not null);


/*2 hours 18 min */

select * from transactions; 

alter table transactions
add column order_date date;

UPDATE transactions
SET order_date = '2023-01-03'
WHERE transaction_id = 5;

INSERT INTO transactions (transaction_id, amount, order_date)
VALUES (6, 5.50, '2023-01-03');


INSERT INTO transactions (transaction_id, amount, order_date)
VALUES (6, 5.50, '2023-01-01');


select SUM(amount), order_date 
from transactions 
group by order_date;


select MAX(amount), order_date 
from transactions 
group by order_date;


select MIN(amount), order_date 
from transactions 
group by order_date;


select COUNT(amount), order_date 
from transactions 
group by order_date;


select count(amount), customer_id
from transactions 
group by customer_id
having count(amount) >1 and customer_id is not null;



select sum(amount), order_date
from transactions 
group by order_date with rollup;


 alter table transactions drop foreign key fk_customer_id;



alter table transactions 
add constraint fk_transactions_id
foreign key (customer_id) references customers(customer_id)
on delete cascade; 

select * from transactions ;


call get_customers();


delimiter $$ 
create procedure get_customers()
begin 
	select * from customers;
    END $$
delimiter ;

call get_customers();


DROP PROCEDURE get_customers;





delimiter $$ 
create procedure find_customer(in id int)
begin 
	select * from customers
    where customer_id =id;
    end $$
    delimiter ;

call find_customer(4);


commit;




select * from transactions 
inner join customers 
on transactions.customer_id= customers.customer_id;


select * from transactions 
left join customers
on transactions.customer_id = customers.customer_id; 




select * from transactions 
right join customers
on transactions.customer_id = customers.customer_id; 

select transactions.*,customers.* 
from products
join transactions on customer_id = transactions.transaction_id
join products on prodcuct_id = transactions.transaction_id
where transactions.transaction_id = 1002;





select transactions.*, customers.*
from products 
join transactions on customers_id = transactions.transaction_id
join products on product_id = transactions.transaction_id
where transactions.transaction_id = 1002;







select * from employees
where first_name = "patrick";


select * from employees 
where hourly_pay >10.00
order by hourly_pay desc;

select  * from employees
where hire_date is not  null
order by hourly_pay desc; 

















































































































