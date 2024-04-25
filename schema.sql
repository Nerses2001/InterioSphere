-- Table Customers
create table Customers
(
    ID serial primary key not null ,
    FName varchar(20) null ,
    MName varchar(20) null ,
    LName varchar(20) null ,
    "Address" varchar(50) null ,
    City varchar(20) null ,
    Phone varchar(12) null ,
    DateInSystem DATE DEFAULT current_date
);

-- Table Employees

create table Employees
(
    ID serial primary key not null ,
    FName varchar(20) not null,
    MName varchar(20) null ,
    LName varchar(20) not null ,
    Post varchar(25) not null ,
    Salary money not null ,
    PriorSalary money null
);

-- Table EmployeesInfo
create table EmployeesInfo
(
    ID int not null ,
    MaritalStatus varchar(10) not null,
    BirthDate date not null,
    "Address" varchar(50) not null ,
    Phone varchar(12) not null,
        foreign key (ID) references Employees(ID)
            on delete cascade
);

-- Table Products
create table Products
(
    ID serial not null primary key ,
    Name varchar(50) not null
);


-- Table ProductDetails
create table ProductDetails
(
    ID int not null,
    Color varchar(20) null ,
    "Description" varchar ,
        foreign key (ID) references Products(ID)
            on delete cascade
);


-- Table Stocks
create table Stocks
(
    ProductId int not null ,
    Qty int default 0,
        foreign key (ProductID) references Products(ID)
            on delete cascade
);



-- Table Orders
create table Orders
(
    ID serial primary key not null ,
    CustomerID int null ,
    EmployeeId int null ,
    OrderDate date default current_date,
     foreign key (CustomerID) references Customers(ID)
         on delete set null ,
    foreign key (EmployeeID) references Employees(ID)
        on delete set null
);


-- Table OrderDetails
create table OrderDetails
(
    OrderID int not null ,
    LineItem int not null ,
    ProductID int not null ,
    Qty int not null ,
    Price money not null,
    TotalPrice money generated always as (Qty * Price) stored,
    primary key (OrderID, LineItem),
    foreign key (OrderID) references Orders(ID)
        on delete  cascade ,
    foreign key (ProductID) references Products(ID)
        on delete set null

);

alter table EmployeesInfo
    add
        unique (ID);

alter table ProductDetails
    add
        unique (ID);


alter table Stocks
    add
        unique (ProductId);

alter table Customers
        add constraint
            customers_phone_check check  (Phone ~ '\(\d{3}\)\d{7}');


alter table EmployeesInfo
    add constraint
            employeesInfo_phone_check check  (Phone ~ '\(\d{3}\)\d{7}');


alter table EmployeesInfo
    add
        check  (BirthDate between ( current_date - interval '50 years') and (current_date - interval '18 years'));


alter table EmployeesInfo
    add
        check  (MaritalStatus in ('Wedded','Not wedded','Married','Single'));

alter table Customers
    add
        check  (DateInSystem >= ( current_date - interval '90 years') and DateInSystem <= current_date);

alter table  Employees
    add
        check ( PriorSalary < Salary );

alter table Stocks
    add constraint FK_Stocks_Products
        foreign key (ProductID)
            references Products(ID)
            on delete cascade ;


alter table Stocks
    add
        check (Qty >= 0 );


create or replace function matching_stocks_on_insert_function()
    returns trigger as $$
    begin
        if not found then
            return NEW;
            end if;
    update Stocks as s
    set Qty = s.Qty - i.Qty
    from (select s.ProductID, SUM(s.Qty) as Qty from NEW group by s.ProductId) as i
    where s.ProductID = i.ProductID;
    return NEW;
        end ;
$$ language plpgsql;

create trigger trMatchingStocksOnInsert
    after insert on OrderDetails
    for each row
    execute function matching_stocks_on_insert_function();

-- Trigger for DELETE operation
CREATE OR REPLACE FUNCTION trMatchingStocksOnDelete()
RETURNS TRIGGER AS $$
BEGIN
	IF NOT FOUND THEN
		RETURN OLD;
	END IF;

	UPDATE Stocks s
	SET Qty = s.Qty + d.Qty
	FROM (SELECT s.ProductId, SUM(s.Qty) AS Qty FROM OLD GROUP BY s.ProductID) AS d
	WHERE s.ProductID = d.ProductID;

	RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trMatchingStocksOnDelete
AFTER DELETE ON OrderDetails
FOR EACH ROW
EXECUTE FUNCTION trMatchingStocksOnDelete();


-- Trigger for UPDATE operation
CREATE OR REPLACE FUNCTION trMatchingStocksOnUpdate()
RETURNS TRIGGER AS $$
BEGIN
	IF NOT FOUND THEN
		RETURN OLD;
	END IF;

	IF NOT TG_OP = 'UPDATE' THEN
		RETURN OLD;
	END IF;

	IF NOT NEW.Qty = OLD.Qty THEN
		UPDATE Stocks s
		SET Qty = s.Qty - (NEW.Qty - OLD.Qty)
		FROM (SELECT s.ProductID, SUM(s.Qty) AS Qty FROM OLD GROUP BY s.ProductID) AS d
		JOIN (SELECT s.ProductID, SUM(s.Qty) AS Qty FROM NEW GROUP BY s.ProductID) AS i
		ON s.ProductID = i.ProductID
		WHERE s.ProductID = d.ProductID;
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trMatchingStocksOnUpdate
AFTER UPDATE ON OrderDetails
FOR EACH ROW
EXECUTE FUNCTION trMatchingStocksOnUpdate();


-- trigger for delete operation
create or replace function trMatchingStocksOnDelete()
returns trigger as $$
begin
	if not found then
		return old;
	end if;

	update stocks s
	set qty = s.qty + d.qty
	from (select s.productid, sum(s.qty) as qty from old group by s.productid) as d
	where s.productid = d.productid;

	return old;
end;
$$ language plpgsql;

create trigger trMatchingStocksOnDelete
after delete on orderdetails
for each row
execute function trMatchingStocksOnDelete();


-- trigger for update operation
create or replace function trMatchingStocksOnUpdate()
returns trigger as $$
begin
	if not found then
		return old;
	end if;

	if not tg_op = 'update' then
		return old;
	end if;

	if not new.qty = old.qty then
		update stocks s
		set qty = s.qty - (new.qty - old.qty)
		from (select s.productid, sum(s.qty) as qty from old group by s.productid) as d
		join (select s.productid, sum(s.qty) as qty from new group by s.productid) as i
		on s.productid = i.productid
		where s.productid = d.productid;
	end if;

	return new;
end;
$$ language plpgsql;

create trigger trMatchingStocksOnUpdate
after update on orderdetails
for each row
execute function trMatchingStocksOnUpdate();
