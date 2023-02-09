CREATE DEFINER=`admin1`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
Select max(Quantity) AS MaxQuantity From `order table`;
END