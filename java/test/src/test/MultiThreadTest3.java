package test;

class MultiThreadTest3 {
	public static void main(String[] args) {
		MultiThread3 a = new MultiThread3(500);
		MultiThread3 b = new MultiThread3(700);
		MultiThread3 c = new MultiThread3(1000);
		
		Thread      ta = new Thread(a);
		Thread      tb = new Thread(b);
		Thread      tc = new Thread(c);
		
		ta.setName("A");
		tb.setName("\tB");
		tc.setName("\t\tC");
		
		ta.start();
		tb.start();
		tc.start();
	}
}