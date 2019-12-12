CREATE DATABASE bamazon_db;
USE bamazon_db;

CREATE TABLE inventory (
id INTEGER(50) AUTO_INCREMENT NOT NULL,
Product VARCHAR (30) NOT NULL,
Department VARCHAR (30),
Prices DECIMAL (10,2),
Stock INTEGER (100),
PRIMARY KEY (id)
);

INSERT INTO inventory (Product, Department, Prices, Stock)
VALUES ("1g of Enriched Uranium", "Science", 75.00, 15);

INSERT INTO inventory (Product, Department, Prices, Stock)
VALUES ("Philosopher's Stone", "Parnormal", 1000, 1);

INSERT INTO inventory (Product, Department, Prices, Stock)
VALUES ("Russian state secrets", "Espionage", 500, 7);

INSERT INTO inventory (Product, Department, Prices, Stock)
VALUES ("Mystery Box", "?", 100, 100);

INSERT INTO inventory (Product, Department, Prices, Stock)
VALUES ("Cursed Katana", "Paranormal", 600, 67);

INSERT INTO inventory (Product, Department, Prices, Stock)
VALUES ("Ark of the Covenant", "Paranormal", 10000, 1);

INSERT INTO inventory (Product, Department, Prices, Stock)
VALUES ("Spear of Destiny", "Paranormal", 5000, 1);

INSERT INTO inventory (Product, Department, Prices, Stock)
VALUES ("Quantum Computer", "Science", 400, 50);

INSERT INTO inventory (Product, Department, Prices, Stock)
VALUES ("Companion Drone", "Science", 200, 20);




SELECT * FROM inventory;

UPDATE inventory SET stock = 75 WHERE id = 1;
UPDATE inventory SET stock = 1 WHERE id = 2;
UPDATE inventory SET stock = 7 WHERE id = 3;
UPDATE inventory SET stock = 100 WHERE id = 4;
UPDATE inventory SET stock = 67 WHERE id = 5;
UPDATE inventory SET stock = 1 WHERE id = 6;
UPDATE inventory SET stock = 1 WHERE id = 7;
UPDATE inventory SET stock = 59 WHERE id = 8;
UPDATE inventory SET stock = 20 WHERE id = 9;
UPDATE inventory SET stock = 100 WHERE id = 10;


ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';