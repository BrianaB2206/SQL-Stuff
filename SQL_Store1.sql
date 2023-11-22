show databases;
drop database briana_b_store;

create database briana_b_store;
use briana_b_store;

create table categories (
	id tinyint unsigned key auto_increment,
    name varchar(255) not null unique
);

drop table categories;
create table categories (
	id tinyint unsigned key auto_increment,
    name varchar(255) not null unique
);
create table products(
	id int unsigned primary key auto_increment,
    category_id tinyint unsigned,
    name varchar(255) not null,
    description text,
    price decimal(10,2) unsigned not null,
    stock int not null,
    created_at timestamp not null 
		default current_timestamp,
	constraint fk_category foreign key (category_id)
		references categories (id)
		on update cascade on delete set null
);

insert into categories values (1, 'TV');
insert into categories values (2, 'Smartphone');
insert into categories values (3, 'Laptop');
insert into categories values (4, 'Camera');

insert into products values (1,2,'iPhone XS 64GB', null, 4099.99, 16, default);
insert into products values (2,2,'Huawei P20Pro 128GB', null, 3409.99, 47, default);
insert into products values (3,1,'LED SmartTV Philips 108 cm 4K', null, 1209.99, 2, default);
insert into products values (4,1,'LED SmartTV Samsung 123 cm 4K', null, 2209.99, 7, default);
insert into products values (5,3,'Laptop LenovoIdeaPad', null, 1739.99, 25, default);
insert into products values (6,3,'Laptop Gaming Lenovo Legion', null, 1229.99, 31, default);
insert into products values (7,3,'Laptop Apple MacBook Air', null, 5449.99, 15, default);

select * from products;
select name, price, stock from products;
select * from products 
	where category_id = 3
    order by price asc;
    
select * from products where name like '%lenovo%';

select * from products where category_id=3 and price >=1000 and price <=3000;

select * from products where category_id=3 and price between 1000 and 3000;

select * from products where stock<5;

select count(*) as num_products from products
	group by category_id;
    
select sum(stock) as total_stock from products group by category_id;

select * from products;
update products set stock = 14 where id = 3;
update products set price = round((1-0.05) * price,2) where category_id = 2;

  
update categories set id=25 where name = 'Smartphone';

delete from categories where name = 'Smartphone';

select * from products where category_id is null;