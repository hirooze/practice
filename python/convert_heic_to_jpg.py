import os
from PIL import Image
import pillow_heif

# HEIC形式をPillowで扱えるように登録
pillow_heif.register_heif_opener()

def convert_heic_to_jpg(folder_path):
    """
    指定したフォルダ配下の.heicファイルを再帰的に検索し、
    .jpgに変換して同じフォルダ内に出力する関数。

    Args:
        folder_path (str): 検索対象のフォルダパス
    """
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            if file.lower().endswith('.heic'):
                heic_path = os.path.join(root, file)
                # 拡張子を.jpgに変更したパスを生成
                jpg_path = os.path.splitext(heic_path)[0] + '.jpg'
                try:
                    # HEICファイルをImageオブジェクトとして開く
                    with Image.open(heic_path) as img:
                        # JPEG形式で保存
                        img.save(jpg_path, 'JPEG')
                    print(f"変換完了: {heic_path} -> {jpg_path}")
                except Exception as e:
                    print(f"変換エラー: {heic_path} - {e}")

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("使用方法: python convert_heic_to_jpg.py <フォルダパス>")
        sys.exit(1)
    folder_path = sys.argv[1]
    convert_heic_to_jpg(folder_path)