use rcttc;

-- helper queries
/*
select * 
from `rcttc-data`
order by customer_first;

select * 
from `rcttc-data` 
where `show` = 'The Sky Lit Up'
order by customer_first;

select `show`, `date`, theater
from `rcttc-data`
order by `show`;

select seat, ticket_price, customer_first, customer_last, `show`, theater, `date`
from `rcttc-data`
where `show` = 'The Sky Lit Up'
order by `show`, date;

select ticket_price, `show`, theater, date
from `rcttc-data`
order by `show`;
*/
insert into theater (`name`, address, `rows`, seats_per_row)
	values ('10 Pin', '62341 Merchant Street, Eagan, MN 55555', 5, 5);
    
insert into theater (`name`, address, `rows`, seats_per_row)
	values ('Little Fitz', '10 E Exchange St, St Paul, MN 55101', 3, 4);

insert into theater (`name`, address, `rows`, seats_per_row)
	values ('Horizon', '70 Meadow Valley Parkway, Saint Paul, MN 55103', 2, 8);

insert into play (title)
	values ('Send in the Clowns');
    
insert into play (title)
	values ('The Dress');
    
insert into play (title)
	values ('Tell Me What To Think');
    
insert into play (title)
	values ('The Sky Lit Up');

insert into play (title)
	values ('Dance Dance Vertical');
    
insert into play (title)
	values ('Stop. Just Stop.');
    
insert into play (title)
	values ('Burr');
    
insert into play (title)
	values ('Caddyshack');
    
insert into play (title)
	values ('Hair');
    
insert into payment_type (payment_type)
	values ('Credit Card');
    
insert into payment_type (payment_type)
	values ('Debit Card');
    
insert into payment_type (payment_type)
	values ('Cash');

insert into theater_contact (email, phone, theater_id)
	values ('ten.pin@rcttc.com', '(651) 555-5555', 1);
    
insert into theater_contact (email, phone, theater_id)
	values ('little.fitz@rcttc.com', '(651) 555-5555', 2);
    
insert into theater_contact (email, phone, theater_id)
	values ('horizon@rcttc.com', '(651) 555-5555', 3);
    
insert into customer (first_name, last_name)
	values ('Alistair', 'Sweetman');
    
insert into customer (first_name, last_name)
	values ('Chiarra', 'Vail');
    
insert into customer (first_name, last_name)
	values ('Cullen', 'Guirau');
    
insert into customer (first_name, last_name)
	values ('Elicia', 'Heymann');
    
insert into customer (first_name, last_name)
	values ('Gordon', 'Walwood');
    
insert into customer (first_name, last_name)
	values ('Hashim', 'Daouze');
    
insert into customer (first_name, last_name)
	values ('Maximilianus', 'Pettifor');
    
insert into customer (first_name, last_name)
	values ('Pooh', 'Bedburrow');
    
insert into customer (first_name, last_name)
	values ('Rolf', 'Bellamy');
    
insert into customer (first_name, last_name)
	values ('Rowan', 'Brumhead');
    
insert into customer (first_name, last_name)
	values ('Salim', 'Strutt');
    
insert into customer (first_name, last_name)
	values ('Shannah', 'Ramsell');
    
-- customer contact
insert into customer_contact (email, phone, address, customer_id)
	values ('asweetmanel@symantec.com', null, '2 Clove Plaza', 
    (select customer_id from customer where first_name = 'Alistair' and last_name = 'Sweetman'));

insert into customer_contact (email, phone, address, customer_id)
	values ('cvailhe@ft.com', null, '5303 Oriole Alley', 
    (select customer_id from customer where first_name = 'Chiarra' and last_name = 'Vail'));
    
insert into customer_contact (email, phone, address, customer_id)
	values ('cguirau11@mozilla.com', '(485) 954-2414', '6885 Bellgrove Street', 
    (select customer_id from customer where first_name = 'Cullen' and last_name = 'Guirau'));

insert into customer_contact (email, phone, address, customer_id)
	values ('eheymann22@github.com', '(129) 168-4725', '9891 Burning Wood Parkway', 
    (select customer_id from customer where first_name = 'Elicia' and last_name = 'Heymann'));
    
insert into customer_contact (email, phone, address, customer_id)
	values ('gwalwoodng@devhub.com', null, '7 Hanson Pass', 
    (select customer_id from customer where first_name = 'Gordon' and last_name = 'Walwood'));
    
insert into customer_contact (email, phone, address, customer_id)
	values ('hdaouze32@craigslist.org', '(338) 922-3547', '51 Sycamore Circle', 
    (select customer_id from customer where first_name = 'Hashim' and last_name = 'Daouze'));
    
