with cte_sources as
(
  select source_id from @ohdsiRepositorySchema.source_daimon
  group by source_id
  having count(*) = 3
),
cte_priority as
(
  select A.source_id from cte_sources A
  join @ohdsiRepositorySchema.source_daimon B on A.source_id = B.source_id
  where B.priority = 1
)
update cte_priority
set priority = 0;