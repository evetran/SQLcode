SELECT 
    DISTINCT(N),
    CASE 
        WHEN P IS NULL THEN "Root"
        WHEN P IS NOT NULL 
                AND (N NOT IN (SELECT DISTINCT(P) FROM BST 
                            WHERE P IS NOT NULL)) THEN "Leaf"
        WHEN P IS NOT NULL 
                AND (N IN (SELECT DISTINCT(P) FROM BST 
                            WHERE P IS NOT NULL)) THEN "Inner"  
    END AS TypeBinaryTree
FROM BST
ORDER BY N;