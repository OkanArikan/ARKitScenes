from download_data import download_data
import pandas as pd
import os
from concurrent.futures import ThreadPoolExecutor

df = pd.read_csv(os.path.join(os.path.dirname(__file__), 'threedod', '3dod_train_val_splits.csv'))
outDir = '/Volumes/WD/ARKitScenes'
dataType = '3dod'
raw_dataset_assets = ['mov', 'annotation', 'mesh', 'confidence', 'lowres_depth',
                 'lowres_wide.traj', 'lowres_wide', 'lowres_wide_intrinsics', 'ultrawide',
                  'ultrawide_intrinsics', 'vga_wide', 'vga_wide_intrinsics']

def download(row):
    videoid = row[1]['video_id']
    split = row[1]['fold']
    
    if os.path.exists(os.path.join(outDir, dataType, split, str(videoid))):
        print(f'Video {videoid} already downloaded')
    else:
        download_data(dataType, [videoid], [split], outDir, False, raw_dataset_assets)

with ThreadPoolExecutor() as executor:
    executor.map(download, df.iterrows())
