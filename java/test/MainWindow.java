import javax.swing.JFrame;
import javax.swing.JLabel;

public class MainWindow {

    public static void main(String[] args) {
        JFrame frame = new JFrame("タイトル"); // ウィンドウのタイトルを設定
        frame.setSize(400, 300); // ウィンドウのサイズを設定
        frame.setLocationRelativeTo(null); // ウィンドウを画面の中央に表示
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // ウィンドウを閉じたときにプログラムを終了する

        JLabel label = new JLabel("Hello, World!"); // ラベルのテキストを設定
        frame.add(label); // ラベルをフレームに追加

        frame.setVisible(true); // ウィンドウを表示する
    }

}
