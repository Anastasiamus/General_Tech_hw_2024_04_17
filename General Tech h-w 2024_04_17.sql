use shop;

-- Найти общую сумму заказов для каждого клиента.

select t1.cust_id as client_id , sum(t2.amt) as sum_orders
from customers t1
join orders t2
on t1.cust_id = t2.cust_id
group by t1.cust_id;

-- Получить количество заказов для каждого продавца.

select t1.sell_id as seller_id, count(t2.sell_id) as count_of_sellers
from sellers t1
join orders t2
on t1.sell_id = t2.sell_id
group by t1.sell_id;

-- Получить количество клиентов с рейтингом выше среднего.
select count(*) as count_of_clients
from customers
where rating > (select avg(rating) from customers);


-- Получить количество клиентов в каждом городе с рейтингом выше 200.

select count(cust_id) as count_of_clients , city
from customers
where rating > 200
group by city;

-- Получить количество заказов, сделанных в каждый месяц.

select count(order_id) as count_of_orders, odate
from orders
group by odate;

-- Найти клиентов, у которых сумма заказов превышает среднюю сумму заказов всех клиентов.

select t1.cname as clients
from customers t1
join (select cust_id, sum(amt) as total_amt from orders group by cust_id) t2
on t1.cust_id = t2.cust_id
where t2.total_amt > (select avg(total_amt)
from (select sum(amt) as total_amt from orders group by cust_id)as totals);