insert into customer_contact (email, phone, address, customer_id)
	values ('mpettiforro@list-manage.com', null, '88806 Kedzie Lane', 
    (select customer_id from customer where first_name = 'Maximilianus' and last_name = 'Pettifor'));
    
insert into customer_contact (email, phone, address, customer_id)
	values ('pbedburrowcc@standford.edu', null, '9 Manitowish Court', 
    (select customer_id from customer where first_name = 'Pooh' and last_name = 'Bedburrow'));
    
insert into customer_contact (email, phone, address, customer_id)
	values ('rbellamyd1@comcast.net', '(731) 485-3430', null, 
    (select customer_id from customer where first_name = 'Rolf' and last_name = 'Bellamy'));
    
insert into customer_contact (email, phone, address, customer_id)
	values ('rbrumheadiz@japanpost.jp', '(302) 617-1804', '8212 Pleasure Junction', 
    (select customer_id from customer where first_name = 'Rowan' and last_name = 'Brumhead'));
    
insert into customer_contact (email, phone, address, customer_id)
	values ('sstruttra@ihg.com', '(470) 350-3212', null, 
    (select customer_id from customer where first_name = 'Salim' and last_name = 'Strutt'));
    
insert into customer_contact (email, phone, address, customer_id)
	values ('sramselloa@cnbc.com', '(357) 730-4952', '2 Dovetail Way', 
    (select customer_id from customer where first_name = 'Shannah' and last_name = 'Ramsell'));

-- performances
insert into performance (`date`, ticket_price, theater_id, play_id)
	values ('2021-09-24', 21.5,
    (select theater_id from theater where `name` = 'Horizon'), 
    (select play_id from play where title = 'Burr'));
    
insert into performance (`date`, ticket_price, theater_id, play_id)
	values ('2021-03-01', 21.5,
    (select theater_id from theater where `name` = 'Horizon'), 
    (select play_id from play where title = 'Burr'));
    
insert into performance (`date`, ticket_price, theater_id, play_id)
	values ('2021-01-04', 15.25,
    (select theater_id from theater where `name` = 'Horizon'), 
    (select play_id from play where title = 'Caddyshack'));
    
insert into performance (`date`, ticket_price, theater_id, play_id)
	values ('2021-01-04', 18.95,
    (select theater_id from theater where `name` = 'Little Fitz'), 
    (select play_id from play where title = 'Dance Dance Vertical'));
    
insert into performance (`date`, ticket_price, theater_id, play_id)
	values ('2021-12-21', 14.75,
    (select theater_id from theater where `name` = 'Horizon'), 
    (select play_id from play where title = 'Hair'));
    
insert into performance (`date`, ticket_price, theater_id, play_id)
	values ('2021-03-01', 15,
    (select theater_id from theater where `name` = '10 Pin'), 
    (select play_id from play where title = 'Send in the Clowns'));
    
insert into performance (`date`, ticket_price, theater_id, play_id)
	values ('2021-09-24', 15,
    (select theater_id from theater where `name` = '10 Pin'), 
    (select play_id from play where title = 'Send in the Clowns'));
    
insert into performance (`date`, ticket_price, theater_id, play_id)
	values ('2021-03-01', 15,
    (select theater_id from theater where `name` = '10 Pin'), 
    (select play_id from play where title = 'Send in the Clowns'));
    
insert into performance (`date`, ticket_price, theater_id, play_id)
	values ('2021-12-21', 17.35,
    (select theater_id from theater where `name` = 'Little Fitz'), 
    (select play_id from play where title = 'Stop. Just Stop.'));
    
insert into performance (`date`, ticket_price, theater_id, play_id)
	values ('2021-12-21', 16.25,
    (select theater_id from theater where `name` = '10 Pin'), 
    (select play_id from play where title = 'Tell Me What To Think'));
    
insert into performance (`date`, ticket_price, theater_id, play_id)
	values ('2021-01-04', 14.85,
    (select theater_id from theater where `name` = '10 Pin'), 
    (select play_id from play where title = 'The Dress'));
    
insert into performance (`date`, ticket_price, theater_id, play_id)
	values ('2021-03-01', 20,
    (select theater_id from theater where `name` = 'Little Fitz'), 
    (select play_id from play where title = 'The Sky Lit Up'));
    
insert into performance (`date`, ticket_price, theater_id, play_id)
	values ('2021-09-24', 20,
    (select theater_id from theater where `name` = 'Little Fitz'), 
    (select play_id from play where title = 'The Sky Lit Up'));

