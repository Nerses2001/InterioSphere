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

create table EmployeesInfo
(
    ID int not null ,
    MaritalStatus varchar(10) not null,
    BirthDate date not null,
    "Address" varchar(50) not null ,
    Phone varchar(12) not null
);

create table Products
(
    ID serial not null primary key ,
    Name varchar(50) not null
);

create table ProductDetails
(
    ID int not null,
    Color varchar(20) null ,
    "Description" varchar null
);


create table Stocks
(
    ProductId int not null ,
    Qty int default 0
);



create table Orders
(
    ID serial primary key not null ,
    CustomerID int null ,
    EmployeeId int null ,
    OrderDate date default current_date
);

create table OrderDetails
(
    OrderID int not null ,
    LineItem int not null ,
    ProductID int not null ,
    Qty int not null ,
    Price money not null,
    TotalPrice money generated always as (Qty * Price) stored
);

alter table EmployeesInfo
    add
        unique (ID);

alter table EmployeesInfo
    add
        foreign key (ID) references Employees(ID)
            on delete cascade;

alter table ProductDetails
    add
        unique (ID);

alter table ProductDetails
    add
        foreign key (ID) references Products(ID)
            on delete cascade ;

alter table Stocks
    add
        unique (ProductId);

alter table Stocks
    add
        foreign key (ProductId) references Products(ID)
            on delete cascade;

alter table Orders
    add
        foreign key (CustomerID) references Customers(ID)
            on delete set null;

alter table Orders
    add
        foreign key (EmployeeId) references Employees(ID)
            on delete set null;

alter  table  OrderDetails
    add
        primary key(OrderID, LineItem);

alter  table  OrderDetails
    add
        foreign key (OrderID) references Orders(ID)
            on delete cascade;

alter table OrderDetails
    add
        foreign key (ProductID) references Products(ID)
            on delete cascade;


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
    add
        check (Qty >= 0 );