.PHONY: bow
bow:
	python ./bow_pipeline/A_feature_extraction.py
	python ./bow_pipelineB_preprocessing_clustering.py
	python ./bow_pipelineC_bow_representation.py
	python ./bow_pipelineD_rankings_BoW.py
