import pandas as pd # type: ignore
import os

# スクリプトのあるディレクトリを基準に .xlsm ファイルを探して処理する
script_dir = os.path.dirname(os.path.abspath(__file__))

def process_xlsm(excel_path: str, out_dir: str) -> None:
	"""指定した .xlsm の LIST シートを読み込み、CSV に出力する。"""
	try:
		# LISTシートの A2:AG14 をテキストとして読み込む
		df = pd.read_excel(
			excel_path,
			sheet_name="LIST",
			usecols="A:AG",
			header=None,
			skiprows=1,
			nrows=13,
			dtype=str,
		)

		# NaN を空文字にしてすべて文字列化
		df = df.fillna("").astype(str)

		base = os.path.splitext(os.path.basename(excel_path))[0]
		out_path = os.path.join(out_dir, f"export_{base}.csv")

		# ヘッダ行は不要なので header=False で出力（行インデックスも不要）
		df.to_csv(out_path, index=False, header=False, encoding="utf-8-sig")
		print(f"CSVファイルを保存しました: {out_path}")
	except Exception as e:
		print(f"{excel_path} の処理中にエラー: {e}")


def main():
	xlsm_files = [f for f in os.listdir(script_dir) if f.lower().endswith('.xlsm')]
	if not xlsm_files:
		print(f"エラー: ディレクトリに .xlsm ファイルが見つかりません: {script_dir}")
		return

	for f in xlsm_files:
		excel_path = os.path.join(script_dir, f)
		process_xlsm(excel_path, script_dir)


if __name__ == '__main__':
	main()
