-- All Private Label brands
SELECT brand_name, private_label_tier
FROM brand
WHERE brand_type = 'Private Label';

-- Vendors ordered alphabetically
SELECT brand_name, description
FROM brand
WHERE brand_type = 'Vendor'
ORDER BY brand_name ASC;

-- Count brands by type
SELECT brand_type, COUNT(*) AS total
FROM brand
GROUP BY brand_type;

CREATE TABLE region (
    brand_id INTEGER,
    region_name TEXT
);

INSERT INTO region VALUES
(10011, 'The Reach'),
(10012, 'Iron Islands'),
(10015, 'Stormlands'),
(10017, 'The North');

-- INNER JOIN
SELECT b.brand_name, r.region_name
FROM brand b
INNER JOIN region r ON b.brand_id = r.brand_id;

-- LEFT JOIN
SELECT b.brand_name, r.region_name
FROM brand b
LEFT JOIN region r ON b.brand_id = r.brand_id;

-- Vendors whose description mentions 'imports'
SELECT brand_name
FROM brand
WHERE brand_id IN (
    SELECT brand_id
    FROM brand
    WHERE description LIKE '%imports%'
);

-- Count vendors vs private labels
SELECT brand_type, COUNT(*) AS total
FROM brand
GROUP BY brand_type;

-- Average description length
SELECT AVG(LENGTH(description)) AS avg_description_length
FROM brand;

CREATE VIEW PrivateLabelBrands AS
SELECT brand_id, brand_name, private_label_tier
FROM brand
WHERE brand_type = 'Private Label';

SELECT * FROM PrivateLabelBrands;

CREATE INDEX idx_brand_type ON brand(brand_type);