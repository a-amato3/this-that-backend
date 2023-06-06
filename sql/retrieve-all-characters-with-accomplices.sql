SELECT c.name AS character_name, ac.name AS accomplice_name
FROM Character c
LEFT JOIN Accomplice a ON c.id = a.character_id
JOIN Character ac ON a.accomplice_id = ac.id;
