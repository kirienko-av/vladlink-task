CREATE TABLE categories (
    id SERIAL PRIMARY KEY NOT NULL UNIQUE,
    name VARCHAR,
    alias VARCHAR,
    parent_id INT REFERENCES categories (id)
);