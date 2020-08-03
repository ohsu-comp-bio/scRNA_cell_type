__author__ = "Joey Estabrook"
__email__ = "estabroj@ohsu.edu"
__license__ = "MIT"

"""CellO pipeline for seurat objects"""

import numpy as np
import datetime
import sys
import os
import pandas as pd
import json





SEURAT,= glob_wildcards("input/{seurat}.rds")

	
timestamp = ('{:%Y-%m-%d_%H:%M:%S}'.format(datetime.datetime.now()))

configfile:"omic_config.yaml"

with open('cluster.json') as json_file:
	json_dict = json.load(json_file)

rule_dirs = list(json_dict.keys())

for rule in rule_dirs:
	if not os.path.exists(os.path.join(os.getcwd(),'logs',rule)):
		log_out = os.path.join(os.getcwd(), 'logs', rule)
		os.makedirs(log_out)
		print(log_out)


def message(mes):
	sys.stderr.write("|--- " + mes + "\n")

for seurat in SEURAT:
	message("seurat file " + seurat + " will be processed")

rule all:
	input:
		expand("results/{seurat}/seurat_cello.rds", seurat = SEURAT)
		
		
include: "rules/cello.smk"
