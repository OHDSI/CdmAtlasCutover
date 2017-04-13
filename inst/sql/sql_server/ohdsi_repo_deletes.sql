DELETE FROM @ohdsiRepositorySchema.cohort_generation_info where source_id in (@sourceIds);
DELETE FROM @ohdsiRepositorySchema.feas_study_generation_info where source_id in (@sourceIds);
DELETE FROM @ohdsiRepositorySchema.ir_execution where source_id in (@sourceIds);
DELETE FROM @ohdsiRepositorySchema.cca_execution where source_id in (@sourceIds);

