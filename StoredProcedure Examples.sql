use JoinExample;

select * from Students;
select * from Enrollments;

--procedure to get student by id
create procedure GetAllId
         @Id1 int,
         @Id2 int
as
begin
       select * from Students where StudentID=@Id1 or StudentID=@Id2;
end;

exec GetAllId 3,2;

use Sales

select * from SalesData;

--getting products by product name from the table
create procedure GetProductsbyProductName
@product varchar(50)
as 
begin
select * from SalesData where product=@product;
end;

exec GetProductsbyProductName 'LAPTOP';

--Adding Product to the table
create procedure AddProduct
@city varchar(50),
@product varchar(50),
@amount int,
@order_date date
as
begin
insert into SalesData (city,product,amount,order_date) values
(@city,@product,@amount,@order_date);
end;

exec AddProduct 'Calicut','PC',70000,'2025-02-22';

--storedProcedure with if/else statements
    


--storedProcedure on output parameter

create procedure GetTotalSalesByProduct
@productName varchar(50),
@TotalSales int output
as
begin
select @TotalSales=SUM(amount)
from SalesData
where product=@productName;
end;

declare @Result int;
exec GetTotalSalesByProduct
    @productName='Laptop',
    @TotalSales=@Result output;

select @Result as TotalSalesAmount

--1 Create a stored procedure that takes a product name as input and returns
--the total sales amount using an OUTPUT parameter.

create proc GetSalesByProduct
@productName varchar(50),
@TotalSales int output
as
begin
    select @TotalSales=SUM(amount) from SalesData where product=@productName;
end;

declare @sales int
exec GetSalesByProduct
@productName='Laptop',
@TotalSales=@sales output;

select @sales as totalSales;


select * from SalesData;
