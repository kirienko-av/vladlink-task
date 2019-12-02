CREATE TEMP TABLE categories_json(data jsonb);                    

COPY categories_json FROM 'D:\categories.json' csv quote e'\x01' delimiter e'\x02';

INSERT INTO categories (id, name, alias, parent_id)
WITH RECURSIVE categories_json_to_categories (data, parent_id) AS (
  SELECT jsonb_array_elements(data), null FROM categories_json
	UNION
	SELECT jsonb_array_elements(children), id
	FROM (SELECT data->'childrens' children, data->>'id'
    FROM categories_json_to_categories) t(children, id)  
), 
cj_to_categories AS (
    SELECT (data->>'id')::int id, 
            data->>'name' AS "name",
            data->>'alias' alias, 
            parent_id::int parent_id FROM categories_json_to_categories)
            
SELECT * FROM cj_to_categories c
WHERE c.id NOT IN (SELECT id FROM categories);

SELECT setval('categories_id_seq', MAX(id)) FROM categories;

DROP TABLE categories_json;