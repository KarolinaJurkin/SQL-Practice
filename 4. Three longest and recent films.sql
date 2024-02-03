/* Top 3 longest films(title, release year, length) 
 * from the last 10 years
 * rated PG-13 or higher
 * available in at least two DVD rental shops */


SELECT
	title,
	release_year,
	length
FROM
	film f
WHERE
	release_year >= (EXTRACT(YEAR FROM NOW())::int)-10
	AND
	rating IN ('PG-13', 'NC-17', 'R')
	AND
	film_id IN 
		(SELECT
			film_id
		FROM
			inventory 
		GROUP BY 
			film_id
		HAVING
			count(DISTINCT(store_id)) >= 2)
ORDER BY 
	length DESC
LIMIT 
	3;

