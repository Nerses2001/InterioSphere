insert into Customers
    (FName,MName, LName, "Address", City, Phone, DateInSystem)
values
    ('Victor', 'Viktorovich', 'Prokopenko', 'Rudenko St. 21a, Apt. 137', 'Ternopil', '(063)4569385', CURRENT_DATE - INTERVAL '85 days'),
    ('Anton', 'Olegovich', 'Kruk', 'Bazhova St. 77', 'Kyiv', '(093)1416433', CURRENT_DATE - INTERVAL '85 days'),
    ('Oksana', 'Vladimirovna', 'Desyatova', 'Bazhan St. 6, Apt. 22', 'Kyiv', '(068)0989367', CURRENT_DATE - INTERVAL '85 days'),
    ('Antonina', 'Dmitrievna', 'Shevchenko', 'Myshugi St. 25', 'Lviv', '(098)4569111', CURRENT_DATE - INTERVAL '65 days'),
    ('Anatoly', 'Petrovich', 'Dmitrov', 'Druzhnova St. 15', 'Lviv', '(068)2229325', CURRENT_DATE - INTERVAL '45 days'),
    ('Ivan', 'Ivanovich', 'Kobzar', 'Kovpak St. 24, Apt. 17', 'Kyiv', '(063)1119311', CURRENT_DATE - INTERVAL '45 days'),
    ('Victor', 'Olegovich', 'Grach', 'Lesnaya St. 21', 'Ternopil', '(068)4569344', CURRENT_DATE - INTERVAL '35 days'),
    ('Olga', 'Alekseevna', 'Butkova', 'Dorozhnaya St. 77, Apt. 99', 'Mykolaiv', '(050)4569255', CURRENT_DATE - INTERVAL '25 days'),
    ('Alina', 'Mikhailovna', 'Melova', 'Kontraktna St. 20', 'Mykolaiv', '(050)4539333', CURRENT_DATE - INTERVAL '15 days'),
    ('Mikhail', 'Andreevich', 'Savitsky', 'Medovaya St. 1', 'Kyiv', '(063)9999380', CURRENT_DATE - INTERVAL '5 days'),
    ('Artem', 'Ivanovich', 'Krava', 'Artema St. 23', 'Lviv', '(067)9995558', CURRENT_DATE - INTERVAL '15 days');

insert into  Employees
    (FName, MName, LName, Post, Salary, PriorSalary)
values
    ('Anatoliy', 'Vladimirovich', 'Desyatov', 'Chief Executive Officer', 2000, 300),
    ('Andrei', 'Antonovich', 'Zaritsky', 'Manager', 700, 150),
    ('Oleg', null, 'Surokov', 'Sales Manager', 500, 50),
    ('Maxim', 'Ivanovich', 'Rudakov', 'Sales Manager', 500, 50),
    ('Irina', null, 'Mikhailovna', 'Manager', 700, 150),
    ('Ilya', null, 'Borisovna', 'Sales Manager', 700, 150);


insert into EmployeesInfo
    (ID, MaritalStatus, BirthDate, "Address", Phone)
values
    (1, 'Single', '1999-08-15', 'Viktoraka 16/7', '(067)4564489'),
    (2, 'Married', '2004-09-09', 'Malinovskaya 15', '(050)9645585'),
    (3, 'Single', '2000-12-11', 'Pobedy 16, 145', '(068)4564049'),
    (4, 'Single', '2001-01-11', 'Antonova 11', '(066)4646466'),
    (5, 'Married', '1995-08-08', 'Rudenko 10, 7', '(093)4334493'),
    (6, 'Married', '1998-01-10', 'Prosveshcheniya 7', '(063)4114141');

insert into Products (Name)
values
    ('Asus D345 Laptop'),
    ('HP Pavilion 15-p032er Laptop'),
    ('Dell Inspiron 5555 Laptop'),
    ('Acer Aspire ES1 Netbook'),
    ('Lenovo Flex 10 Netbook'),
    ('Dell Inspiron 3147 Netbook'),
    ('Samsung Galaxy S6 SS 32GB Smartphone'),
    ('Apple iPhone 6 Smartphone'),
    ('Canon PowerShot SX400 Camera'),
    ('LG 55LB631V TV');

