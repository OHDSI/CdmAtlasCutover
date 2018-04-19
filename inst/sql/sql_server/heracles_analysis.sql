IF OBJECT_ID('@resultsDatabaseSchema.heracles_analysis', 'U') IS NULL

--HINT DISTRIBUTE_ON_KEY(analysis_id)
with selects
as
(
  @heraclesAnalysisSelects
)
select 
	analysis_id,
	analysis_name,
	stratum_1_name,
	stratum_2_name,
	stratum_3_name,
	stratum_4_name,
	stratum_5_name,
	analysis_type
into @resultsDatabaseSchema.heracles_analysis
from selects;