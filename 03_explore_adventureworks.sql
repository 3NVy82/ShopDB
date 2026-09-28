USE AdventureWorks2022;
GO

-- 1. Все схемы базы
SELECT name AS SchemaName 
FROM sys.schemas 
ORDER BY name;
GO

-- 2. Все таблицы со схемами
SELECT 
    SCHEMA_NAME(schema_id) AS [Schema], 
    name AS TableName
FROM sys.tables 
ORDER BY [Schema], TableName;
GO

-- 3. Топ-10 таблиц по количеству строк
SELECT TOP 10 
    t.name AS TableName,
    p.rows AS RowCounts
FROM sys.tables t
JOIN sys.partitions p 
    ON p.object_id = t.object_id 
   AND p.index_id IN (0,1)
ORDER BY p.rows DESC;
GO

-- 4. Все представления
SELECT name AS ViewName 
FROM sys.views 
ORDER BY name;
GO

-- 5. Пример данных: клиенты
SELECT TOP 5 * FROM Person.Person;
GO

-- 6. Пример данных: товары
SELECT TOP 5 * FROM Production.Product;
GO

-- 7. Пример данных: заказы
SELECT TOP 5 * FROM Sales.SalesOrderHeader;
GO