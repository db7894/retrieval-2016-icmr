.PHONY: bow
bow:
	python2 ./bow_pipeline/A_feature_extraction.py
	python2 ./bow_pipelineB_preprocessing_clustering.py
	python2 ./bow_pipelineC_bow_representation.py
	python2 ./bow_pipelineD_rankings_BoW.py
