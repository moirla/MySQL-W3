
Drop database if exists MySQL_W3;
create database MySQL_W3;
Use mysql_w3;

drop database if exists comments;
drop database if exists posts;
drop database if exists users;

create table users(
user_id int(11) not null auto_increment,
username varchar(20) not null,
pass_word varchar(20) not null,
email varchar(30) not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
primary key (user_id)
);

create table posts(
post_id int(11) not null auto_increment,
user_id int(11) not null,
post varchar(255),
created_at timestamp default current_timestamp,
primary key (post_id),
foreign key (user_id) references users(user_id)
);

create table comments(
user_id int(11) not null,
post_id int(11) not null,
comment varchar(255) not null,
created_at timestamp default current_timestamp,
primary key (user_id, post_id),
foreign key (user_id) references users(user_id),
foreign key (post_id) references posts(post_id)
);