-- 3 longest films and list of the actors who played there

SELECT 
	f.title AS movie_title, 
	a.first_name || ' ' || a.last_name AS actor
FROM
	(
		SELECT
			film_id,
			title,
			length
		FROM	
			film
		ORDER BY
			3 DESC
		LIMIT
			3
		) AS f
	JOIN 
		film_actor AS fa
	ON f.film_id = fa.film_id
	JOIN 
		actor AS a
	ON a.actor_id = fa.actor_id;
	
