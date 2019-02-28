IF OBJECT_ID('@networkDatabaseSchema.achilles_results_dist', 'U') IS NOT NULL drop table @networkDatabaseSchema.achilles_results_dist;

--HINT DISTRIBUTE_ON_KEY(analysis_id)
with count_analyses as 
(
  @analysisIds
), 
sql_union as
(
  @sqlUnions
)
SELECT analysis_id,
       stratum_1,
       stratum_2,
       stratum_3,
       stratum_4,
       stratum_5,
       AVG(count_value) as count_value,
       AVG(min_value) as min_value,
       AVG(max_value) as  max_value,
       AVG(avg_value) as avg_value,
       AVG(stdev_value) as stdev_value,
       AVG(median_value) as median_value,
       AVG(p10_value) as p10_value,
       AVG(p25_value) as p25_value,
       AVG(p75_value) as p75_value,
       AVG(p90_value) as p90_value
into @networkDatabaseSchema.achilles_results_dist
FROM sql_union
GROUP BY analysis_id,
         stratum_1,
         stratum_2,
         stratum_3,
         stratum_4,
         stratum_5
;