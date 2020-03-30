

DBCC DROPCLEANBUFFERS
DBCC FREEPROCCACHE
set statistics time on

;WITH querytwo AS (
SELECT *
,ROW_NUMBER() OVER (PARTITION BY source_id ORDER BY entity_text) AS row_n
FROM 
(
SELECT distinct e.source_id, e.entity_text
from BigData.dbo.entity AS e
WHERE e.entity_text LIKE 'zlatan' 
OR e.entity_text LIKE 'premier league') AS a
) 
SELECT * 
FROM querytwo
WHERE row_n >= 2






DBCC DROPCLEANBUFFERS
DBCC FREEPROCCACHE
set statistics time on

;WITH querytwo AS (
select 
* 
from BigData.dbo.entity AS e
WHERE entity_type = 'PERSON' --both tested with and without this where on entity_type
AND
(e.entity_text LIKE '%zlatan%' 
OR e.entity_text LIKE '%pearson%'
OR e.entity_text LIKE '%mark%')
) 
SELECT * 
FROM querytwo
