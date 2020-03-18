USE BigData


CREATE TABLE #source (
	entity_text NVARCHAR(500)
   ,entity_text2 NVARCHAR(500)
   ,entity_text3 NVARCHAR(500)
   ,entity_text4 NVARCHAR(MAX)
)

BULK INSERT #source
FROM 'D:\_Jeffrey\Dropbox\UvA\information_studies\msc1_big_data\python_code\structured_table_source.csv'
WITH
(
FIRSTROW = 2
, FIELDTERMINATOR = ';'
, ROWTERMINATOR = '0x0a'
, MAXERRORS = 100
)


SELECT
	TRY_CAST(entity_text2 AS BIGINT) AS source_id
   ,TRY_CAST(entity_text4 AS NVARCHAR(MAX)) AS source_text
   ,TRY_CAST(entity_text3 AS DATETIME2) AS date_created INTO BigData.dbo.source
FROM #source


DROP TABLE #source


