CREATE TABLE #entities (
	entity_id NVARCHAR(500)
   ,source_id NVARCHAR(500)
   ,date_created NVARCHAR(500)
   ,entity_text NVARCHAR(MAX)
   ,str_begin NVARCHAR(500)
   ,str_end NVARCHAR(500)
   ,entity_type NVARCHAR(500)
)

BULK INSERT #entities
FROM 'D:\_Jeffrey\Dropbox\UvA\information_studies\msc1_big_data\python_code\structured_table.csv'
WITH
(
FIRSTROW = 2
, FIELDTERMINATOR = ';'
, ROWTERMINATOR = '0x0a'
, MAXERRORS = 10
)

SELECT
	TRY_CAST(entity_id AS BIGINT) AS entity_id
   ,TRY_CAST(source_id AS BIGINT) AS source_id
   ,TRY_CAST(date_created AS DATETIME2) AS date_created
   ,TRY_CAST(entity_text AS NVARCHAR(MAX)) AS entity_text
   ,TRY_CAST(str_begin AS INT) AS str_begin
   ,TRY_CAST(str_end AS INT) AS str_end
   ,TRY_CAST(entity_type AS NVARCHAR(MAX)) AS entity_type INTO BigData.dbo.entity
FROM #entities


DROP TABLE #entities