-- reservations
insert into reservation (seat, customer_id, performance_id)
	values('A1', 
    (select customer_id from customer where first_name = 'Gordon' and last_name = 'Walwood'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-03-01'));
    
insert into reservation (seat, customer_id, performance_id)
	values('A2', 
    (select customer_id from customer where first_name = 'Hashim' and last_name = 'Daouze'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-03-01'));
    
insert into reservation (seat, customer_id, performance_id)
	values('A3', 
    (select customer_id from customer where first_name = 'Hashim' and last_name = 'Daouze'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-03-01'));
    
insert into reservation (seat, customer_id, performance_id)
	values('A4', 
    (select customer_id from customer where first_name = 'Pooh' and last_name = 'Bedburrow'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-03-01'));
    
insert into reservation (seat, customer_id, performance_id)
	values('B1', 
    (select customer_id from customer where first_name = 'Pooh' and last_name = 'Bedburrow'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-03-01'));
    
insert into reservation (seat, customer_id, performance_id)
	values('B2', 
    (select customer_id from customer where first_name = 'Pooh' and last_name = 'Bedburrow'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-03-01'));
    
insert into reservation (seat, customer_id, performance_id)
	values('B3', 
    (select customer_id from customer where first_name = 'Pooh' and last_name = 'Bedburrow'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-03-01'));
    
insert into reservation (seat, customer_id, performance_id)
	values('B4', 
    (select customer_id from customer where first_name = 'Cullen' and last_name = 'Guirau'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-03-01'));
    
insert into reservation (seat, customer_id, performance_id)
	values('C1', 
    (select customer_id from customer where first_name = 'Cullen' and last_name = 'Guirau'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-03-01'));
    
insert into reservation (seat, customer_id, performance_id)
	values('C2', 
    (select customer_id from customer where first_name = 'Chiarra' and last_name = 'Vail'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-03-01'));
    
insert into reservation (seat, customer_id, performance_id)
	values('C3', 
    (select customer_id from customer where first_name = 'Maximilianus' and last_name = 'Pettifor'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-03-01'));
    
insert into reservation (seat, customer_id, performance_id)
	values('C4', 
    (select customer_id from customer where first_name = 'Maximilianus' and last_name = 'Pettifor'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-03-01'));
    
insert into reservation (seat, customer_id, performance_id)
	values('A1', 
    (select customer_id from customer where first_name = 'Rowan' and last_name = 'Brumhead'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-09-24'));
    
insert into reservation (seat, customer_id, performance_id)
	values('A2', 
    (select customer_id from customer where first_name = 'Rowan' and last_name = 'Brumhead'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-09-24'));
    
insert into reservation (seat, customer_id, performance_id)
	values('A3', 
    (select customer_id from customer where first_name = 'Shannah' and last_name = 'Ramsell'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-09-24'));
    
insert into reservation (seat, customer_id, performance_id)
	values('A4', 
    (select customer_id from customer where first_name = 'Shannah' and last_name = 'Ramsell'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-09-24'));
    
insert into reservation (seat, customer_id, performance_id)
	values('B1', 
    (select customer_id from customer where first_name = 'Shannah' and last_name = 'Ramsell'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-09-24'));
    
insert into reservation (seat, customer_id, performance_id)
	values('B2', 
    (select customer_id from customer where first_name = 'Shannah' and last_name = 'Ramsell'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-09-24'));
    
insert into reservation (seat, customer_id, performance_id)
	values('B3', 
    (select customer_id from customer where first_name = 'Alistair' and last_name = 'Sweetman'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-09-24'));
    
insert into reservation (seat, customer_id, performance_id)
	values('B4', 
    (select customer_id from customer where first_name = 'Elicia' and last_name = 'Heymann'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-09-24'));
    
insert into reservation (seat, customer_id, performance_id)
	values('C1', 
    (select customer_id from customer where first_name = 'Elicia' and last_name = 'Heymann'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-09-24'));
    
insert into reservation (seat, customer_id, performance_id)
	values('C2', 
    (select customer_id from customer where first_name = 'Elicia' and last_name = 'Heymann'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-09-24'));
    
insert into reservation (seat, customer_id, performance_id)
	values('C3', 
    (select customer_id from customer where first_name = 'Salim' and last_name = 'Strutt'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-09-24'));
    
insert into reservation (seat, customer_id, performance_id)
	values('C4', 
    (select customer_id from customer where first_name = 'Rolf' and last_name = 'Bellamy'), 
    (select performance_id from performance p 
    inner join play pl on p.play_id = pl.play_id
    where pl.title = 'The Sky Lit Up' and p.`date` = '2021-09-24'));