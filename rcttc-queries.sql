use rcttc;

-- Find all performances in the third quarter of 2021 (July 1, 2021 - Sept. 31 2021).
select p.performance_id, pl.title, p.`date`
from performance p
inner join play pl on p.play_id = pl.play_id
where p.`date` between '2021-07-01' and '2021-09-31';

-- List customers without duplication.



-- Find all customers without a .com email address.



-- Find the three cheapest shows.



-- List customers and the show they're attending with no duplication.



-- List customer, show, theater, and seat number in one query.



-- Find customers without an address.



-- Recreate the spreadsheet data with a single query. Use column aliases to produce the original column names.



-- Count total tickets purchased per customer.



-- Calculate the total revenue per show based on tickets sold.



-- Calculate the total revenue per theater based on tickets sold.



-- Who is the biggest supporter of RCTTC? Who spent the most in 2021?


