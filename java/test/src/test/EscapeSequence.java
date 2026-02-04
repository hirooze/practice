package test;

public class EscapeSequence {
	public static void main(String[] args) {
		System.out.println("タブ\t[\\n]：" + '\t' + "文字");
		System.out.println("改行\t[\\t]：改行前" + '\n' + "改行後");
		System.out.println("ダブルクオート\t：\"");
		System.out.println("シングルクオート\t：\'");
		System.out.println("バックスラッシュ\t：\\");
	}
}
