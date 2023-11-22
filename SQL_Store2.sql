USE briana_b_store;

SELECT products.*, categories.name AS category 
	FROM products, categories
	WHERE products.category_id = categories.id;

DESCRIBE categories;
/*
ALTER TABLE categories
	ADD parent_id TINYINT UNSIGNED AFTER id;*/
    
SELECT * FROM categories;

ALTER TABLE categories ADD FOREIGN KEY (parent_id)
	REFERENCES categories(id)
    ON UPDATE CASCADE ON DELETE CASCADE;
/*    
INSERT INTO categories VALUES (NULL, 1, 'Smart TV');
INSERT INTO categories VALUES (NULL, 1, 'Full HD');
INSERT INTO categories VALUES (NULL, 1, 'UHD 4k');
*/
SELECT categories.name AS category,
	subcategories.name AS subcategory 
    FROM categories, categories AS subcategories
    WHERE categories.id= subcategories.parent_id
UNION
SELECT name, NULL FROM categories
	WHERE parent_id IS NULL and id!=(SELECT DISTINCT parent_id FROM categories WHERE parent_id IS NOT NULL);
    
INSERT INTO categories VALUES (NULL, 3,  'AMD');

SELECT * FROM categories WHERE id IN (1, 3);
    
    
    