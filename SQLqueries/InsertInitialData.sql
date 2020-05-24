INSERT INTO stores(name, address)
VALUES('Maxima', 'Balbieriškis'), 
('Rimi', 'Ariogala'), 
('Iki', 'Babtai'),
('Aibė', 'Grigiškės'),
('Senukai', 'Garliava');

INSERT INTO products(name, description)
VALUES('Duona', NULL), ('Pienas', 'Ekologiškas pienas'), 
('Sūris', NULL), ('Varškė', NULL),('Alus', NULL),
('Vanduo', NULL),('Dešra', NULL),('Skilandis', NULL),
('Salotos', NULL);

INSERT INTO products_in_stores(product_id, store_id, price, quantity)
VALUES (1, 2, 2.50, 2), (2, 2, 2.00, 5), (1, 3, 1.50, 4), (2, 3, 0.50, 3),
(3, 3, 3.50, 1), (1, 4, 1.50, 2), (2, 4, 2.50, 2), (3, 4, 3.50, 1), (4, 4, 5.50, 1),
(5, 4, 4.50, 1), (6, 4, 6.50, 1), (6, 5, 5.50, 2), (7, 5, 3.50, 4);