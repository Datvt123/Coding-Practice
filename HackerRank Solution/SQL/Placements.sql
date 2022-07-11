SELECT s.name FROM students s
JOIN friends f ON s.id = f.id
JOIN packages p1 ON p1.id = f.id
JOIN packages p2 ON p2.id = f.friend_ID
WHERE p2.salary > p1.salary
ORDER BY p2.salary;