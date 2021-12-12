#!/bin/bash

# https://github.com/OkanArikan/ARKitScenes

#source ./venv/bin/activate

VIDEO_ID=41048190
OUT_DIR="/tmp/ARKitScenes/"
TYPE=3dod

if [ ! -d "$OUT_DIR/$TYPE/Training/$VIDEO_ID" ]; then
    python3 download_data.py $TYPE --split Training --video_id $VIDEO_ID --download_dir $OUT_DIR
fi

python3 threedod/benchmark_scripts/show_3d_bbox_annotation.py --file $OUT_DIR/$TYPE/Training/$VIDEO_ID/${VIDEO_ID}_3dod_mesh.ply  --anno $OUT_DIR/$TYPE/Training/$VIDEO_ID/${VIDEO_ID}_3dod_annotation.json