update @ohdsiRepositorySchema.source 
set deleted_date = GETDATE() where source_id in (@sourceIds)
;