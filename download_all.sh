#!/usr/bin/env bash

source ${REPOS_HOME}/ImageSpace/activate.sh

OUT_DIR=/Volumes/WD/ARKit

python3 download_data.py 3dod --video_id_csv threedod/3dod_train_val_splits.csv --download_dir ${OUT_DIR}
python3 download_data.py upsampling --video_id_csv depth_upsampling/upsampling_train_val_splits.csv --download_dir ${OUT_DIR}
python3 download_data.py raw --video_id_csv raw/raw_train_val_splits.csv --download_dir ${OUT_DIR}