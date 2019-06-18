update @ohdsiRepositorySchema.source
set source_key = '@newSourceKey'
where source_key = '@oldSourceKey'
;