insert into  ProductDetails (ID, Color, "Description")
values
    (1, 'Black', '14" (1366x768) HD LED screen, glossy / Intel Celeron N2840 (2.16 GHz) / 2 GB RAM / 500 GB HDD / Intel HD Graphics / No optical drive / LAN / Wi-Fi / Bluetooth / webcam / DOS / 2.09 kg'),
    (2, 'Gray', '15.6" (1366x768) HD LED screen, glossy / AMD Quad-Core A6-6310 (1.8 - 2.4 GHz) / 4 GB RAM / 500 GB HDD / AMD Radeon R4 + AMD Radeon R7 M260, 2 GB / DVD Super Multi / LAN / Wi-Fi / Bluetooth 4.0 / webcam / DOS / 2.44 kg'),
    (3, 'Black', '15.6" (1366x768) HD WLED screen, glossy / AMD Quad-Core A6-7310 (2.0 GHz) / 4 GB RAM / 500 GB HDD / AMD Radeon R5 M335, 2 GB / DVD±RW / LAN / Wi-Fi / Bluetooth / webcam / Linux / 2.3 kg'),
    (4, 'Black', '11.6'' (1366x768) HD LED screen, matte / Intel Celeron N2840 (2.16 GHz) / 2 GB RAM / 500 GB HDD / Intel HD Graphics / No optical drive / LAN / Wi-Fi / Bluetooth / webcam / Linpus / 1.29 kg'),
    (5, 'Black', '10.1" (1366x768) HD LED touchscreen, glossy / Intel Celeron N2830 (2.16 GHz) / 2 GB RAM / 320 GB HDD / Intel HD Graphics / No optical drive / Wi-Fi / Bluetooth / webcam / Windows 8.1 Pro 64-bit (Ukrainian language) / Microsoft Office Pro Academic 2013 (Ukrainian language) / 1.2 kg'),
    (6, 'Black', '11.6" IPS (1366x768) HD LED touchscreen, glossy / Intel Pentium N3530 (2.16 - 2.58 GHz) / 4 GB RAM / 500 GB HDD / Intel HD Graphics / No optical drive / Wi-Fi / Bluetooth / webcam / Windows 8.1 / 1.41 kg'),
    (7, 'White', '5.1" Super AMOLED (2560x1440) touchscreen / monoblock / Exynos 7420 (Quad 2.1 GHz + Quad 1.5 GHz) / 16 MP camera + 5 MP front camera / Bluetooth 4.1 / Wi-Fi a/b/g/n/ac / 3 GB RAM / 32 GB internal memory / 3.5 mm jack / LTE / GPS / GLONASS / Android 5.0 / 143.4 x 70.5 x 6.8 mm, 138 g'),
    (8, 'Black', '4.7" IPS LCD (1334x750 pixels) with LED backlight / 16 million colors / touchscreen / Ion-X Glass scratch-resistant glass with oleophobic coating / 16 GB built-in memory'),
    (9, 'Black', '1/2.3" sensor, 16 MP / 30x zoom (optical), 4x zoom (digital) / supports SD, SDHC, SDXC memory cards / 3" LCD display / HD video / powered by a lithium-ion battery / 104.4 x 69.1 x 80.1 mm, 313 g'),
    (10, 'Black', '55" screen size / Smart TV support / Resolution: 1920x1080 / Wi-Fi: Yes / Digital tuner ranges: DVB-S2, DVB-C, DVB-T2 / Panel refresh rate: 100 Hz / Refresh rate: 500 Hz (MCI)');

insert into Stocks (ProductID, Qty)
values
    (1, 20),
    (2, 10),
    (3, 7),
    (4, 8),
    (5, 9),
    (6, 5),
    (7, 12),
    (8, 54),
    (9, 8),
    (10, 7);

insert into Orders
    (CustomerID, EmployeeID, OrderDate)
values
    (1, 3, current_date - interval '85 days'),
    (2, 6, current_date - interval '85 days'),
    (3, 4, current_date - interval '85 days'),
    (3, null, current_date - interval '75 days'),
    (2, 3, current_date - interval '65 days'),
    (4, 6, current_date - interval '65 days'),
    (1, 3, current_date - interval '55 days'),
    (5, 3, current_date - interval '45 days'),
    (6, 3, current_date - interval '45 days'),
    (1, 4, current_date - interval '45 days'),
    (2, null, current_date - interval '45 days'),
    (7, 3, current_date - interval '35 days'),
    (6, 4, current_date - interval '35 days'),
    (3, null, current_date - interval '35 days'),
    (5, 6, current_date - interval '35 days'),
    (8, 3, current_date - interval '25 days'),
    (5, 4, current_date - interval '25 days'),
    (7, 4, current_date - interval '25 days'),
    (7, 3, current_date - interval '15 days'),
    (9, 3, current_date - interval '15 days'),
    (8, 4, current_date - interval '15 days'),
    (10, null, current_date - interval '15 days'),
    (11, 3, current_date - interval '5 days'),
    (10, 4, current_date - interval '5 days');

insert into OrderDetails
    (OrderID, LineItem, ProductID, Qty, Price)
values
    (1, 1, 1, 1, 295),
    (2, 1, 2, 1, 445),
    (2, 2, 6, 1, 450),
    (3, 1, 4, 1, 422),
    (3, 2, 9, 4, 218),
    (4, 1, 7, 1, 450),
    (5, 1, 9, 1, 220),
    (6, 1, 8, 1, 550),
    (7, 1, 8, 2, 550),
    (7, 2, 9, 1, 222);