#!/bin/bash

echo "Restoring uploaded images..."

# ディレクトリを作成
mkdir -p public/uploads

# もし /mnt/data/uploads にバックアップがあるなら、それを public/uploads にコピー
if [ -d "/mnt/data/uploads" ]; then
  cp -r /mnt/data/uploads/* public/uploads/
  echo "Images restored successfully!"
else
  echo "No backup found in /mnt/data/uploads."
fi
