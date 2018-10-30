export PYTHONPATH := "${CURDIR}"
export LD_LIBRARY_PATH := "/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:/usr/lib/x86_64-linux-gnu:/usr/lib64:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:/data/mirlab/miniconda3/envs/py2/lib"

.PHONY: setup
setup:
	echo "You need to run both of the following commands:"
	echo "source activate py2"
	echo "export PYTHONPATH=\"${PYTHONPATH}\""

.PHONY: bowA
bowA:
	python ./bow_pipeline/A_feature_extraction.py

.PHONY: bowB
bowB:
	python ./bow_pipeline/B_preprocessing_clustering.py

.PHONY: bowC
bowC:
	python ./bow_pipeline/C_bow_representation.py

.PHONY: bowD
bowD:
	python ./bow_pipeline/D_rankings_BoW.py
