package test;
public class WideningConversion {
	public static void main(String[] args) {
		short s = 123;
		long l;
		l = s;
		
		byte b = 1;
		int i;
		i = b;

		byte bc = 2;
		double d;
		d = bc;

		char c = 'a';
		int ib;
		ib = c;
		
		System.out.println("short to long\t:" + l);
		System.out.println("byte  to int\t:" + i);
		System.out.println("byte  to double\t:" + d);
		System.out.println("char  to int\t:" + ib);	
	}
}
