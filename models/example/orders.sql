{{ 
    config(materialized='table') 
}}

with order_table as ( 
SELECT so.OrderNumber,
so.OrderDate,
so.Channel,
so.Currency_Code,
so.Warehouse_Code,
so.Order_Quantity,
so.Unit_Price,
so.Line_Total,
so.Total_Unit_Cost,
r.City,
r.Country,
r.Territory,
r.Full_Name as Region_Full_Name,
p.Product_Name,
c.Customer_Names
FROM
Data_table.Sales_orders so
left outer join
Data_table.Regions r
on so.Delivery_Region_Index = r.Index
left outer join
Data_table.Products p
on so.Product_Description_Index = p.Index
left outer join
Data_table.Customers c
on so.Customer_Name_Index = c.Customer_Index
)

select * from order_table