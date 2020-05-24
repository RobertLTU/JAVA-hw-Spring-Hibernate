-- ========= Uzduotis 1 ===========
-- Suskaičiuokite kiek iš viso lentelėje yra prekių (kiek įrašų yra lentelėje products) 
SELECT COUNT(*) FROM products;

-- ========= Uzduotis 2 ===========
/* Išveskite visas prekes esančias atitinkamose parduotuvėse. Išvedamas rezultatas:
 parduotuvės pavadinimas, prekės pavadinimas, kiekis, kaina, suma). */
SELECT s.name AS store_name, ps_p.name AS product_name,
		ps_p.quantity, ps_p.price, (ps_p.quantity * ps_p.price) AS total_value
FROM (SELECT * FROM products_in_stores ps 
		LEFT JOIN products p ON (ps.product_id = p.id)) AS ps_p
LEFT JOIN stores s ON (s.id = ps_p.store_id);

-- ========= Uzduotis 3 ===========
/*  Išveskite kiek kiekvienoje parduotuvėje yra prekių. 
Išvedamas sąrašas turi būti toks: parduotuvės pavadinimas,
 adresas, bendras prekių kiekis. Turi būti išvestos parduotuvės ir neturinčios prekių. */
SELECT s.name, s.address, SUM(ps.quantity) AS total_stock FROM stores s
LEFT JOIN products_in_stores ps ON (s.id = ps.store_id)
GROUP BY s.name;

-- ========= Uzduotis 4 ===========
/*  Išveskite visas parduotuves ir jose esančių prekių sumą. 
t.y. kiek kainuotų visos prekės esančios parduotuvėje. 
Išvedamas sąrašas turi būti toks: parduotuvės pavadinimas, adresas, sandėlio suma. */
SELECT 	s.name AS store_name, 
		s.address,
		SUM(ps_p.quantity * ps_p.price) AS total_value
FROM (SELECT * FROM products_in_stores ps 
		LEFT JOIN products p ON (ps.product_id = p.id)) AS ps_p
RIGHT JOIN stores s ON (s.id = ps_p.store_id)
GROUP BY s.name;

-- ========= Uzduotis 5 ===========
/*
Išveskite tas parduotuves kuriose yra ne daugiau kaip 4 skirtingų rūšių prekės. 
Išvedamas sąrašas turi būti toks: parduotuvės pavadinimas, prekių rūšių skaičius; 
*/
SELECT sps.name, sps.prod_count FROM (SELECT s.name, COUNT(ps.product_id) AS prod_count FROM stores s 
			LEFT JOIN products_in_stores ps ON (s.id = ps.store_id) 
            GROUP BY s.id) AS sps
		WHERE sps.prod_count < 5;

-- ========= Uzduotis 6 ===========	
-- Isveskite prekes, kuriu nera nei vienoje parduotuveje.
SELECT p.name FROM products p 
		LEFT JOIN products_in_stores pst 
			ON p.id = pst.product_id
			WHERE quantity IS NULL OR quantity = 0;
                        
