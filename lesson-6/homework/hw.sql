SELECT DISTINCT 
       LEAST(col1, col2) AS col1,
       GREATEST(col1, col2) AS col2
FROM InputTbl;

SELECT DISTINCT 
       CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
       CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;

SELECT *
FROM TestMultipleZero
WHERE GREATEST(A,B,C,D) <> 0;

SELECT *
FROM section1
WHERE id % 2 = 1;

SELECT TOP 1 *
FROM section1
ORDER BY id ASC;

SELECT TOP 1 *
FROM section1
ORDER BY id DESC;

SELECT *
FROM section1
WHERE name LIKE 'b%';

select *from ProductCodes
where code like '%t_%' escape 't'
