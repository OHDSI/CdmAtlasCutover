--HINT DISTRIBUTE_ON_KEY(cohort_definition_id)
IF OBJECT_ID('@resultsDatabaseSchema.cohort', 'U') IS NULL
create table @resultsDatabaseSchema.cohort
(
  cohort_definition_id    int not null,
  subject_id              bigint not null,
  cohort_start_date       date not null,
  cohort_end_date         date not null
);

--HINT DISTRIBUTE_ON_KEY(cohort_definition_id)
IF OBJECT_ID('@resultsDatabaseSchema.cohort_inclusion', 'U') IS NULL
create table @resultsDatabaseSchema.cohort_inclusion
(
  cohort_definition_id    int not null,
  rule_sequence           int not null,
  name                    varchar(255) null,
  description             varchar(1000) null
);

--HINT DISTRIBUTE_ON_KEY(cohort_definition_id)
IF OBJECT_ID('@resultsDatabaseSchema.cohort_inclusion_result', 'U') IS NULL
create table @resultsDatabaseSchema.cohort_inclusion_result
(
  cohort_definition_id    int not null,
  inclusion_rule_mask     bigint not null,
  person_count            bigint not null
);

--HINT DISTRIBUTE_ON_KEY(cohort_definition_id)
IF OBJECT_ID('@resultsDatabaseSchema.cohort_summary_stats', 'U') IS NULL
create table @resultsDatabaseSchema.cohort_summary_stats
(
  cohort_definition_id    int not null,
  base_count              bigint not null,
  final_count             bigint not null
);

--HINT DISTRIBUTE_ON_KEY(cohort_definition_id)
IF OBJECT_ID('@resultsDatabaseSchema.cohort_inclusion_stats', 'U') IS NULL
create table @resultsDatabaseSchema.cohort_inclusion_stats
(
  cohort_definition_id    int not null,
  rule_sequence           int not null,
  person_count            bigint not null,
  gain_count              bigint not null,
  person_total            bigint not null
);
