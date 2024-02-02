-- List all the movies and their release year in which Burt Temple starred
-- 1. Subquery using 'IN' operator

SELECT
	title, 
	release_year
FROM
	film
WHERE
	film_id 
	IN
	(SELECT
		fa.film_id
	FROM
		film_actor fa
		JOIN actor a
		ON fa.actor_id=a.actor_id
	WHERE 
		a.first_name = 'BURT'
		AND
		a.last_name = 'TEMPLE')
ORDER BY
	release_year DESC;
	
-- 2. Subquery using 'EXISTS' operator	
	
SELECT
	f.title,
	f.release_year
FROM
	film f
WHERE 
	EXISTS
	(SELECT
		fa.film_id
	FROM
		film_actor fa
		JOIN actor a
		ON fa.actor_id=a.actor_id
	WHERE 
		a.first_name = 'BURT'
		AND
		a.last_name = 'TEMPLE'
		AND
		f.film_id=fa.film_id)
	ORDER BY
		f.release_year DESC;	
	
-- 3. CTE

WITH Burt AS
	(SELECT
		fa.film_id
	FROM
		film_actor fa
		JOIN actor a
		ON fa.actor_id=a.actor_id
	WHERE 
		a.first_name = 'BURT'
		AND
		a.last_name = 'TEMPLE')
SELECT
	f.title,
	f.release_year
FROM
	film f
	JOIN Burt b
	ON f.film_id=b.film_id
ORDER BY
		f.release_year DESC;

	

