SET @r1=0, @r2=0, @r3=0, @r4=0;
/* Remove NULL value from the temporary table with MIN() */
SELECT MIN(Doctor), MIN(Professor), MIN(Singer), MIN(Actor) 
FROM (
    SELECT
    /* Create an index column with respect to occupation */
        CASE
            WHEN Occupation = 'Doctor' THEN (@r1:=@r1+1)
            WHEN Occupation = 'Professor' THEN (@r2:=@r2+1)
            WHEN Occupation = 'Singer' THEN (@r3:=@r3+1)
            WHEN Occupation = 'Actor' THEN (@r4:=@r4+1)
        END AS Rownumber,
    /* Create a table with Occupation column and Name displayed underneath its corresponding Occupation */
        CASE WHEN Occupation = 'Doctor' then Name END AS Doctor,
        CASE WHEN Occupation = 'Professor' then Name END AS Professor,
        CASE WHEN Occupation = 'Singer' then Name END AS Singer,
        CASE WHEN Occupation = 'Actor' then Name END AS Actor
    FROM OCCUPATIONS
    /* Name is sorted alphabetically */
    ORDER BY Name
    ) temp /* give temporary table inside the query an alise */
GROUP BY Rownumber;