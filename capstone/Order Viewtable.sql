CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `admin1`@`%` 
    SQL SECURITY DEFINER
VIEW `orderview` AS
    SELECT 
        `order table`.`OrderID` AS `OrderID`,
        `order table`.`OrderQuantity` AS `OrderQuantity`,
        `order table`.`TotalCost` AS `TotalCost`
    FROM
        `order table`