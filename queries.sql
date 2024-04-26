select * from Stocks
         where ProductId in (8,9,10);

select e.fname || ' ' || e.lname, ei.birthdate from employees e
    join employeesinfo ei
        on e.id = ei.id;

select e.fname || ' ' || e.lname, ei.birthdate from employees e
    join employeesinfo ei
        on e.id = ei.id
            where EXTRACT(month from ei.birthdate) = 8;

select concat(e.FName, ' ', e.MName, ' ', e.LName) as Employee,
       to_char(BirthDate, 'Month') as "Month"  from Employees e
           inner join EmployeesInfo ei on e.ID = ei.ID
                                               where extract(month from BirthDate) = 8;

select  e.fname || ' ' || e.lname, o.orderdate, c.fname || ' ' ||c.lname
from employees e
    join orders o
        on e.id = o.employeeid
    join customers c
        on o.customerid = c.id;

select  o.orderdate, c.fname || ' ' || c.lname, p.name,pd."Description", od.qty, od.totalprice
from customers c
    join orders o
        on o.id = o.customerid
    join orderdetails od
        on o.id = od.orderid
    join products p
        on od.productid = p.id
    join productdetails pd
        on p.id = pd.id
order by o.orderdate ;

select  o.orderdate, c.fname || ' ' || c.lname,
        p.name,
        pd."Description", od.qty, od.totalprice
from customers c
    join orders o
        on o.id = o.customerid
    join orderdetails od
        on o.id = od.orderid
    join products p
        on od.productid = p.id
    join productdetails pd
        on p.id = pd.id
where orderdate between (current_date - interval '3 months') and current_date
order by o.orderdate ;


select  c.fname || ' ' || c.lname,
        p.name,
        od.price,
        o.orderdate
from customers c
join orders o
        on o.id = o.customerid
    join orderdetails od
        on o.id = od.orderid
    join products p
        on od.productid = p.id;


select  c.fname || ' ' || c.lname,
        p.name,
        od.price,
        o.orderdate
from customers c
join orders o
        on o.id = o.customerid
    join orderdetails od
        on o.id = od.orderid
               and od.price >  420::money
    join products p
        on od.productid = p.id
where p.name like '%Netbook' or p.name like '%Laptop';


select o.orderdate , p.name, pd."Description", od.price, od.qty  from orders o
    join orderdetails od
        on o.id = od.orderid
    join products p
        on p.id = od.productid
    join productdetails pd
        on p.id = pd.id;

select o.orderdate ,
       p.name,
       pd."Description",
       od.price,
       od.qty
from orders o
    join orderdetails od
        on o.id = od.orderid
    join products p
        on p.id = od.productid
    join productdetails pd
        on p.id = pd.id
where p.name like '%Smartphone' and  p.name not like '%iPhone%';


select   e.fname || ' ' || e.lname, e.post, od.totalprice from employees e
    left join  orders o
        on e.id = o.employeeid
    join orderdetails od
        on o.id = od.orderid;

select   e.fname || ' ' || e.lname Employee, e.post, sum(od.totalprice) TotalSold from employees e
    left join  orders o
        on e.id = o.employeeid
    join orderdetails od
        on o.id = od.orderid
group by e.fname, e.lname, e.post ;

select   e.fname || ' ' || e.lname Employee, e.post, sum(od.totalprice) TotalSold
from employees e
    left join  orders o
        on e.id = o.employeeid
               and age(o.OrderDate, current_date) <= interval '30 days'
    join orderdetails od
        on o.id = od.orderid
group by e.fname, e.lname, e.post ;

select p.name, sum(od.Qty) OrderDetalsQty,
       sum(od.totalprice) TotalSold,
       min(od.price) min_pirce,
       max(od.price) max_price,
       avg(od.price::decimal) FalseAVG_price,
       sum(od.totalprice)/sum(od.qty) AVG_price
from products p
    left join orderdetails od
        on od.productid = p.id
group by p.name
order by TotalSold desc;


select  stable."city",
        stable.TotalSold,
        avg(stable.TotalSold:: decimal) AVG_TotalSold ,
        count(stable.id)
from (select o.id,
       c.city,
       sum(od.totalprice) TotalSold
from customers c
    left join orders o
        on c.id = o.customerid
    left join orderdetails od
        on o.id = od.orderid
group by c.city, o.id) stable
group by stable."city", stable.TotalSold;


select  stable."city",
        sum(stable.TotalSold),
        avg(stable.TotalSold:: decimal) AVG_TotalSold ,
        count(stable.id)
from (select o.id,
       c.city,
       sum(od.totalprice) TotalSold
from customers c
    left join orders o
        on c.id = o.customerid
    left join orderdetails od
        on o.id = od.orderid
group by c.city, o.id) stable
group by stable."city";


select e.fname || ' ' || e.lname Employee,
count(o.id) "Count"
from employees e
    join orders o
        on e.id = o.employeeid
group by e.fname || ' ' || e.lname
having 4 <= count(o.id);

select e.fname || ' ' || e.lname Employee,
       (select count(o.id)
        from orders o
        where o.employeeid = e.id
        having count(o.id) >= 4)"Count"
from employees e;

select e.fName || ' ' || e.lName as Employee,
       (select count(o.id)
        from orders o
        where o.employeeid = e.id) as "Count"
from Employees e
where 4 <= (select count(o.id)
            from orders o
            where o.employeeid = e.id);

select *
from (select c.fname || ' ' || c.lname customer,
             (select avg(total::decimal)
              from (select sum(totalprice) total from orderdetails od
                  join orders o
                      on od.orderid = o.id and o.customerid = c.id
                                                 group by orderid) inner_table) avgtotalsales,
          (select avg(total::decimal)
           from (select sum(totalprice) total from orderdetails
                                              group by orderid) inner_table) avgtotal_overall
      from customers c) cust_sales
where avgtotalsales > avgtotal_overall;


select
(select  sum(totalprice)
from orders o
    join orderdetails od
        on o.id = od.orderid
where o.orderdate >= (current_date - interval '4 months')) last,

(select  sum(totalprice)
from orders o
    join orderdetails od
        on o.id = od.orderid
where o.orderdate between (current_date - interval '3 months') and current_date) lastTwo,
(select  sum(totalprice)
from orders o
    join orderdetails od
        on o.id = od.orderid
where o.orderdate between (current_date - interval '2 months') and current_date) differnts












