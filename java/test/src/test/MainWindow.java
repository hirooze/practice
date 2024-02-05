package test;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class MainWindow {
    public static void main(String[] args) {
        // JFrameのインスタンスを作成
    	JFrame frame = new JFrame("Simple Window Example");

        // ウィンドウが閉じられたときのデフォルトの動作を設定
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // ラベルを作成してフレームに追加
        JLabel label = new JLabel("Hello, Java Swing!");
        frame.getContentPane().add(label);

        // ウィンドウのサイズを設定
        frame.setSize(300, 200);

        // ウィンドウを表示
        frame.setVisible(true);
    }
}