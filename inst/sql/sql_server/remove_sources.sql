delete from @ohdsiRepositorySchema.source where source_id in (@sourceIds); 
delete from @ohdsiRepositorySchema.source_daimon where source_id in (@sourceIds);