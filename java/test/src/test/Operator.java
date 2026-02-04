package test;
public class Operator {
	public static void main(String[] args) {
		System.out.println(120 + 200 * 1.05 + "円");
		
		int sum = 1;
		sum = sum + 2;
		System.out.println(sum);
		
		System.out.println("1 < 2\t: "  + (1 < 2));						//より大きい
		System.out.println("1 <= 2\t: " + (1 <= 2));					//以上
		System.out.println("1 == 2\t: " + (1 == 2));					//同じ
		System.out.println("1 != 2\t: " + (1 != 2));					//同じではない
		System.out.println("1 >= 2\t: " + (1 >= 2));					//以下
		System.out.println("1 > 2\t: "  + (1 > 2));						//より小さい（未満）
		
		System.out.println("true && false\t: "  + (true && false)); 	//AND
		System.out.println("true && !false\t: " + (true && !false));	//XAND
		System.out.println("true || false\t: "  + (true || false)); 	//OR
		System.out.println("true || !false\t: " + (true || !false));	//XOR
		
	}
}
