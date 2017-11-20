--HINT DISTRIBUTE_ON_KEY(cohort_definition_id)
IF OBJECT_ID('@resultsDatabaseSchema.cohort_features_dist', 'U') IS NULL
create table @resultsDatabaseSchema.cohort_features_dist
(
  cohort_definition_id bigint,   
  covariate_id bigint, 
  count_value float, 
  min_value float, 
  max_value float, 
  average_value float, 
  standard_deviation float, 
  median_value float, 
  p10_value float, 
  p25_value float, 
  p75_value float, 
  p90_value float
);

--HINT DISTRIBUTE_ON_KEY(cohort_definition_id)
IF OBJECT_ID('@resultsDatabaseSchema.cohort_features', 'U') IS NULL
create table @resultsDatabaseSchema.cohort_features
(
  cohort_definition_id bigint,
  covariate_id bigint, 
  sum_value bigint, 
  average_value float
);

--HINT DISTRIBUTE_ON_KEY(cohort_definition_id)
IF OBJECT_ID('@resultsDatabaseSchema.cohort_features_ref', 'U') IS NULL
create table @resultsDatabaseSchema.cohort_features_ref
(
  cohort_definition_id bigint,
  covariate_id bigint, 
  covariate_name varchar(1000), 
  analysis_id int, 
  concept_id int
);

--HINT DISTRIBUTE_ON_KEY(cohort_definition_id)
IF OBJECT_ID('@resultsDatabaseSchema.cohort_features_analysis_ref', 'U') IS NULL
create table @resultsDatabaseSchema.cohort_features_analysis_ref
(
  cohort_definition_id bigint,
  analysis_id int, 
  analysis_name varchar(1000), 
  domain_id varchar(100), 
  start_day int, 
  end_day int, 
  is_binary char,
  missing_means_zero char
);