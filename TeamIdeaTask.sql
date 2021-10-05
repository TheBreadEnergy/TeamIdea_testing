--Создание Таблиц и заполнение их данными
CREATE TABLE company (
    companyId int NOT NULL,
    companyName varchar(255),
    companyCountry varchar(255),
    PRIMARY KEY (companyId)
);

CREATE TABLE phone (
    phoneId int NOT NULL,
    phoneModel varchar(255),
    companyId int,
    price int,
    PRIMARY KEY (phoneId),
    FOREIGN KEY (companyId) REFERENCES company(companyId)
);

INSERT INTO company (companyId, companyName, companyCountry) VALUES (1, 'Apple', 'USA');
INSERT INTO company (companyId, companyName, companyCountry) VALUES (2, 'Xiaomi', 'China');
INSERT INTO company (companyId, companyName, companyCountry) VALUES (3, 'OPPO', 'China');
INSERT INTO company (companyId, companyName, companyCountry) VALUES (4, 'HUAWEI', 'China');

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (1, 'iPhone 13 128GB', 1, 69990);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (2, 'iPhone 12 128 GB', 1, 59990);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (3, 'iPhone 12 128 GB', 1, 59990);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (4, 'iPhone 12 128 GB', 1, 59990);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (5, 'iPhone 12 128 GB', 1, 59990);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (6, 'Redmi 9C 3/64GB', 2, 10450);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (7, 'Redmi 9C 3/64GB', 2, 10450);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (8, 'Redmi 8 4/64GB', 2, 11990);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (9, 'Redmi 8 4/64GB', 2, 11990);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (10, 'Redmi 8 4/64GB', 2, 11990);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (11, 'A72 128GB', 3, 25990);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (12, 'A12 3/32GB', 3, 9900);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (13, 'A12 3/32GB', 3, 9900);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (14, 'P40 Lite 6/128GB', 4, 20000);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (15, 'P40 Lite 6/128GB', 4, 20000);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (16, 'P40 Lite 6/128GB', 4, 20000);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (17, 'P40 Lite 6/128GB', 4, 20000);

INSERT INTO phone (phoneId, phoneModel, companyId, price)
VALUES (18, 'P30 6/128GB', 4, 20490);

--Задача 1
SELECT companyName, phoneModel, COUNT(*) phoneModel, SUM(price)
FROM company as c
INNER JOIN phone as p ON p.companyId = c.companyId
GROUP BY phoneModel
ORDER BY companyName

--Задача 2.a
SELECT companyName, AVG(price)
FROM company as c
INNER JOIN phone as p ON p.companyId = c.companyId
GROUP BY companyName ORDER By AVG(price) DESC

--Задача 2.b
SELECT companyCountry, COUNT(phoneId)
FROM company as c
INNER JOIN phone as p ON p.companyId = c.companyId
WHERE c.companyCountry = 'China'
Order BY COUNT(phoneId)

--Задача 2.c
SELECT companyName, phoneModel, MAX(price)
FROM company as c
INNER JOIN phone as p ON p.companyId = c.companyId
GROUP BY companyName