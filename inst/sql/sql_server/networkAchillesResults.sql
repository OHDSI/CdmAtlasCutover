IF OBJECT_ID('@networkDatabaseSchema.achilles_results', 'U') IS NOT NULL drop table @networkDatabaseSchema.achilles_results;

--HINT DISTRIBUTE_ON_KEY(analysis_id)
with count_analyses as 
(
  @analysisIds
), 
sql_union as
(
  @sqlUnions
)
select 
  analysis_id,
  stratum_1,
  stratum_2,
  stratum_3,
  stratum_4,
  stratum_5,
  sum(count_value) count_value 
into @networkDatabaseSchema.achilles_results
from sql_union
group by analysis_id, stratum_1, stratum_2, stratum_3, stratum_4, stratum_5
;
