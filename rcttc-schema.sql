drop database if exists rcttc;
create database rcttc;
use rcttc;

create table play (
	play_id int primary key auto_increment,
    title varchar(50)
);

create table theater (
	theater_id int primary key auto_increment,
    `name` varchar(50),
    address varchar(50),
    `rows` int,
    seats_per_row int
);

create table theater_contact (
	theater_contact_id int primary key auto_increment,
    email varchar(50),
    phone varchar(50),
    theater_id int,
    constraint fk_theater_contact_theater_id
		foreign key (theater_id)
        references theater(theater_id)
);

create table payment_type (
	payment_type_id int primary key auto_increment,
    payment_type varchar(50)
);

create table customer (
	customer_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50)
);

create table login (
	login_id int primary key auto_increment,
    username varchar(50),
    `password` varchar(50),
    customer_id int,
    constraint fk_login_customer_id
		foreign key (customer_id)
        references customer(customer_id)
);

create table customer_contact (
	customer_contact_id int primary key auto_increment,
    email varchar(50),
    phone varchar(50),
    address varchar(50),
    customer_id int not null,
    constraint fk_customer_contact_customer_id
		foreign key (customer_id)
        references customer(customer_id)
);

create table actor (
	actor_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50)
);

create table performance (
	performance_id int primary key auto_increment,
    `date` date,
    ticket_price double,
    theater_id int not null,
    play_id int not null,
    constraint fk_performance_theater_id
		foreign key (theater_id)
        references theater(theater_id),
	constraint fk_performance_play_id
		foreign key (play_id)
        references play(play_id)
);

create table cast (
	cast_id int primary key auto_increment,
    actor_id int not null,
    performance_id int not null,
    constraint fk_cast_actor_id
		foreign key (actor_id)
        references actor(actor_id),
	constraint fk_cast_performance_id
		foreign key (performance_id)
        references performance(performance_id)
);

create table reservation (
	reservation_id int primary key auto_increment,
    seat varchar(50),
    customer_id int not null,
    performance_id int not null,
    constraint fk_reservation_customer_id
		foreign key (customer_id)
        references customer(customer_id),
	constraint fk_reservation_performance_id
		foreign key (performance_id)
        references performance(performance_id)
);

create table payment (
	payment_id int primary key auto_increment,
    amount int,
    payment_date date,
    payment_type_id int not null,
    reservation_id int not null,
    constraint fk_payment_payment_type_id
		foreign key (payment_type_id)
        references payment_type(payment_type_id),
	constraint fk_payment_reservation_id
		foreign key (reservation_id)
        references reservation(reservation_id)
);