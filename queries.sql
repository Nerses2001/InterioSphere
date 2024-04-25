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
where p.name like '%Netbook' or p.name like '%Laptop'













