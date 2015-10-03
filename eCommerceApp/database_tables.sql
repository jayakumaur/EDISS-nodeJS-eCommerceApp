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
	isLoggedIn bit,
	foreign key (username) references userdetail(username)
);