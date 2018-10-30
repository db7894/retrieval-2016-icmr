export PYTHONPATH := "./vlfeat-0.9.21/vl"
export PATH := "./vlfeat-0.9.21/bin/glnxa64:${PATH}"
export LD_LIBRARY_PATH := "/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:/usr/lib/x86_64-linux-gnu:/usr/lib64:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:/data/mirlab/miniconda3/envs/py2/lib"

.PHONY: setup
setup:
	echo "You need to run both of the following commands:"
	echo "source activate py2"
	echo "export PYTHONPATH=\"${PYTHONPATH}\""

.PHONY: vlfeat
vlfeat:
	-wget http://www.vlfeat.org/download/vlfeat-0.9.21-bin.tar.gz
	-tar xvzf vlfeat-0.9.21-bin.tar.gz
	cd vlfeat-0.9.21; make

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
