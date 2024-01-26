-- Count number of films actors starred in

SELECT 
	a.first_name || ' ' || a.last_name AS actor,
	COUNT(fa.film_id) AS number_of_films
FROM
	film_actor fa
	JOIN actor a
	ON	fa.actor_id=a.actor_id
GROUP BY
	actor
HAVING 
	COUNT(fa.film_id) > 40
ORDER BY
	COUNT(fa.film_id) DESC;

