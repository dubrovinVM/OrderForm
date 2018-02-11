use lykos
SELECT us_rl.name as role, usr.fullName as fullName, usr.comment as comment 
FROM users as usr 
 LEFT OUTER JOIN user_role as us_rl 
 ON usr.user_role_id = us_rl.id 
 WHERE login like 'vites'