package test;
public class BitShift {
	public static void main(String[] args) {
		System.out.println("2　の2条\t :" + (7 << 2));
		System.out.println("1024 のマイナス 3条\t :" + (1024 >>3));
		System.out.println("-1024 のマイナス 3条\t: " + (-1024 >>3));
		
		System.out.println(7 & 3);	//AND
		System.out.println(7 | 3);	//OR
		System.out.println(7 ^ 3);	//XOR
		System.out.println(~63);	//NOT
		
		int a = 0;
		a += 10;
		System.out.println("a = 10\t: " + a);
		a -=2;
		System.out.println("a - 2\t: "  + a);
		a *=5;
		System.out.println("a * 5\t: "  + a);
		a /=4;
		System.out.println("a / 4\t: "  + a);
		System.out.println("a\t: "      + a);
		System.out.println("a++\t: "    + a++);
		System.out.println("a\t: "      + a);
		System.out.println("++a\t: "    + ++a);
		System.out.println("a\t: "      + a);
		
	}
}
