use rcttc;

-- Find all performances in the third quarter of 2021 (July 1, 2021 - Sept. 31 2021).
select p.performance_id, pl.title, p.`date`
from performance p
inner join play pl on p.play_id = pl.play_id
where p.`date` between '2021-07-01' and '2021-09-30';

-- List customers without duplication.

select c.customer_id, c.first_name, c.last_name
from customer c;
-- Find all customers without a .com email address.
select c.customer_id, c.first_name, c.last_name, cc.email
from customer c
inner join customer_contact cc on c.customer_id = cc.customer_id
where cc.email not like '%.com';

-- Find the three cheapest shows.

select pl.title, p.ticket_price
from performance p
inner join play pl on p.play_id = pl.play_id
order by ticket_price
limit 3;

-- List customers and the show they're attending with no duplication.

select DISTINCT c.first_name, c.last_name, pl.title, p.`date`
from customer c
inner join reservation r on c.customer_id = r.customer_id
inner join performance p on r.performance_id = p.performance_id
inner join play pl on p.play_id = pl.play_id;

-- List customer, show, theater, and seat number in one query.

select c.first_name, pl.title, t.`name`, r.seat
from customer c 
inner join reservation r on r.customer_id = c.customer_id
inner join performance p on r.performance_id = p.performance_id
inner join play pl on p.play_id = pl.play_id
inner join theater t on t.theater_id = p.theater_id;

-- Find customers without an address.

select c.first_name, c.last_name
from customer c 
inner join customer_contact cc on c.customer_id = cc.customer_id
where cc.address is null;

-- Recreate the spreadsheet data with a single query. Use column aliases to produce the original column names.
select * from `rcttc-data`;

select c.first_name 'customer_first', c.last_name 'customer_last', cc.email 'customer_email', cc.phone 'customer_phone',
 cc.address 'customer_address', r.seat 'seat', pl.title 'show', p.ticket_price 'ticket_price', p.`date` 'date',
 t.`name` 'theater', t.address 'theater_address', tc.phone 'theater_phone', tc.email 'theater_email'
from customer c 
inner join customer_contact cc on c.customer_id = cc.customer_id
inner join reservation r on r.customer_id = c.customer_id
inner join performance p on r.performance_id = p.performance_id
inner join play pl on p.play_id = pl.play_id
inner join theater t on p.theater_id = t.theater_id
inner join theater_contact tc on t.theater_id = tc.theater_id;

-- Count total tickets purchased per customer.

select c.first_name, c.last_name, count(r.reservation_id) 'tickets purchased'
from reservation r
inner join customer c on r.customer_id = c.customer_id
group by c.first_name, c.last_name
order by count(r.reservation_id) desc;

-- Calculate the total revenue per show based on tickets sold.

select p.performance_id, pl.title, format(p.ticket_price * count(r.reservation_id), 2) 'total revenue'
from performance p
inner join play pl on p.play_id = pl.play_id
inner join reservation r on r.performance_id = p.performance_id
group by p.performance_id, pl.title, p.ticket_price;

-- Calculate the total revenue per theater based on tickets sold.

select theater_id, `name`, format(sum(revenue), 2) as total_revenue
from (
	select t.theater_id, t.`name`, p.performance_id, pl.title, format(p.ticket_price * count(r.reservation_id), 2) as revenue
	from theater t
    inner join performance p on t.theater_id = p.theater_id
	inner join play pl on p.play_id = pl.play_id
	inner join reservation r on r.performance_id = p.performance_id
	group by p.performance_id, pl.title, theater_id, p.ticket_price
) as theater_revenue
group by theater_id
order by total_revenue;

-- Who is the biggest supporter of RCTTC? Who spent the most in 2021?

select first_name, last_name, individual_customer_revenue as biggest_supporter
from (
	select c.first_name, c.last_name, format(p.ticket_price * count(r.reservation_id), 2) as individual_customer_revenue
	from customer c
	inner join reservation r on r.customer_id = c.customer_id
	inner join performance p on r.performance_id = p.performance_id
	group by c.first_name, c.last_name, p.ticket_price
    order by p.ticket_price * count(r.reservation_id) desc
) as customer_revenue
group by first_name, last_name
limit 1;
