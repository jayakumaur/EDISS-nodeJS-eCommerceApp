create table userdetail
(
	userdetail_id int, 
	fname varchar(100), 
	lname varchar(100), 
	address varchar(100), 
	city varchar(100), 
	state varchar(10), 
	zip varchar(10), 
	email varchar(100), 
	username varchar(100), 
	password varchar(100)
);

create table product_category_mapping
(
	id int, 
	product_id int, 
	category varchar(3000),
	foreign key (product_id) references product(product_id)
	on delete cascade
);

create table product
(
	product_id int primary key,
	asin varchar(10),
	title varchar(100),
	description varchar(3000),
	group_name varchar(100)
);

select distinct p.product_id,title from product p inner join product_category_mapping c on p.product_id = c.product_id where category like '%Ages 4-8%';

create table session
(
	user_session_id int not null auto_increment primary key,
	username varchar(100),
	IP varchar(100),
	session_id varchar(100),
	isLoggedIn bit
);

--for purchase order
create table product_inventory 
(
	product_id int primary key, 
	quantity int,
	foreign key (product_id) references product(product_id)
);

create table purchase_order
(
	purchase_order_id int not null auto_increment primary key, 
	product_id int, 
	quantity_sold int,
	user_id int,
	foreign key (product_id) references product(product_id)
);

select product_id as productId, sum(quantity_sold) as quantitySold
from purchase_order
group by product_id

--ediss.czlcqq0ph8dm.us-east-1.rds.amazonaws.com