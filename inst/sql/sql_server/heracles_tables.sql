--HINT DISTRIBUTE_ON_KEY(analysis_id)
IF OBJECT_ID('@resultsDatabaseSchema.heracles_results', 'U') IS NULL
CREATE TABLE @resultsDatabaseSchema.heracles_results
(
	cohort_definition_id int,
	analysis_id int,
	stratum_1 varchar(255),
	stratum_2 varchar(255),
	stratum_3 varchar(255),
	stratum_4 varchar(255),
	stratum_5 varchar(255),
	count_value bigint,
	last_update_time datetime 
);

--HINT DISTRIBUTE_ON_KEY(analysis_id)
IF OBJECT_ID('@resultsDatabaseSchema.heracles_results_dist', 'U') IS NULL
CREATE TABLE @resultsDatabaseSchema.heracles_results_dist
(
	cohort_definition_id int,
	analysis_id int,
	stratum_1 varchar(255),
	stratum_2 varchar(255),
	stratum_3 varchar(255),
	stratum_4 varchar(255),
	stratum_5 varchar(255),
	count_value bigint,
	min_value float,
	max_value float,
	avg_value float,
	stdev_value float,
	median_value float,
	p10_value float,
	p25_value float,
	p75_value float,
	p90_value float,
	last_update_time datetime
)
;

--HINT DISTRIBUTE_ON_KEY(analysis_id)
IF OBJECT_ID('@resultsDatabaseSchema.heracles_heel_results', 'U') IS NULL
CREATE TABLE @resultsDatabaseSchema.heracles_heel_results 
( 
	cohort_definition_id int, 
	analysis_id int, 
	heracles_heel_warning varchar(255) 
);

--HINT DISTRIBUTE_ON_KEY(study_id)
IF OBJECT_ID('@resultsDatabaseSchema.feas_study_result', 'U') IS NULL
CREATE TABLE @resultsDatabaseSchema.feas_study_result
(
	study_id int not null,
	inclusion_rule_mask bigint not null,
	person_count bigint not null
);

--HINT DISTRIBUTE_ON_KEY(study_id)
IF OBJECT_ID('@resultsDatabaseSchema.feas_study_inclusion_stats', 'U') IS NULL
CREATE TABLE @resultsDatabaseSchema.feas_study_inclusion_stats
(
  study_id int not null,
  rule_sequence int not null,
  name varchar(255) not null,
  person_count bigint not null,
  gain_count bigint not null,
  person_total bigint not null
);

--HINT DISTRIBUTE_ON_KEY(study_id)
IF OBJECT_ID('@resultsDatabaseSchema.feas_study_index_stats', 'U') IS NULL
CREATE TABLE @resultsDatabaseSchema.feas_study_index_stats
(
  study_id int not null,
  person_count bigint not null,
  match_count bigint not null
);
