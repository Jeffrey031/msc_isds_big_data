-- ## Performing time test
DBCC DROPCLEANBUFFERS
DBCC FREEPROCCACHE
set statistics time on 
select 
* 
from BigData.dbo.entity AS e
WHERE entity_type = 'PERSON' --both tested with and without this where on entity_type
AND
(e.entity_text LIKE '%zlatan%' 
OR e.entity_text LIKE '%pearson%'
OR e.entity_text LIKE '%mark%')

set statistics time off