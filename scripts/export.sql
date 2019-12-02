COPY (
    WITH RECURSIVE menu(id,	name,	level,	path) AS (
    SELECT id, name, 0 AS Level, '/' || alias path
    FROM categories 
    WHERE parent_id IS NULL

    UNION

    SELECT c.id, c.name, level + 1, m.path || '/' || alias 
    FROM categories c
    INNER JOIN menu m ON m.id = c.parent_id
    )

	    SELECT concat(repeat(E'\t', level), name, CASE :type 
                                                        WHEN 'type_a' 
                                                        THEN  ' ' || path 
                                                        WHEN 'type_b' 
                                                        THEN '' END)  
        FROM menu
        WHERE CASE :type 
              WHEN 'type_a' 
              THEN  true
              WHEN 'type_b' 
              THEN level <= 1 END
        ORDER BY path
    ) TO :file DELIMITER ',' CSV;
    